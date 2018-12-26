<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript" src="${ctx_js}/print/LodopFuncs.js${fv}"></script>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/task/rating/list.js${fv}"></script>
<script type="text/javascript">
var other="${other}";
</script>
<style>
#mytable{
word-wrap:break-word;word-break:break-all;white-space:normal;
   
}
#mytable td{
overflow:hidden;

}
</style>
<div class="m-b-md">
	<form class="form-inline" role="form" id="searchForm" name="searchForm">
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">申请单号:${role }</span></label> <input
				class="input-medium ui-autocomplete-input" id="requestcode"
				name="taskFormMap.requestcode">
		</div>
		<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
		<a href="javascript:void(0)" class="btn btn-default" id="numberprint">箱号打印</a>
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