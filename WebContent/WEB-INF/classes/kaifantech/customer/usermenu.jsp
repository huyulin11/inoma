<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>

<style type="text/css">
*{margin:0;padding:0;}
#nav{width:150px;height:610px;margin:0px;font-family:"微软雅黑";}
#nav h4{cursor:pointer;line-height:30px;height:30px;background-color:#1797C0;color:#fff;marin-bottom:0px;}
#nav a{display:block;line-height:24px;color:#666666;text-decoration:none;font-size: 14px;padding-left:25px;}
#nav a:hover{background-color:#19A5E6;color:#FFFFFF;}
#nav div{display:block;border:1px solid #C8C9CA;border-top:none;background-color:#CFEEF8;}
.selected{background-color:#19A5E6;}
</style>
<script type="text/javascript" src="/s/j/jquery-1.7.1.js"></script>
<script type="text/javascript">
/* function $(id){return document.getElementById(id);}
window.onload = function(){
	$("nav").onclick = function(e){
		var src = e?e.target:event.srcElement;
		if(src.tagName == "H4"){
			var next = src.nextElementSibling || src.nextSibling;
			next.style.display = (next.style.display =="block")?"none":"block";
		}
	};
}; */

$(function() {
	/* $("#sel_1").toggle(function() {
		$("#con2_1").slideUp(5000,function() {
			$("#con2_1").slideDown(2000);});
	}, function() {
		$("#con2_1").hide(500);
		
	}); */
	$("#sel_1").toggle(function() {
		$("#con2_1").slideUp(500);
	}, function() {
		$("#con2_1").slideDown(500);
		
	});
	$("#sel_2").toggle(function() {
		$("#con2_2").slideUp(500);
	}, function() {
		$("#con2_2").slideDown(500);
		
	});
	$("#sel_3").toggle(function() {
		$("#con2_3").slideUp(500);
	}, function() {
		$("#con2_3").slideDown(500);
		
	});
	$("#sel_4").toggle(function() {
		$("#con2_4").slideUp(500);
	}, function() {
		$("#con2_4").slideDown(500);
		
	});
	
	$("a").click(function(){
		$("a").removeClass("selected");
		  $(this).addClass("selected");
	});

	
	
});

</script>

<%
	String showMenu = "showMenu.json" ;
%>

<c:set var='showMenu' value='showMenu.json' scope='request' />

<script >
	var urls = {
		'showMenu'		:'showMenu.json' 
	}
</script>



<div id="nav">
	<h4 id="sel_3">&nbsp;+  我的送评</h4>
    <div id="con2_3">
    	<a href="/group/yt/request">我要送评</a>
    	<a href="/group/yt/requestmanage">送评管理</a>
    	
    </div>
	<h4 id="sel_1">&nbsp;+  个人资料</h4>
    <div id="con2_1">
    	<a id="ab" href="/group/yt/basicinfo">基本资料</a>
    	<a href="/group/yt/mobile">我的手机</a>
        <a href="/group/yt/telephone">联系电话</a>
        <a href="/group/yt/bank">银行账户</a>
        <a href="/group/yt/email">邮件地址</a>
        <a href="/group/yt/address">通讯地址</a>
    </div>
    <h4 id="sel_2">&nbsp;+  个人账户</h4>
    <div id="con2_2">
    	<a href="/group/yt/wallet">电子钱包</a>
    	<a href="/group/yt/password">密码维护</a>
    </div>
    
</div>