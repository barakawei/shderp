/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productionorder.web.controller;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import ee.sys.organization.entity.Job;
import ee.sys.organization.service.JobService;
import ee.sys.user.entity.User;
import ee.sys.user.entity.UserOrganizationJob;
import ee.sys.user.web.bind.annotation.CurrentUser;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
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
import shd.purchaseorder.entity.Purchase;
import shd.purchaseorder.entity.PurchaseOrder;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping(value = "/productionOrder")
public class ProductionOrderController extends BaseController<ProductionOrder, Long> {

    @Autowired
    private ProductionOrderService poService;

    @Autowired
    private JobService jobService;

    @RequestMapping("/{id}/export")
    public void exportExcel(HttpServletResponse response,@PathVariable("id") Long id) {
        ProductionOrder po = poService.findOne(id);
        po.assemble();
        Map beans = new HashMap();
        beans.put("po", po);
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
        String date =sdf.format(new Date());
        String fileName = "";
        if(StringUtils.isBlank(fileName)){
            fileName = "生产链接单_"+date+".xlsx";
        }
        String template ="productionOrder.xlsx";
        String classpathResourceUrl = "classpath:/" + template;
        ResourceLoader resourceLoader = new DefaultResourceLoader();
        Resource resource = resourceLoader.getResource(classpathResourceUrl);
        XLSTransformer transformer=new XLSTransformer();

        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");
            fileName = fileName.replaceAll("%2B","+");
            fileName = fileName.replaceAll("%20"," ");
            fileName = fileName.replaceAll("%2F","/");
            fileName = fileName.replaceAll("%3F","?");
            fileName = fileName.replaceAll("%25","%");
            fileName = fileName.replaceAll("%23","#");
            fileName = fileName.replaceAll("%26","&");
            fileName = fileName.replaceAll("%3D","=");
            fileName = fileName.replaceAll("%3B","；");
            fileName = fileName.replaceAll("%28","(");
            fileName = fileName.replaceAll("%29",")");
            fileName = fileName.replaceAll("%2A","*");
            fileName = fileName.replaceAll("%2D","-");
            fileName = fileName.replaceAll("%2C",",");
            fileName = fileName.replaceAll("%3A",":");
            fileName = fileName.replaceAll("%5F","_");
            fileName = fileName.replaceAll("%5C","\\");
            fileName = fileName.replaceAll("%7E","~");
            fileName = fileName.replaceAll("%5B","[");
            fileName = fileName.replaceAll("%5D","]");
            fileName = fileName.replaceAll("%7C","|");
            Workbook wb = null;

            wb=transformer.transformXLS(resource.getInputStream(), beans);
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-disposition", "attachment;filename=" + fileName);
            ServletOutputStream out=response.getOutputStream();
            wb.write(out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @RequestMapping(method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String list(@CurrentUser User user,Searchable searchable, Model model) {
        List<String> jobList = new ArrayList<>();
        List<UserOrganizationJob> jobs = user.getOrganizationJobs();
        for(UserOrganizationJob job:jobs){
            Job j= jobService.findOne(job.getJobId());
            jobList.add(j.getName());
        }
        if(jobList.contains("订单负责人")|| jobList.contains("片区经理") || jobList.contains("销售总监")||jobList.contains("销售总监助理")){
            searchable.addSearchParam("status_gt", ProductionOrder.STATUS_NEW);
        }else if(jobList.contains("计划部经理")){
            searchable.addSearchParam("status_gt", ProductionOrder.STATUS_REJECT);
        }else if(jobList.contains("责任助理")){

        }else{
            searchable.addSearchParam("status_eq", ProductionOrder.STATUS_CONFIRM);
        }

        model.addAttribute("page", poService.findAll(searchable));
        model.addAttribute("type", "all");
        return viewName("list");
    }

    @RequestMapping(value="/tasks" ,method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String tasks(@CurrentUser User user,Searchable searchable, Model model) {
        List<String> orderIds = poService.userTaskList(String.valueOf(user.getId()));
        if(orderIds.size() ==0){
            searchable.addSearchParam("orderId_in", new String[]{"-1"});
        }else {
            searchable.addSearchParam("orderId_in", orderIds);
        }
        model.addAttribute("page", poService.findAll(searchable));
        model.addAttribute("type", "tasks");
        return viewName("list");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") Long id) {

        ProductionOrder po=poService.load(id);
        model.addAttribute("po", po);
        model.addAttribute(Constants.OP_NAME, "查看");
        String json = poService.findAllDicts();
        model.addAttribute("dicts",json);
        return viewName("editForm");
    }
    
    @RequestMapping(value = "{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@CurrentUser User user,@PathVariable("id") Long id, Model model) {
        ProductionOrder po = poService.load(id);
        List<String> jobList = new ArrayList<>();
        List<UserOrganizationJob> jobs = user.getOrganizationJobs();
        for(UserOrganizationJob job:jobs){
            Job j= jobService.findOne(job.getJobId());
            jobList.add(j.getName());
        }
        if(jobList.contains("责任助理")){
            if(po.getStatus() != ProductionOrder.STATUS_NEW && po.getStatus() != ProductionOrder.STATUS_REJECT){
                model.addAttribute("canEdit", "false");
            }
        }
        model.addAttribute(Constants.OP_NAME, "修改");
        model.addAttribute("po",poService.load(id));
        String json = poService.findAllDicts();
        model.addAttribute("dicts",json);
        return viewName("editForm");
    }
    
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {

        model.addAttribute(Constants.OP_NAME, "新增");
        if (!model.containsAttribute("po")) {
            model.addAttribute("po", newModel());
        }
        String json = poService.findAllDicts();
        model.addAttribute("dicts",json);
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
        return redirectToUrl("/productionOrder/tasks");
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
