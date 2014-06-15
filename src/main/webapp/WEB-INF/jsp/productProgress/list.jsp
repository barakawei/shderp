<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>
<script src="${ctx}/static/js/productProgress/edit.js?4" type="text/javascript"></script>

<div>
	<input type="hidden" id="permission" value="${permission}">
    <input type="hidden" id="dicts" value='${dicts}'>
</div>

<div data-table="table" class="panel">

    <ul class="nav nav-tabs">
        <li ${param['search.deleted_eq'] ne 'true' and param['search.status_eq'] ne 'blocked' ? 'class="active"' : ''}>
            <a href="${ctx}/productProgress">
                <i class="icon-table"></i>
                生产进度表
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

<form id="editForm" method="post"  action="productProgress/update" class="form-inline form-horizontal form-small">
    <table id="table" style="width:1900px;" class="sort-table table table-bordered table-hover productProgress" data-prefix-url="${ctx}/productProgress">
        <thead>
        <tr>
            <th style="width:50px;" sort="status">状态</th>
            <th style="width:50px;" sort="po.orderNumber">订单号</th>
            <th style="width:50px;" sort="po.serialNumber">序列号</th>
            <th style="width:70px;" sort="po.orderPrincipal">订单负责人</th>
            <th style="width:60px;" sort="po.assistant">责任助理</th>
            <th style="width:60px;" sort="po.customerName">客户名称</th>
            <th style="width:100px;" >品名1</th>
            <th style="width:60px;" >生产合计</th>
            <th style="width:100px;" >品名2</th>
            <th style="width:60px;" >生产合计</th>
            <th style="width:100px;" >品名3</th>
            <th style="width:60px;" >生产合计</th>
            <th style="width:60px;" sort="po.contractDeliveryDate">合同交期</th>
            <th style="width:60px;" sort="orderType">订单类型</th>
            <th style="width:60px;" >可利用1</th>
            <th style="width:60px;" >可利用2</th>
            <th style="width:60px;" >可利用3</th>
            <th style="width:80px;" sort="po.fillDate">实际下单日期</th>
            <th style="width:60px;" sort="productStatus">生产进度</th>
            <th style="width:80px;" sort="planWarehouseDate">计划入库时间</th>
            <th style="width:80px;" sort="actualWarehouseDate">实际入库时间</th>

        </tr>
        <tbody>
        <c:forEach items="${page.content}" var="m" varStatus="status">
        <input type="hidden" name="pps[${status.index}].id" value="${m.id}">
            <tr>
                <td>
                    <c:if test="${m.status==0}">
                        生产中
                    </c:if>
                    <c:if test="${m.status==1}">
                        已入库
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
                  <a href="javascript:void(0)" class="x-text plan">${m.orderType}</a>
                  <input type="text" name="pps[${status.index}].orderType"  class="hide" value="${m.orderType}"/>
                </td>

                <td>${m.po.productions[0].availableMale+m.po.productions[0].availableFemale}</td>
                <td>${m.po.productions[1].availableMale+m.po.productions[1].availableFemale}</td>
                <td>${m.po.productions[2].availableMale+m.po.productions[2].availableFemale}</td>
                <td><fmt:formatDate value="${m.po.fillDate}" pattern="yyyy-MM-dd"/></td>

                <td>
                    <a href="javascript:void(0)" class="x-text produce check">${m.productStatus}</a>
                    <input type="text" name="pps[${status.index}].productStatus"  class="hide" value="${m.productStatus}"/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="x-date produce" data-type="date" ><fmt:formatDate value="${m.planWarehouseDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="pps[${status.index}].planWarehouseDate"  class="hide" value='<fmt:formatDate value="${m.planWarehouseDate}" pattern="yyyy-MM-dd"/>'/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="x-date warehouse" data-type="date" ><fmt:formatDate value="${m.actualWarehouseDate}" pattern="yyyy-MM-dd"/></a>
                    <input type="text" name="pps[${status.index}].actualWarehouseDate"  class="hide" value='<fmt:formatDate value="${m.actualWarehouseDate}" pattern="yyyy-MM-dd"/>'/>
                </td>


            </tr>
        </c:forEach>
        </tbody>
    </table>

    </form>

    <es:page page="${page}"/>
      <div class="control-group left-group">
                <div>
                        <shiro:hasPermission name="productProgress:update">
                             <button type="button" id="submit" class="btn btn-primary">
                                 <i class="icon-edit"></i>
                                     修改
                             </button>
                      </shiro:hasPermission>

                    <c:if test="${type=='summary'}">
                    <a href="<es:BackURL/>" class="btn">
                        <i class="icon-reply"></i>
                        返回
                    </a>
                    </c:if>
                </div>
            </div>
</div>
<es:contentFooter/>
<script type="text/javascript">
    $(function() {
        $("#submit").click(function(){

            $("#editForm").submit();
        });

    });
</script>

