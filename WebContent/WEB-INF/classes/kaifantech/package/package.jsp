<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<%@include file="/WEB-INF/jsp/common/common.jspf"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<style>
#printpackageinfo{
	display: block;
	display: none;
	position: fixed;
	width: 210px;
	background: #fff;
	padding: 15px 10px;
	border: 1px solid #5fafff;
	border-radius: 10px;
	color: #333;
	font-size: 14px;
	z-index: 100;
	box-shadow: 4px 4px rgba(0, 0, 0, .5);
	z-index: 100;
}
</style>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/print/LodopFuncs.js${fv}"></script>
<script type="text/javascript">
$(function() {
		operatorname='${sessionScope.userSession.userName}';
})
</script>
<c:if test="${busstype=='DEPOSIT'}">
	<script type="text/javascript" src="${ctx_js}/package/package.js${fv}"></script>
</c:if>
<c:if test="${busstype=='JUDGE'}">
	<script type="text/javascript"
		src="${ctx_js}/package/packageJudge.js${fv}"></script>
</c:if>
<c:if test="${busstype=='MULTI'}">
	<script type="text/javascript"
		src="${ctx_js}/package/packageMulti.js${fv}"></script>
</c:if>
<div class="m-b-md">
	<a href="javascript:void(0)" id="surepackage" class="btn btn-default">封箱结束</a>
	<c:if test="${busstype=='MULTI'}">
	<a href="javascript:void(0)" id="allpackage" class="btn btn-default">批量保存</a>
	</c:if>
	<a href="javascript:void(0)" id="printpackage" class="btn btn-default" style="float:right">箱号打印</a>
</div>
<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
</header>
<div class="table-responsive">
	<form id="sealingform" action="/judge/sealing.shtml" method="post">
		<div id="paging" class="pagclass"></div>
	</form>
</div>
<div id="printpackageinfo">
	<div class="printpackageinfoshow"></div>
</div>