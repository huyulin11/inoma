<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>

<%--
<portlet:renderURL var="goTohelp">
	<portlet:param name="myaction" value="" />
</portlet:renderURL>
<portlet:renderURL var="goToGuide">
	<portlet:param name="myaction" value="goToGuide" />
</portlet:renderURL>
<portlet:renderURL var="goToTermsof">
	<portlet:param name="myaction" value="goToTermsof" />
</portlet:renderURL>
<portlet:renderURL var="goToCommProblems">
	<portlet:param name="myaction" value="goToCommProblems" />
</portlet:renderURL>
<portlet:renderURL var="goToOtherHelp">
	<portlet:param name="myaction" value="goToOtherHelp" />
</portlet:renderURL>
--%>
<%	
	String goTohelpvar	= ".json" ;
	String goToGuidevar	= ".json" ;
	String goToTermsofvar	= ".json" ;
	String goToCommProblemsvar	= ".json" ;
	String goToOtherHelpvar	= ".json" ;
%>
<c:set var='goTohelp' value='.json' scope='request' />
<c:set var='goToGuide' value='.json' scope='request' />
<c:set var='goToTermsof' value='.json' scope='request' />
<c:set var='goToCommProblems' value='.json' scope='request' />
<c:set var='goToOtherHelp' value='.json' scope='request' />
<script >
	var urls = {
		'goTohelp'		:'.json' ,
		'goToGuide'		:'.json' ,
		'goToTermsof'		:'.json' ,
		'goToCommProblems'		:'.json' ,
		'goToOtherHelp'		:'.json' 
	}
</script>

<style type="text/css">
*{margin:0;padding:0;}
#nav{height:600px;margin:0px;font-family:"微软雅黑";margin-top:30px;width:1000px;font-size: 14px;margin-bottom:30px;}
#nav .navcaidan{ width:150px;height: 600px;float:left; background-color: #EEEEEE;  border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC;color:#EEEEEE;}

#nav .navcaidan a{ width:100px;height:39px;line-height:39px; text-decoration:none;float:right;padding-right: 20px;border-bottom: 1px solid #ccc }
#nav .navcaidan span{font: bold 13pt "微软雅黑", serif;color: #000;}

#nav .navcaidan ul{ width:150px;list-style:none;text-align:center;}
#nav .navcaidan li{ width:150px;line-height:40px;height:40px;text-align:center;font: bold 11pt "微软雅黑", serif;
color: #333;}
#nav a:hover{background-color:#B79E68;color:#FFFFFF;}
.supportCenter{
	text-align: center;background-color: #FFF; line-height: 40px;width: 100%; height:auto!important;border-bottom:1px solid #fff;
}
#helpEntrance{
	background:#fff;width: 848px;float:left;height:600px;
}

#helpEntrance li {
	list-style: none;height:40px;line-height: 40px;width: 815px;
}
 li.pageFooting a{
 	padding-left:35px; 
 	width:780px;
 	line-height:40px;
 	height:40px;
 	display:inline-block;
 	text-decoration:none;
 	border-bottom: 1px solid #ccc; 
} 
.pageFooting{
	background-color: #fff;
}
</style>
<script type="text/javascript" src="/s/j/jquery-1.8.3.js"></script>


<div id="nav">
	<div class="navcaidan">
		<div class="supportCenter"><span>帮助中心</span></div>
	<ul>
    	<li>
    		<a href="${goToCommProblems }" style="background-color:#B79E68;color:#fff;">常见问题</a>
    		
    	</li>
    	<li>
    		<a href="${goToTermsof }">规则条款</a>
    	</li>
    	<li>
    		<a href="${goToGuide }">操作指南</a>
    	</li>
    	<li>
    		<a href="${goToOtherHelp }">其他帮助</a>
    	</li>
    	<li id="help">
    		<a href="${goTohelp }">帮助入口</a>
    	</li>
    </ul>
    
	</div>
	
	<div id="helpEntrance">
		<ul>
			<li class="pageFooting"><a href="#"></a></li>
			<li class="pageFooting"><a href="#">如何送评</a></li>
			<li class="pageFooting"><a href="#">怎样使用电子钱包</a></li>
			<li class="pageFooting"><a href="#">如何付款</a></li>
			<li class="pageFooting"><a href="#">如何充值</a></li>
			<li class="pageFooting"><a href="#">忘记密码怎么办</a></li>
			<li class="pageFooting"><a href="#">填写的不是真实姓名怎么办</a></li>
			<li class="pageFooting"><a href="#">如何获取帮助</a></li>
		</ul>
</div>
</div>



 
