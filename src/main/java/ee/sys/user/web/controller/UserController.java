/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package ee.sys.user.web.controller;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ee.common.entity.BooleanEnum;
import ee.common.search.Searchable;
import ee.common.utils.Constants;
import ee.common.web.bind.annotation.PageAttribute;
import ee.common.web.bind.annotation.SearchAttribute;
import ee.common.web.controller.BaseCRUDController;
import ee.common.web.validate.ValidateResponse;
import ee.sys.organization.entity.Job;
import ee.sys.organization.entity.Organization;
import ee.sys.user.entity.User;
import ee.sys.user.entity.UserOrganizationJob;
import ee.sys.user.entity.UserStatus;
import ee.sys.user.service.UserService;
import ee.sys.user.web.bind.annotation.CurrentUser;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-1-28 下午4:29
 * <p>Version: 1.0
 */
@Controller("adminUserController")
@RequestMapping(value = "/admin/sys/user")
public class UserController extends BaseCRUDController<User, Long> {

    private UserService getUserService() {
        return (UserService) baseService;
    }

    public UserController() {
        setResourceIdentity("sys:user");
    }

    @Override
    protected void setCommonData(Model model) {
        model.addAttribute("statusList", UserStatus.values());
        model.addAttribute("booleanList", BooleanEnum.values());
    }


    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main(Model model) {
        return viewName("main");
    }

    @RequestMapping(value = "tree", method = RequestMethod.GET)
    public String tree(Model model) {
        return viewName("tree");
    }


    @RequestMapping(value = "list/discard", method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    public String list(Searchable searchable, Model model) {
        throw new RuntimeException("discarded method");
    }

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    @SearchAttribute(value = "deleted_eq=0")
    public String listAll(Searchable searchable, Model model) {
        return list(null, null, searchable, model);
    }


    @RequestMapping(value = {"{organization}/{job}"}, method = RequestMethod.GET)
    @PageAttribute(sort = "id=desc")
    @SearchAttribute(value = "deleted_eq=0")
    public String list(
            @PathVariable("organization") Organization organization,
            @PathVariable("job") Job job,
            Searchable searchable, Model model) {

        setCommonData(model);

        if (organization != null && !organization.isRoot()) {
            searchable.addSearchParam("organizationId", organization.getId());
        }
        if (job != null && !job.isRoot()) {
            searchable.addSearchParam("jobId", job.getId());
        }

        return super.list(searchable, model);
    }


    @RequestMapping(value = "create/discard", method = RequestMethod.POST)
    @Override
    public String create(
            Model model, @Valid @ModelAttribute("m") User m, BindingResult result,
            RedirectAttributes redirectAttributes) {
        throw new RuntimeException("discarded method");
    }

    @RequestMapping(value = "{id}/update/discard", method = RequestMethod.POST)
    @Override
    public String update(
            Model model, @Valid @ModelAttribute("m") User m, BindingResult result,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {
        throw new RuntimeException("discarded method");
    }


    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String createWithOrganization(
            Model model,
            @Valid @ModelAttribute("m") User m, BindingResult result,
            @RequestParam(value = "organizationId", required = false) Long[] organizationIds,
            @RequestParam(value = "jobId", required = false) Long[][] jobIds,
            RedirectAttributes redirectAttributes) {

        fillUserOrganization(m, organizationIds, jobIds);

        if (permissionList != null) {
            this.permissionList.assertHasCreatePermission();
        }

        if (hasError(m, result)) {
            return showCreateForm(model);
        }
        baseService.save(m);
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "新增成功");
        return redirectToUrl(null);
    }

    private void fillUserOrganization(User m, Long[] organizationIds, Long[][] jobIds) {
        if (ArrayUtils.isEmpty(organizationIds)) {
            return;
        }
        for (int i = 0, l = organizationIds.length; i < l; i++) {

            //仅新增/修改一个 spring会自动split（“，”）--->给数组
            if (l == 1) {
                for (int j = 0, l2 = jobIds.length; j < l2; j++) {
                    UserOrganizationJob userOrganizationJob = new UserOrganizationJob();
                    userOrganizationJob.setOrganizationId(organizationIds[i]);
                    userOrganizationJob.setJobId(jobIds[j][0]);
                    m.addOrganizationJob(userOrganizationJob);
                }
            } else {
                Long[] jobId = jobIds[i];
                for (int j = 0, l2 = jobId.length; j < l2; j++) {
                    UserOrganizationJob userOrganizationJob = new UserOrganizationJob();
                    userOrganizationJob.setOrganizationId(organizationIds[i]);
                    userOrganizationJob.setJobId(jobId[j]);
                    m.addOrganizationJob(userOrganizationJob);
                }
            }

        }
    }

    @RequestMapping(value = "{id}/update", method = RequestMethod.POST)
    public String updateWithOrganization(
            Model model, @Valid @ModelAttribute("m") User m, BindingResult result,
            @RequestParam(value = "organizationId", required = false) Long[] organizationIds,
            @RequestParam(value = "jobId", required = false) Long[][] jobIds,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {

        fillUserOrganization(m, organizationIds, jobIds);

        return super.update(model, m, result, backURL, redirectAttributes);
    }


    @RequestMapping(value = "changePassword")
    public String changePassword(
            HttpServletRequest request,
            @RequestParam("ids") Long[] ids, @RequestParam("newPassword") String newPassword,
            @CurrentUser User opUser,
            RedirectAttributes redirectAttributes) {

        getUserService().changePassword(opUser, ids, newPassword);

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "改密成功！");

        return redirectToUrl((String) request.getAttribute(Constants.BACK_URL));
    }

    @RequestMapping(value = "changeStatus/{newStatus}")
    public String changeStatus(
            HttpServletRequest request,
            @RequestParam("ids") Long[] ids,
            @PathVariable("newStatus") UserStatus newStatus,
            @RequestParam("reason") String reason,
            @CurrentUser User opUser,
            RedirectAttributes redirectAttributes) {

        getUserService().changeStatus(opUser, ids, newStatus, reason);

        if (newStatus == UserStatus.normal) {
            redirectAttributes.addFlashAttribute(Constants.MESSAGE, "解封成功！");
        } else if (newStatus == UserStatus.blocked) {
            redirectAttributes.addFlashAttribute(Constants.MESSAGE, "封禁成功！");
        }

        return redirectToUrl((String) request.getAttribute(Constants.BACK_URL));
    }

    @RequestMapping(value = "recycle")
    public String recycle(HttpServletRequest request, @RequestParam("ids") Long[] ids, RedirectAttributes redirectAttributes) {
        for (Long id : ids) {
            User user = getUserService().findOne(id);
            user.setDeleted(Boolean.FALSE);
            getUserService().update(user);
        }
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "还原成功！");
        return redirectToUrl((String) request.getAttribute(Constants.BACK_URL));
    }


