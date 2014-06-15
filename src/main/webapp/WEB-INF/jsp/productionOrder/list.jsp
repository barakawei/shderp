<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>


<div data-table="table" class="panel">


    <ul class="nav nav-tabs">
        <li ${type eq 'tasks' ? 'class="active"' : ''}>
                <a href="${ctx}/productionOrder/tasks">
                    <i class="icon-table"></i>
                    当前任务
                </a>
        </li>

        <li ${type eq 'all' ? 'class="active"' : ''}>
            <a href="${ctx}/productionOrder">
                <i class="icon-table"></i>
                所有生产链接单列表
            </a>
        </li>

    </ul>

    <es:showMessage/>


    <div class="row-fluid tool ui-toolbar">
        <div class="span3">
            <div class="btn-group">

                <c:if test="${type=='tasks'}">
                <shiro:hasPermission name="productionOrder:audit">
                <a class="btn btn-audit">
                    <span class="icon-trash"></span>
                    确认
                </a>
                </shiro:hasPermission>


                <shiro:hasPermission name="productionOrder:reject">
                <a class="btn btn-reject">
                    <span class="icon-trash"></span>
                    不确认
                </a>
                 </shiro:hasPermission>

                 <shiro:hasPermission name="productionOrder:confirm">
                                <a class="btn btn-confirm">
                                    <span class="icon-trash"></span>
                                    确认
                                </a>
                  </shiro:hasPermission>
                </c:if>

                 <c:if test="${type=='tasks'}">
                <shiro:hasPermission name="productionOrder:create">
                <a class="btn no-disabled btn-create">
                    <span class="icon-file-alt"></span>
                    新增
                </a>
                </shiro:hasPermission>

                <shiro:hasPermission name="productionOrder:submit">
                <a class="btn btn-submit">
                    <span class="icon-file-alt"></span>
                    提交
                </a>
                </shiro:hasPermission>


                <shiro:hasPermission name="productionOrder:update">
                <a id="update" class="btn btn-update">
                    <span class="icon-edit"></span>
                    修改
                </a>
                 </shiro:hasPermission>

                <shiro:hasPermission name="productionOrder:delete">
                <a class="btn btn-delete">
                    <span class="icon-trash"></span>
                    删除
                </a>
                </shiro:hasPermission>
                 </c:if>
                <a id="exportt" class="btn btn-export">
                    <span class="icon-edit"></span>
                    导出EXCEL
                </a>

            </div>
        </div>
        <div class="span9">
            <%@include file="searchForm.jsp" %>
        </div>
    </div>
    <table id="table" class="sort-table table table-bordered table-hover" data-prefix-url="${ctx}/productionOrder">
        <thead>
        <tr>
            <th style="width: 80px;">
                <a class="check-all" href="javascript:;">全选</a>
                |
                <a class="reverse-all" href="javascript:;">反选</a>
            </th>
            <th sort="orderNumber">订单号</th>
            <th sort="serialNumber">序列号</th>
            <th sort="customerName">客户名称</th>
            <th sort="contractDeliveryDate">合同交期</th>
            <th sort="status">状态</th>

        </tr>
        <tbody>
        <c:forEach items="${page.content}" var="m">
            <tr>

                <td class="check">
                    <input type="checkbox" name="ids" value="${m.id}"/>
                </td>

                <td>
                    <a href="${ctx}/productionOrder/${m.id}">
                        ${m.orderNumber}
                    </a>
                </td>
                <td>${m.serialNumber}</td>
                <td>${m.customerName}</td>
                <td><fmt:formatDate value="${m.contractDeliveryDate}" pattern="yyyy-MM-dd"/></td>
                <td>
                 <c:choose>
                            <c:when test="${m.status==0}">
                                新建
                            </c:when>
                            <c:when test="${m.status==1}">
                                已提交
                            </c:when>
                            <c:when test="${m.status==2}">
                                已驳回
                            </c:when>
                            <c:when test="${m.status==3}">
                                已审核
                            </c:when>
                            <c:when test="${m.status==4}">
                                已确认
                            </c:when>
                            <c:otherwise>
                                未知状态
                            </c:otherwise>
                        </c:choose>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <es:page page="${page}"/>
</div>
<es:contentFooter/>

