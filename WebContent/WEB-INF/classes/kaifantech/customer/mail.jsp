<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
	
<script type="text/javascript">
	var userid = '${param.userid}' ;
</script>

<link rel="stylesheet" href="${ctx_css}/flexigrid.pack.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/flexigrid.css${fv}"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/customer/mail.css${fv}"
	type="text/css"></link>
	
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/flexigrid.pack.js"
	charset='utf-8'></script>
<script type="text/javascript" src="${ctx_js}/customer/urls.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/customer/mail.js${fv}"></script>
<script type="text/javascript">
	function refresh() {
		$("#flexMobile").flexReload();
	}
	$("#addNewMailFrm").submit(function(e){
		um.mobile.addNewMailFrm();
	}); 
	
$(document).ready(function(isopen){	
	var maiheight = 460;
	var w = $("#mobiletable").width();
	var gapTop =  30;
	var otherpm = 150; //GridHead，toolbar，footer,gridmargin
	var h = maiheight - gapTop - otherpm;
	$("#flexMail").flexigrid({
		width: w,
		height: h,
		url: um.urls.showUserMailList + "?userid="+userid,
		dataType: 'json',
		colModel : [			
			{display: 'ID', name : 'id', width : 50, sortable : true, align: 'center',hide: true},
			{display: 'mail', name : 'getmail', width : 50, sortable : true, align: 'center',hide: true},
			{display: '所属人', name : 'userid', width : 100, sortable : false, align: 'center',hide: true},
			{display: '认证', name : 'stat', width : 100, sortable : false, align: 'center',hide: true},
			{display: '邮件地址', name : 'mail', width : 166, sortable : true, align: 'center'},
			{display: '联系人', name : 'remark', width : 176, sortable : false, align: 'center'},
			{display: '状态', name : 'isdefault', width : 141, sortable : false, align: 'center',process:formatMoney},
			{display: '认证', name : 'status', width : 119, sortable : true, align: 'center'},
			{display:'操作' ,name:'caozuo', width:130,sortable:false,align:'center'}
			
			],
		errormsg: '发生异常',
		sortname: "isdefault",
		sortorder: "desc",
		usepager: true,
		pagestat: '显示记录从{from}到{to}，总数 {total} 条',
		useRp: true,
		rp: 10,
		rpOptions: [10, 15, 20, 30, 40, 100], //可选择设定的每页结果数
		nomsg: '没有符合条件的记录存在',
		minColToggle: 1, //允许显示的最小列数
		showTableToggleBtn: false,
		autoload: true, //自动加载，即第一次发起ajax请求
		resizable: true, //table是否可伸缩
		procmsg: '加载中, 请稍等 ...',
		hideOnSubmit: true, //是否在回调时显示遮盖
		blockOpacity: 0.5,//透明度设置
		rowbinddata: true,
		showcheckbox: true,
		showToggleBtn: false,
		resizable:false,//表格是否可以拖动
		usepager: false,//是否分页的导航栏下下面
		onrowchecked:true
		//gridClass: "bbit-grid"//样式
	});
	$(".cDrag").css("display","none");//很重要
	function formatMoney(value, pid) {
         return "￥" + parseFloat(value).toFixed(2);
    }
				
});
	
</script>


<!--
<div style="height: 30px;">
	<a href="/group/yt/usercenter"
		style="text-decoration: none; color: blue;">会员中心</a><span>>></span> <a
		href="#" style="text-decoration: none; color: blue;">个人资料</a><span>>></span>
	<a href="#" style="text-decoration: none; color: blue;">邮件地址</a>
</div>

 
<div id="newMail"
	style="width: 400px; display: none; z-index: 10; background-color: white; position: absolute;">
	<div id="title"	
		style="width: 100%; height: 30px; background-color: #E8F2FE; padding-top: 10px;">
		&nbsp;&nbsp;添加邮箱地址 <span style="float: right; margin-right: 10px;"><a
			href="javascript:closeMailWin()">关闭</a></span>
	</div>
	<div style="width: 100%; padding-left: 20px; padding-top: 10px;">
		<form id="addNewMailFrm" method="post"
			onsubmit="return addNewMailFrm()">
			<div id="mobileDiv" style="margin-left: 40px;">
				<span>邮箱地址</span> <br> <input id="usermail" name="usermail"
					type="email" size="30" style="height: 26px;"/>
					<span id="notice" style="color:red;font-size:12px;"></span>	
				<br>
				<!-- <br> <input id="mailstauts" name="mailstauts" type="checkbox" />&nbsp;进行认证 -->
				<!-- <br>
				<br> <input id="checkDefault" name="checkDefault"
					type="checkbox" />&nbsp;设为默认邮箱 <br>
				<br> <input type="submit" value="确定" style="width: 60px;" />&nbsp;
				<input type="reset" value="重写" /> <br>
				<br>
			</div>
		</form>
	</div>
</div>
 -->
 <div id="nave" >
<div id="mobiletable">
	<c:if test="${sessionType == '0'}" >
		<div class="baoshang">
			<div class="sdgshang" style="">
				<a href="/customer/mobile/view.shtml?userid=${userid}"><div class="span" style="border-bottom: 3px solid #ccc;"><span>手机号码</span></div></a>
				<a href="/customer/mail/view.shtml?userid=${userid}"><div class="span" style="border-bottom: 3px solid #BA5A3B;"><span>电子邮件</span></div></a>
				<a href="/customer/telephone/view.shtml?userid=${userid}"><div class="span" style="border-bottom: 3px solid #ccc;"><span>固定电话</span></div></a>
			</div>
		</div>
	</c:if>
	<div id="megss" style="display: none;"><p id="megs" style="color: #000;">删除成功</p></div>
	
	<div class="shousuo">
		<form id="addNewMailFrm" method="post" onsubmit="return addNewMailFrm()">
			<span>电子邮件 </span>  
			<input id="usermail" name="usermail" type="text" />
			<span>联系人</span>	
			<input id="describe" type="text"/><!-- 联系人文本框先不填 -->
			<input id="checkDefault" name="checkDefault"type="checkbox" /><span>设为默认</span>
			<input type="submit" value="新增" />
		</form>
	</div>
	<table id="flexMail" style="display: none"></table>
</div>
<input id="action" type="hidden" name="action" value="select" />
</div>


<style type="text/css">

</style>

