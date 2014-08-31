<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>

<div>
	<input type="hidden" id="permission" value="${permission}">
</div>

<div data-table="table" class="panel">

    <ul class="nav nav-tabs">
        <li ${param['search.deleted_eq'] ne 'true' and param['search.status_eq'] ne 'blocked' ? 'class="active"' : ''}>
            <a href="${ctx}/organizeProgress">
                <i class="icon-table"></i>
                订单组织计划（进度）表
            </a>
        </li>

    </ul>

    <es:showMessage/>


    <div class="row-fluid tool ui-toolbar">
        <div class="span3">
            <div class="btn-group">
                      <c:if test="${method!='summary'}">
                     <shiro:hasPermission name="organizeProgress:update">
                             <button type="button" id="submit" class="btn no-disabled btn-primary">
                                 <i class="icon-edit"></i>
                                     修改
                             </button>
                      </shiro:hasPermission>
                    </c:if>

                    <c:if test="${method=='summary'}">
                    <a href="<es:BackURL/>" class="btn no-disabled">
                        <i class="icon-reply"></i>
                        返回
                    </a>
                    </c:if>
            </div>
        </div>
        <div class="span9">
            <%@include file="searchForm.jsp" %>
        </div>
    </div>

<form id="editForm" method="post"  action="organizeProgress/update" class="form-inline form-horizontal form-small">
<div class="table-container">
    <table id="table" style="width:2300px;" class="sort-table table table-bordered table-hover organizeProgress" data-prefix-url="${ctx}/organizeProgress">
        <thead>
        <tr>
            <th style="width:40px;" sort="status">状态</th>
            <th style="width:100px;" sort="po.orderNumber">订单号</th>
            <th style="width:100px;" sort="po.serialNumber">序列号</th>
            <th style="width:70px;" sort="po.orderPrincipal">订单负责人</th>
            <th style="width:60px;" sort="po.assistant">责任助理</th>
            <th style="width:100px;" sort="po.customerName">客户名称</th>
            <th style="width:100px;" >品名1</th>
            <th style="width:60px;" >生产合计</th>
            <th style="width:100px;" >品名2</th>
            <th style="width:60px;" >生产合计</th>
            <th style="width:100px;" >品名3</th>
            <th style="width:60px;" >生产合计</th>
            <th style="width:60px;" sort="po.contractDeliveryDate">合同交期</th>
            <th style="width:100px;" sort="dataPlanFinishDate">数据计划完成时间</th>
            <th style="width:100px;" sort="standardSampleConfirmDate">标准样确认时间</th>
            <th style="width:120px;" sort="fabricOrganizePlanDate">面料组织计划完成时间</th>
            <th style="width:120px;" sort="fabricOrganizeActualDate">面料组织实际完成时间</th>
            <th style="width:120px;" sort="accessoryOrganizePlanDate">辅料组织计划完成时间</th>
            <th style="width:120px;" sort="accessoryOrganizeActualDate">辅料组织实际完成时间</th>

        </tr>
         </thead>
        <tbody>
        <c:forEach items="${page.content}" var="m" varStatus="status">
        <input type="hidden" name="ops[${status.index}].id" value="${m.id}">
            <tr>
                <td>
                    <c:if test="${m.status==0}">
                        组织中
                    </c:if>
                    <c:if test="${m.status==1}">
                        组织完成
                    </c:if>
                    <c:if test="${m.status==null}">
                         未开始
                     </c:if>
                </td>
                <td>${m.po.orderNumber}</td>
                <td>${m.po.serialNumber}</td>
                <td>${m.po.orderPrincipal}</td>
                <td>${m.po.assistant}</td>
                <td>${m.po.customerName}</td>
                <td>${m.po.productions[0].name}</td>
                <td>${m.po.productions[0].productionTotal}</td>
                <td>${m.po.productions[1].name}</td>
                <td>${m.po.productions[1].productionTotal}</td>
                <td>${m.po.productions[2].name}</td>
                <td>${m.po.productions[2].productionTotal}</td>
                <td><fmt:formatDate value="${m.po.contractDeliveryDate}" pattern="yyyy-MM-dd"/></td>


                <td>
                  <a href="javascript:void(0)" class="x-date measure" data-type="date" ><fmt:formatDate value="${m.dataPlanFinishDate}" pattern="yyyy-MM-dd"/></a>
                  <input type="text" name="ops[${status.index}].dataPlanFinishDate"  class="hide" value='<fmt:formatDate value="${m.dataPlanFinishDate}" pattern="yyyy-MM-dd"/>'/>
                </td>

                <td>
                    <a href="javascript:void(0)" class="x-date sale" data-type="date" ><fmt:formatDate value="${m.standardSampleConfirmDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="ops[${status.index}].standardSampleConfirmDate"  class="hide" value='<fmt:formatDate value="${m.standardSampleConfirmDate}" pattern="yyyy-MM-dd"/>'/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="x-date supply" data-type="date" ><fmt:formatDate value="${m.fabricOrganizePlanDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="ops[${status.index}].fabricOrganizePlanDate"  class="hide" value='<fmt:formatDate value="${m.fabricOrganizePlanDate}" pattern="yyyy-MM-dd"/>'/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="x-date supply" data-type="date" ><fmt:formatDate value="${m.fabricOrganizeActualDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="ops[${status.index}].fabricOrganizeActualDate"  class="hide" value='<fmt:formatDate value="${m.fabricOrganizeActualDate}" pattern="yyyy-MM-dd"/>'/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="x-date supply" data-type="date" ><fmt:formatDate value="${m.accessoryOrganizePlanDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="ops[${status.index}].accessoryOrganizePlanDate"  class="hide" value='<fmt:formatDate value="${m.accessoryOrganizePlanDate}" pattern="yyyy-MM-dd"/>'/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="x-date supply" data-type="date" ><fmt:formatDate value="${m.accessoryOrganizeActualDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="ops[${status.index}].accessoryOrganizeActualDate"  class="hide" value='<fmt:formatDate value="${m.accessoryOrganizeActualDate}" pattern="yyyy-MM-dd"/>'/>
                </td>


            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    </form>

    <es:page page="${page}"/>

</div>
<es:contentFooter/>
<script src="${ctx}/static/js/organizeProgress/edit.js?57" type="text/javascript"></script>
<script type="text/javascript">
    $(function() {
        $("#submit").click(function(){

            $("#editForm").submit();
        });

    });
</script>

