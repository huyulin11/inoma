<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="/WEB-INF/tag/sysDicValue.tld" prefix="sysDic"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<script type="text/javascript"
	src="/s/j/My97DatePicker/WdatePicker.js${fv}"></script>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/wmsinbound/operation/list.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/laydate/laydate.js${fv}"></script>
<div class="m-b-md">
	<form class="form-inline" role="form" id="searchForm" name="searchForm">
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">申请单号</span></label> <input
				class="input-medium ui-autocomplete-input" id="packageid"
				name="WmsPackageFormMap.packageid"><label class="control-label"> <span
				class="h4 font-thin v-middle">封箱时间</span></label>
				<input id="createusertimeK" name="WmsPackageFormMap.createusertimeK"
							class="Wdate inputValue " type="text"
							onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'createusertimeJ\')||\'2050-10-01\'}'})"
							size="17"  /> &nbsp;&nbsp;至 &nbsp;&nbsp; <input
							id="createusertimeJ" name="WmsPackageFormMap.createusertimeJ" class="Wdate inputValue " type="text"
							onFocus="WdatePicker({minDate:'#F{$dp.$D(\'createusertimeK\')}',maxDate:'2050-10-01'})"
							size="17"  /><label class="control-label"> <span
				class="h4 font-thin v-middle">封箱人:</span></label> <input
				class="input-medium ui-autocomplete-input" id="createuserid"
				name="WmsPackageFormMap.createuserid">
		</div>
		<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
	</form>
</div>

<div class="table-responsive">
	<div id="paging" class="pagclass"></div>
</div>
<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${inboundopRes}" var="key">
			${key.description}
		</c:forEach>
	</div>
</header>