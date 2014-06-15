/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.purchaseorder.web.controller;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import ee.sys.user.entity.User;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ee.common.search.Searchable;
import ee.common.utils.Constants;
import ee.common.web.bind.annotation.PageAttribute;
import ee.common.web.controller.BaseController;
import shd.purchaseorder.entity.Purchase;
import shd.purchaseorder.entity.PurchaseOrder;
import shd.purchaseorder.service.PurchaseOrderService;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping(value = "/purchaseOrder")
public class PurchaseOrderController extends BaseController<PurchaseOrder, Long> {

    @Autowired
    private PurchaseOrderService poService;

    public class DataHolder{
        String category;

        List<Purchase> pus;

        public String getCategory() {
            return category;
        }

        public void setCategory(String category) {
            this.category = category;
        }

        public List<Purchase> getPus() {
            return pus;
        }

        public void setPus(List<Purchase> pus) {
            this.pus = pus;
        }
    }

    @RequestMapping("/{id}/export")
    public void exportExcel(HttpServletResponse response,@PathVariable("id") Long id) {
        PurchaseOrder po = poService.findOne(id);
        List<Purchase> purchaseList = po.getPurchases();
        List<DataHolder> dataHolders = new ArrayList<DataHolder>();
        String category = "";
        Map<String,List<Purchase>> data = new LinkedHashMap<String,List<Purchase>>();
        for (Purchase _p : purchaseList) {
            category = _p.getCategory();
            List<Purchase> pList = data.get(category);
            if (pList == null) {
                pList = new ArrayList<>();
                pList.add(_p);
                data.put(category, pList);
            } else {
                pList.add(_p);
            }
        }

        for(String c:data.keySet()){
            DataHolder dh = new DataHolder();
            dh.category = c;
            dh.pus =data.get(c);
            dataHolders.add(dh);
        }
        Map beans = new HashMap();
        beans.put("po", po);
        beans.put("dhs", dataHolders);
        SimpleDateFormat sdf =new SimpleDateFormat("MM-dd");
        String date =sdf.format(new Date());
        String fileName = po.getFileName();
        if(StringUtils.isBlank(fileName)){
            fileName = "采购计划_"+date+".xlsx";
        }
        String template ="purchase.xlsx";
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

        model.addAttribute("page", poService.findAll(searchable));
        return viewName("list");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") Long id) {

        PurchaseOrder po=poService.load(id);
        model.addAttribute("po", po);
        model.addAttribute(Constants.OP_NAME, "查看");
        return viewName("editForm");
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        PurchaseOrder po = poService.load(id);
        model.addAttribute(Constants.OP_NAME, "修改");
        String permission = poService.getEditPermission();
        model.addAttribute("permission",permission);
        model.addAttribute("po",po);
        return viewName("editForm");
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {

        model.addAttribute(Constants.OP_NAME, "新增");
        if (!model.containsAttribute("po")) {
            PurchaseOrder po = (PurchaseOrder)newModel();
            model.addAttribute("po", po);
        }
        return viewName("editForm");
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(
            Model model, @Valid @ModelAttribute("po") PurchaseOrder po,
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
            Model model, @Valid @ModelAttribute("po") PurchaseOrder po, BindingResult result,
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

    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    public String uploadFile(
          @RequestParam(value = "file", required = false) MultipartFile file,
            RedirectAttributes redirectAttributes) {

        if (!file.isEmpty()) {
            PurchaseOrder po  = new PurchaseOrder();
            PurchaseOrder _po = po.parseExcel(file);
            _po.setCreateDate(new Date());
            poService.save(_po);

        }
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "上传成功");
        return redirectToUrl(null);
    }

    public PurchaseOrderService getPoService() {
        return poService;
    }

    public void setPoService(PurchaseOrderService poService) {
        this.poService = poService;
    }
}
