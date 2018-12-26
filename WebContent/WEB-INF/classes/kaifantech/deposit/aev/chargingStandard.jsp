<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<div id="standardWin" style="display: none; width: 690px; height: auto;">
	<div style="float: left; margin-left: 45px; width: 576px">
		<span class="tabTitle">评级收费</span>
		<hr>
	</div>
	<div style="float: left; margin-left: 45px; margin-top: 20px;">
	<c:choose>
		<c:when test="${entitytype=='1'}">
		<img alt="" src="${ctx_images}/standard.png">
		</c:when>
		<c:when test="${entitytype=='2'}">
		<img alt="" src="${ctx_images}/standardBill.png">
		</c:when>
		<c:when test="${entitytype=='3' || entitytype=='5'}">
		<img alt="" src="${ctx_images}/standardancientcoin.png">
		</c:when>
		<c:when test="${entitytype=='4'}">
		<img alt="" src="${ctx_images}/standardStamp.jpg">
		</c:when>
	</c:choose>
	</div>
</div>