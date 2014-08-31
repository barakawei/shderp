/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.summary.web.controller;

import ee.common.search.Searchable;
import ee.common.web.controller.BaseController;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import shd.common.util.UserContextUtil;
import shd.common.util.ZipUtil;
import shd.purchaseorder.entity.Purchase;
import shd.purchaseorder.entity.PurchaseOrder;
import shd.purchaseorder.service.PurchaseOrderService;
import shd.summary.entity.Summary;
import shd.summary.service.SummaryService;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping(value = "/summary")
public class SummaryController extends BaseController<Summary, Long> {

    @Autowired
    private SummaryService summaryService;

    @Autowired
    private PurchaseOrderService poService;

    @Autowired
    private UserContextUtil userContextUtil;

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

    private File export(Long id, HttpServletResponse response,boolean isMulti,String type) {
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
        String fileName = "";
        String template ="purchase.xlsx";
        if("plan".equals(type)){
            fileName = "采购计划"+po.getOrderNumber()+"；"+po.getSerialNumber()+".xlsx";
            template = "purchase-plan.xlsx";
        }
        if("notify".equals(type)){
            fileName = "发料通知"+po.getOrderNumber()+"；"+po.getSerialNumber()+".xlsx";
            template = "purchase-notify.xlsx";
        }

        String classpathResourceUrl = "classpath:/" + template;
        ResourceLoader resourceLoader = new DefaultResourceLoader();
        Resource resource = resourceLoader.getResource(classpathResourceUrl);
        XLSTransformer transformer=new XLSTransformer();

        try {
            if (!isMulti) {
                fileName = URLEncoder.encode(fileName, "UTF-8");
                fileName = fileName.replaceAll("%2B", "+");
                fileName = fileName.replaceAll("%20", " ");
                fileName = fileName.replaceAll("%2F", "/");
                fileName = fileName.replaceAll("%3F", "?");
                fileName = fileName.replaceAll("%25", "%");
                fileName = fileName.replaceAll("%23", "#");
                fileName = fileName.replaceAll("%26", "&");
                fileName = fileName.replaceAll("%3D", "=");
                fileName = fileName.replaceAll("%3B", "；");
                fileName = fileName.replaceAll("%28", "(");
                fileName = fileName.replaceAll("%29", ")");
                fileName = fileName.replaceAll("%2A", "*");
                fileName = fileName.replaceAll("%2D", "-");
                fileName = fileName.replaceAll("%2C", ",");
                fileName = fileName.replaceAll("%3A", ":");
                fileName = fileName.replaceAll("%5F", "_");
                fileName = fileName.replaceAll("%5C", "\\");
                fileName = fileName.replaceAll("%7E", "~");
                fileName = fileName.replaceAll("%5B", "[");
                fileName = fileName.replaceAll("%5D", "]");
                fileName = fileName.replaceAll("%7C", "|");
            }
            Workbook wb = transformer.transformXLS(resource.getInputStream(), beans);;

            if (isMulti) {
                File file = new File(fileName);
                FileOutputStream fo = new FileOutputStream(file);
                wb.write(fo);
                fo.flush();
                return file;
            } else {
                response.setContentType("APPLICATION/OCTET-STREAM");
                response.setHeader("Content-disposition", "attachment;filename=" + fileName);
                ServletOutputStream out = response.getOutputStream();
                wb.write(out);
                out.flush();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(@CurrentUser User user,Searchable searchable, Model model) {
        boolean isAssistant = userContextUtil.hasJob(user,"责任助理");
        if(isAssistant){
            searchable.addSearchParam("po.assistant_eq",user.getUsername());
        }
        model.addAttribute("page", summaryService.findAll(searchable));
        return viewName("list");
    }

    @RequestMapping("/batch/export/{type}")
    public void exportExcel(HttpServletResponse response,@RequestParam(value = "ids", required = false) Long[] ids,
                            @PathVariable("type") String type) {
        List<File> srcfile = new ArrayList<File>();
        if(ids!= null && ids.length >1) {
            for (Long id : ids) {
                File temp = export(id, response,true,type);
                srcfile.add(temp);
            }
            String fileName = "报表.zip";
            File file = new File(fileName);
            ZipUtil.zipFiles(srcfile, file);
            try {
                fileName = URLEncoder.encode(fileName, "UTF-8");
                InputStream inStream = new FileInputStream(file);
                response.setContentType("APPLICATION/OCTET-STREAM");
                response.setHeader("Content-disposition", "attachment;filename=" + fileName);
                ServletOutputStream out = response.getOutputStream();
                byte[] b = new byte[100];
                int len;
                while ((len = inStream.read(b)) > 0)
                    out.write(b, 0, len);
                inStream.close();
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(ids!= null && ids.length ==1){
            export(ids[0], response,false,type);
        }


    }

    public SummaryService getSummaryService() {
        return summaryService;
    }

    public void setSummaryService(SummaryService summaryService) {
        this.summaryService = summaryService;
    }

    public PurchaseOrderService getPoService() {
        return poService;
    }

    public void setPoService(PurchaseOrderService poService) {
        this.poService = poService;
    }
}
