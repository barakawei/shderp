/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productionorder.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import ee.sys.user.entity.User;
import ee.sys.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.snaker.engine.SnakerEngine;
import org.snaker.engine.access.Page;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Order;
import org.snaker.engine.entity.Task;
import org.snaker.engine.entity.WorkItem;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import shd.productionorder.entity.Production;
import shd.productionorder.entity.ProductionOrder;
import shd.productionorder.repository.ProductionOrderRepository;
import ee.common.service.BaseService;

import java.util.*;

@Service
public class ProductionOrderService extends BaseService<ProductionOrder, Long> {

    @Autowired
    private SnakerEngine snakerEngine;

    @Autowired
    private SnakerService snakerService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductionOrderRepository getProductionOrderRepository() {
        return (ProductionOrderRepository) baseRepository;
    }

    public List<String> userTaskList(String username) {
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOperator(username));
        List<String> orderIds = new ArrayList<>();
        for(Task t:tasks){
            orderIds.add(t.getOrderId());
        }
        return orderIds;
    }

    public ProductionOrder add(ProductionOrder po,String json){
        List<Production> pds = JSON.parseArray(json,Production.class);
        po.setProductions(pds);
        for(Production p :pds){
            p.setPo(po);
        }
        po.setStatus(ProductionOrder.STATUS_NEW);
        ProductionOrder _po = baseRepository.save(po);
        //启动链接单流程
        Subject currentUser = SecurityUtils.getSubject();
        String userName =(String)currentUser.getPrincipal();
        Order order = snakerService.startFlowByName(SnakerService.PRODUCTION_ORDER_FLOW,userName);
        _po.setOrderId(order.getId());
        _po.setAssistant(userName);
        return baseRepository.save(_po);
    }

    public ProductionOrder update(ProductionOrder po,String json){
        List<Production> pds = JSON.parseArray(json,Production.class);
        ProductionOrder old = baseRepository.findOne(po.getId());
        BeanUtils.copyProperties(po,old,new String[]{"createDate","productions","orderId","assistant","salesDirector","planManager","salesDirectorAssistant","status"});
        for(Production p :pds){
            p.setPo(old);
        }
        old.getProductions().clear();
        old.getProductions().addAll(pds);
        return baseRepository.save(old);
    }
    
    public ProductionOrder load(Long id){
    	ProductionOrder po = baseRepository.findOne(id);
        SimplePropertyPreFilter filter = new SimplePropertyPreFilter(Production.class);
        filter.getExcludes().add("po");
    	String json = JSON.toJSONString(po.getProductions(), filter, SerializerFeature.WriteMapNullValue);
        json = json.replaceAll("null","\"\"");
        po.setProductionJson(json);
        return po;
    }

    public void delete(Long id){
        ProductionOrder po = baseRepository.findOne(id);
        po.getProductions().clear();
        baseRepository.save(po);
        baseRepository.delete(po);
    }

    public void delete(Long[] ids){
        for(Long id :ids){
            this.delete(id);
        }
    }

    //提交链接单
    public void submit(Long[] ids){
        List<User> users = userService.findByJob(new String[]{"销售总监","销售总监助理"});
        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_NEW)
                    || po.getStatus().equals(ProductionOrder.STATUS_REJECT))) {
                if(this.submitTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_SUBMIT);
                    baseRepository.save(po);
                }
            }
        }
    }

    //提交链接单
    public void audit(Long[] ids){
        //List<User> users = userService.findByJob(new String[]{"销售总监","销售总监助理"});
        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_SUBMIT))) {
                if(this.auditTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_AUDIT);
                    po.setSalesDirector("user5(确认)");
                    po.setFillDate(new Date());
                    baseRepository.save(po);
                }
            }
        }
    }

    //提交链接单
    public void reject(Long[] ids){
        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_SUBMIT))){
                if(this.rejectTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_REJECT);
                    po.setSalesDirector("user5(不确认)");
                    baseRepository.save(po);
                }
            }
        }
    }

    //提交链接单
    public void confirm(Long[] ids){
        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_AUDIT))) {
                if(this.confirmTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_CONFIRM);
                    po.setPlanManager("user8(确认)");
                    baseRepository.save(po);
                }
            }
        }
    }

    public Boolean submitTask(String orderId) {
        //启动流程,指派默认会签人员->销售总监助理和销售总监
        Map<String, Object> args = new HashMap<String, Object>();
        //查询销售总监和销售总监助理
        List<User> users = userService.findByJob(new String[]{"销售总监","销售总监助理"});
        String[] operators = new String[users.size()];
        for(int i=0;i<users.size();i++){
            operators[i] = ((User)users.get(i)).getUsername();
        }
        args.put("audit.operator", operators);
        Subject currentUser = SecurityUtils.getSubject();
        String userName =(String)currentUser.getPrincipal();
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeTask(tasks.get(0).getId(), userName, args);
        }
        return true;
    }

    public Boolean auditTask(String orderId) {
        //启动流程,指派默认会签人员->销售总监助理和销售总监
        Map<String, Object> args = new HashMap<String, Object>();
        args.put("confirm.operator", "user8");
        Subject currentUser = SecurityUtils.getSubject();
        String userName =(String)currentUser.getPrincipal();
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeTask(tasks.get(0).getId(), userName, args);
        }
        return true;
    }

    public Boolean confirmTask(String orderId) {
        Subject currentUser = SecurityUtils.getSubject();
        String userName =(String)currentUser.getPrincipal();
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeTask(tasks.get(0).getId(), userName);
        }
        return true;
    }

    public Boolean rejectTask(String orderId) {
        Subject currentUser = SecurityUtils.getSubject();
        String userName =(String)currentUser.getPrincipal();
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeAndJumpTask(tasks.get(0).getId(),userName,null,null);
        }
        return true;
    }

}
