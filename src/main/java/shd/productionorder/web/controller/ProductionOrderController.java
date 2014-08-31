/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.productionorder.web.controller;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import ee.common.utils.PoiUtils;
import ee.common.web.upload.FileUploadUtils;
import ee.sys.organization.entity.Job;
import ee.sys.organization.service.JobService;
import ee.sys.user.entity.User;
import ee.sys.user.entity.UserOrganizationJob;
import ee.sys.user.web.bind.annotation.CurrentUser;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;
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

import shd.common.entity.Upload;
import shd.common.util.UserContextUtil;
import shd.common.util.ZipUtil;
import shd.productionorder.entity.ProductionOrder;
import shd.productionorder.service.ProductionOrderService;
import ee.common.search.Searchable;
import ee.common.utils.Constants;
import ee.common.web.bind.annotation.PageAttribute;
import ee.common.web.controller.BaseController;

import java.awt.image.BufferedImage;
import java.io.*;
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

    @Autowired
    private UserContextUtil userContextUtil;

    private File export(Long id, HttpServletResponse response, HttpServletRequest request,boolean isMulti) {
        ProductionOrder po = poService.findOne(id);
        po.assemble();
        Map beans = new HashMap();
        beans.put("po", po);

        String serial = po.getSerialNumber();
        if(StringUtils.isEmpty(serial)){
            serial ="empty";
        }
        String fileName = "链接单_" + po.getOrderNumber() + "；" + serial + ".xlsx";

        String template = "productionOrder.xlsx";
        String classpathResourceUrl = "classpath:/" + template;
        ResourceLoader resourceLoader = new DefaultResourceLoader();
        Resource resource = resourceLoader.getResource(classpathResourceUrl);
        XLSTransformer transformer = new XLSTransformer();
        Workbook wb = null;
        try {
            if(!isMulti) {
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
            wb = transformer.transformXLS(resource.getInputStream(), beans);

            //导出图片
            Sheet sheet = (XSSFSheet) wb.getSheetAt(0);
            Cell imgCell = PoiUtils.findCell(sheet, "#img");
            Drawing patriarch = sheet.createDrawingPatriarch();//创建绘图工具对象放循环外可正确显示
            for (int i = 0; i < po.getUploads().size(); i++) {
                //将图片以字节流的方式输入输出
                Upload up = po.getUploads().get(i);
                String picture = FileUploadUtils.extractUploadDir(request) + up.getSrc();
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                File f = new File(picture);
                if (f.exists()) {
                    BufferedImage BufferImg = ImageIO.read(new File(picture));
                    ImageIO.write(BufferImg, up.getType(), bos);
                    XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 50, 50, (short) (1 + i), imgCell.getRowIndex(), (short) (i + 2), imgCell.getRowIndex() + 1);
                    int type = wb.PICTURE_TYPE_JPEG;
                    if ("png".equals(up.getType())) {
                        type = wb.PICTURE_TYPE_PNG;
                    }
                    patriarch.createPicture(anchor, wb.addPicture(bos.toByteArray(), type));
                }
            }
            if(isMulti) {
                File file = new File(fileName);
                FileOutputStream fo = new FileOutputStream(file);
                wb.write(fo);
                fo.flush();
                return file;
            }else{
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

    @RequestMapping("/batch/export")
    public void exportExcel(HttpServletResponse response, HttpServletRequest request,
                            @RequestParam(value = "ids", required = false) Long[] ids) {
        List<File> srcfile = new ArrayList<File>();
        if(ids!= null && ids.length >1) {
            for (Long id : ids) {
                File temp = export(id, response, request,true);
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
            export(ids[0], response, request,false);
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String list(@CurrentUser User user, Searchable searchable, Model model) {
        List<String> jobList = userContextUtil.getUserJobs(user);
        if (jobList.contains("订单负责人") || jobList.contains("片区经理") || jobList.contains("销售总监") || jobList.contains("销售总监助理")) {
            searchable.addSearchParam("status_gt", ProductionOrder.STATUS_NEW);
        } else if (jobList.contains("计划部经理")) {
            searchable.addSearchParam("status_gt", ProductionOrder.STATUS_REJECT);
        } else if (jobList.contains("责任助理")) {
            searchable.addSearchParam("assistant_eq", user.getUsername());
        } else {
            searchable.addSearchParam("status_eq", ProductionOrder.STATUS_CONFIRM);
        }

        model.addAttribute("page", poService.findAll(searchable));
        model.addAttribute("type", "all");
        return viewName("list");
    }

    @RequestMapping(value = "/tasks", method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String tasks(@CurrentUser User user, Searchable searchable, Model model) {
        List<String> orderIds = poService.userTaskList(String.valueOf(user.getId()));
        if (orderIds.size() == 0) {
            searchable.addSearchParam("orderId_in", new String[]{"-1"});
        } else {
            searchable.addSearchParam("orderId_in", orderIds);
        }
        model.addAttribute("page", poService.findAll(searchable));
        model.addAttribute("type", "tasks");
        return viewName("list");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable("id") Long id, String method) {

        ProductionOrder po = poService.load(id);
        model.addAttribute("po", po);
        model.addAttribute(Constants.OP_NAME, "查看");
        String json = poService.findAllDicts();
        model.addAttribute("dicts", json);
        if ("summary".equals(method)) {
            model.addAttribute("method", method);
        }
        return viewName("editForm");
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@CurrentUser User user, @PathVariable("id") Long id, Model model) {
        ProductionOrder po = poService.load(id);
        List<String> jobList = new ArrayList<>();
        List<UserOrganizationJob> jobs = user.getOrganizationJobs();
        for (UserOrganizationJob job : jobs) {
            Job j = jobService.findOne(job.getJobId());
            jobList.add(j.getName());
        }
        if (jobList.contains("责任助理")) {
            if (po.getStatus() != ProductionOrder.STATUS_NEW && po.getStatus() != ProductionOrder.STATUS_REJECT) {
                model.addAttribute("canEdit", "false");
            }
        }
        model.addAttribute(Constants.OP_NAME, "修改");
        model.addAttribute("po", poService.load(id));
        String json = poService.findAllDicts();
        model.addAttribute("dicts", json);
        return viewName("editForm");
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {

        model.addAttribute(Constants.OP_NAME, "新增");
        if (!model.containsAttribute("po")) {
            model.addAttribute("po", newModel());
        }
        String json = poService.findAllDicts();
        model.addAttribute("dicts", json);
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
        poService.add(po, jsonData);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "新增成功");
        return redirectToUrl("/productionOrder/tasks");
    }

    @RequestMapping(value = "{id}/copy", method = RequestMethod.GET)
    public String copy(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {

        poService.copy(id);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "补单成功");
        return redirectToUrl("/productionOrder/tasks");
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.POST)
    public String update(
            Model model, @Valid @ModelAttribute("po") ProductionOrder po, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            @RequestParam(value = "jsonData", required = false) String jsonData,
            RedirectAttributes redirectAttributes) {

        poService.update(po, jsonData);
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
