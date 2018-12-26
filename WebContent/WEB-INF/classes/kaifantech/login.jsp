<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<html lang="en"
	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<title>${bussName}登录</title>
<!-- 为移动设备添加 viewport -->
<meta name="viewport"
	content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${ctx_css}/min.css">
<link rel="stylesheet" href="${ctx_css}/login.css">
<link href="${ctx_css}/css.css" rel="stylesheet" type="text/css">
<%
	String domain = request.getHeader("Host");
	if (domain.startsWith("192.168") || domain.startsWith("127.0.0.1")
			|| domain.toLowerCase().startsWith("localhost")) {
		request.setAttribute("selfNet", "true");
	} else {
		request.setAttribute("selfNet", "false");
	}
%>
</head>
<body>
	<div id="loginbox">
		<form id="loginform" name="loginform" class="form-vertical"
			action="/login.shtml" method="post">
			<div class="control-group normal_text">
				<table>
					<tr>
						<td align="center">${bussName}</td>
					</tr>
				</table>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
					<input
							type="text" placeholder="用户名" name="username" autocomplete="off" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<c:if test="${selfNet=='true'}">
							<input type="password" placeholder="密码" name="password"
								autocomplete="off" />
						</c:if>
						<c:if test="${selfNet=='false'}">
							<c:choose>
								<c:when test="${param.rem=='true'}">
									<input type="password" placeholder="密码" name="password"
										autocomplete="off" />
								</c:when>
								<c:otherwise>
									<input type="text" placeholder="密码" name="password"
										onfocus="this.type='password'" autocomplete="off" />
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<input type="hidden" name="redirect" value="${redirect}" />
				<!-- 				<span -->
				<!-- 					class="pull-left"><a href="#" class="flip-link btn btn-info" -->
				<!-- 					id="to-recover">忘记密码？</a></span> -->
				<!-- 					<span -->
				<!-- 					class="pull-left" ><a href="install.shtml" -->
				<!-- 					class="flip-link btn btn-danger" id="to-recover">一键初始化系统</a></span> -->
				<span class="pull-right"><a type="submit"
					href="javascript:checkUserForm()" class="btn btn-success">登&nbsp;&nbsp;录</a></span>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		if ("${error}" != "") {
			alert("${error}");
		};
		function checkUserForm() {
			document.loginform.submit();
		}
	</script>
</body>
</html>