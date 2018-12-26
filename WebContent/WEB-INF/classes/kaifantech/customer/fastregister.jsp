<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script >
	var urls = {
		'checknameUrl'		:'/customer/fastregister/checkloginname.shtml' ,
		'checkMobileUrl'	:'/customer/fastregister/checkMobile.shtml' ,
		'fastregisterUrl'	:'/customer/fastregister/fastregister.shtml' ,
		
		'showThumbnailUrl'	:'thumbnail.shtml' ,
		'checkCAPTCHA'		:'yanzheng.shtml' ,
		'forgetUrl'			:'forgetpassword.shtml' ,
		
		'employeeLoginUrl'	:'/login.shtml' 
	}
</script>


	
<style type="text/css">
#reg_body {
/* 	width: auto; */
/* 	height: 648px; */
/* 	background: url(${ctx_images}/u0_normal.jpg) center no-repeat; */
/* 	margin-bottom: 10px; */
/* 	padding-left: 10px; */
/* 	padding-right: 5px; */
/* 	background:white; */
}
#reg_l {
/* 	width: 675px; */
/* 	height: auto; */
/* 	display: block; */
/* 	float: left; */
	
	
}

.rectangle{ height: 17px; background:#CCC; float:left; padding:5px 10px;color:#FFF}
.triangle-left { margin-top:10px; width: 0; height: 0; border-top: 5px solid transparent; border-right: 10px solid #CCC; border-bottom: 5px solid transparent; float:left}
.triangle-up {
width: 0;
height: 0;
border-left: 5px solid transparent;
border-right: 5px solid transparent;
border-bottom: 10px solid #CCC;
margin-left:7px;
}
</style>

<script type="text/javascript">
	function reloadcode() {
		var verify = document.getElementById('imgObj');
		verify.setAttribute('src', urls.showThumbnailUrl);
	}
</script>
<script type="text/javascript" src="/s/j/jquery-1.8.3.js"></script>
 <script type="text/javascript">
//验证验证码
function checkCertPic() {
	var certCode = $('#pstCfmCode').val();
	if(certCode==''){
		alert("请输入验证码！");
	}else{
	$.getJSON( urls.checkCAPTCHA +'?certCode='+certCode,function(data) {
		$.each(data,function(key,value) {
			if(value == "ok") {
				document.editMenuForm.submit();
			} else if(value == "error") {
				alert("验证码输入错误！");
				return false;
			}
		});
	});}
}
</script> 
<script type="text/javascript">		
	function checkUserids() {
		var defaultmobile = $('#defaultmobile').val();
		$.ajax( {
			type : "POST",
			url: urls.checkMobileUrl + "?mobile="+defaultmobile,
			dataType: "json",
			success : function(data) {
				if(data.result == "ok"){
					$('#mobiletag').html("<font color='#33CC33'>填写正确，"
						+ defaultmobile + "可以注册使用!</font>");
					$('#mobiletag').removeClass();
					$('#mobiletag').addClass("SucceedMsg");
					return true;
				}
				else if(data.result == "registered"){
					$('#mobiletag').html("<font color='#FF9933'>很抱歉，"
						+ defaultmobile + "手机号码已被注册!</font>");
					$('#mobiletag').removeClass();
					$('#mobiletag').addClass("FailedMsg");
					return false;
				} 
				else if(data.result == "error"){
					$('#mobiletag').html("<font color='#FF0000'>很抱歉，"
						+ defaultmobile + "手机号码有误!</font>");
					$('#mobiletag').removeClass();
					$('#mobiletag').addClass("FailedMsg");
					return false;
				}
			},
			error : function(XMLHttpRequest,textStatus, errorThrown){
				alert("网络连接出错！");
				alert(XMLHttpRequest.status);
				return false;
			}
		});
	}
	function validate_reg() {
		$("#btn_submit").attr("disabled","disabled");
		if(checkusernameifNull()){
			if(checkloginnameifNull()){
//				var email = $('#defaultmail').val();
				var username = $('#username').val();
			//	var defaultmobile = $('#defaultmobile').val();	
				if (username.length>=12) {
					var html="<div class='triangle-left'></div>";
				 	html+="<div class='rectangle'>名字输入错误</div>";
				 	$("#div_check_username").html(html);
				}else{			
					 checkloginname();
				}
			}
		}
		$("#btn_submit").removeAttr("disabled");
	}
	function saveRegister(){
		var username = $('#username').val();
		var loginname = $('#loginname').val();
		var defaulttel = $('#defaulttel').val();
		$.ajax({
			type: "POST",
			url: urls.fastregisterUrl ,
			data: "username="+username+"&loginname="+loginname+"&defaulttel="+defaulttel,
			dataType:"text",
			success: function(msg){
					alert("注册成功！");
					$('#username').val("");
					$('#loginname').val("");
					$('#defaulttel').val("");
			},
			error: function(msg){
				alert("出错啦！"+msg);
			}
		});
	}
	function checkusernameifNull(){
		 var username=$('#username').val();
		 if(username.length==0){
			 	var html="<div class='triangle-left'></div>";
			 	html+="<div class='rectangle'>请填写真实姓名</div>";
			 	$("#div_check_username").html(html);
			 	return false;
		}else{return true;}
	}
	function checkloginnameifNull(){
		 var loginname=$('#loginname').val();
		 if(loginname.length==0){
			 	var html="<div class='triangle-left'></div>";
			 	html+="<div class='rectangle'>请填写注册信息</div>";
			 	$("#div_check_loginname").html(html);
			 	return false;
			 }else{return true;}
	}		
	function checkdefaulttel(){
		 var defaulttel=$('#defaulttel').val();
		var num=/^[0-9]*[1-9][0-9]*$/;
		if(defaulttel.length!=0){
		 if(!num.test(defaulttel)){
			 	var html="<div class='triangle-left'></div>";
			 	html+="<div class='rectangle'>电话号码格式不正确</div>";
			 	$("#div_check_defaulttel").html(html);
			 	return false;
			 }else{return true;}
		}else{return true;}
	}		
	function checkloginname() {		
		var loginname = $('#loginname').val();
		var reg=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
		var num=/^[0-9]*[1-9][0-9]*$/;
		if(loginname.length!=0){
			if(reg.test(loginname)|| (num.test(loginname)&& loginname.length==11)){
				$.getJSON(urls.checknameUrl + '?loginname=' + loginname,
						function(data) {
							$.each(data, function(key, value) {
								if(value == "ok") {									
									if(checkdefaulttel()){
										 saveRegister();
									}									
								} else if(value == "error") {
									alert("账户已存在");
								}
							});
						});
					$("#btn_submit").removeAttr("disabled");
				}else{
					var html="<div class='triangle-left'></div>";
				 	html+="<div class='rectangle'>手机填写错误</div>";
				 	$("#div_check_loginname").html(html);
				}
		}
		$("#btn_submit").removeAttr("disabled");
	}
</script>
<script type="text/javascript">
$(function(){
	$("#username").focus(function(){
		$(this).css({"background":"#FFF","border-color":"#C7CCD0"});
		$("#div_check_username").html("");
		$(this).select();		
	}).blur(function(){
		$(this).css("background","#F2F3F4");
		checkusernameifNull();
	});
	$("#loginname").focus(function(){
		$(this).css({"background":"#FFF","border-color":"#C7CCD0"});
		$("#div_check_loginname").html("");
		$(this).select();		
	}).blur(function(){
		$(this).css("background","#F2F3F4");
		checkloginnameifNull();
	});
	$("#defaulttel").focus(function(){
		$(this).css({"background":"#FFF","border-color":"#C7CCD0"});
		$("#div_check_defaulttel").html("");
		$(this).select();		
	}).blur(function(){
		$(this).css("background","#F2F3F4");
	});
});
</script>
<fmt:setLocale value="zh_CN" />
<fmt:bundle basename="content/Language-ext" >
<form:form name="editMenuForm" commandName="user" method="post"
	onsubmit="validate_reg();return false">
	<div id="reg_body">
		<div id="reg_l">
			<div id="number" >
				<table style="width:500px;">
					<tr>
						<td></td>
						<td align="center"><h3>快速注册</h3></td>
						<td></td>
					<tr>
					 <tr height="60">
					 	<td align="right"><font color="red" width="20%">*</font>
					 		<%-- <liferay-ui:message key="fastregister_name" />--%>
					 		<fmt:message key="fastregister_name" />:</td>
					 	<td width="40%"><input type="text"  tabindex="1" style="width:200px; height:20px;background:#F2F3F4;border:solid 1px; border-color:#C7CCD0"
					    	id="username" name="username" size="6"/></td>
					 	<td width="40%"><div id="div_check_username"></div></td>
					  </tr>
					 <tr height="60">
					 	<td align="right"><font color="red">*</font>
					 	<%-- <liferay-ui:message key="fastregister_mobile" /> --%>
					 	<fmt:message key="fastregister_mobile" />/邮箱： </td>
					    <td>
					    	<input type="text" tabindex="1" style="width:200px; height:20px;background:#F2F3F4;border:solid 1px; border-color:#C7CCD0"
					    	  name="loginname" id="loginname"/>				    	
					    </td>
					   <td><div id="div_check_loginname"></div></td>
					  </tr>
					   <tr  height="60">
					 	<td align="right">
					 		<%-- <liferay-ui:message key="fastregister_tel" /> --%>
					 	<fmt:message key="fastregister_tel" />： </td>
					    <td>
					    	<input type="text" tabindex="1" style="width:200px; height:20px;background:#F2F3F4;border:solid 1px; border-color:#C7CCD0"
					    	 id="defaulttel" name="defaulttel" size="12"/>				    	
					    </td>
					    <td><div id="div_check_defaulttel"></div></td>
					  </tr>
					  <tr>
						<td>&nbsp;</td>
						<td>
							<input id="btn_submit" type="submit" value='<fmt:message key="register_botton" />'/>
							<%-- <liferay-ui:message key="register_botton" />"/> --%>
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>	
			</div>
		
		</div>
	</div>
</form:form>
</fmt:bundle>