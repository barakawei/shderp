/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package shd.summary.web.controller;

import ee.common.search.Searchable;
import ee.common.web.bind.annotation.PageAttribute;
import ee.common.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import shd.summary.entity.Summary;
import shd.summary.service.SummaryService;


@Controller
@RequestMapping(value = "/summary")
public class SummaryController extends BaseController<Summary, Long> {

    @Autowired
    private SummaryService summaryService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(Searchable searchable, Model model) {
        model.addAttribute("page", summaryService.findAll(searchable));
        return viewName("list");
    }

    public SummaryService getSummaryService() {
        return summaryService;
    }

    public void setSummaryService(SummaryService summaryService) {
        this.summaryService = summaryService;
    }
}
