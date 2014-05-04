<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<es:contentHeader/>
<script src="${ctx}/static/js/productionOrder/edit.js?22" type="text/javascript"></script>

<div>
	<input type="hidden" id="op" value="${op}">
</div>


<div class="panel">
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
        <shiro:hasPermission name="productionOrder:delete">
        <li ${op eq '删除' ? 'class="active"' : ''}>
            <a href="${ctx}/productionOrder/${po.id}/delete?BackURL=<es:BackURL/>">
                <i class="icon-trash"></i>
                删除
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
                    <form:input path="customerName" cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="orderNumber" cssClass="control-label">订单号</form:label>
                <div class="controls">
                    <form:input path="orderNumber" cssClass=""  placeholder=""/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="serialNumber" cssClass="control-label">序列号</form:label>
                <div class="controls">
                    <form:input path="serialNumber"
                                cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="contractDeliveryDate" cssClass="control-label">合同交期</form:label>
                <div class="controls input-append date">
                    <form:input path="contractDeliveryDate"
                                  data-format="yyyy-MM-dd"
                                  data-position="bottom-left"
                                  placeholder=""/>
                    <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div id="productioninfo" ms-controller="production" >


            <div ms-repeat="list">

            <h4 class="hr">产品信息{{$index+1}}
                <span ms-click="add" style="cursor:pointer"><i class="fa fa-plus-circle fa-lg"></i></span>
                &nbsp; &nbsp;
                <span ms-click="remove(el)" style="cursor:pointer"><i class="fa fa-minus-circle fa-lg"></i></span>
            </h4>

            <div class="control-group span3" >
                <form:label path="productions[0].name" cssClass="control-label">品名</form:label>

                <div class="controls" >
                    <input type="text"  ms-duplex="el.name">

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].brand" cssClass="control-label">商标</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.brand"/>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="productions[0].styleNumberMale" cssClass="control-label">款号(男)</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.styleNumberMale"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].sizeStandardsMale" cssClass="control-label">号型标准(男)</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sizeStandardsMale"/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].styleNumberFemale" cssClass="control-label">款号(女)</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.styleNumberFemale"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].sizeStandardsFemale" cssClass="control-label">号型标准(女)</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sizeStandardsFemale"/>

                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="productions[0].style" cssClass="control-label">男女款式</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.style"/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].handleMethod" cssClass="control-label">成衣后处理方式</form:label>
                <div class="controls">
                        <input type="text" ms-duplex="el.handleMethod"/>
                    </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="productions[0].sampleStyle" cssClass="control-label">提供样衣类型</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sampleStyle"/>
                </div>


            </div>
            <div class="control-group span3">
                <form:label path="productions[0].sampleStyleNumber" cssClass="control-label">样衣款号</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sampleStyleNumber"/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].sampleAmount" cssClass="control-label">数量</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sampleAmount"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].sampleRevisionDesc" cssClass="control-label">样衣修改说明</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sampleRevisionDesc"/>

                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="productions[0].sampleProvider" cssClass="control-label">样衣提供单位</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.sampleProvider"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].materialReserve" cssClass="control-label">面辅料是否预订</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.materialReserve"/>

                </div>
            </div>
            <div class="clearfix"></div>
            <div class="control-group span3">
                <form:label path="productions[0].measureSampleVersion" cssClass="control-label">量体样衣版型</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.measureSampleVersion"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].measureStaff" cssClass="control-label">量体人员</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.measureStaff"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].archiveStaff" cssClass="control-label">归档人员</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.archiveStaff"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].finishDate" cssClass="control-label">完成时间</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.finishDate"/>

                </div>
            </div>
                <!-- 面料主色-->
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">面料主色</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="el.outshellMainColor.colorName"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">规格</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="el.outshellMainColor.style"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">成分</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="el.outshellMainColor.materia"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">产前后处理</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="el.outshellMainColor.handle"/>

                    </div>
                </div>
                <div class="clearfix"></div>
                <!-- 面料镶色-->
                <div ms-repeat-data="el.outshellSetColorJson" style="position:relative;">
                <span ms-click="addOutshell(el)" style="position: absolute;left: 0;top:3px;cursor:pointer;"><i class="fa fa-plus-circle fa-lg"></i></span>
                    <span ms-click="removeOutshell(el,data)" style="position: absolute;left: 25px;top:3px;cursor:pointer;"><i class="fa fa-minus-circle fa-lg"></i></span>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">面料镶色{{$index+1}}</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data.colorName"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">规格</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data.style"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">成分</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data.materia"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">产前后处理</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data.handle"/>

                    </div>
                </div>
                <div class="clearfix"></div>
                </div>

            <!-- 里料主色-->
            <div class="control-group span3">
                <form:label path="productions[0].liningMainColor" cssClass="control-label">里料主色</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.liningMainColor.colorName"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].liningMainColor" cssClass="control-label">规格</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.liningMainColor.style"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].liningMainColor" cssClass="control-label">成分</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.liningMainColor.materia"/>

                </div>
            </div>
            <div class="control-group span3">
                <form:label path="productions[0].liningMainColor" cssClass="control-label">产前后处理</form:label>
                <div class="controls">
                    <input type="text" ms-duplex="el.liningMainColor.handle"/>

                </div>
            </div>
            <div class="clearfix"></div>




            <!--里料拼色-->
            <div ms-repeat-data1="el.liningSetColorJson" style="position:relative;">
                <span ms-click="addLining(el)" style="position: absolute;left: 0;top:3px;cursor:pointer;"><i class="fa fa-plus-circle fa-lg"></i></span>
                <span ms-click="removeLining(el,data1)" style="position: absolute;left: 25px;top:3px;cursor:pointer;"><i class="fa fa-minus-circle fa-lg"></i></span>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">里料拼色{{$index+1}}</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data1.colorName"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">规格</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data1.style"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">成分</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data1.materia"/>

                    </div>
                </div>
                <div class="control-group span3">
                    <form:label path="productions[0].outshellMainColor" cssClass="control-label">产前后处理</form:label>
                    <div class="controls">
                        <input type="text" ms-duplex="data1.handle"/>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>


            <!-- 袋布-->
                            <div ms-repeat-data2="el.baggingJson" style="position:relative;">
                            <span ms-click="addBagging(el)" style="position: absolute;left: 0;top:3px;cursor:pointer;"><i class="fa fa-plus-circle fa-lg"></i></span>
                                <span ms-click="removeBagging(el,data2)" style="position: absolute;left: 25px;top:3px;cursor:pointer;"><i class="fa fa-minus-circle fa-lg"></i></span>
                            <div class="control-group span3">
                                <form:label path="productions[0].outshellMainColor" cssClass="control-label">袋布{{$index+1}}</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="data2.colorName"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].outshellMainColor" cssClass="control-label">规格</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="data2.style"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].outshellMainColor" cssClass="control-label">成分</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="data2.materia"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].outshellMainColor" cssClass="control-label">产前后处理</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="data2.handle"/>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                            </div>


                            <div class="control-group span3">
                                <form:label path="productions[0].materialSpecialReq" cssClass="control-label">面辅料特殊要求</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.materialSpecialReq"/>

                                </div>
                            </div>

                            <div class="control-group span3">
                                <form:label path="productions[0].packingReq" cssClass="control-label">填充物要求</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.packingReq"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].otherReq" cssClass="control-label">其他要求</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.otherReq"/>

                                </div>
                            </div>
                             <div class="clearfix"></div>
                            <div class="control-group span3">
                                <form:label path="productions[0].peopleNumberMale" cssClass="control-label">人数(男)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.peopleNumberMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].peopleNumberFemale" cssClass="control-label">人数(女)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.peopleNumberFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].totalPeople" cssClass="control-label">人数合计</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.totalPeople"/>

                                </div>
                            </div>
                             <div class="clearfix"></div>
                            <div class="control-group span3">
                                <form:label path="productions[0].amountMale" cssClass="control-label">数量(男)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.amountMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].availableMale" cssClass="control-label">可利用(男)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.availableMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].needMale" cssClass="control-label">需生产(男)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.needMale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].orderTotal" cssClass="control-label">订单合计</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.orderTotal"/>

                                </div>
                            </div>

                            <div class="clearfix"></div>
                            <div class="control-group span3">
                                <form:label path="productions[0].amountFemale" cssClass="control-label">数量(女)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.amountFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].availableFemale" cssClass="control-label">可利用(女)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.availableFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].needFemale" cssClass="control-label">需生产(女)</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.needFemale"/>

                                </div>
                            </div>
                            <div class="control-group span3">
                                <form:label path="productions[0].productionTotal" cssClass="control-label">生产合计</form:label>
                                <div class="controls">
                                    <input type="text" ms-duplex="el.productionTotal"/>

                                </div>
                            </div>
        </div>

        <div id="packaheinfo">
            <h4 class="hr">包装信息</h4>
            <div class="control-group span3">
                <form:label path="packagingReq" cssClass="control-label">包装要求</form:label>
                <div class="controls">
                    <form:input path="packagingReq"
                                cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="packingReq" cssClass="control-label">装箱要求</form:label>
                <div class="controls">
                    <form:input path="packingReq"
                                cssClass="" placeholder=""/>
                </div>
            </div>
            <div class="control-group span3">
                <form:label path="sizebeltReq" cssClass="control-label">尺码带、洗唛等要求</form:label>
                <div class="controls">
                    <form:input path="sizebeltReq"
                                cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="companylogoReq" cssClass="control-label">企业标识要求</form:label>
                <div class="controls">
                    <form:input path="companylogoReq"
                                cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="productionParts" cssClass="control-label">随货配件</form:label>
                <div class="controls">
                    <form:input path="productionParts"
                                cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="checkReport" cssClass="control-label">检测报告内容</form:label>
                <div class="controls">
                    <form:input path="checkReport"
                                cssClass="" placeholder=""/>
                </div>
            </div>

            <div class="control-group span3">
                <form:label path="remark" cssClass="control-label">备注</form:label>
                <div class="controls">
                    <form:input path="remark"
                                cssClass="" placeholder=""/>
                </div>
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
                    ${po.orderPrincipal}
                </div>
            </div>


            <div class="control-group span3">
                <form:label path="regionalManager" cssClass="control-label">片区经理</form:label>
                <div class="controls">
                    ${po.regionalManager}
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
<script type="text/javascript">
    $(function () {

        <c:choose>
            <c:when test="${op eq '删除'}">
                //删除时不验证 并把表单readonly
                $.app.readonlyForm($("#editForm"), false);

            </c:when>
            <c:when test="${op eq '查看'}">
                $.app.readonlyForm($("#editForm"), true);
                //$.sys.organization.removeOrganizationBtn();
            </c:when>
            <c:otherwise>
                //$.sys.user.initValidator($("#editForm"));
                <es:showFieldError commandName="po"/>
            </c:otherwise>
        </c:choose>

    });

</script>