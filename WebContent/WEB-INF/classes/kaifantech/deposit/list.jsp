<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<script type="text/javascript" src="${ctx_js}/deposit/mgr/list.js"></script>
<div class="m-b-md">
	<form class="form-inline" role="form" id="searchForm" name="searchForm">
	<br>
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">预约单号:</span></label> <input
				class="input-medium ui-autocomplete-input" id="reservno"
				name="depositMainFormMap.reservno">
		</div>
		<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
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
