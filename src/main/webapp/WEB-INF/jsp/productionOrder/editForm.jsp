<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>
<script src="${ctx}/static/js/productionOrder/edit.js?72" type="text/javascript"></script>

<div>
	<input type="hidden" id="op" value="${op}">
	<input type="hidden" id="canEdit" value="${canEdit}">
    <input type="hidden" id="dicts" value='${dicts}'>
</div>


<div class="panel" ms-controller="production">
    <ul class="nav nav-tabs">
        <shiro:hasPermission name="productionOrder:create">
        <c:if test="${op eq '新增'}">
        <li ${op eq '新增' ? 'class="active"' : ''}>
            <a href="${ctx}/productionOrder/create?BackURL=<es:BackURL/>">
                <i class="icon-file-alt"></i>
                新增
            </a>
        </li>
        </c:if>
        </shiro:hasPermission>

        <c:if test="${not empty po.id}">
        <li ${op eq '查看' ? 'class="active"' : ''}>
            <a href="${ctx}/productionOrder/${po.id}?BackURL=<es:BackURL/>">
                <i class="icon-eye-open"></i>
                查看
            </a>
        </li>

        <shiro:hasPermission name="productionOrder:update">
        <li ${op eq '修改' ? 'class="active"' : ''}>
            <a href="${ctx}/productionOrder/${po.id}/update?BackURL=<es:BackURL/>">
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
        <input type="hidden" id ="jsonData" name ="jsonData" value='${po.productionJson}'>
        <form:hidden path="id"/>

        <div id="baseinfo">
            <h4 class="hr">基本信息</h4>
            <div class="control-group span3">
                <form:label path="customerName" cssClass="control-label">客户名称</form:label>

                <div class="controls">
                    <a href="javascript:void(0)"  class="customerName text" data-type="text">${po.customerName}</a>
                    <form:input path="customerName" cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="orderNumber" cssClass="control-label">订单号</form:label>
                <div class="controls">
                   <a href="javascript:void(0)"  class="orderNumber text" data-type="text">${po.orderNumber}</a>
                    <form:input path="orderNumber" cssClass="hide"  placeholder=""/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="serialNumber" cssClass="control-label">序列号</form:label>
                <div class="controls">
                  <a href="javascript:void(0)"  class="serialNumber text" data-type="text">${po.serialNumber}</a>
                    <form:input path="serialNumber" cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="contractDeliveryDate" cssClass="control-label">合同交期</form:label>
                <div class="controls">
                 <a href="javascript:void(0)" class="contractDeliveryDate x-date" data-type="date" ><fmt:formatDate value="${po.contractDeliveryDate}" pattern="yyyy-MM-dd"/></a>
                    <form:input path="contractDeliveryDate"  cssClass="hide" />
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div id="productioninfo">


            <div ms-repeat="list" data-repeat-rendered="render">

            <h4 class="hr">产品信息{{$index+1}}
                <span ms-click="add" ms-if="$index == 0" style="cursor:pointer"><i class="fa fa-plus-circle fa-lg"></i></span>
                &nbsp; &nbsp;
                <span ms-click="remove(el)" ms-if="$index != 0" style="cursor:pointer"><i class="fa fa-minus-circle fa-lg"></i></span>
            </h4>

            <div class="control-group span3" >
                <label class="control-label">品名</label>

                <div class="controls" >
                    <a href="javascript:void(0)"  class="name" data-type="select2">{{el.name}}</a>
                    <input type="text" class="hide" ms-duplex="el.name">
                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">商标</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="brand" data-type="select2">{{el.brand}}</a>
                    <input type="text" class="hide" ms-duplex="el.brand">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <label class="control-label">款号(男)</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="styleNumberMale" data-type="text">{{el.styleNumberMale}}</a>
                    <input type="text" class="hide" ms-duplex="el.styleNumberMale">

                </div>
            </div>
            <div class="control-group span3">
                <label  class="control-label">号型标准(男)</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sizeStandardsMale" data-type="select2">{{el.sizeStandardsMale}}</a>
                    <input type="text" class="hide" ms-duplex="el.sizeStandardsMale">
                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">款号(女)</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="styleNumberFemale" data-type="text">{{el.styleNumberFemale}}</a>
                    <input type="text" class="hide" ms-duplex="el.styleNumberFemale">
                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">号型标准(女)</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sizeStandardsFemale" data-type="select2">{{el.sizeStandardsFemale}}</a>
                    <input type="text" class="hide" ms-duplex="el.sizeStandardsFemale">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <label  class="control-label">男女款式</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="style" data-type="select2">{{el.style}}</a>
                    <input type="text" class="hide" ms-duplex="el.style">
                </div>
            </div>
            <div class="control-group span3">
                <label  class="control-label">成衣后处理方式</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="handleMethod" data-type="select2">{{el.handleMethod}}</a>
                    <input type="text" class="hide" ms-duplex="el.handleMethod">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <label  class="control-label">提供样衣类型</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sampleStyle" data-type="select2">{{el.sampleStyle}}</a>
                    <input type="text" class="hide" ms-duplex="el.sampleStyle">
                </div>


            </div>
            <div class="control-group span3">
                <label  class="control-label">样衣款号</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sampleStyleNumber" data-type="text">{{el.sampleStyleNumber}}</a>
                    <input type="text" class="hide" ms-duplex="el.sampleStyleNumber">
                </div>
            </div>
            <div class="control-group span3">
                <label  class="control-label">样衣数量</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sampleAmount" data-type="text">{{el.sampleAmount}}</a>
                    <input type="text" class="hide" ms-duplex="el.sampleAmount">

                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">样衣修改说明</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sampleRevisionDesc" data-type="text">{{el.sampleRevisionDesc}}</a>
                    <input type="text" class="hide" ms-duplex="el.sampleRevisionDesc">
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <label class="control-label">样衣提供单位</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sampleProvider" data-type="select2">{{el.sampleProvider}}</a>
                    <input type="text" class="hide" ms-duplex="el.sampleProvider">

                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">面辅料是否预订</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="materialReserve" data-type="select2">{{el.materialReserve}}</a>
                    <input type="text" class="hide" ms-duplex="el.materialReserve">

                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <label  class="control-label">量体样衣版型</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="measureSampleVersion" data-type="text">{{el.measureSampleVersion}}</a>
                    <input type="text" class="hide" ms-duplex="el.measureSampleVersion">
                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">量体人员</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="measureStaff" data-type="text">{{el.measureStaff}}</a>
                    <input type="text" class="hide" ms-duplex="el.measureStaff">
                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">归档人员</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="archiveStaff" data-type="text">{{el.archiveStaff}}</a>
                    <input type="text" class="hide" ms-duplex="el.archiveStaff">
                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">完成时间</label>
                <div class="controls">
                    <a href="javascript:void(0)" class="finishDate x-date" data-type="date" >{{el.finishDate}}</a>
                    <input type="text" class="hide" ms-duplex="el.finishDate">

                </div>
            </div>
                <!-- 面料主色-->
                <div class="control-group span3">
                    <label class="control-label">面料主色</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellColorName" data-type="text">{{el.outshellMainColor.colorName}}</a>
                        <input type="text" class="hide" ms-duplex="el.outshellMainColor.colorName"/>
                    </div>
                </div>
                <div class="control-group span3">
                    <label class="control-label">规格</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellStyle" data-type="select2">{{el.outshellMainColor.style}}</a>
                        <input type="text" class="hide" ms-duplex="el.outshellMainColor.style"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label class="control-label">成分</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellMaterial" data-type="select2">{{el.outshellMainColor.material}}</a>
                        <input type="text" class="hide" ms-duplex="el.outshellMainColor.material"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label  class="control-label">产前后处理</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellHandle" data-type="select2">{{el.outshellMainColor.handle}}</a>
                        <input type="text" class="hide" ms-duplex="el.outshellMainColor.handle"/>

                    </div>
                </div>
                <div class="clearfix"></div>
                <!-- 面料镶色-->
                <div ms-repeat-data="el.outshellSetColorJson" style="position:relative;">
                <span ms-click="addOutshell(el)" ms-if="$index == 0" style="position: absolute;left: 0;top:3px;cursor:pointer;"><i class="fa fa-plus-circle fa-lg"></i></span>
                    <span ms-click="removeOutshell(el,data)" ms-if="$index != 0" style="position: absolute;left: 25px;top:3px;cursor:pointer;"><i class="fa fa-minus-circle fa-lg"></i></span>
                <div class="control-group span3">
                    <label class="control-label">面料镶色{{$index+1}}</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellColorName" data-type="text">{{data.colorName}}</a>
                        <input type="text" class="hide" ms-duplex="data.colorName"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label class="control-label">规格</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellStyle" data-type="select2">{{data.style}}</a>
                        <input type="text" class="hide" ms-duplex="data.style"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label  class="control-label">成分</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellMaterial" data-type="select2">{{data.material}}</a>
                        <input type="text" class="hide" ms-duplex="data.material"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label  class="control-label">产前后处理</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="outshellHandle" data-type="select2">{{data.handle}}</a>
                        <input type="text" class="hide" ms-duplex="data.handle"/>

                    </div>
                </div>
                <div class="clearfix"></div>
                </div>

            <!-- 里料主色-->
            <div class="control-group span3">
                <label  class="control-label">里料主色</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="liningColorName" data-type="text">{{el.liningMainColor.colorName}}</a>
                    <input type="text" class="hide" ms-duplex="el.liningMainColor.colorName"/>

                </div>
            </div>
            <div class="control-group span3">
                <label  class="control-label">规格</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="liningStyle" data-type="select2">{{el.liningMainColor.style}}</a>
                    <input type="text" class="hide" ms-duplex="el.liningMainColor.style"/>

                </div>
            </div>
            <div class="control-group span3">
                <label  class="control-label">成分</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="liningMaterial" data-type="select2">{{el.liningMainColor.material}}</a>
                    <input type="text" class="hide" ms-duplex="el.liningMainColor.material"/>

                </div>
            </div>
            <div class="control-group span3">
                <label class="control-label">产前后处理</label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="liningHandle" data-type="select2">{{el.liningMainColor.handle}}</a>
                    <input type="text" class="hide" ms-duplex="el.liningMainColor.handle"/>

                </div>
            </div>
            <div class="clearfix"></div>


            <!--里料拼色-->
            <div ms-repeat-data1="el.liningSetColorJson" style="position:relative;">
                <span ms-click="addLining(el)" ms-if="$index == 0" style="position: absolute;left: 0;top:3px;cursor:pointer;"><i class="fa fa-plus-circle fa-lg"></i></span>
                <span ms-click="removeLining(el,data1)"  ms-if="$index != 0" style="position: absolute;left: 25px;top:3px;cursor:pointer;"><i class="fa fa-minus-circle fa-lg"></i></span>
                <div class="control-group span3">
                    <label class="control-label">里料拼色{{$index+1}}</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="liningColorName" data-type="text">{{data1.colorName}}</a>
                        <input type="text" class="hide" ms-duplex="data1.colorName"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label class="control-label">规格</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="liningStyle" data-type="select2">{{data1.style}}</a>
                        <input type="text" class="hide" ms-duplex="data1.style"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label  class="control-label">成分</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="liningMaterial" data-type="select2">{{data1.material}}</a>
                        <input type="text" class="hide" ms-duplex="data1.material"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <label class="control-label">产前后处理</label>
                    <div class="controls">
                        <a href="javascript:void(0)"  class="liningHandle" data-type="select2">{{data1.handle}}</a>
                        <input type="text" class="hide" ms-duplex="data1.handle"/>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>


            <!-- 袋布-->
                            <div ms-repeat-data2="el.baggingJson" style="position:relative;">
                            <span ms-click="addBagging(el)" ms-if="$index == 0" style="position: absolute;left: 0;top:3px;cursor:pointer;"><i class="fa fa-plus-circle fa-lg"></i></span>
                                <span ms-click="removeBagging(el,data2)" ms-if="$index != 0"  style="position: absolute;left: 25px;top:3px;cursor:pointer;"><i class="fa fa-minus-circle fa-lg"></i></span>
                            <div class="control-group span3">
                                <label class="control-label">袋布{{$index+1}}</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="liningColorName" data-type="text">{{data2.colorName}}</a>
                                    <input type="text" class="hide" ms-duplex="data2.colorName"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">规格</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="liningStyle" data-type="select2">{{data2.style}}</a>
                                    <input type="text" class="hide" ms-duplex="data2.style"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">成分</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="liningMaterial" data-type="select2">{{data2.material}}</a>
                                    <input type="text" class="hide" ms-duplex="data2.material"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label  class="control-label">产前后处理</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="liningHandle" data-type="select2">{{data2.handle}}</a>
                                    <input type="text" class="hide" ms-duplex="data2.handle"/>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                            </div>


                            <div class="control-group span3">
                                <label class="control-label">面辅料特殊要求</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="materialSpecialReq text" data-type="text">{{el.materialSpecialReq}}</a>
                                    <input type="text" class="hide" ms-duplex="el.materialSpecialReq"/>

                                </div>
                            </div>

                            <div class="control-group span3">
                                <label  class="control-label">填充物要求</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="packingReq text" data-type="text">{{el.packingReq}}</a>
                                    <input type="text" class="hide" ms-duplex="el.packingReq"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">其他要求</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="otherReq text" data-type="text">{{el.otherReq}}</a>
                                    <input type="text" class="hide" ms-duplex="el.otherReq"/>

                                </div>
                            </div>
                             <div class="clearfix"></div>
                            <div class="control-group span3">
                                <label class="control-label">人数(男)</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="peopleNumberMale text" data-type="text">{{el.peopleNumberMale}}</a>
                                    <input type="text" class="hide" ms-duplex="el.peopleNumberMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">人数(女)</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="peopleNumberFemale text" data-type="text">{{el.peopleNumberFemale}}</a>
                                    <input type="text" class="hide" ms-duplex="el.peopleNumberFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">人数合计</label>
                                <div class="controls">
                                    {{el.peopleNumberMale*1 + el.peopleNumberFemale*1}}
                                </div>
                            </div>
                             <div class="clearfix"></div>
                            <div class="control-group span3">
                                <label  class="control-label">数量(男)</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="amountMale text" data-type="text">{{el.amountMale}}</a>
                                    <input type="text" class="hide"  ms-duplex="el.amountMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">可利用(男)</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="availableMale text" data-type="text">{{el.availableMale}}</a>
                                    <input type="text" class="hide"  ms-duplex="el.availableMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">需生产(男)</label>
                                <div class="controls">
                                    {{el.amountMale*1 - el.availableMale*1}}
                                </div>
                            </div>
                            <div class="control-group span3">
                                <label  class="control-label">订单合计</label>
                                <div class="controls">
                                    {{el.amountMale*1 + el.amountFemale*1}}
                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="control-group span3">
                                <label  class="control-label">数量(女)</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="amountFemale text" data-type="text">{{el.amountFemale}}</a>
                                    <input type="text" class="hide"  ms-duplex="el.amountFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label  class="control-label">可利用(女)</label>
                                <div class="controls">
                                    <a href="javascript:void(0)"  class="availableFemale text" data-type="text">{{el.availableFemale}}</a>
                                    <input type="text" class="hide" ms-duplex="el.availableFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label class="control-label">需生产(女)</label>
                                <div class="controls">
                                    {{el.amountFemale*1 - el.availableFemale*1}}

                                </div>
                            </div>
                            <div class="control-group span3">
                                <label  class="control-label">生产合计</label>
                                <div class="controls">
                                    {{el.amountMale*1 - el.availableMale*1 + el.amountFemale*1 - el.availableFemale*1}}
                                </div>
                            </div>
        </div>

        <div id="packaheinfo">
            <h4 class="hr">包装信息</h4>
            <div class="control-group span3">
                <form:label path="packagingReq" cssClass="control-label">包装要求</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="packagingReq" data-type="select2">${po.packagingReq}</a>
                    <form:input path="packagingReq"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="packingReq" cssClass="control-label">装箱要求</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="packingReq" data-type="select2">${po.packingReq}</a>
                    <form:input path="packingReq"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="sizebeltReq" cssClass="control-label">尺码带、洗唛等要求</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="sizebeltReq" data-type="select2">${po.sizebeltReq}</a>
                    <form:input path="sizebeltReq"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="companylogoReq" cssClass="control-label">企业标识要求</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="companylogoReq" data-type="select2">${po.companylogoReq}</a>
                    <form:input path="companylogoReq"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="productionParts" cssClass="control-label">随货配件</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="productionParts" data-type="select2">${po.productionParts}</a>
                    <form:input path="productionParts"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="checkReport" cssClass="control-label">检测报告内容</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="checkReport" data-type="select2">${po.checkReport}</a>
                    <form:input path="checkReport"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="remark" cssClass="control-label">备注</form:label>
                <div class="controls">
                    <a href="javascript:void(0)"  class="remark text" data-type="textarea">${po.remark}</a>
                    <form:textarea path="remark"
                                cssClass="hide" placeholder=""/>
                </div>
            </div>
        <div class="clearfix"></div>
        <div class="control-group ">
                 <label class="control-label">标示要求(附表)</label>
                <div class="controls imgDiv">
                    <c:forEach items="${po.uploads}" var="u" varStatus="status">
                        <div class="tradeMark" data-src="${u.src}" data-name="${u.name}">
                        <span class='imgDel'><i class="fa fa-times-circle"></i></span>
                        <c:if test="${u.type=='img'}">
                            <img src="${ctx}/${u.src}" height="70" width="70">
                        </c:if>
                        </div>
                    </c:forEach>
                    <div class="ajax-upload-view"></div>
                    <div class="ajax-upload-input hide"></div>
                </div>
                           <label for="files" class="btn btn-success fileinput-button" style="margin-left:20px;">
                                <i class="icon-plus icon-white"></i>
                                <span>添加图片</span>
                               <input type="file" id="files" name="files[]" data-url="${ctx}/ajaxUpload" multiple>
                           </label>
            </div>
        </div>

        <div id="packaheinfo">
            <h4 class="hr">流程信息</h4>

            <div class="control-group span3">
                <form:label path="assistant" cssClass="control-label">责任助理</form:label>
                <div class="controls">
                    ${po.assistant}
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="orderPrincipal" cssClass="control-label">订单负责人</form:label>
                <div class="controls">
                 <a href="javascript:void(0)"  class="orderPrincipal text" data-type="text">${po.orderPrincipal}</a>
                <form:input path="orderPrincipal" cssClass="hide" placeholder=""/>
                </div>
            </div>


            <div class="control-group span3">
                <form:label path="regionalManager" cssClass="control-label">片区经理</form:label>
                <div class="controls">
                 <a href="javascript:void(0)"  class="regionalManager text" data-type="text">${po.regionalManager}</a>
                <form:input path="regionalManager" cssClass="hide" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="salesDirectorAssistant" cssClass="control-label">销售总监助理</form:label>
                <div class="controls">
                    ${po.salesDirectorAssistant}
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="salesDirector" cssClass="control-label">销售总监</form:label>
                <div class="controls">
                    ${po.salesDirector}
                </div>
            </div>

             <div class="control-group span3">
                <form:label path="fillDate" cssClass="control-label">填单时间</form:label>

                <div class="controls">
                <fmt:formatDate value="${po.fillDate}" pattern="yyyy-MM-dd"/>
                </div>
            </div>
             <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="planManager" cssClass="control-label">计划部经理</form:label>
                <div class="controls">
                    ${po.planManager}
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
<%@include file="/WEB-INF/jsp/common/import-upload-css.jspf"%>
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


                var uploadIndex =  $(".tradeMark").size();

                $(".imgDiv").on("click",".imgDel",function(){
                    var url =  $(this).closest(".tradeMark").attr("data-src");
                    $(this).closest(".tradeMark").remove();
                    var deleteUrl = "${ctx}/ajaxUpload/delete?filename="+url;
                    $.post(deleteUrl);
                });


                $('.fileinput-button input[type="file"]').fileupload({
                    dataType: 'json',
                    progressall: function (e, data) {
                    },
                    start : function(e) {
                    },
                    //上传完成
                    done: function (e, data) {
                    _.each(data.result.files, function (file) {
                    if (file.error) {
                        $(".ajax-upload-view").html("<div class='alert alert-error'>" + file.error + "</div>");
                    } else {
                        var msg = "<div class='tradeMark' data-src='{url}' data-name='{name}'><span class='imgDel'><i class='fa fa-times-circle'></i></span>{preview}</div>";
                        msg = msg.replace("{url}",file.url).replace("{name}",file.name);
                        var preview = "";
                        var url = ctx + "/" + file.url;
                        var thumbnail_url = ctx + "/" + file.thumbnail_url;
                        if($.app.isImage(file.name)) {
                            preview = "<a href='{url}' target='_blank'><img src='{thumbnail_url}' title='{name}' style='height:70px;margin-left:20px;float:left;'/></a>"
                        } else {
                            preview = "<a href='{url}' target='_blank'>{name}</a>"
                        }
                        preview = preview.replace("{url}", url).replace("{thumbnail_url}", thumbnail_url).replace("{name}", file.name);
                        msg = msg.replace("{preview}", preview);
                        $(".ajax-upload-view").append(msg);
                        uploadIndex++;

                    }
                });
                    }
                });

    });

</script>