<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>

<%--文件版本号，用于控制缓存问题--%>
<% 
	boolean isDebugMode = true ;
    if (isDebugMode){
    	Integer random = (int)(Math.random()*1000);
    	pageContext.setAttribute("fv", "?r=".concat(random.toString()));
    }
%>

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
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<%-- plugins, puts in head --%>
<%-- 实测页面<body>部分下载时间比较长，将一部分js置于head中，
	一方面可以分散body中js请求和解析时间，js的解析和页面下载同时进行，
	另一方面，可以保证在解析body中的业务js程序前，jquery、jquery-ui等依赖库提前解析完成。
 --%>
<script src="${ctx_js}/jquery-1.8.3.js"></script>
<script src="${ctx_static}/plugins/jui/jquery-ui-1.9.2.js"></script>
<script src="${ctx_js}/jquery.mytable.js"></script>
<script src="${ctx_static}/plugins/yahoo-ui/3.18.1/yui-min.js"></script><!-- yahoo ui -->


<%-- import images --%>
<link href="${ctx_images}/ico/ytgrading.ico" type="image/x-icon"
	rel=icon>
<link href="${ctx_images}/ico/ytgrading.ico" type="image/x-icon"
	rel="shortcut icon">
</head>