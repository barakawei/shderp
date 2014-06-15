/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productprogress.web.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import shd.productionorder.service.ProductionOrderService;
import shd.productprogress.entity.ProductProgress;
import shd.productprogress.service.ProductProgressService;

import java.util.List;


@Controller
@RequestMapping(value = "/productProgress")
public class ProductProgressController extends BaseController<ProductProgress, Long> {

    @Autowired
    private ProductProgressService ppService;

    @Autowired
    private ProductionOrderService poService;

    @RequestMapping(method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String list(@CurrentUser User user,Searchable searchable, Model model,String type) {
        if("summary".equals(type)){
            model.addAttribute("type",type);
        }
        model.addAttribute("page", ppService.findAll(searchable));
        String permission = ppService.getEditPermission();
        model.addAttribute("permission",permission);
        String json = poService.findAllDicts();
        model.addAttribute("dicts",json);
        return viewName("list");
    }


    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(
            @ParamAttribute("pps") List<ProductProgress> pps,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        ppService.updateAll(pps);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "修改成功");
        return redirectToUrl(backURL);
    }

    public ProductProgressService getPpService() {
        return ppService;
    }

    public void setPpService(ProductProgressService ppService) {
        this.ppService = ppService;
    }

    public ProductionOrderService getPoService() {
        return poService;
    }

    public void setPoService(ProductionOrderService poService) {
        this.poService = poService;
    }
}
