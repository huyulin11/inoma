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
	src="/s/j/My97DatePicker/WdatePicker.js"></script>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/wmsinbound/query/list.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/laydate/laydate.js${fv}"></script>
<div class="m-b-md">
	<form class="form-inline" role="form" id="searchForm" name="searchForm">
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">申请单号</span></label> <input
				class="input-medium ui-autocomplete-input" id="packageid"
				name="WmsInBoundFormMap.packageid"><label class="control-label" style="width: 120px;text-align: center;"> <span
				class="h4 font-thin v-middle">封&nbsp;箱&nbsp;时&nbsp;间</span></label> <input id="createusertimeK" name="WmsInBoundFormMap.createusertimeK"
							class="Wdate inputValue " type="text"
							onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'createusertimeJ\')||\'2050-10-01\'}'})"
							size="17"  /> &nbsp;&nbsp;至 &nbsp;&nbsp; <input
							id="createusertimeJ" name="WmsInBoundFormMap.createusertimeJ" class="Wdate inputValue " type="text"
							onFocus="WdatePicker({minDate:'#F{$dp.$D(\'createusertimeK\')}',maxDate:'2050-10-01'})"
							size="17"  />
		</div>
		<div class="form-group">
			<label class="control-label" style="width: 72px;text-align: center;"> <span
				class="h4 font-thin v-middle">入&nbsp;库&nbsp;人</span></label> <input
				class="input-medium ui-autocomplete-input" id="createuserid"
				name="WmsInBoundFormMap.inbounduserid"><label class="control-label" style="width: 120px;text-align: center;"> <span
				class="h4 font-thin v-middle">提交入库时间</span></label>
				<input id="inboundtimeK" name="WmsInBoundFormMap.inboundtimeK"
							class="Wdate inputValue " type="text"
							onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'inboundtimeJ\')||\'2050-10-01\'}'})"
							size="17"  /> &nbsp;&nbsp;至 &nbsp;&nbsp; <input
							id="inboundtimeJ" name="WmsInBoundFormMap.inboundtimeJ" class="Wdate inputValue " type="text"
							onFocus="WdatePicker({minDate:'#F{$dp.$D(\'inboundtimeK\')}',maxDate:'2050-10-01'})"
							size="17"  />
		</div>
		<a href="javascript:void(0)" class="btn btn-default" id="search" style="margin-left:20px;">查询</a>
	</form>
</div>
<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
</header>
<div class="table-responsive">
	<div id="paging" class="pagclass"></div>
</div>

<div class="table-responsive">
	<div id="paging2" class="pagclass"></div>
</div>