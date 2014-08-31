/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.purchaseorder.service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import ee.common.service.BaseService;
import ee.sys.user.entity.User;
import ee.sys.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.snaker.engine.entity.Order;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shd.common.entity.Upload;
import shd.productionorder.entity.Production;
import shd.productionorder.entity.ProductionOrder;
import shd.purchaseorder.entity.Purchase;
import shd.purchaseorder.entity.PurchaseOrder;
import shd.purchaseorder.repository.PurchaseOrderRepository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class PurchaseOrderService extends BaseService<PurchaseOrder, Long> {

    @Autowired
    private UserService userService;

    @Autowired
    private PurchaseOrderRepository getPurchaseOrderRepository() {
        return (PurchaseOrderRepository) baseRepository;
    }

    public PurchaseOrder copy(Long id){
        PurchaseOrder old = this.findOne(id);
        PurchaseOrder _new =new PurchaseOrder();
        BeanUtils.copyProperties(old, _new, new String[]{"status", "id", "createData", "purchases"});
        _new.setCreateDate(new Date());
        _new.setOrderNumber(old.getOrderNumber()+"-补");
        _new.setSerialNumber(old.getSerialNumber()+"-补");
        List<Purchase> ps = new ArrayList<>();
        for (Purchase p : old.getPurchases()) {
            Purchase _p = new Purchase();
            BeanUtils.copyProperties(p, _p, new String[]{"id", "po", "createDate"});
            _p.setCreateDate(new Date());
            _p.setPo(_new);
            ps.add(_p);
        }
        _new.setPurchases(ps);
        return baseRepository.save(_new);
    }



    public PurchaseOrder add(PurchaseOrder po,String json){
        List<Purchase> pus = JSON.parseArray(json,Purchase.class);
        po.setPurchases(pus);
        for(Purchase p :pus){
            p.setCreateDate(new Date());
            p.setPo(po);
        }
        po.setCreateDate(new Date());
        return baseRepository.save(po);
    }

    public PurchaseOrder update(PurchaseOrder po,String json){
        List<Purchase> pus = JSON.parseArray(json,Purchase.class);
        PurchaseOrder old = baseRepository.findOne(po.getId());
        BeanUtils.copyProperties(po, old, new String[]{"createDate", "purchases", "status"});
        int i = 0;
        for(Purchase p :pus){
            i++;
            p.setPo(old);
            p.setCreateDate(new Date());
            p.setCategory(p.getCategory());
            p.setSortNo(i);
        }
        old.getPurchases().clear();
        old.getPurchases().addAll(pus);
        return baseRepository.save(old);
    }
    
    public PurchaseOrder load(Long id){
        PurchaseOrder po = baseRepository.findOne(id);
        SimplePropertyPreFilter filter = new SimplePropertyPreFilter(Purchase.class);
        filter.getExcludes().add("po");
        String json = JSON.toJSONString(po.getPurchases(), filter, SerializerFeature.WriteMapNullValue);
        json = json.replaceAll("null","\"\"");
        po.setPurchaseJson(json);
        return po;
    }

    public void delete(Long id){
        PurchaseOrder puo = baseRepository.findOne(id);
        puo.getPurchases().clear();;
        baseRepository.save(puo);
        baseRepository.delete(puo);
    }

    public void delete(Long[] ids){
        for(Long id :ids){
            this.delete(id);
        }
    }

    public String getEditPermission(){
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser.isPermitted("purchaseOrder:plan")){
            return "plan";
        }else if(currentUser.isPermitted("purchaseOrder:produce")){
            return "produce";
        }else if(currentUser.isPermitted("purchaseOrder:tech")){
            return "tech";
        }else if(currentUser.isPermitted("purchaseOrder:warehouse")){
            return "warehouse";
        }else if(currentUser.isPermitted("purchaseOrder:supply")){
            return "supply";
        }else if(currentUser.isPermitted("purchaseOrder:check")){
            return "check";
        }else{
            return "";
        }
    }

}
