<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/common.jspf"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/judge/urls.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/judge/judgeConfirm.js${fv}"></script>
<style type="text/css">
.m-b-md{
width:81px;
height:33px;
front-size:16px;
margin-top:18px;
margin-left:23px;
box-shadow:-3px 0 3px #B9B9B9, /*左边阴影*/
            3px 0 3px #B9B9B9, /*右边阴影*/
            0 -3px 3px #B9B9B9, /*顶部阴影*/
            0 3px 3px #B9B9B9; /*底边阴影*/
}
</style>
<div class="m-b-md">
		<a href="javascript:void(0)" class="btn btn-default" id="start">开始复核</a>
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
<div class="m-b-md" style="display:none">
		<a href="javascript:void(0)" class="btn btn-default" id="comfirmResult">提交封箱</a>
</div>
