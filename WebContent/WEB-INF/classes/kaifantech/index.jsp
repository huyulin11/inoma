<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<link rel="stylesheet" type="text/css" href="${ctx_css}/style.css" />
<link rel="stylesheet" type="text/css" href="${ctx_css}/app.css" />
<script type="text/javascript" src="${ctx_css}/modernizr-1.5.min.js"></script>

<title>满世界的美好，要有一颗平静的心才能看到--胡玉林</title>
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?2cf34baf46d4e0510438f6b7076c41f5";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</head>

<body>
	<div id="main">
		<header>
			<div id="motto">
				<h1>
					<span>Peaceful</span>
				</h1>
			</div>
			<nav class="">
				<ul class="lavaLampWithImage" id="lava_menu">
					<li class="current"><a href="#">我的</a></li>
					<li><a href="#">一亩</a></li>
					<li><a href="/manager.shtml">三分</a></li>
					<li><a target="_blank" href="http://www.ytgrading.com/">地</a></li>
				</ul>
			</nav>
		</header>
		<div id="site_content">
			<ul class="slideshow">
				<li class="show"><img width="950" height="350"
					src="${ctx_images}/1.jpg" /></li>
				<li><img width="950" height="350" src="${ctx_images}/2.jpg" /></li>
				<li><img width="950" height="350" src="${ctx_images}/3.jpg" /></li>
			</ul>
			<div id="sidebar_container" class="hiddenThis">
				<div class="sidebar">
					<h3>最近的消息</h3>
					<p>保密</p>
				</div>
				<div class="sidebar">
					<h3>相关文档下载</h3>
					<ul>
						<li><a href="#">我的简历</a></li>
						<li><a href="#">我的靓照</a></li>
						<li><a href="#">留言板</a></li>
					</ul>
				</div>
			</div>
			<div id="content" class="hiddenThis">
				<h3>
					<a href="#">这里是一些文章</a>
				</h3>
				<h3>
					<a href="#">这里是一些文章</a>
				</h3>
				<h3>
					<a href="#">这里是一些文章</a>
				</h3>
				<h3>
					<a href="#">这里是一些文章</a>
				</h3>
			</div>
		</div>
		<footer>
			<p>
				<a target="_blank" href="${componyWebSite}">${componyName}</a> |
				<a target="_blank" href="http://www.ytgrading.com/">源泰评级</a> | <a
					target="_blank" href="https://www.baidu.com/">百度</a> | <a
					href="/login.shtml">登录</a>
			</p>
			<p>&copy; 2015 胡玉林. All Rights Reserved.</p>
			<p>
				<a href="http://www.miibeian.gov.cn/" target="_blank">皖ICP备15011029号-1</a>
			</p>
			<%
				System.gc();
			%>
			<div>
				freeMemory:<%=Runtime.getRuntime().freeMemory()%><br />
				totalMemory:<%=Runtime.getRuntime().totalMemory()%><br />
				maxMemory:<%=Runtime.getRuntime().maxMemory()%><br />
			</div>
		</footer>
	</div>
	<!-- javascript at the bottom for fast page loading -->
	<script type="text/javascript" src="${ctx_css}/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx_css}/jquery.easing.min.js"></script>
	<script type="text/javascript" src="${ctx_css}/jquery.lavalamp.min.js"></script>
	<script type="text/javascript" src="${ctx_css}/image_fade.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#lava_menu").lavaLamp({
				fx : "backout",
				speed : 700
			});
		});
	</script>
</body>

</html>