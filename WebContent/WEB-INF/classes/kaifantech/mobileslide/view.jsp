<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=yes" />
<title>源泰评级</title>
<link rel="stylesheet" href="/html/mobile/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/html/mobile/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/html/mobile/css/flyPanels.css">
<link rel="stylesheet" href="/html/mobile/css/demo.css">
</head>
<%
	boolean showTimeFlag = false;
%>
<body data-debug="true">
	<!--手机显示页面-->
	<div class="flypanels-content">
		<!--banner-->
		<div class="img_gallery" style="margin-top: 50px;">
			<div class="main_img">
				<ul>
					<c:forEach var="image" items="${images}" varStatus="status">
						<c:if test="${image.imagestype=='1'}">
							<li><a href="javascript:void(0)"
								onclick="adpage('${fn:substring(image.url,fn:indexOf(image.url,'=')+1,image.url.length())}')"
								target="_blank"><img id="imgw" class="imgshow"
									src="${image.path}" alt="" width="1000" height="420" /> </a></li>
							<c:if
								test="${image.path=='/coin/index/pubimage/AD/7c52a84a-dce9-4fcd-8f07-2b2cea43e47d.jpg'}">
								<%
									showTimeFlag = true;
								%>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				<a href="javascript:;" id="btn_prev"><i
					class="fa fa-chevron-left"></i></a> <a href="javascript:;"
					id="btn_next"><i class="fa fa-chevron-right"></i></a>
			</div>
			<div class="point">
				<c:forEach var="image" items="${images}" varStatus="status">
					<c:if test="${image.imagestype=='1'}">
						<a href="#"></a>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!--banner ending-->
		<!-- 内容部分 -->
		<div class="main">

			<c:if test="${fn:length(imageShowHighScoreCoin)>0}">
				<div class="classify">
					<span>评级新品展现</span>
					<!--<a href="#">更多&nbsp;></a>-->
				</div>
				<div class="show">
					<c:forEach var="image" items="${imageShowHighScoreCoin }"
						varStatus="status">
						<a href="${image.url}" target="_blank"><img
							class="img${status.index }" src="${image.path }"></a>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${fn:length(imageShowStamp)>0}">
				<div class="classify">
					<span>邮票精品展现</span>
					<!--<a href="#">更多&nbsp;></a>-->
				</div>
				<div class="show">
					<c:forEach var="image" items="${imageShowStamp }"
						varStatus="status">
						<a href="${image.url}" target="_blank"><img
							class="img${status.index }" src="${image.path }"></a>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${fn:length(imageShowCoin)>0}">
				<div class="classify">
					<span>钱币精品展现</span>
					<!--<a href="#">更多&nbsp;></a>-->
				</div>
				<div class="show">
					<c:forEach var="image" items="${imageShowCoin }" varStatus="status">
						<a href="${image.url}" target="_blank"><img
							class="img${status.index }" src="${image.path }"></a>
					</c:forEach>
				</div>
			</c:if>
		</div>
		<script src="/html/mobile/js/jquery.min.js"></script>
		<script src="/html/mobile/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="/html/mobile/js/jquery.event.drag.js"></script>
		<script type="text/javascript"
			src="/html/mobile/js/jquery.touchSlider.js"></script>
		<script>
			$(document).ready(
					function() {
						$dragBln = false;

						$(".main_img").touchSlider(
								{
									flexible : true,
									speed : 400,
									btn_prev : $("#btn_prev"),
									btn_next : $("#btn_next"),
									paging : $(".point a"),
									counter : function(e) {
										$(".point a").removeClass("on").eq(
												e.current - 1).addClass("on");//图片顺序点切换
									}
								});

						$(".main_img").bind("mousedown", function() {
							$dragBln = false;
						});

						$(".main_img").bind("dragstart", function() {
							$dragBln = true;
						});

						$(".main_img a").click(function() {
							if ($dragBln) {
								return false;
							}
						});

						timer = setInterval(function() {
							$("#btn_next").click();
						}, 3000);

						$(".img_gallery").hover(function() {
							clearInterval(timer);
						}, function() {
							timer = setInterval(function() {
								$("#btn_next").click();
							}, 3000);
						});

						$(".main_img").bind("touchstart", function() {
							clearInterval(timer);
						}).bind("touchend", function() {
							timer = setInterval(function() {
								$("#btn_next").click();
							}, 3000);
						});

					});

			function search(param) {
				top.location.href = "/web/yt/mobileindex?id=" + param;
			}
			function adpage(param) {
				window.location.href = "/web/yt/adpage?pagetype=" + param;
			}
		</script>
</body>
</html>