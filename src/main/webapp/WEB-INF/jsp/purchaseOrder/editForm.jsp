<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>
<script src="${ctx}/static/js/purchaseOrder/edit.js?44" type="text/javascript"></script>
<script src="${ctx}/static/js/frozen-table.js?23" type="text/javascript"></script>


<div>
	<input type="hidden" id="op" value="${op}">
	<input type="hidden" id="permission" value="${permission}">
    <input type="hidden" id ="modelJson"  value='${po.modelJson}'>
</div>


<div class="panel" ms-controller="purchase">
    <ul class="nav nav-tabs">
        <shiro:hasPermission name="purchaseOrder:create">
        <c:if test="${op eq '新增'}">
        <li ${op eq '新增' ? 'class="active"' : ''}>
            <a href="${ctx}/purchaseOrder/create?BackURL=<es:BackURL/>">
                <i class="icon-file-alt"></i>
                新增
            </a>
        </li>
        </c:if>
        </shiro:hasPermission>

        <c:if test="${not empty po.id}">
        <li ${op eq '查看' ? 'class="active"' : ''}>
            <a href="${ctx}/purchaseOrder/${po.id}?BackURL=<es:BackURL/>">
                <i class="icon-eye-open"></i>
                查看
            </a>
        </li>
        <shiro:hasPermission name="purchaseOrder:update">
        <li ${op eq '修改' ? 'class="active"' : ''}>
            <a href="${ctx}/purchaseOrder/${po.id}/update?BackURL=<es:BackURL/>">
                <i class="icon-edit"></i>
                修改
            </a>
        </li>
        </shiro:hasPermission>
        </c:if>
        <li>
            <a href="<es:BackURL/>" class="btn btn-link">
                <i class="icon-reply"></i>
                返回
            </a>
        </li>
    </ul>


    <form:form id="editForm" method="post" commandName="po" cssClass="form-inline form-horizontal form-small">
        <es:showGlobalError commandName="po"/>
        <input type="hidden" id ="jsonData" name ="jsonData" value='${po.purchaseJson}'>
        <form:hidden path="id"/>

        <div id="baseinfo">
            <h4 class="hr">基本信息</h4>
            <div class="control-group span3">
                <form:label path="customerName" cssClass="control-label">单位</form:label>

                <div class="controls">
                    <a href="javascript:void(0)"  class="customerName x-text plan" >${po.customerName}</a>
                    <form:input path="customerName" cssClass="hide" placeholder=""/>
                </div>
            </div>



            <div class="control-group span3">
                <form:label path="orderNumber" cssClass="control-label">订单号</form:label>
                <div class="controls">
                   <a href="javascript:void(0)"  class="orderNumber x-text plan" >${po.orderNumber}</a>
                    <form:input path="orderNumber" cssClass="hide"  placeholder=""/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="serialNumber" cssClass="control-label">序列号</form:label>
                <div class="controls">
                  <a href="javascript:void(0)"  class="serialNumber x-text plan" >${po.serialNumber}</a>
                    <form:input path="serialNumber" cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="orderAmount" cssClass="control-label">数量</form:label>
                <div class="controls">
                  <a href="javascript:void(0)"  class="serialNumber x-text plan" >${po.orderAmount}</a>
                    <form:input path="orderAmount" cssClass="hide" placeholder=""/>
                </div>
            </div>

            <!--
            <div class="control-group span3">
                <form:label path="contractDeliveryDate" cssClass="control-label">订单合同交期</form:label>
                <div class="controls">
                 <a href="javascript:void(0)" class="contractDeliveryDate x-date plan" ><fmt:formatDate value="${po.contractDeliveryDate}" pattern="yyyy-MM-dd"/></a>
                    <form:input path="contractDeliveryDate"  cssClass="hide" />
                </div>
            </div>
            <div class="clearfix"></div>
            -->
            <div class="control-group span3">
                <form:label path="tabulator" cssClass="control-label">制表</form:label>
                <div class="controls">
                 <a href="javascript:void(0)" class="x-text plan" >${po.tabulator}</a>
                    <form:input path="tabulator"  cssClass="hide" />
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="tabulateDate" cssClass="control-label">制表日期</form:label>
                <div class="controls">
                 <a href="javascript:void(0)" class="x-date plan" ><fmt:formatDate value="${po.tabulateDate}" pattern="yyyy-MM-dd"/></a>
                    <form:input path="tabulateDate"  cssClass="hide" />
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="dischargePerson" cssClass="control-label">排料</form:label>
                <div class="controls">
                 <a href="javascript:void(0)" class="x-text plan" >${po.dischargePerson}</a>
                    <form:input path="dischargePerson"  cssClass="hide" />
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="dischargeDate" cssClass="control-label">排料日期</form:label>
                <div class="controls">
                 <a href="javascript:void(0)" class="x-date plan" ><fmt:formatDate value="${po.dischargeDate}" pattern="yyyy-MM-dd"/></a>
                    <form:input path="dischargeDate"  cssClass="hide" />
                </div>
            </div>
        </div>
            <h4 class="hr">详细信息
              <shiro:hasPermission name="purchaseOrder:plan">
                            <span ms-click="add" class="operator" style="cursor:pointer"><i class="fa fa-plus-circle fa-lg"></i></span>
                        </shiro:hasPermission>
            </h4>

        <div id="detail"  style="width:1200px;overflow-x:scroll;overflow-y:hidden">
        <div class="ScrollTableContainer" style="width:2850px;">
                <table class="table table-bordered table-condensed" style="width:2850px;">
                <thead>
                    <tr class="table-head">
                                <th style="width:20px;">#</th>
                                <shiro:hasPermission name="purchaseOrder:plan">
                                <th style="width:90px;" class="categoryType">类型</th>
                                </shiro:hasPermission>
                                <th style="width:150px;">名称</th>
                                <th style="width:48px;">性别</th>
                                <th style="width:48px;">类别</th>
                                <th style="width:150px;">型号规格</th>
                                <th style="width:65px;">面辅料成分</th>
                                <th style="width:75px;">计划净宽/CM</th>
                                <th style="width:48px;">单量</th>
                                <th style="width:48px;">颜色</th>
                                <th style="width:60px;">预排单耗</th>
                                <th style="width:30px;">单位</th>
                                <th style="width:70px;">预留损耗1*%</th>
                                <th style="width:180px;">面辅料特殊要求</th>
                                <th style="width:60px;">预排规格</th>
                                <th style="width:60px;">采购计划</th>
                                <th style="width:60px;">库存数量</th>
                                <th style="width:60px;">实需采购</th>
                                <th style="width:48px;">单价</th>
                                <th style="width:60px;">入库数量</th>
                                <th style="width:90px;">计划外入库(元)</th>
                                <th style="width:60px;">缺料预警</th>
                                <th style="width:90px;">使用面辅料批号</th>
                                <th style="width:105px;">实测缩率:经%/纬%</th>
                                <th style="width:60px;">实排规格</th>
                                <th style="width:80px;">实排门幅(CM)</th>
                                <th style="width:60px;">实排单耗</th>
                                <th style="width:60px;">核定损耗</th>
                                <th style="width:60px;">核定用料</th>
                                <th style="width:60px;">实发用料</th>
                                <th style="width:48px;">退回</th>
                                <th style="width:60px;">实际使用</th>
                                <th style="width:65px;">超用料(元)</th>
                                <th style="width:60px;">超用原因</th>
                                <th style="width:80px;">订单结算(元)</th>
                    </tr>
                    </thead>
                    </table>
                    <div class="ScrollDiv" style="overflow-y: scroll; overflow-x:hidden;width:2850px; max-height: 400px;">
                    <table id="purchase" class="table table-bordered table-condensed" style="width:2850px;" initialized="true">
                    <tbody ms-each-el="list" data-each-rendered="render">

                    <tr ms-if='el.category=="面里料类衣"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">面里料类衣</td>
                    </tr>

                    <tr ms-if='el.category=="辅料类衣"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">辅料类衣</td>
                    </tr>

                    <tr ms-if='el.category=="面里料类裤"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">面里料类裤</td>
                    </tr>
                    <tr ms-if='el.category=="辅料类裤"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">辅料类裤</td>
                    </tr>
                    <tr ms-if='el.category=="标识类"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">标识类</td>
                    </tr>
                    <tr ms-if='el.category=="包装类"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">包装类</td>
                    </tr>
                    <tr ms-if='el.category=="其它"'>
                        <td colspan="35" class="category hide" style="color:white;background-color:#6C7B8B;">其它</td>
                    </tr>
                    <tr class="table-content">
                        <td>
                        <shiro:hasPermission name="purchaseOrder:plan">
                            <span ms-click="remove(el)" class="operator" style="cursor:pointer"><i class="fa fa-minus-circle fa-lg"></i></span>
                        </shiro:hasPermission>

                        </td>
                         <shiro:hasPermission name="purchaseOrder:plan">
                        <td class="categoryType" style="text-align:center;">
                             <a href="javascript:void(0)" class="plan">{{el.category}}</a>
                             <input type="text" class="hide" ms-duplex="el.category"/>
                        </td>
                        </shiro:hasPermission>
                        <td align="center" style="text-align:center;">
                            <a href="javascript:void(0)" class="plan">{{el.name}}</a>
                            <input type="text" class="hide" ms-duplex="el.name"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.sex}}</a>
                            <input type="text" class="hide" ms-duplex="el.sex"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.type}}</a>
                            <input type="text" class="hide" ms-duplex="el.type"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.specification}}</a>
                            <input type="text" class="hide" ms-duplex="el.specification"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.composition}}</a>
                            <input type="text" class="hide" ms-duplex="el.composition"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.width}}</a>
                            <input type="text" class="hide" ms-duplex="el.width"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan produce">{{el.amount}}</a>
                            <input type="text" class="hide" ms-duplex="el.amount"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.color}}</a>
                            <input type="text" class="hide" ms-duplex="el.color"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan tech">{{el.consume}}</a>
                            <input type="text" class="hide" ms-duplex="el.consume"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.unit}}</a>
                            <input type="text" class="hide" ms-duplex="el.unit"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.loss}}</a>
                            <input type="text" class="hide" ms-duplex="el.loss"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.specDesc}}</a>
                            <input type="text" class="hide" ms-duplex="el.specDesc"/>
                        </td>

                        <td>
                            <a href="javascript:void(0)" class="plan tech">{{el.dischargeSpec}}</a>
                            <input type="text" class="hide" ms-duplex="el.dischargeSpec"/>
                        </td>
                        <!--采购计划-->
                        <td>
                            <a href="javascript:void(0)">
                            {{(el.amount*el.consume*el.loss).toFixed(2)}}
                            </a>
                        </td>
                        <!--库存数量-->
                        <td>
                            <a href="javascript:void(0)" class="warehouse">{{el.warehouseAmount}}</a>
                            <input type="text" class="hide" ms-duplex="el.warehouseAmount"/>
                        </td>
                        <!--实需采购-->
                        <td>
                            <a href="javascript:void(0)">
                                {{(el.amount*el.consume*el.loss-el.warehouseAmount).toFixed(2)}}
                            </a>
                        </td>
                        <!--单价-->
                        <td>
                            <a href="javascript:void(0)" class="warehouse supply">{{el.price}}</a>
                            <input type="text" class="hide" ms-duplex="el.price"/>
                        </td>
                        <!--入库数量-->


                        <td>
                            <a href="javascript:void(0)" class="warehouse">{{el.entryAmount}}</a>
                            <input type="text" class="hide" ms-duplex="el.entryAmount"/>
                        </td>
                        <!--计划外入库(元)-->
                        <td>
                            <a href="javascript:void(0)">
                            {{((el.entryAmount-(el.amount*el.consume*el.loss-el.warehouseAmount))*el.price <=0?0:(el.entryAmount-(el.amount*el.consume*el.loss-el.warehouseAmount))*el.price).toFixed(2)}}
                            </a>
                        </td>
                        <!--缺料预警-->
                        <td>
                            <a href="javascript:void(0)">
                         {{((el.amount*el.actualConsume*el.actualLoss-el.warehouseAmount-el.entryAmount)<=0?0:(el.amount*el.actualConsume*el.actualLoss-el.warehouseAmount-el.entryAmount)).toFixed(2)}}
                         </a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="warehouse">{{el.materialNumber}}</a>
                            <input type="text" class="hide" ms-duplex="el.materialNumber"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="check" >{{el.shrinkage}}</a>
                            <input type="text" class="hide" ms-duplex="el.shrinkage"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="tech" >{{el.actualDischargeSpec}}</a>
                            <input type="text" class="hide" ms-duplex="el.actualDischargeSpec"/>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="tech" >{{el.actualWidth}}</a>
                            <input type="text" class="hide" ms-duplex="el.actualWidth"/>
                        </td>
                        <!--实排单耗-->
                        <td>
                            <a href="javascript:void(0)" class="plan tech">{{el.actualConsume}}</a>
                            <input type="text" class="hide" ms-duplex="el.actualConsume"/>
                        </td>
                        <!--核定损耗-->
                        <td>
                            <a href="javascript:void(0)" class="plan">{{el.actualLoss}}</a>
                            <input type="text" class="hide" ms-duplex="el.actualLoss"/>
                        </td>
                        <!--核定用料-->
                        <td>
                            <a href="javascript:void(0)">
                            {{(el.amount*el.actualConsume*el.actualLoss).toFixed(2)}}
                            </a>
                        </td>
                        <!--实发用料-->
                        <td>
                            <a href="javascript:void(0)"  class="warehouse">{{el.sendUse}}</a>
                            <input type="text" class="hide" ms-duplex="el.sendUse"/>
                        </td>
                        <!--退回-->
                        <td>
                            <a href="javascript:void(0)"  class="warehouse">{{el.returnUse}}</a>
                            <input type="text" class="hide" ms-duplex="el.returnUse"/>
                        </td>
                        <!--实际使用-->
                        <td>
                            <a href="javascript:void(0)">
                            {{(el.sendUse-el.returnUse).toFixed(2)}}
                            </a>
                        </td>
                        <!--超用料-->
                        <td>
                            <a href="javascript:void(0)">
                            {{((el.sendUse-el.returnUse-el.amount*el.actualConsume*el.actualLoss)*el.price<=0?0:(el.sendUse-el.returnUse-el.amount*el.actualConsume*el.actualLoss)*el.price).toFixed(2)}}
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="warehouse">{{el.reason}}</a>
                            <input type="text" class="hide" ms-duplex="el.reason"/>
                        </td>
                        <!--订单结算-->
                        <td>
                            <a href="javascript:void(0)">
                            {{((el.sendUse-el.returnUse)*el.price).toFixed(2)}}
                            </a>
                        </td>
                    </tr>

                    </tbody>
                </table>
                </div>
            </div>
        </div>

