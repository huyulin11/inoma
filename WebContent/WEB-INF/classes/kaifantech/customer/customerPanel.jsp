<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>	
<div id="um_head">
<script type="text/javascript" src="${ctx_js}/jquery-1.8.3.js"></script>
<link href="${ctx_css}/b/menu/nav-h-v.css${fv}" type="text/css" rel="stylesheet" />
<link href="${ctx_css}/main.css" type="text/css" rel="stylesheet" />
<style>
	ul.nav-h-v>li:first-child a {
	   font-size:14px;
	    background: #FFC333;
		
		font-weight: 800; // bold
	}
	nav p {
	    height: 40px;
	}
</style>
<nav>
	<ul class="nav-h-v">
		<li>
			<a style="width:190px">当前用户: ${c_user.name} <div class="bottomArrow"></div></a>
</li>
		<li >
			<a>个人资料</a>
			<ul>
				<li id="li_01"><a class="um-menu" href="/customer/personalInfo/view.shtml?userid=${c_user.id}">基本资料</a></li>
				<li id="li_02"><a class="um-menu" href="/customer/mobile/view.shtml?userid=${c_user.id}">手机号码</a></li>
				<li id="li_03"><a class="um-menu" href="/customer/telephone/view.shtml?userid=${c_user.id}">固定电话</a></li>
				<li id="li_04"><a class="um-menu" href="/customer/mail/view.shtml?userid=${c_user.id}">电子邮件</a></li>
				<li id="li_10"><a class="um-menu" href="about:black">密码设置</a></li>
				<li id="li_05"><a class="um-menu" href="customer/addr/view.shtml?userid=${c_user.id}">售货地址</a></li>
				<li id="li_06"><a class="um-menu" href="about:black">银行帐号</a></li>
			</ul>
		<li>
			<a id="li_13_a">钱包管理</a>
			<ul >
				<li><a class="um-menu" href="about:black">在线充值</a></li>
				<li><a class="um-menu" href="about:black">汇款告知</a></li>
				<li id="li_08"><a class="um-menu" href="about:black">退/扣款申请</a></li>
			</ul>
		</li>
<%-- 		<li id="li_12"><a class="um-menu" href="/request/request.shtml?userid=${c_user.id}">送评清单</a></li> --%>
<%-- 		<li id="li_11"><a class="um-menu" href="/review/reviewAdd.shtml?userid=${c_user.id}" target="_blank">送评申请</a></li> --%>
		<li id="li_13"><a class="um-menu" href="/deposit/depositAdd.shtml?userid=${c_user.id}" target="_blank">托管申请</a></li>
		<li id="li_14"><a class="um-menu" href="/deposit/mgr/index.shtml?userid=${c_user.id}">托管清单</a></li>
	</ul>
	<br><!-- 用于占位，因为菜单<ul.nav-h-v>会应用float:left样式 -->
	<table class="singleDataTable">
		<tr>
			<th>编号：</th>
			<td>${c_user.usercode}</td>
		</tr>
		<tr>
			<th>姓名：</th>
			<td>${c_user.name}</td>
		</tr>
		<tr>
			<th>注册时间：</th>
			<td>${c_user.regdate}</td>
		</tr>
		<tr>
			<th>手机：</th>
			<td>${c_user.defaultmobile}</td>
		</tr>
		<tr>
			<th>电子邮件：</th>
			<td>${c_user.defaultmail}</td>
		</tr>
	</table>
</nav>
</div>
<iframe id="um_body" name="um_view_frame" frameborder="0" width="100%" height="100%" seamless ></iframe>
<script>
	var userid = ${c_user.id} ;
	(function(){
		// 取消父容器纵向滚动条
		$("#loadhtml").parent().css("overflow-y","hidden");
		$(".nav-h-v a.um-menu").on("click",function(e){
			$(".nav-h-v a.um-menu").not(this).css("background-color", "#EEE");
			$(this).css("background-color", "rgb(141, 109, 62)")
				   .find('a').css("color", "white");
			var iframe = document.querySelector("[name='um_view_frame']") ;
			if(!this.target){
				this.target = "um_view_frame" ;
				// 防止<a>默认点击行为被取消
				iframe.src = this.href ; 
			}
			if (iframe.src.search("login") != -1 ) {
				location.reload();
			}
			// e.preventDefault();	
		});
		/* 菜单之下位置 用户信息表的显示与隐藏 */
		var showInfoTabAlways = false ;
		var showInfoTab = function(show){
			if (show){
				$("nav .singleDataTable").show();
			}else{
				$("nav .singleDataTable").hide();
			}
		}
		$("ul.nav-h-v>li:first-child a").on("click",function(){
			showInfoTabAlways = !showInfoTabAlways ;
			showInfoTab(showInfoTabAlways);
		});
		$(".nav-h-v a.um-menu").on("click",function(e){
			$("nav .singleDataTable").hide();
		});	
		//$("ul.nav-h-v>li:first-child a").on("click",function(e){
			//$("nav .bottomArrow").css("border-bottom:10px solid #EAEAEA;border-left:10px solid transparent;border-right:10px solid transparent;width:0;height:0px;float:right; margin-top:15px;margin-right:5px;");
		//});	
	// $("a.um-menu").click(function(e){
		//	 e.preventDefault();
		//	$("#um_body").load(this.href+ "?userid=" + userid );
		// })
	})();
	sn = [
		{
			name : "客服管理"
		},
		{
			name : "用户管理",
			url : "/customer/manage/list.shtml"
		},
		{
			name : "用户详情",
			url : "/customer/detail/detail.shtml"
		}
	];
	url = {
		"customerDetail" : "/customer/detail/detail.shtml" 
	};
</script>