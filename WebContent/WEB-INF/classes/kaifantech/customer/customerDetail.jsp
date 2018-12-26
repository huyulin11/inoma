<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
*{margin:0;padding:0;font-family:"微软雅黑";font-size:14px;}
input[type=text],input[type=submit],input[type=reset],textarea,button{font-family: "微软雅黑";}
table#userop{
	height: 450px;
	width: 807px;
	border-color: green;
}
table#userop tr th{
	height: 45px;
	text-align: center;
	background-color: blue;
}
</style>
<c:set  var="showUserList" value="${ctx}/customer/detail/showUserList.shtml" />

<script src="${ctx}/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/flexigrid.pack.js" charset='utf-8'></script>
<link rel="stylesheet" href="${ctx_css}/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/flexigrid.css" type="text/css"></link>
<script type="text/javascript">

$(document).ready(function(){
	$('input:text').keyup(function(){
		if(event.keyCode == 13){ 
			submitUserSearch();
		}
	});
	/*$("#user_mobile").keyup(function(){
		submitUserSearch();
	});
	$("#user_mail").keyup(function(){
		submitUserSearch();
	});
	$("#user_usercode").keyup(function(){
		submitUserSearch();
	});
	$("#user_name").keyup(function(){
		submitUserSearch();
	});*/
	/* var maiheight = document.documentElement.clientHeight; */
	var maiheight = 450;
	var w = $("#userlisttable").width() - 3;
	var gapTop =  30;	
	var otherpm = 150; //GridHead，toolbar，footer,gridmargin
	var h = maiheight - gapTop - otherpm;

	$("#flexUser").flexigrid({
		width: w,
		height: h,
		url: '${showUserList}',
		dataType: 'json',
		colModel : [
			
			{display: 'ID', name : 'id',width : 50, sortable : false, align: 'center',hide: true},
			{display: '编号', name : 'usercode', width : 65, sortable : false, align: 'center',hide: false},
			{display: '姓名', name : 'name', width : 60, sortable : false, align: 'center',hide: false},
			{display: '称谓', name : 'title', width : 60, sortable : false, align: 'center'},
			{display: '证件类型', name : 'documenttype', width : 65, sortable : false, align: 'center'},
			{display: '证件号码', name : 'documentcode', width : 120, sortable : false, align: 'center'},
			{display: '默认手机', name : 'defaultmobile', width : 115, sortable : false, align: 'center',process:formatMoney},
			{display: '默认邮箱', name : 'defaultmail', width : 150, sortable : false, align: 'center'},
			{display: '注册时间', name : 'registerdate', width : 170, sortable : false, align: 'center'}
			],
		buttons : [
			{name: '选择',id:'select', bclass: 'default', onpress : toolbar},
			{separator: true}
			],
		errormsg: '发生异常',
		sortname: "id",
		sortorder: "desc",
		usepager: false,
		singleSelect:true,
		title: '用户管理',
		pagestat: '显示记录从{from}到{to}，总数 {total} 条',
		useRp: true,
		rp: 0,
		rpOptions: [10, 15, 20, 30, 40, 100], //可选择设定的每页结果数
		nomsg: '没有符合条件的记录存在',
		minColToggle: 1, //允许显示的最小列数
		showTableToggleBtn: false,
		autoload: true, //自动加载，即第一次发起ajax请求
		resizable: false, //table是否可伸缩
		procmsg: '加载中, 请稍等 ...',
		hideOnSubmit: true, //是否在回调时显示遮盖
		blockOpacity: 0.5,//透明度设置
		rowbinddata: true,
		showcheckbox: true,
		onrowchecked:true,
		showToggleBtn: false,
		onSubmit: addFormData//数据传出时调用的函数
		//gridClass: "bbit-grid"//样式
	});
	
	function toolbar(com,grid){
		//删除记录如果是默认号码...确定删除后默认号码自动换为已认证的其他手机？
		//另外，如果确定删除当前默认号码，user表中defaultmobile的处理！！
		if(com=='select'){
				if($("div#userlisttable .trSelected").length==1){
				// var c_userid = "";
				// var c_usercode = "";
				// c_userid=$('.trSelected',grid).eq(0).children("td").find("span").eq(0).text();
				// c_usercode=$('.trSelected',grid).eq(0).children("td").find("span").eq(1).text();
				// window.location.href="/group/coin/userdetail?c_userid="+c_userid+"&c_usercode="+c_usercode+"&page_status=li_01";
				location.reload();
			}else if($("div#userlisttable .trSelected").length>1){
				alert("仅能选择一位用户");
			}else if($("div#userlisttable .trSelected").length==0){
				alert("请选择一位用户");
			}
		}
	}
	function formatMoney(value, pid) {
         return "￥" + parseFloat(value).toFixed(2);
    }
	
			
});
function addFormData(){
	//passing a form object to serializeArray will get the valid data from all the objects, but, if the you pass a non-form object, you have to specify the input elements that the data will come from
	var dt = $('#searchUser').serializeArray();
//		alert("11111");
//		$.each(dt, function(key, val) {   
//	           alert(key);
//	           alert(val);
//	           $.each(val, function(tt, ttt) {   
//		           alert(tt);
//		           alert(ttt);
	           
//		         });   
//	         });      
	$("#flexUser").flexOptions({params: dt});
	return true;
}
function submitUserSearch(){
	if($("#user_mobile").val()=="" && $("#user_mail").val()=="" && $("#user_usercode").val()==""&& $("#user_usercode").val()==""&&$("#user_name").val()==""){
		alert("请输入查询条件!");
		
		return;
	}
	
	$('#flexUser').flexOptions({newp: 1,rp:10}).flexReload();
	return false;
}
function toggleuser(){
	var value = $("#hideQueryDiv").val();
	if(value=="隐藏查询条件"){
		$("#usersearch").hide();
		$("#hideQueryDiv").val("显示查询条件");
	}else if(value="显示查询条件"){
		$("#usersearch").show();
		$("#hideQueryDiv").val("隐藏查询条件");
	}
}
function ifarmeshow(){
	$("#userdetail").show();
	$("#usersearch").hide();
	$("#hideQueryDiv").val("显示查询条件");
}
</script>
<!-- <div style="height:30px;">
	<a href="/web/guest/usercenter" style="text-decoration: none;color:blue;">会员中心</a><span>>></span>
	<a href="#" style="text-decoration: none;color:blue;">个人资料</a><span>>></span>
	<a href="#" style="text-decoration: none;color:blue;">我的手机</a>
