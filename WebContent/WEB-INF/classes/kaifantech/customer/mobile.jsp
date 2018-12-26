<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
	


<link type="text/css" rel="stylesheet" href="${ctx_css}/customer/mobile.css${fv}" />
<link rel="stylesheet" href="${ctx_css}/flexigrid.pack.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/flexigrid.css"
	type="text/css"></link>

<script type="text/javascript">
	var userid = '${userid}' ;
</script>

<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/s/j/flexigrid.pack.js"></script>
<script type="text/javascript" src="${ctx_js}/customer/urls.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/customer/mobile.js${fv}"></script>

<script type="text/javascript">

	$(document).ready(function(){
		/* var maiheight = document.documentElement.clientHeight; */
		var maiheight = 580;
		var w = $("#mobiletable").width();
		var gapTop =  30;
		var otherpm = 150; //GridHead，toolbar，footer,gridmargin
		var h = maiheight - gapTop - otherpm;
		
		function refresh() {
			$("#flexMobile").flexReload();
		}
		$("#flexMobile").flexigrid({
			width: w,
			height: h,
			url: um.urls.showPhoneList + "?userid="+userid ,   
			dataType: 'json',
			colModel : [
				{display: 'ID', name : 'id', width : 50, sortable : true, align: 'center',hide: true},
				{display: 'gettel', name : 'getmobile', width : 50, sortable : true, align: 'center',hide: true},
				{display: 'status', name : 'status', width : 50, sortable : true, align: 'center',hide: true},
				{display: '用户编号', name : 'userid', width : 100, sortable : false, align: 'center',hide: true},
				{display: '手机号码', name : 'telephone', width : 211, sortable : true, align: 'center'},
				{display: '联系人', name : 'remark', width : 150, sortable : false, align: 'center'},
				{display: '状态', name : 'isdefault', width : 120, sortable : false, align: 'center',process:formatMoney},
				{display: '认证', name : 'status', width : 120, sortable : false, align: 'center'},
				{display:'操作' ,name:'caozuo', width:150, sortable:false,align:'center'}
				],
			errormsg: '发生异常',
			sortname: "isdefault",
			sortorder: "desc",
			usepager: true,
			/* title: '手机号码管理', */
			pagestat: '显示记录从{from}到{to}，总数 {total} 条',
			useRp: true,
			rp: 10,
			rpOptions: [10, 15, 20, 30, 40, 100], //可选择设定的每页结果数
			nomsg: '没有符合条件的记录存在',
			minColToggle: 1, //允许显示的最小列数
			showToggleBtn: false,
			showTableToggleBtn: false,
			autoload: true, //自动加载，即第一次发起ajax请求
			resizable: true, //table是否可伸缩
			procmsg: '加载中, 请稍等 ...',
			hideOnSubmit: true, //是否在回调时显示遮盖
			blockOpacity: 0.5,//透明度设置
			rowbinddata: true,
			showcheckbox: true,
			resizable:false,//表格是否可以拖动
			usepager: false,//是否分页的导航栏下下面
			onrowchecked:true
			//gridClass: "bbit-grid"//样式
		});
		$(".cDrag").css("display","none");
		function formatMoney(value, pid) {
			 return "￥" + parseFloat(value).toFixed(2);
		}

		$("#mobiletable #mobile").blur(function(){
			um.mobile.mobileNoCheck();
		});
		
		$("#mobiletable #addNewMobileFrm").submit(function(e){
			e.preventDefault();
			um.mobile.submitMobile();
		});
	});
</script>

<div id="nave">
	<div id="mobiletable">
		<c:if test="${sessionType == '0'}">
			<div class="baoshang">
				<div>
					<a href="/group/yt/mobile?page_status=a08">
						<div style="border-bottom: 3px solid #BA5A3B;">
							<span>手机号码</span>
						</div></a> <a href="/group/yt/email?page_status=a08"><div
							style="border-bottom: 3px solid #ccc;">
							<span>电子邮件</span>
						</div></a> <a href="/group/yt/telephone?page_status=a08">
							<div style="border-bottom: 3px solid #ccc;">
							<span>固定电话</span>
						</div></a>
				</div>
			</div>
		</c:if>
		<div id="megss" style="display: none;">
			<p id="megs" style="color: red;">删除成功</p>
		</div>

		<div class="shousuo">
			<form id="addNewMobileFrm" >
				<span>手机号码 </span> 
				<input id="mobile" name="mobile" type="text"
					onkeyup="this.value=this.value.replace(/\D/g,'')"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <span>联系人</span>
				<input id="describe" type="text" /> <input id="checkDefault"
					name="checkDefault" type="checkbox" /><span>设为默认</span> <input
					type="submit" value="新增" />
			</form>
		</div>
		<table id="flexMobile" style="display: none"></table>
	</div>
	<input id="action" type="hidden" name="action" value="select" />
</div>

