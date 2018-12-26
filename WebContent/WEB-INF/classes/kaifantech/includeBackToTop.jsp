<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<style type="text/css">
a.backtop {
	background: url(${ctx_images}/backtotop.png) no-repeat center
		center;
	bottom: 20px;
	cursor: pointer;
	display: none;
	height: 70px;
	position: fixed;
	right: 20px;
	text-indent: -9999px;
	width: 70px;
	z-index: 100;
}
</style>
<script type="text/javascript">
	/** 返回页面顶部 */
	function backtopFun() {
		$(window).scroll(function() {
			if ($(window).scrollTop() >= 200) {
				$(".backtop").fadeIn();
			} else {
				$(".backtop").fadeOut();
			}
		});

		$(".backtop").click(function(event) {
			$('html,body').animate({
				scrollTop : 0
			}, 500);
			return false;
		});
	}

	$(function() {
		backtopFun();
	})
</script>

<a class="backtop hiddenThis" title="返回顶部"></a>