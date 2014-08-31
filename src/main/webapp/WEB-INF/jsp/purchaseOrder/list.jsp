<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>

<div data-table="table" class="panel">

    <ul class="nav nav-tabs">
        <li ${param['search.deleted_eq'] ne 'true' and param['search.status_eq'] ne 'blocked' ? 'class="active"' : ''}>
            <a href="${ctx}/purchaseOrder">
                <i class="icon-table"></i>
                所有采购单列表
            </a>
        </li>

    </ul>

    <es:showMessage/>


    <div class="row-fluid tool ui-toolbar">
        <div class="span3">
            <div class="btn-group">

                <shiro:hasPermission name="purchaseOrder:create">
                             <a class="btn btn-copy">
                                 <span class="icon-file-alt"></span>
                                补单
                             </a>
                </shiro:hasPermission>

                <shiro:hasPermission name="purchaseOrder:update">
                <a id="update" class="btn btn-update">
                    <span class="icon-edit"></span>
                    修改
                </a>
                 </shiro:hasPermission>

                <shiro:hasPermission name="purchaseOrder:delete">
                <a class="btn btn-delete">
                    <span class="icon-trash"></span>
                    删除
                </a>
                </shiro:hasPermission>

                <a id="export" class="btn btn-export">
                    <span class="icon-edit"></span>
                    导出EXCEL
                </a>



            </div>
        </div>
        <div class="span9">
            <%@include file="searchForm.jsp" %>
        </div>
    </div>
    <div class="table-container">
    <table id="table" class="sort-table table table-bordered table-hover" data-prefix-url="${ctx}/purchaseOrder">
        <thead>
        <tr>
            <th style="width: 80px;">
                <a class="check-all" href="javascript:;">全选</a>
                |
                <a class="reverse-all" href="javascript:;">反选</a>
            </th>
            <th style="width:160px;" sort="orderNumber">订单号</th>
            <th style="width:160px;" sort="serialNumber">序列号</th>
            <th  sort="customerName">客户名称</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="m">
            <tr>

                <td class="check">
                    <input type="checkbox" name="ids" value="${m.id}"/>
                </td>

                <td>
                    <a href="${ctx}/purchaseOrder/${m.id}/all">
                        ${m.orderNumber}
                    </a>
                </td>
                <td>${m.serialNumber}</td>
                <td >${m.customerName}</td>


            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    <es:page page="${page}"/>
</div>
<es:contentFooter/>
<script type="text/javascript">
    $(function() {
       $("#import").click(function(){
            var file = $("#file").val();
            if(file == null || file ==""){
                alert("请先选择文件!");
                return false;
            }
       });
    });
</script>

