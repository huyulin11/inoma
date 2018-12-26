<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/common.jspf"%>
<script type="text/javascript" src="${ctx_js}/system/user/edit.js${fv}"></script>

<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/user/editEntity.shtml">
		<input type="hidden" class="form-control checkacc"
			value="${user.id}" name="userFormMap.id" id="id">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入用户名" value="${user.userName}"
						name="userFormMap.userName" id="userName"
						<c:if test="${isSelf==true}"> 
							readonly="readonly"
						</c:if>>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">账号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入账号" value="${user.accountName}"
						name="userFormMap.accountName" id="accountName" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否重置密码</label>
				<div class="col-sm-9">
					<input type="checkbox" name="userFormMap.isResetPwd" id="isResetPwd" class="ace ace-switch ace-switch-5" value=0 >
				</div>
			</div>
			<div class="hidden" id="pwdDiv">
				<div class="form-group">
					<label class="col-sm-3 control-label">密码</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="123456789"
							name="userFormMap.password" id="password">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<c:if test="${isSelf==false}">
				<div id="selGroup"
					data-url="/role/selRole.shtml?roleFormMap.userId=${user.id}"></div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">是否禁用</label>
					<div class="col-sm-9">
						<div class="btn-group m-r">
							<button data-toggle="dropdown"
								class="btn btn-sm btn-default dropdown-toggle">
								<span class="dropdown-label"><c:if
										test="${user.locked eq 1}">否</c:if>
									<c:if test="${user.locked eq 0}">是</c:if></span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-select">
								<li class=""><a href="#"><input type="radio"
										name="userFormMap.locked" value="0"
										<c:if test="${user.locked eq 0}"> checked="checked"</c:if>>是</a></li>
								<li class="active"><a href="#"><input type="radio"
										name="userFormMap.locked" value="1"
										<c:if test="${user.locked eq 1}"> checked="checked"</c:if>>否</a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:if>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入账号描述"
						value="${user.description}" name="userFormMap.description" id="description">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">保存</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
	onloadurl();
	var flag = 0;
	$("input[type='checkbox']#isResetPwd").on("click",function(){
		if(flag%2==0){
			$("div#pwdDiv").removeClass("hidden");
			$("#password").val($GF.randomString(9));
		}else{
			$("div#pwdDiv").addClass("hidden");
		}
		$(this).val(flag++);
	});
	
	</script>
</body>
</html>