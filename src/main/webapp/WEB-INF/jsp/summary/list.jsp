<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>


<div data-table="table" class="panel">

    <ul class="nav nav-tabs">
        <li ${param['search.deleted_eq'] ne 'true' and param['search.status_eq'] ne 'blocked' ? 'class="active"' : ''}>
            <a href="${ctx}/summary">
                <i class="icon-table"></i>
                汇总表
            </a>
        </li>

    </ul>

    <es:showMessage/>


    <div class="row-fluid tool ui-toolbar">
        <div class="span3">
        <!--
            <div class="btn-group">
                <a id="export-production" class="btn btn-export">
                    <span class="icon-edit"></span>
                    链接单
                </a>
            </div>
            <div class="btn-group">
                <a id="export-purchase" class="btn btn-export">
                    <span class="icon-edit"></span>
                    采购单
                </a>
            </div>
           -->
            <div class="btn-group">
                <a id="export-plan" class="btn btn-export">
                    <span class="icon-edit"></span>
                    导出采购计划
                </a>
            </div>
            <div class="btn-group">
                <a id="export-notify" class="btn btn-export">
                    <span class="icon-edit"></span>
                    导出发料通知
                </a>
            </div>
        </div>
        <div class="span9">
            <%@include file="searchForm.jsp" %>
        </div>
    </div>

    <div class="table-container">
    <table id="table" style="width:1100px;" class="sort-table table table-bordered table-hover productProgress" data-prefix-url="${ctx}/summary">
        <thead>
        <tr>
            <th style="width:20px;" >#</th>
            <th style="width:150px;" sort="po.order_number">订单号</th>
            <th style="width:80px;" sort="po.serial_number">序列号</th>
            <th style="width:150px;" sort="po.customer_name">客户名称</th>
            <th style="width:70px;" >生产链接单</th>
            <th style="width:70px;" >采购总表</th>
            <th style="width:70px;">采购计划</th>
            <th style="width:70px;">发料通知</th>
            <th style="width:70px;">组织计划表</th>
            <th style="width:70px;">生产进度表</th>
            <th style="width:70px;">订单总结</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${page.content}" var="m" varStatus="status">
            <tr>
                <td class="check">
                    <input type="checkbox" name="ids" value="${m.purchaseOrderId}"/>
                </td>
                <td>${m.orderNumber}</td>
                <td>${m.serialNumber}</td>
                <td>${m.customerName}</td>
                <td>
                   <c:if test="${m.productionOrderId !='null'}">
                   <a href="${ctx}/productionOrder/${m.productionOrderId}?method=summary">
                        链接单
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.purchaseOrderId !='null'}">
                   <a href="${ctx}/purchaseOrder/${m.purchaseOrderId}/all?method=summary">
                        采购单
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.purchaseOrderId !='null'}">
                   <a href="${ctx}/purchaseOrder/${m.purchaseOrderId}/plan?method=summary">
                        采购计划
                   </a>
                   </c:if>
                </td>
               <td>
                   <c:if test="${m.purchaseOrderId !='null'}">
                   <a href="${ctx}/purchaseOrder/${m.purchaseOrderId}/notify?method=summary">
                        发料通知
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.organizeProgressId !='null'}">
                   <a href="${ctx}/organizeProgress?search.id_eq=${m.organizeProgressId}&method=summary">
                        <c:if test="${m.organizeProgressStatus=='0'}">
                             组织中
                         </c:if>
                         <c:if test="${m.organizeProgressStatus=='1'}">
                             组织完成
                         </c:if>
                         <c:if test="${m.organizeProgressStatus=='null'}">
                          订单组织未开始
                        </c:if>
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.productProgressId !='null'}">
                   <a href="${ctx}/productProgress?search.id_eq=${m.productProgressId}&method=summary">
                    <c:if test="${m.productProgressStatus=='0'}">
                        生产中
                    </c:if>
                    <c:if test="${m.productProgressStatus=='1'}">
                        已入库
                    </c:if>
                    <c:if test="${m.productProgressStatus=='null'}">
                         生产未开始
                     </c:if>
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.purchaseOrderId !='null'}">
                   <a href="${ctx}/purchaseOrder/${m.purchaseOrderId}/summary?method=summary">
                        订单总结
                   </a>
                   </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>

    <es:page page="${page}"/>
</div>
<es:contentFooter/>
