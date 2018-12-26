<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tag/sysDicValue.tld" prefix="sysDic"%>
<!doctype html>
<html class="no-js" lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>源泰评级</title>
<link rel="stylesheet" href="/html/mobile/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/html/mobile/fonts/font-awesome-4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/html/mobile/css/default.css">
<link rel="stylesheet" href="/html/mobile/css/flyPanels.css">
<link rel="stylesheet" href="/html/mobile/css/demo.css">
<link rel="stylesheet" href="/html/mobile/css/idangerous.swiper.css">
</head>
<body data-debug="true">
	<div class="flypanels-container preload">
		<div class="offcanvas flypanels-left">
			<div class="panelcontent" data-panel="treemenu">
				<a href="/mobile/home/view.shtml" target="main"><img
					class="ytlogo" src="/html/mobile/img/logo.jpg"></a>
				<nav class="flypanels-treemenu" role="navigation">
					<ul>
						<li class="haschildren"><div>
								<a class="link" href="/mobile/home/view.shtml" target="main"
									data-panel="treemenu">首页</a>
							</div></li>

						<li><div>
								<a target="main" href="/html/mobile/introduce.html" class="link">公司简介</a>
							</div></li>
						<li class="haschildren"><div>
								<a target="main" href="/html/mobile/songping.html" class="link"
									data-panel="treemenu">评级服务</a> <a href="#" class="expand">7<i
									class="fa icon"></i></a>
							</div>
							<ul>
								<li><div>
										<a target="main" href="/html/mobile/songping.html"
											class="link">送评中心</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/package.html" class="link">封装保护</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/scope.html" class="link">送评范围</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/biaozhun.html"
											class="link">评级标准</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/shoufei.html" class="link">收费标准</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/team.html" class="link">团队介绍</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/mark.html" class="link">分数报告</a>
									</div></li>
							</ul></li>
						<li class="haschildren"><div>
								<a target="main" href="/html/mobile/deposit.html" class="link">托管服务</a>
								<a href="#" class="expand">3<i class="fa icon"></i></a>
							</div>
							<ul>
								<li><div>
										<a target="main" href="/html/mobile/deposit.html" class="link">托管中心</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/deposit.html" class="link"
											id="goToPageB">托管贴士</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/deposit.html" class="link"
											id="goToPageD">合作机构</a>
									</div></li>
							</ul></li>
						<li class="haschildren"><div>
								<a target="main" href="/html/mobile/serve.html" class="link">增值服务</a>
								<a href="#" class="expand">4<i class="fa icon"></i></a>
							</div>
							<ul>
								<li><div>
										<a target="main" href="/html/mobile/serve.html" class="link">个性化服务</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/zhitongche.html"
											class="link">直通车</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/serve.html" class="link">源泰两周年纪念章</a>
									</div></li>
								<li><div>
										<a target="main" href="/html/mobile/other.html" class="link">其它</a>
									</div></li>
							</ul></li>
						<li><div>
								<a target="main" href="/html/mobile/xieyi.html" class="link">服务协议</a>
							</div></li>
						<li><div>
								<a target="main" href="/html/mobile/contact.html" class="link">联系我们</a>
							</div></li>
					</ul>
				</nav>
			</div>

		</div>
		<!-- 左边隐藏侧边栏结束 -->
		<!-- 主体部分-->
		<div class="flypanels-main">
			<!-- header -->

			<div class="flypanels-topbar">
				<a class="flypanels-button-left icon-menu" data-panel="treemenu"
					href="#"><i class="fa fa-bars"></i></a> 源泰评级 <a
					class="flypanels-button-right icon-menu" data-panel="search"
					href="#" style="float: right;"><i class="fa fa-search"></i></a>
			</div>
			<!-- header ending -->

			<div class="flypanels-content">
				<!-- 内容部分 -->
				<iframe class="iframe_search" id="iframepage" name="main"
					frameborder="0" width="100%" height="600px" style="display: none"></iframe>

				<div class="content-search">

					<!--左右切换按钮-->
					<div class="btn">
						<a class="btnleft" href="#"></a><a class="btnright" href="#"></a>
					</div>
					<!--图片展示部分-->

					<div class="swiper-container " style="margin-top: 50px;">
						<div class="swiper-wrapper">
							<div class="swiper-slide" style="width: 100%;">
								<div class="content-slide">
									<img class="u5" src="${img1}" />
								</div>
							</div>
							<div class="swiper-slide">
								<div class="content-slide">
									<img class="u8" src="${img2}" />
								</div>
							</div>
						</div>
						<div class="pagination"></div>
					</div>


					<c:if test="${!empty requestcoin}">
						<div class="decoration">
							<c:if test="${request.entitytype==4}">
								<c:if test="${count>10 }">
									<table>
										<tbody>
											<c:forEach var="i" begin="0" end="${counts+1}">
												<c:if test="${array[i]!=null }">
													<tr>
														<th><c:out value="${array[i]}" /></th>
														<c:choose>
															<c:when test="${array2[i]!=null}">
																<td><sysDic:value dicType="${array2[i]}"
																		dicValue="${array1[i]}" /></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${array1[i]}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
									<hr>
									<table>
										<tbody>
											<c:forEach var="i" begin="${counts+2}" end="${count+1}">
												<c:if test="${array[i]!=null }">
													<tr>
														<th><c:out value="${array[i]}" /></th>
														<c:choose>
															<c:when test="${array2[i]!=null}">
																<td><sysDic:value dicType="${array2[i]}"
																		dicValue="${array1[i]}" /></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${array1[i]}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${count<=10 }">
									<table>
										<tbody>
											<c:forEach var="i" begin="0" end="${count+1}">
												<c:if test="${array[i]!=null }">
													<tr>
														<th><c:out value="${array[i]}" /></th>
														<c:choose>
															<c:when test="${array2[i]!=null}">
																<td><sysDic:value dicType="${array2[i]}"
																		dicValue="${array1[i]}" /></td>
															</c:when>
															<c:otherwise>
																<td><c:out value="${array1[i]}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</c:if>
							<c:if test="${request.entitytype==6}">
								<table>
									<tr>
										<td><pre>
												<c:out value="${sysSuitBasicInfo.detinformation}" />
											</pre></td>
										<td><c:if test="${requestcoin.score==null}">
												<pre>
													<c:out value="${requestcoin.scores}" />
												</pre>
											</c:if> <c:if
												test="${requestcoin.score!=null && requestcoin.score!=0}">
												<c:out value="${requestcoin.score}" />
											</c:if> <c:if
												test="${requestcoin.score!=null && requestcoin.score==0}">
					真品
				</c:if></td>
									</tr>
								</table>
							</c:if>
						</div>

					</c:if>
					<c:if test="${empty requestcoin}">
						<div
							style="width: 100%; height: 100px; text-align: center; margin-top: 100px; color: #FFF; font-size: 20px;">
							<p style="margin-top: 20%">艺术品详情</p>
						</div>
					</c:if>
				</div>

			</div>
			<!-- 内容部分结束 -->
			<div class="footer">
				地址:上海市田林路1016号科技绿洲三期2-1号楼<br>沪ICP备1304671号
			</div>
		</div>
		<!-- 主体部分结束-->

		<!-- 右边隐藏侧边栏 -->
		<div class="offcanvas flypanels-right">
			<div class="panelcontent" data-panel="search">
				<div class="searchbox">
					<input title="search" type="text" placeholder="源泰钱币搜索" id="keyword" />
					<a href="javascript:search()" aria-label="search"
						class="searchbutton"><i class="fa fa-search"></i></a>
				</div>
				<a href="/html/mobile/mark.html" target="main"
					class="fenshubutton"><button class="fenshu-button">源泰钱币分数报告</button></a>
				<img class="code" src="/html/mobile/img/code.png">
			</div>
		</div>
	</div>
	<!-- 右边隐藏侧边栏结束  -->
	<script src="/html/mobile/js/jquery.min.js"></script>
	<script src="/html/mobile/dist/jquery.flypanels.js"></script>
	<script src="/html/mobile/js/bootstrap.min.js"></script>
	<script src="/html/mobile/js/kitUtils.js"></script>
	<script type="text/javascript"
		src="/html/mobile/js/idangerous.swiper.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.flypanels-container').flyPanels({
				treeMenu : {
					init : true
				},
				search : {
					init : true,
					saveQueryCookie : true
				}
			});
			FastClick.attach(document.body);
		});
	</script>
	<script>
		var mySwiper = new Swiper('.swiper-container', {
			pagination : '.pagination',
			loop : true,
			grabCursor : true,
			paginationClickable : true
		})
		$('.btnleft').on('click', function(e) {
			e.preventDefault()
			mySwiper.swipePrev()
		})
		$('.btnright').on('click', function(e) {
			e.preventDefault()
			mySwiper.swipeNext()
		})
		var tabsSwiper = new Swiper('.swiper-container', {
			speed : 500,
		});
		function search() {
			var txt = document.getElementById("keyword").value;
			if (txt == '' || txt == null) {
				alert("请输入评级编号");
				return;
			}
			window.location.href = "/mobile/appcoindis/view.shtml?id=" + txt;
		}
	</script>

	<!-- 跳转至托管中心并触发点击事件 -->
	<script>
		$('#goToPageB').on('click', function() {
			sessionStorage.setItem("from", "pageA");
		})
		$('#goToPageD').on('click', function() {
			sessionStorage.setItem("from", "pageC");
		})
	</script>
</body>
</html>