<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>任务控制台</title>
<link rel="stylesheet"
	href="/s/c/agvmgr/agvmgr.css?fv=${staticFileVersion}">
</head>
<body>
	<div id="msg">
		<div id="tipsOper">
			<span class="yellowFont">欢迎，${userSession.userName}！</span> <span
				class="redFont" id="warning"></span>
			<c:if test="${userSessionId==27}">
				<a href="/sysInit.shtml" class="mgr">重新初始化</a>
				<a href="logout.shtml">切换账号</a>
			</c:if>
		</div>
		<div id="tips"></div>
	</div>
</body>
<script src="/s/j/jquery-1.12.2.min.js"></script>
<script src="/s/j/agvmgr/agv.msg.js?fv=${staticFileVersion}"></script>
</html>