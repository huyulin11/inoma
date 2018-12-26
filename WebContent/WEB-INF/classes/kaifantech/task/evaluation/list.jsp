<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<%@ taglib uri="/WEB-INF/tag/sysDicValue.tld" prefix="sysDic"%>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/task/urls.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/task/evaluation/list.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/laydate/laydate.js${fv}"></script>

<div class="m-b-md">
	<input type="hidden" id="checkflag" value="${checkRole }" />
	<c:if test="${checkRole==true}">
	<form class="form-inline" role="form" id="searchForm" name="searchForm">
		<div class="form-group">
			藏品类型：<select id="entitytype" name="taskFormMap.entitytype" class="inputValue">
				<option value=""
					<c:if test="${entitytype=='' }">selected="true"</c:if>>全部</option>
					<sysDic:option dicType="ENTITY_TYPE" dicValue="${entitytype}" />
			</select>
		</div>
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">流转号:</span></label> <input
				class="input-medium ui-autocomplete-input" id="innerno"
				name="taskFormMap.innerno">
		</div>
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">受理时间：</span></label> <input
				class="input-medium ui-autocomplete-input" id="deposittimestart" 
							onclick="laydate({elem : '#deposittimestart' , istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
				name="taskFormMap.deposittimestart"> &nbsp;至&nbsp; <input
				class="input-medium ui-autocomplete-input" id="deposittimeend" 
							onclick="laydate({elem : '#deposittimeend' , istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
				name="taskFormMap.deposittimeend">
		</div>
	<!--<div class="form-group">
			预约数量：<select id="amount" name="taskFormMap.amount" class="inputValue">
				<option value="">全部</option>
				<option value="0-50">0-50</option>
				<option value="51-100">51-100</option>
				<option value="101-200">101-200</option>
				<option value="201-300">201-300</option>
				<option value="301-400">301-400</option>
				<option value="401-500">401-500</option>
				<option value="500">500以上</option>
			</select>
		</div> -->
		<div class="form-group">
			状态：<select id="depositstatus" name="taskFormMap.depositstatus" class="inputValue">
				<option value=""
					<c:if test="${depositstatus=='' }">selected="true"</c:if>>全部</option>
					<sysDic:option dicType="DEPOSIT_STATUS" dicValue="${depositstatus}" />
			</select>
		</div>
		<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
		<a href="javascript:void(0)" class="btn btn-default" id="clare">重置</a>
	</form>
    </c:if>
	<div style="margin-left: 14px">
				
						<span id="amountcount">
						${amountcount}
						</span>
	</div>
</div>
<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${taskRes}" var="key">
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