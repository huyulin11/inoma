<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/common/common.jspf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${ctx_js}/task/evaluation/assign.js"></script>
<script src="/s/j/jquery-1.8.3.js"></script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
	text-align: right;
}

.col-sm-9 {
	width: 85%;
	float: left;
	text-align: left;
}
label[class^="btn btn-default"] {
	margin-top: -4px;
}
.select{
	height:200px;
	width: 360px;
}
.select ul{
	height: 175px;
	list-style: none;
	overflow: hidden;
}
.select ul li{
	height: 37px;
	margin-left:20px;
	font-size: 14px;
	float: left;
}
#selectsealedbox{
	position: absolute;
	margin-top:-200px;
	margin-left: 400px;
}
</style>
<script>
	function addwitness(index){
		var witnesst = $(".witness"+index).text();
		var witnessv = $("#witness"+index).val();
		$("#witnessshow").val(witnesst);
		$("#witness").val(witnessv);
	}
	function addsealedbox(index){
		var sealedboxt = $(".sealedbox"+index).text();
		var sealedboxv = $("#sealedbox"+index).val();
		$("#sealedboxshow").val(sealedboxt);
		$("#sealedbox").val(sealedboxv);
	}
</script>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<c:if test="${flag!=1 }">
	<div id="selectwitness" class="select">
		<span>鉴定人:</span>
		<ul>
		<c:forEach var="list" items="${list}" varStatus="status">
				<li class="witness${status.index}" onclick="addwitness('${status.index}')">${list.userName }</li>
				<input type="hidden" id="witness${status.index}" value="${list.id }"/>
		</c:forEach>
		</ul>
	</div>
	<div id="selectsealedbox" class="select">
		<span>封箱人:</span>
		<ul>
		<c:forEach var="list" items="${list}" varStatus="status">
				<li class="sealedbox${status.index}" onclick="addsealedbox('${status.index}')">${list.userName }</li>
				<input type="hidden" id="sealedbox${status.index}" value="${list.id }"/>
		</c:forEach>
		</ul>
	</div>
	</c:if>
		<form class="form-horizontal" >
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="control-label">鉴定人</label>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入鉴定人" value="${witnessName}"
						id="witnessshow" readonly="readonly"> 
					<input type="hidden" id="witness" />
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">封箱人</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入封箱人"  value="${sealedboxName}"
						id="sealedboxshow" readonly="readonly">
					<input type="hidden" id="sealedbox" />
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<!--  <div style="float: right;"><span class="showpoint">添加点数人</span></div>
			<div class="line line-dashed line-lg pull-in"></div>-->
			<div class="form-group">
				<label class="col-sm-3 control-label">点数人</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输入点数人" value="${witnessdta.remark }"
						id="pointperson" <c:if test="${flag==1 }">readonly="readonly"</c:if>>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<input type="hidden" id="depositid" value="${cbox }" />
		<button type="button" class="btn btn-success btn-s-xs" id="assignsave">提交</button>
		</footer> </section>
		</form>
	<script type="text/javascript"
		src="${ctx_static}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>