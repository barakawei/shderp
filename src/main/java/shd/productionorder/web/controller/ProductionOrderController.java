/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productionorder.web.controller;

import javax.validation.Valid;

import ee.sys.user.entity.User;
import ee.sys.user.web.bind.annotation.CurrentUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import shd.productionorder.entity.ProductionOrder;
import shd.productionorder.service.ProductionOrderService;
import ee.common.search.Searchable;
import ee.common.utils.Constants;
import ee.common.web.bind.annotation.PageAttribute;
import ee.common.web.controller.BaseController;

import java.util.List;


@Controller
@RequestMapping(value = "/productionOrder")
public class ProductionOrderController extends BaseController<ProductionOrder, Long> {

    @Autowired
    private ProductionOrderService poService;
    
    @RequestMapping(method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String list(@CurrentUser User user,Searchable searchable, Model model) {

        String name = user.getUsername();
        if(name.equals("user4")|| name.equals("user5") || name.equals("user6")||name.equals("user7")){
            searchable.addSearchParam("status_gt", 0);
        }else if(name.equals("user8")){
            searchable.addSearchParam("status_gt", 2);
        }else if(name.endsWith("user1")){

        }else{
            searchable.addSearchParam("status_eq", 4);
        }

        model.addAttribute("page", poService.findAll(searchable));
        return viewName("list");
    }

    @RequestMapping(value="/tasks" ,method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String tasks(@CurrentUser User user,Searchable searchable, Model model) {
        List<String> orderIds = poService.userTaskList(user.getUsername());
        if(orderIds.size() ==0){
            searchable.addSearchParam("orderId_in", new String[]{"-1"});
        }else {
            searchable.addSearchParam("orderId_in", orderIds);
        }
        model.addAttribute("page", poService.findAll(searchable));
        return viewName("tasks");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") Long id) {

        ProductionOrder po=poService.load(id);
        model.addAttribute("po", po);
        model.addAttribute(Constants.OP_NAME, "查看");
        return viewName("editForm");
    }
    
    @RequestMapping(value = "{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {

        model.addAttribute(Constants.OP_NAME, "修改");
        model.addAttribute("po",poService.load(id));
        return viewName("editForm");
    }
    
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {

        model.addAttribute(Constants.OP_NAME, "新增");
        if (!model.containsAttribute("po")) {
            model.addAttribute("po", newModel());
        }
        return viewName("editForm");
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(
            Model model, @Valid @ModelAttribute("po") ProductionOrder po, 
            BindingResult result,
            @RequestParam(value = "jsonData", required = false) String jsonData,
            RedirectAttributes redirectAttributes) {

        if (hasError(po, result)) {
            return showCreateForm(model);
        }
        poService.add(po,jsonData);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "新增成功");
        return redirectToUrl(null);
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.POST)
    public String update(
            Model model, @Valid @ModelAttribute("po") ProductionOrder po, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            @RequestParam(value = "jsonData", required = false) String jsonData,
            RedirectAttributes redirectAttributes) {

        poService.update(po,jsonData);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "修改成功");
        return redirectToUrl(backURL); 
    }

    @RequestMapping(value = "{id}/delete", method = RequestMethod.POST)
    public String delete(
            @PathVariable("id") Long id,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {
        poService.delete(id);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "batch/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteInBatch(
            @RequestParam(value = "ids", required = false) Long[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        poService.delete(ids);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "batch/submit", method = {RequestMethod.GET, RequestMethod.POST})
    public String submitInBatch(
            @RequestParam(value = "ids", required = false) Long[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        poService.submit(ids);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "提交成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "batch/audit", method = {RequestMethod.GET, RequestMethod.POST})
    public String auditInBatch(
            @RequestParam(value = "ids", required = false) Long[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        poService.audit(ids);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "确认成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "batch/reject", method = {RequestMethod.GET, RequestMethod.POST})
    public String rejectInBatch(
            @RequestParam(value = "ids", required = false) Long[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        poService.reject(ids);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "驳回成功");
        return redirectToUrl(backURL);
    }

    @RequestMapping(value = "batch/confirm", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmInBatch(
            @RequestParam(value = "ids", required = false) Long[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        poService.confirm(ids);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "确认成功");
        return redirectToUrl(backURL);
    }
}
