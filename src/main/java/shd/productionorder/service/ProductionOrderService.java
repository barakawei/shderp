/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productionorder.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import ee.common.utils.ImagesUtils;
import ee.sys.organization.entity.Job;
import ee.sys.organization.service.JobService;
import ee.sys.user.entity.User;
import ee.sys.user.entity.UserOrganizationJob;
import ee.sys.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.snaker.engine.SnakerEngine;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Order;
import org.snaker.engine.entity.Task;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.util.StringUtils;
import shd.common.entity.Dict;
import shd.common.entity.Upload;
import shd.common.repository.DictRepository;
import shd.organizeprogress.entity.OrganizeProgress;
import shd.organizeprogress.service.OrganizeProgressService;
import shd.productionorder.entity.ChangeInfo;
import shd.productionorder.entity.Production;
import shd.productionorder.entity.ProductionOrder;
import shd.productionorder.repository.ProductionOrderRepository;
import ee.common.service.BaseService;
import shd.productprogress.entity.ProductProgress;
import shd.productprogress.service.ProductProgressService;

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
    private DictRepository dictRepository;

    @Autowired
    private JobService jobService;

    @Autowired
    private OrganizeProgressService opService;

    @Autowired
    private ProductProgressService ppService;

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

    public ProductionOrder copy(Long id){
        ProductionOrder old = this.findOne(id);
        ProductionOrder _new =new ProductionOrder();
        BeanUtils.copyProperties(old, _new, new String[]{"assistant","salesDirector","salesDirectorAssistant","planManager","status", "id", "createData", "orderId", "fillDate", "op", "pp", "", "uploads", "productions"});
        _new.setCreateDate(new Date());
        _new.setStatus(ProductionOrder.STATUS_NEW);
        _new.setOrderNumber(old.getOrderNumber() + "-补");
        _new.setSerialNumber(old.getSerialNumber()+"-补");
        List<Production> pds = new ArrayList<>();
        for (Production p : old.getProductions()) {
            Production _p = new Production();
            BeanUtils.copyProperties(p, _p, new String[]{"id", "po", "createDate"});
            _p.setCreateDate(new Date());
            _p.setPo(_new);
            pds.add(_p);
        }
        _new.setProductions(pds);
        List<Upload> us = new ArrayList<>();
        for (Upload u : old.getUploads()) {
            Upload _u = new Upload();
            BeanUtils.copyProperties(u, _u, new String[]{"id", "po"});
            _u.setPo(_new);
            us.add(_u);
        }
        _new.setUploads(us);
        ProductionOrder _po = baseRepository.save(_new);
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        User user = userService.findOne(userId);
        Order order = this.start(user);
        _po.setOrderId(order.getId());
        _po.setAssistant(user.getUsername());
        return baseRepository.save(_po);
    }

    public ProductionOrder add(ProductionOrder po,String json) {
        List<Production> pds = JSON.parseArray(json, Production.class);
        po.setProductions(pds);
        for (Production p : pds) {
            p.setPo(po);
            p.setCreateDate(new Date());
        }

        List<Upload> us = po.getUploads();
        if (us != null){
            for (Upload u : us) {
                u.setPo(po);
                u.setType(StringUtils.split(u.getName(),".")[1]);
            }
        }
        po.setStatus(ProductionOrder.STATUS_NEW);
        po.setCreateDate(new Date());
        ProductionOrder _po = baseRepository.save(po);
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        User user = userService.findOne(userId);
        Order order = this.start(user);
        _po.setOrderId(order.getId());
        _po.setAssistant(user.getUsername());
        return baseRepository.save(_po);
    }

    public ProductionOrder update(ProductionOrder po,String json){
        List<Production> pds = JSON.parseArray(json,Production.class);
        ProductionOrder old = baseRepository.findOne(po.getId());
        BeanUtils.copyProperties(po,old,new String[]{"fillDate","uploads","createDate","productions","og","orderId","assistant","salesDirector","planManager","salesDirectorAssistant","status"});
        for(Production p :pds){
            p.setPo(old);
        }
        List<Upload> us = po.getUploads();
        old.getUploads().clear();
        if(us!=null){
            for(Upload u :us){
                u.setPo(old);
                u.setType(StringUtils.split(u.getName(),".")[1]);
            }
            old.getUploads().addAll(us);
        }
        old.getProductions().clear();
        old.getProductions().addAll(pds);
        return baseRepository.save(old);
    }

    public ProductionOrder load(Long id){
    	ProductionOrder po = baseRepository.findOne(id);
        SimplePropertyPreFilter filter = new SimplePropertyPreFilter(Production.class);
        filter.getExcludes().add("po");
        filter.getExcludes().add("main");
        filter.getExcludes().add("lining");
        filter.getExcludes().add("outShell");
        filter.getExcludes().add("liningSet");
        filter.getExcludes().add("bagging");
    	String json = JSON.toJSONString(po.getProductions(), filter, SerializerFeature.WriteMapNullValue);
        json = json.replaceAll("null","\"\"");
        po.setProductionJson(json);
        return po;
    }

    public void delete(Long id){
        ProductionOrder po = baseRepository.findOne(id);
        if( po.getProductions()!=null){
            po.getProductions().clear();
        }

        if(po.getPp() !=null){
            po.getPp().setPo(null);
            ppService.delete(po.getPp());
            po.setPp(null);
        }

        if( po.getOp()!=null){
            po.getOp().setPo(null);
            opService.delete(po.getOp());
            po.setOp(null);
        }
        if( po.getUploads()!=null){
            po.getUploads().clear();
        }


            baseRepository.save(po);
            baseRepository.delete(po);
    }

    public void delete(Long[] ids){
        for(Long id :ids){
            this.delete(id);
        }
    }

    public Order start(User user){
        //启动链接单流程
        Map<String, Object> args = new HashMap<String, Object>();
        //查询责任助理
        List<User> users = userService.findByJob(new String[]{"责任助理"});
        String[] operators = new String[users.size()];
        for(int i=0;i<users.size();i++){
            operators[i] = ((User)users.get(i)).getId().toString();
        }
        args.put("submit.operator", operators);
        Order order = snakerService.startFlowByName(SnakerService.PRODUCTION_ORDER_FLOW,String.valueOf(user.getId()),args);
        return order;
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
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        User user = userService.findOne(userId);

        List<String> jobList = new ArrayList<>();
        List<UserOrganizationJob> jobs = user.getOrganizationJobs();
        for(UserOrganizationJob job:jobs){
            Job j= jobService.findOne(job.getJobId());
            jobList.add(j.getName());
        }

        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_SUBMIT))) {
                if(this.auditTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_AUDIT);

                    if(jobList.contains("销售总监")) {
                        po.setSalesDirector(user.getUsername() + "(确认)");
                    }else{
                        po.setSalesDirectorAssistant(user.getUsername() + "(确认)");
                    }
                    po.setFillDate(new Date());
                    baseRepository.save(po);
                }
            }
        }
    }

    //提交链接单
    public void reject(Long[] ids){
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        User user = userService.findOne(userId);

        List<String> jobList = new ArrayList<>();
        List<UserOrganizationJob> jobs = user.getOrganizationJobs();
        for(UserOrganizationJob job:jobs){
            Job j= jobService.findOne(job.getJobId());
            jobList.add(j.getName());
        }

        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_SUBMIT))){
                if(this.rejectTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_REJECT);
                    if(jobList.contains("销售总监")) {
                        po.setSalesDirector(user.getUsername() + "(不确认)");
                    }else{
                        po.setSalesDirectorAssistant(user.getUsername() + "(不确认)");
                    }
                    baseRepository.save(po);
                }
            }
        }
    }

    //提交链接单
    public void confirm(Long[] ids){
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        User user = userService.findOne(userId);
        //查询链接单
        for(Long id:ids){
            ProductionOrder po = baseRepository.findOne(id);
            //新建和驳回状态可以提交
            if(null!=po&& (po.getStatus().equals(ProductionOrder.STATUS_AUDIT))) {
                if(this.confirmTask(po.getOrderId())){
                    po.setStatus(ProductionOrder.STATUS_CONFIRM);
                    OrganizeProgress op = new OrganizeProgress();
                    op.setPo(po);
                    po.setOp(op);
                    ProductProgress pp = new ProductProgress();
                    pp.setPo(po);
                    po.setPp(pp);
                    po.setPlanManager(user.getUsername());
                    //订单组织计划表 中“订单号”出现“补”“返”字眼，
                    // 如：WJ20140227补单、CJ20140807返、 HTH20121101补
                    // “数据计划完成时间	 标准样确认时间”自动生成。
                    if(po.getOrderNumber() !=null && (po.getOrderNumber().contains("补") ||
                            po.getOrderNumber().contains("返"))){
                        op.setDataPlanFinishDate(new Date());
                        op.setStandardSampleConfirmDate(new Date());
                    }

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
            operators[i] = ((User)users.get(i)).getId().toString();
        }
        args.put("audit.operator", operators);

        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeTask(tasks.get(0).getId(), String.valueOf(userId), args);
        }
        return true;
    }

    public Boolean auditTask(String orderId) {
        Map<String, Object> args = new HashMap<String, Object>();
        //查询计划部经理
        List<User> users = userService.findByJob(new String[]{"计划部经理"});
        String[] operators = new String[users.size()];
        for(int i=0;i<users.size();i++){
            operators[i] = ((User)users.get(i)).getId().toString();
        }
        args.put("confirm.operator", operators);
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeTask(tasks.get(0).getId(), String.valueOf(userId), args);
        }
        return true;
    }

    public Boolean confirmTask(String orderId) {
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeTask(tasks.get(0).getId(), String.valueOf(userId));
        }
        return true;
    }

    public Boolean rejectTask(String orderId) {
        Subject currentUser = SecurityUtils.getSubject();
        Long userId =Long.valueOf((String)currentUser.getPrincipal());
        List<Task> tasks = snakerEngine.query().getActiveTasks(new QueryFilter().setOrderId(orderId));
        if(null!=tasks && tasks.size() == 1) {
            snakerEngine.executeAndJumpTask(tasks.get(0).getId(),String.valueOf(userId),null,null);
        }
        return true;
    }

    public String findAllDicts(){
       List<Dict> dicts = dictRepository.findAll();
       String json = JSON.toJSONString(dicts,SerializerFeature.WriteMapNullValue);
       return json;
    }

}
