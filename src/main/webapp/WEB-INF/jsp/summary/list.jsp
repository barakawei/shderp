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
            <div class="btn-group">

            </div>
        </div>
        <div class="span9">
            <%@include file="searchForm.jsp" %>
        </div>
    </div>

    <table id="table" class="sort-table table table-bordered table-hover productProgress" data-prefix-url="${ctx}/summary">
        <thead>
        <tr>
            <th sort="po.order_number">订单号</th>
            <th sort="po.serial_number">序列号</th>
            <th sort="po.customer_name">客户名称</th>
            <th >生产链接单</th>
            <th >采购单</th>
            <th >订单组织计划进度表</th>
            <th >生产进度表</th>

        </tr>
        <tbody>
        <c:forEach items="${page.content}" var="m" varStatus="status">
            <tr>

                <td>${m.orderNumber}</td>
                <td>${m.serialNumber}</td>
                <td>${m.customerName}</td>
                <td>
                   <c:if test="${m.productionOrderId !='null'}">
                   <a href="${ctx}/productionOrder/${m.productionOrderId}">
                        链接单
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.purchaseOrderId !='null'}">
                   <a href="${ctx}/purchaseOrder/${m.purchaseOrderId}">
                        采购单
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.organizeProgressId !='null'}">
                   <a href="${ctx}/organizeProgress?search.id_eq=${m.organizeProgressId}&type=summary">
                        <c:if test="${m.organizeProgressStatus=='0'}">
                             组织中
                         </c:if>
                         <c:if test="${m.organizeProgressStatus=='1'}">
                             组织完成
                         </c:if>
                         <c:if test="${m.organizeProgressStatus=='null'}">
                          未开始
                        </c:if>
                   </a>
                   </c:if>
                </td>
                <td>
                   <c:if test="${m.productProgressId !='null'}">
                   <a href="${ctx}/productProgress?search.id_eq=${m.productProgressId}&type=summary">
                    <c:if test="${m.productProgressStatus=='0'}">
                        生产中
                    </c:if>
                    <c:if test="${m.productProgressStatus=='1'}">
                        已入库
                    </c:if>
                    <c:if test="${m.productProgressStatus=='null'}">
                         未开始
                     </c:if>
                   </a>
                   </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <es:page page="${page}"/>
</div>
<es:contentFooter/>