<c:if test="${op eq '新增'}">
            <c:set var="icon" value="icon-file-alt"/>
        </c:if>
        <c:if test="${op eq '修改'}">
            <c:set var="icon" value="icon-edit"/>
        </c:if>
        <c:if test="${op eq '删除'}">
            <c:set var="icon" value="icon-trash"/>
        </c:if>
        <div class="control-group left-group">
            <div>
                <button type="submit" class="btn btn-primary" ms-click="click">
                    <i class="${icon}"></i>
                        ${op}
                </button>
                <a href="<es:BackURL/>" class="btn">
                    <i class="icon-reply"></i>
                    返回
                </a>
            </div>
        </div>

    </form:form>
</div>
<es:contentFooter/>
<script type="text/javascript">
    $(function () {

        <c:choose>
            <c:when test="${op eq '删除'}">
                //删除时不验证 并把表单readonly
                //$.app.readonlyForm($("#editForm"), false);
            </c:when>
            <c:when test="${op eq '查看'}">
                //$.app.readonlyForm($("#editForm"), true);
                //$.sys.organization.removeOrganizationBtn();
            </c:when>
            <c:otherwise>
                //$.sys.user.initValidator($("#editForm"));
                <es:showFieldError commandName="po"/>
            </c:otherwise>
        </c:choose>

    });

</script>
