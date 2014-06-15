/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package ee.showcase.upload.web.controller;

import javax.validation.Valid;

import ee.showcase.upload.entity.UploadFile;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ee.common.utils.Constants;
import ee.showcase.upload.service.UploadService;

/**
 * 文件上传/下载
 * <p>User: Zhang Kaitao
 * <p>Date: 13-2-11 上午8:46
 * <p>Version: 1.0
 */
@Controller
@RequestMapping(value = "showcase/upload/ajax")
public class AjaxUploadFormController {

    @Autowired
    private UploadService uploadService;

    @RequiresPermissions("showcase:upload:create")
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        model.addAttribute(Constants.OP_NAME, "新增");
        if (!model.containsAttribute("upload")) {
            model.addAttribute("upload", new UploadFile());
        }
        return "showcase/upload/ajax/editForm";
    }

    @RequiresPermissions("showcase:upload:create")
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@Valid UploadFile upload, RedirectAttributes redirectAttributes) {

        uploadService.save(upload);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "创建文件成功");
        return "redirect:/showcase/upload";
    }

}
