<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<%@include file="/WEB-INF/jsp/common/common.jspf"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/judge/urls.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/judge/judgeResult.js${fv}"></script> 
<script type="text/javascript">
$(function(){
	var con = $('td:eq(7) input').val();
	if(con!=""){
		$(".save").css("color","blue");
		$("#judgeEnd").show();
	}
})
</script>
<div class="m-b-md">
		<a href="javascript:void(0)" class="btn btn-default" id="saveAll" style="display: none;" >批量保存</a>
</div>
<div class="m-b-md">
		<a href="javascript:void(0)" class="btn btn-default" id="judgeEnd" style="display: none;" >评鉴结束</a>
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