    @RequestMapping("{user}/organizations")
    public String permissions(@PathVariable("user") User user) {
        return viewName("organizationsTable");
    }


    @RequestMapping("ajax/autocomplete")
    @PageAttribute(value = 30)
    @ResponseBody
    public Set<Map<String, Object>> autocomplete(
            Searchable searchable,
            @RequestParam("term") String term) {

        return getUserService().findIdAndNames(searchable, term);
    }


    /**
     * 验证返回格式
     * 单个：[fieldId, 1|0, msg]
     * 多个：[[fieldId, 1|0, msg],[fieldId, 1|0, msg]]
     *
     * @param fieldId
     * @param fieldValue
     * @return
     */
    @RequestMapping(value = "validate", method = RequestMethod.GET)
    @ResponseBody
    public Object validate(
            @RequestParam("fieldId") String fieldId, @RequestParam("fieldValue") String fieldValue,
            @RequestParam(value = "id", required = false) Long id) {

        ValidateResponse response = ValidateResponse.newInstance();


        if ("username".equals(fieldId)) {
            User user = getUserService().findByUsername(fieldValue);
            if (user == null || (user.getId().equals(id) && user.getUsername().equals(fieldValue))) {
                //如果msg 不为空 将弹出提示框
                response.validateSuccess(fieldId, "");
            } else {
                response.validateFail(fieldId, "用户名已被其他人使用");
            }
        }

        if ("email".equals(fieldId)) {
            User user = getUserService().findByEmail(fieldValue);
            if (user == null || (user.getId().equals(id) && user.getEmail().equals(fieldValue))) {
                //如果msg 不为空 将弹出提示框
                response.validateSuccess(fieldId, "");
            } else {
                response.validateFail(fieldId, "邮箱已被其他人使用");
            }
        }

        if ("mobilePhoneNumber".equals(fieldId)) {
            User user = getUserService().findByMobilePhoneNumber(fieldValue);
            if (user == null || (user.getId().equals(id) && user.getMobilePhoneNumber().equals(fieldValue))) {
                //如果msg 不为空 将弹出提示框
                response.validateSuccess(fieldId, "");
            } else {
                response.validateFail(fieldId, "手机号已被其他人使用");
            }
        }

        return response.result();
    }

    @RequestMapping(value = "batch/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteInBatch(
            @RequestParam(value = "ids", required = false) Long[] ids,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {


        if (permissionList != null) {
            this.permissionList.assertHasDeletePermission();
        }

        baseService.delete(ids);

        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "删除成功");
        return redirectToUrl(backURL);
    }


}
