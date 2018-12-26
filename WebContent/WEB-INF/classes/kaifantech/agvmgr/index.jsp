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
		<div>
			<div>
				<table class="task">
					<tr class="ctrlTr">
						<td>
							<div>
								<button id="PAUSE_USER">暂停所有</button>
							</div>
						</td>
						<td>
							<div>
								<button id="CONTINUE">继续所有</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<table class='agv'>
				<tr class='agvTr'></tr>
			</table>
		</div>
		<div>
			<table class='area'>
				<tr class='areaTr'></tr>
			</table>
		</div>
		<div>
			<table class='lap'>
				<tr class='lapTr'></tr>
			</table>
		</div>
	</div>

	<div id="coordinate"></div>

	<div id="msg">
		<div id="tipsOper">
			<span class="yellowFont">欢迎，${userSession.userName}！</span> <span
				class="redFont" id="warning"></span>
			<c:if test="${userSessionId==27}">
				<a href="logout.shtml">切换账号</a>
			</c:if>
		</div>
	</div>
</body>
<script src="/s/j/jquery-1.12.2.min.js"></script>
<script src="/s/j/layer-v1.9.2/layer/layer.js"></script>
<script src="/s/j/d3/d3.min.js"></script>

<script src="/s/j/agvmgr/agv.mgr.js?fv=${staticFileVersion}"></script>
<script src="/s/j/agvmgr/agv.index.js?fv=${staticFileVersion}"></script>
<script src="/s/j/agvmgr/location.data.js?fv=${staticFileVersion}"></script>
<script src="/s/j/agvmgr/location.render.js?fv=${staticFileVersion}"></script>
<script src="/s/j/agvmgr/agv.msg.js?fv=${staticFileVersion}"></script>
</html>