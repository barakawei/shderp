/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package ee.index.web.controller;

import ee.maintain.push.service.PushApi;
import ee.personal.calendar.service.CalendarService;
import ee.personal.message.service.MessageService;
import ee.sys.resource.entity.tmp.Menu;
import ee.sys.resource.service.ResourceService;
import ee.sys.user.entity.User;
import ee.sys.user.web.bind.annotation.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-1-18 下午10:15
 * <p>Version: 1.0
 */
@Controller("adminIndexController")
@RequestMapping("/admin")
public class IndexController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private PushApi pushApi;

    @Autowired
    private MessageService messageService;

    @Autowired
    private CalendarService calendarService;


    @RequestMapping(value = {"/{index:index;?.*}"}) //spring3.2.2 bug see  http://jinnianshilongnian.iteye.com/blog/1831408
    public String index(@CurrentUser User user, Model model) {

        List<Menu> menus = resourceService.findMenus(user);
        model.addAttribute("menus", menus);

        pushApi.offline(user.getId());

        return "admin/index/index";
    }


    @RequestMapping(value = "/welcome")
    public String welcome(@CurrentUser User loginUser, Model model) {

        //未读消息
        Long messageUnreadCount = messageService.countUnread(loginUser.getId());
        model.addAttribute("messageUnreadCount", messageUnreadCount);
        model.addAttribute("user", loginUser);

        //最近3天的日历
        model.addAttribute("calendarCount", calendarService.countRecentlyCalendar(loginUser.getId(), 2));

        return "admin/index/welcome";
    }





}
