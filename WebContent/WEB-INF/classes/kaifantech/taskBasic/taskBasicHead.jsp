<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="/s/j/print/LodopFuncs.js"></script>
<link rel="stylesheet" href="${ctx_images}/upload/css/dialog.css">
<link rel="stylesheet" href="${ctx_css}/charting.css">
<link rel="stylesheet" href="${ctx_css}/main.css" type="text/css" />
<script src="${ctx_images}/upload/js/dialog.js"></script>
<script src="/s/j/backstage.js"></script>
<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript" src="/s/j/jquery-1.8.3.js"></script>
<link rel="stylesheet"
	href="${ctx_images}/upload/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctx_images}/upload/css/blueimp-gallery.min.css">
<script
	src="${ctx_images}/upload/js/jquery.blueimp-gallery.min.js"></script>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String backPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
	String uploadImgtURL = "" ;
	String findDetailURL = "" ;
%>
<script type="text/javascript">
	var uploadImgtURL="<%=uploadImgtURL%>";
	var findDetailURL="<%=findDetailURL%>";
	var path="<%=path%>";
	var backPath="<%=backPath%>";
	var basePath="	";
	jQuery("title").html(
			jQuery("title").html() + "--${request.requestcode}");
</script>