/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.organizeprogress.web.controller;

import ee.common.search.Searchable;
import ee.common.utils.Constants;
import ee.common.web.bind.annotation.PageAttribute;
import ee.common.web.bind.annotation.ParamAttribute;
import ee.common.web.controller.BaseController;
import ee.sys.user.entity.User;
import ee.sys.user.web.bind.annotation.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import shd.organizeprogress.entity.OrganizeProgress;
import shd.organizeprogress.service.OrganizeProgressService;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "/organizeProgress")
public class OrganizeProgressController extends BaseController<OrganizeProgress, Long> {

    @Autowired
    private OrganizeProgressService opService;

    @RequestMapping(method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String list(@CurrentUser User user,Searchable searchable, Model model,String type) {
        if("summary".equals(type)){
            model.addAttribute("type",type);
        }
        model.addAttribute("page", opService.findAll(searchable));
        String permission = opService.getEditPermission();
        model.addAttribute("permission",permission);
        return viewName("list");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") Long id) {

        OrganizeProgress op= opService.findOne(id);
        model.addAttribute("op", op);
        model.addAttribute(Constants.OP_NAME, "查看");
        return viewName("editForm");
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        OrganizeProgress op= opService.findOne(id);
        model.addAttribute(Constants.OP_NAME, "修改");
        model.addAttribute("og",op);
        return viewName("editForm");
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(
            @ParamAttribute("ops") List<OrganizeProgress> ops,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        opService.updateAll(ops);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "修改成功");
        return redirectToUrl(backURL);
    }

    public OrganizeProgressService getOpService() {
        return opService;
    }

    public void setOpService(OrganizeProgressService opService) {
        this.opService = opService;
    }


}
