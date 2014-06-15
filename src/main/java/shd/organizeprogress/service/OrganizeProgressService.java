/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.organizeprogress.service;
import ee.common.repository.support.SearchCallback;
import ee.common.search.Searchable;
import ee.common.service.BaseService;
import ee.sys.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import shd.organizeprogress.entity.OrganizeProgress;
import shd.organizeprogress.repository.OrganizeProgressRepository;

import java.util.List;

@Service
public class OrganizeProgressService extends BaseService<OrganizeProgress, Long> {

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizeProgressRepository getOrganizeProgressRepository() {
        return (OrganizeProgressRepository) baseRepository;
    }


    public OrganizeProgress add(OrganizeProgress op){
        return baseRepository.save(op);
    }

    public void updateAll(List<OrganizeProgress> ops){
        for(OrganizeProgress op:ops){
            OrganizeProgress _op =  baseRepository.findOne(op.getId());
            BeanUtils.copyProperties(op, _op, new String[]{ "po", "status"});
            if(_op.getFabricOrganizeActualDate()!=null && _op.getAccessoryOrganizeActualDate()!=null){
                _op.setStatus(OrganizeProgress.STATUS_FINISH);
            }else{
                _op.setStatus(OrganizeProgress.STATUS_UNFINISH);
            }
            baseRepository.save(_op);
        }
    }

    public String getEditPermission(){
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser.isPermitted("organizeProgress:measure")){
            return "measure";
        }else if(currentUser.isPermitted("organizeProgress:sale")){
            return "sale";
        }else if(currentUser.isPermitted("organizeProgress:supply")){
            return "supply";
        }else{
            return "";
        }
    }


}
