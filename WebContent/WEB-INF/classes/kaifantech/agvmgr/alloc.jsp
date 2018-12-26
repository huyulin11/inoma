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
<title>AGV控制台</title>
<link rel="stylesheet" href="/s/c/agvmgr/agvmgr.css">
</head>
<body>
	<div id="agvsMgr">
		<jsp:include page="alloc/agvmgrAlloc.jsp"></jsp:include>
	</div>

	<div id="coordinate"></div>

	<div id="fade" class="black_overlay">
		<div id="imgdiv">
			<img alt="" src="/s/i/loading2.gif">
		</div>
	</div>
</body>
<script src="/s/j/jquery-1.12.2.min.js"></script>
<script src="/s/j/tool/url.js"></script>
<script src="/s/j/agvmgr/agv.alloc.js?fv=${staticFileVersion}"></script>
</html>