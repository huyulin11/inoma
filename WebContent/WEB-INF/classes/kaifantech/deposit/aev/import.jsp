<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>${title}</title>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<%-- Google Chrome Frame也可以让IE用上Chrome的引擎: --%>
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- 
width - viewport的宽度 height - viewport的高度
initial-scale - 初始的缩放比例
minimum-scale - 允许用户缩放到的最小比例
maximum-scale - 允许用户缩放到的最大比例
user-scalable - 用户是否可以手动缩放
 --%>


<link type="text/css" rel="stylesheet" href="${ctx_css}/b/forms.css" />
<link type="text/css" rel="stylesheet" href="${ctx_css}/b/base.css" />
<link type="text/css" rel="stylesheet" href="${ctx_css}/b/application.css" />
<link type="text/css" rel="stylesheet" href="${ctx_css}/b/custom.css" />
<link href="${ctx_css}/main.css" type="text/css" rel="stylesheet" />
<link href="${ctx_css}/background.css${fv}" type="text/css"
	rel="stylesheet" />
<link href="${ctx_static}/plugins/jui/themes/redmond/jquery-ui-1.9.2.custom.min.css"
	type="text/css" rel="stylesheet" />
<link href="${ctx_static}/plugins/qtip/jquery.qtip.min.css"
	type="text/css" rel="stylesheet" />
<link href="${ctx_static}/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.css"
	type="text/css" rel="stylesheet" />
<link href="${ctx_css}/deposit/deposit.css${fv}" type="text/css"
	rel="stylesheet" />

<c:choose>
	<c:when test="${entitytype=='1'}">
	</c:when>
	<c:when test="${entitytype=='2'}">
	</c:when>
	<c:when test="${entitytype=='3'}">
	</c:when>
	<c:when test="${entitytype=='4'}">
		<link href="${ctx_css}/deposit/depositTips.css${fv}" type="text/css"
			rel="stylesheet" />
	</c:when>
	<c:when test="${entitytype=='5'}">
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${udRequestType=='ADD'}">
		<link href="${ctx_css}/deposit/depositAdd.css${fv}" type="text/css"
			rel="stylesheet" />
	</c:when>
	<c:when test="${udRequestType=='EDIT'}">
		<link href="${ctx_css}/deposit/depositEdit.css${fv}" type="text/css"
			rel="stylesheet" />
	</c:when>
	<c:when test="${udRequestType=='HEAR'}">
		<link href="${ctx_static}/plugins/alert/jquery.alerts.css"
			rel="stylesheet" type="text/css" media="screen" />
		<link href="${ctx_css}/deposit/depositEdit.css${fv}" type="text/css"
			rel="stylesheet" />
	</c:when>
	<c:when test="${udRequestType=='VIEW'}">
		<link href="${ctx_css}/style.css" type="text/css" rel="stylesheet"/>
		<link href="${ctx_css}/deposit/depositDetail.css" type="text/css"
			rel="stylesheet" />
	</c:when>
</c:choose>

<%-- import images --%>
<link href="${ctx_images}/ico/ytgrading.ico" type="image/x-icon"
	rel=icon>
<link href="${ctx_images}/ico/ytgrading.ico" type="image/x-icon"
	rel="shortcut icon">
</head>