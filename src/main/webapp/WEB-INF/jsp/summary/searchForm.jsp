<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <esform:label path="search.po.order_number_like">订单号</esform:label>
    <esform:input path="search.po.order_number_like" cssClass="input-small" placeholder="模糊匹配"/>
    &nbsp;&nbsp;
    <esform:label path="search.po.serial_number_like">序列号</esform:label>
    <esform:input path="search.po.serial_number_like" cssClass="input-small" placeholder="模糊匹配"/>
    &nbsp;&nbsp;
    <esform:label path="search.po.customer_name_like">客户名称</esform:label>
    <esform:input path="search.po.customer_name_like" cssClass="input-medium" placeholder="模糊匹配"/>
    &nbsp;&nbsp;
    <input type="submit" class="btn" value="查询"/>
    <a class="btn btn-link btn-clear-search">清空</a>


</form>