</div> -->
<input type="button" id="hideQueryDiv" value="隐藏查询条件" onclick="return toggleuser()">
<div id="usersearch">
<div style="margin-bottom:10px;margin-top:20px;">
	<form:form action="${showUserList}" method="post">
		手机<input type="text" id="user_mobile" name="s_Mobile" size="15"/>&nbsp;
		邮箱<input name="s_Mail" type="text" id="user_mail" size="25"/>&nbsp;
		会员编号<input name="s_UserCode" type="text" size="15" id="user_usercode"/>&nbsp;
		姓名<input name="s_Name" type="text" size="15" id="user_name"/>
		<input name="submitBtn" type="submit" value="搜索"/>
	</form:form>
</div>
<div id="userop" style="margin:0px;width:810px;z-index:1;">
		<table id="userop" >
			<tr>
				<th width="50px">编号</th>
				<th width="50px">姓名</th>
				<th width="45px">称谓</th>
				<th width="50px">证件类型</th>
				<th width="130px">证件号码</th>
				<th width="105px">默认手机</th>
				<th width="155px">默认邮箱</th>
				<th width="130px">注册时间</th>
			</tr>
			<tr>
				<td><a href="#" onclick="ifarmeshow()">${user.usercode }</a></td>
				<td>${user.name }</td>
				<td>${user.title }</td>
				<td>${user.documenttype }</td>
				<td>${user.documentcode }</td>
				<td>${user.defaultmobile }</td>
				<td>${user.defaultmail }</td>
				<td>${user.regdate }</td>
			</tr>
		</table>
</div>
<input id="action" type="hidden" name="action" value="select" />
</div>
<section id="userdetail" style="display: none" scrolling="no" name="userdetail" height="1000px" width="800px" src="${user.url }">
</section>