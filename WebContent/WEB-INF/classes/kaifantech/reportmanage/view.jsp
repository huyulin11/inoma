<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zh">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/s/c/main.css"></link>
<link rel="stylesheet" href="/s/c/reportmanager/view.css"></link>
<script src="/s/j/jquery-1.12.2.min.js"></script>
<script src="/s/j/common.js"></script>
<title>通用报表查询器</title>
</head>
<body>
	<div id="body">
		<div class='searchBtnDiv'>
			<div id="query">
				<span>查 询</span>
			</div>
		</div>
		<div>
			<jsp:include page="routing.jsp"></jsp:include>
		</div>
	</div>
</body>
<script src="/s/j/reportmanage/view.js"></script>
</html>