<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/common/include.jspf"%>
<%--
<link rel="stylesheet" href="/s/c/flexigrid.css" type="text/css" />
<link rel="stylesheet" href="/s/c/flexigrid.pack.css" type="text/css" />
 --%>
<link rel="stylesheet" href="/s/c/deposit/depositmgr.css" type="text/css" />
<%--
<script src="/s/j/jquery-1.8.3.js" ></script> --%>
<script type="text/javascript" src="${ctx_js}/uuid.js"></script>
<script type="text/javascript" src="${ctx_js}/deposit/mgr/depositMgr.js"></script>
<!-- <script type="text/javascript" src="${ctx_js}/flexigrid.pack.js" ></script> -->
<script type="text/javascript" src="${ctx_js}/My97DatePicker/WdatePicker.js">
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" type="text/css" />

<script>
	var param = {
		userid 				: '${userid}' ,
		request_state 		: '${request_state}' 
	};
	
	var URLs = {
		reviewEdit			: '/deposit/depositEdit.shtml' ,
		reviewDetail		: '/deposit/depositDetail.shtml' ,
		validPayment 		: '/deposit/mar/validPayment.shtml' ,
		insertRequestid 	: '/deposit/mgr/insertRequestid.shtml' ,
		showRequestList 	: '/deposit/mgr/showRequestList.shtml' ,
		confirmRequest		: '/deposit/mgr/confirmRequest.shtml' ,
		delRequest			: '/deposit/mgr/delRequest.shtml' ,
		refund  			: '/deposit/mgr/refund.shtml' ,
		postBackDetail		: '/deposit/mgr/postbackdetail.shtml'  // 物流详情
	};
	
	URLs.payment = '/payment/payment.shtml' ; // 未开发
	
</script>

<div  class="pageBlock" style="padding: 0 20px; ">
	<c:if test="${isEmployee}">
		<div class="baoshang">
			<div class="sdgshang" >
				<div class="span" style="border-bottom: 3px solid #BA5A3B;">
					<span>送评管理</span>
				</div>
			</div>
		</div>
	</c:if>
	<form id="sform">
	<ul><li>
		<ul>
			<li class='label'>预约时间</li>
			<li>
				<input id="d4311" name="applytimestart" class="Wdate" type="text"
				onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2050-10-01\'}'})"
				size="15" />
                -
			    <input id="d4312" type="text" name="applytimeend" class="Wdate" 
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2050-10-01'})"
					size="15" /> 
			</li>
		</ul>
	</li>
	<li>
		<ul>
	  		<li class='label'>藏品代码</li>
			<li class='input'><input type="text" name='coinid' /></li>
			<li class='label'>藏品名称</li>
			<li class='input'><input type="text" name='shortsubject' /></li>
			<li class='label'>支付状态</li>
			<li class='input'>
				<select name="paystate">
					<option value=''>全部</option>
					<option value='0'>未支付</option>
					<option value='1'>已支付</option>
				</select></li>
			<li class='btn_search'>	<a href="javascript:search()">
					<img alt="" src="${ctx_images}/button/red/btn_search.jpg">
				</a>
			</li>
		</ul>
	</li>
	<li>
		<ul>
			<li class='label'>预约单号</li>
			<li class='input'><input type="text" name="reservno"
				onkeyup="this.value=this.value.replace(/\D/g,'')"
				onafterpaste="this.value=this.value.replace(/\D/g,'')" /></li>
			<li class='label'>内部流转号</li>
			<li class='input'><input type="text" name='innerno' /></li>
			<li class='label'>藏品类型</li>
			<li class='input'><select name="entitytype" >
				<option value="">全部</option>
				<option value="1">现代钱币</option>
				<option value="3">古钱</option>
				<option value="5">机制币</option>
				<option value="2">纸钞</option>
				<option value="4">邮票</option>
			</select></li>
			<li class='btn_reset'><input type="reset" value="重置">
			</li>
		</ul>
	</li>
	</ul>
	</form>
	<div id="Requesttable"
		style="margin-left: 60px; width: 1080px; height: 500px; 
			margin-top: 100px; margin-bottom: 30px;">
		<table id="flexRequest" class="display" cellspacing="0" width="100%";>
	        <thead>
	            <tr>
	                <th>预约单号</th>
	                <th>内部流转号</th>
	                <th>申请时间</th>
	                <th>受理时间</th>
	                <th>状态</th>
	                <th>支付状态</th>
	                <th>藏品名称</th>
	                <th>预约数量</th>
	                <th>操作</th>
	              </tr>
       	 	</thead>
       	 	<%--  
	        <tfoot>
	            <tr>
	                <th>预约单号</th>
	                <th>内部流转号</th>
	                <th>申请时间</th>
	                <th>受理时间</th>
	                <th>外部状态</th>
	                <th>内部状态</th>
	                <th>支付状态</th>
	                <th>藏品名称</th>
	                <th>预约数量</th>
	                <th>操作</th>
	              </tr>
	        </tfoot>
	        --%>
		</table>
		<br />

		<p>应付：${reqForPay.getCount()}单，共计: 
			<c:out value="${reqForPay.totalCost}" default="0.00" />
			元
		</p>
		<p>已选：
			<b id="checkedAmount">0</b>
			单，共计：
			<b id="checkedTotalCost">0.00</b>
			元
		</p>
		<!-- 
		<a href="#" onclick="payment()"
			style="display: inline-block; margin-top: 10px;">
			<img alt="" src="${ctx_images}/payment.png">
		</a>
		 -->
	</div>
</div>

