/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package ee.showcase.status.show.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ee.common.entity.Stateable;
import ee.common.utils.Constants;
import ee.common.web.controller.BaseCRUDController;
import ee.showcase.status.show.entity.Show;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-1-28 下午4:29
 * <p>Version: 1.0
 */
@Controller
@RequestMapping(value = "/showcase/status/show")
public class ShowController extends BaseCRUDController<Show, Long> {

    public ShowController() {
        setListAlsoSetCommonData(true);
        setResourceIdentity("showcase:statusShow");
    }

    @Override
    protected void setCommonData(Model model) {
        model.addAttribute("statusList", Stateable.ShowStatus.values());
    }

    @RequestMapping(value = "status/{status}", method = RequestMethod.GET)
    public String audit(
            HttpServletRequest request,
            @RequestParam("ids") Long[] ids,
            @PathVariable("status") Stateable.ShowStatus status,
            RedirectAttributes redirectAttributes
    ) {

        this.permissionList.assertHasPermission("audit");

        for (Long id : ids) {
            Show show = baseService.findOne(id);
            show.setStatus(status);
            baseService.update(show);
        }

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "操作成功！");

        return "redirect:" + request.getAttribute(Constants.BACK_URL);
    }

    /**
     * 验证失败返回true
     *
     * @param m
     * @param result
     * @return
     */
    @Override
    protected boolean hasError(Show m, BindingResult result) {
        Assert.notNull(m);

        return result.hasErrors();
    }

}
