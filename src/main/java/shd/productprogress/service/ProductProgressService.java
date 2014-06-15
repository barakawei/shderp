/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productprogress.service;
import ee.common.service.BaseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shd.productprogress.entity.ProductProgress;
import shd.productprogress.repository.ProductProgressRepository;

import java.util.List;

@Service
public class ProductProgressService extends BaseService<ProductProgress, Long> {

    @Autowired
    private ProductProgressRepository geProductProgressRepository() {
        return (ProductProgressRepository) baseRepository;
    }


    public ProductProgress add(ProductProgress op){
        return baseRepository.save(op);
    }

    public void updateAll(List<ProductProgress> pps){
        for(ProductProgress pp:pps){
            ProductProgress _pp =  baseRepository.findOne(pp.getId());
            BeanUtils.copyProperties(pp, _pp, new String[]{ "po", "status"});
            if(_pp.getActualWarehouseDate() !=null){
                _pp.setStatus(ProductProgress.STATUS_FINISH);
            }else{
                _pp.setStatus(ProductProgress.STATUS_UNFINISH);
            }
            baseRepository.save(_pp);
        }
    }

    public String getEditPermission(){
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser.isPermitted("productProgress:plan")){
            return "plan";
        }else if(currentUser.isPermitted("productProgress:produce")){
            return "produce";
        }else if(currentUser.isPermitted("productProgress:warehouse")){
            return "warehouse";
        }else if(currentUser.isPermitted("productProgress:check")){
            return "check";
        }else{
            return "";
        }
    }


}