<div id="new" style="width: 300px; height: 100px; margin-top: -150px; display: none;
			background-color: white; z-index: 999; margin-left: -150px; 
			position: absolute; top: 50%; left: 50%;">
	<div id="title"
		style="width: 100%; height: 30px; background-color: #E8F2FE; padding-top: 10px;">
		支付提示
	</div>
	<div style="width: 100%; padding-left: 10px; padding-top: 15px;">
		<div id="mobileDiv" style="margin-left: 40px;">
			<input type="hidden" id="payid" /> 
			<input type="button" value="支付完成"
				class="check" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="button" value="遇到问题" class="check" />
		</div>
	</div>
</div>

<script type="text/javascript">   
	window.onbeforeunload = onbeforeunload_handler;   
    window.onunload = onunload_handler;   
    function onbeforeunload_handler(){   
		var payid=$("#payid").val();
		$.getJSON(URLs.validPayment,{'payid' : payid}, function(data) {
			$.each(data, function(key, value) {
			});
		});  
    }   
    function onunload_handler(){   
    	$.getJSON(URLs.validPayment,{'payid' : payid}, function(data) {
			$.each(data, function(key, value) {
			});
		});  
    }
// -->  
	function closeAddTelWin(){
		$("#new").css("display","none");
		$("#bgDiv").remove();
	}
	
	var dt = $('#flexRequest').DataTable( {
        "ajax": {
        	"url" : URLs.showRequestList,
        	"data" : function(d){
        		if(param.userid && param.userid != ''){
        			d.userid = param.userid ; 
        		}
        		$("#sform :text,#sform select").each(function(){
        			if(this.value != ''){
        				d[this.name] = this.value;
        			}
        		});
        		// return d ;
        	}
        },
        "columns": [
            { "data": "reservno" },
            { "data": "innerno" },
            { "data": "applytime" },
            { "data": "deposittime" },
            { "data": "depositstate" },
            { "data": "paystate" },
            { "data": "aliasname" },
            { "data": "amount" },
            { "data": "menu" }
        ]
    } );
	
	function search(){
		dt.ajax.reload();
	}
	
	var maiheight = 500;
	var w = 980;
	var gapTop =  30;
	var otherpm = 150; //GridHead，toolbar，footer,gridmargin
	var h = maiheight - gapTop - otherpm;
  	/*
    $("#flexRequest").flexigrid({
        width: w,
        height: h,
        url: URLs.showRequestList 
        	+ '?userid=' + param.userid
			+ '&request_state=' +  param.request_state,
        dataType:'json',
        colModel : [
            {display: 'ID', name: 'id', width: 100, sortable: true, align: 'center', hide: true},
            {display: '<input id="selAll" type="checkbox" onclick=checkAll()>', name: 'checkbox', width: 25, sortable: false, align: 'center', hide: false},
            {display: '状态标识', name: 'hehe', width: 60, sortable: false, align: 'center', hide: true},
            {display: '申请单号', name: 'requestcode', width: 80, sortable: false, align: 'center', hide: true},
            {display: '申请单号', name: 'requestcode', width: 50, sortable: false, align: 'center', hide: false},
            {display: '类型', name: 'entitytype', width: 80, sortable: true, align: 'center', hide: false},
            {display: '申请时间', name: 'applytime', width: 90, sortable: false, align: 'center', hide: false},
            {display: '送评数', name: 'totalamount', width: 30, sortable: false, align: 'center', hide: false},
            {display: '总估价', name: 'totalevaluate', width: 60, sortable: false, align: 'center', hide: false},
            {display: '总费用', name: 'totalcost', width: 60, sortable: false, align: 'center', hide: false},
            {display: '备注', name: 'remark', width: 120, sortable: false, align: 'center', hide: false},                           
            {display: '状态', name: 'depositstate', width: 60, sortable: false, align: 'center', hide: false},
            {display: '支付情况', name: 'applytime', width: 160, sortable: false, align: 'center', hide: false},
            {display: '所有人', name: 'userid', width: 100, sortable: false, align: 'center', hide: true},
            {display: '操作', name: 'uprequest', width: 100, sortable: false, align: 'center', hide: false}
        ],
       	buttons : [
           	{name: '&nbsp;选&nbsp;择&nbsp;', id: 'select', bclass: 'default', onpress: toolbar},
           	{separator: true}
         ],   
         errormsg:  '发生异常',
         sortname: "applytime",
         sortorder: "desc",
         usepager: false,
//          title: '我的送评',
         pagestat: '显示记录从{from}到{to}，总数 {total} 条',
         userp: true,
         rp: 10,
         rpoptions: [10, 15, 20, 30, 40, 100],////可选择设定的每页结果数
         nomsg: '没有符合条件的记录存在',
         singleSelect:true,
         mincoltoggle: 1,////允许显示的最小列数
         showtabletogglebtn: false,
         autoload: true,////自动加载，即第一次发起ajax请求
         resizable: false,////table是否可伸缩
         procmsg:  '加载中, 请稍等 ...',
         hideonsubmit: true,////是否在回调时显示遮盖
         blockopacity: 0.5,////透明度设置
         rowbinddata: true,
         showcheckbox: true,
         showToggleBtn: false,
         onSubmit: function(){ //数据传出时调用的函数
			var dt = $('#sform').serializeArray();     
			$("#flexRequest").flexOptions({params: dt});
			return true;
		}
    });
  	*/
    $(".cDrag").css("display","none");
 	$('.check').click(function() {
		var uuid=$("#uuid").val();
		var payid=$("#payid").val();
		$.getJSON(URLs.validPayment,{'payid' : payid}, function(data) {
			$.each(data, function(key, value) {
				closeAddTelWin();
				alert( (value == "ok") ? "支付成功！" : "支付失败！");
				$("#flexRequest").flexReload();
 				removeCheck();
			});
		});
	});
</script>