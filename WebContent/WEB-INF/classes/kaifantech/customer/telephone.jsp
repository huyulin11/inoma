<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>


<style type="text/css">
*{margin:0;padding:0;font-family:"微软雅黑";font-size:14px;}
input[type=text],input[type=submit],input[type=reset],textarea,button{font-family: "微软雅黑";}
input[type=text],input[type=password],select,textarea{background:#f3f3f3;}
#nave{background-color: #FFF;width: 850px; margin-top: 30px;margin-bottom: 30px;}
#mobiletable{margin: 0px; width: 810px; z-index: 1;margin-left: 20px; height: 600px;}
#mobiletable .sdgshang{background-color: #FFF; border-bottom: 2px solid #ccc; height: 27px; padding-top: 7px;}
#mobiletable .baoshang{background-color: #FFF;  height: 50px;}
#mobiletable .sdgshang .span{ height: 26px; color: #000;margin-right: 20px;float:left; width: 75px; text-align:center; }
#mobiletable #megss{ height: 30px; background-color: #EBEBEB;}
#mobiletable .shousuo{background-color: #FFF;height: 46px;padding-top: 18px;padding-bottom: 17px;}
#mobiletable .shousuo span{color: #000;}
</style>

<link rel="stylesheet" href="${ctx_css}/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/flexigrid.css" type="text/css"></link>
<script src="${ctx_js}/jquery-1.8.3.js"></script>
<script src="${ctx_js}/flexigrid.pack.js"></script>

<script type="text/javascript">
	var userid = '${userid}' ;
	
	
$(document).ready(function(){
	var maiheight = 460;
	var w = $("#mobiletable").width();
	var gapTop =  30;
	var otherpm = 150; //GridHead，toolbar，footer,gridmargin
	var h = maiheight - gapTop - otherpm;

	$("#flexTel").flexigrid({
		width: w,
		height: h,
		url: um.urls.showTelList + '?userid='+ userid,
		dataType: 'json',
		colModel : [
			{display: 'ID', name : 'id', width : 50, sortable : true, align: 'center',hide: true},
			{display: 'gettel', name : 'gettel', width : 50, sortable : true, align: 'center',hide: true},
			{display: '用户编号', name : 'userid', width : 100, sortable : false, align: 'center',hide: true},
			{display: '固话号码', name : 'telephone', width : 243, sortable : true, align: 'center'},
			{display: '联系人', name : 'remark', width : 149, sortable : false, align: 'center'},
			{display: '状态', name : 'isdefault', width : 150, sortable : false, align: 'center',process:formatMoney},
			{display:'操作' ,name:'caozuo', width:221,sortable:false,align:'center'}
			],
		searchitems : [
			{display: 'ID', name : 'id', isdefault: true},
			{display: '手机号码', name : 'telephone'}
			],
		errormsg: '发生异常',
		sortname: "id",
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
		showToggleBtn: false,
		resizable:false,//表格是否可以拖动
		usepager: false,//是否分页的导航栏下下面
		showcheckbox: true
		//gridClass: "bbit-grid"//样式
	});
	$(".cDrag").css("display","none");//很重要
	function formatMoney(value, pid) {
         return "￥" + parseFloat(value).toFixed(2);
    }
});
//执行添加
function submitTel(){
	var country = $("#country").val();
	var telNum = $("#teleNumber").val();
	var branchNum = '';
	if (country==''){
		$("#megss").css("display","block");
		$("#megs").text("区号不可为空！");
		$("#country").focus();
		return false;
	}
	if (telNum==''){
		$("#megss").css("display","block");
		$("#megs").text("主机号码不可为空！");
		$("#teleNumber").focus();
		return false;
	}
	if ($("#branch").val()!=''){
		branchNum = "-" + $("#branch").val();
	}
	var number = $("#country").val() +  "-" + telNum + branchNum;
	
	$.ajax({
		type: "POST",
		url: um.urls.checkTel ,
		data: {'userid' : userid, 'telno' : number } ,
		dataType:"text",
		success: function(data){
			if (data=="no"){
				$("#megss").css("display","block");
				$("#megs").text("号码不可重复！");
			}else {
				$("#megs").text("");
				realSubmit(number);
				document.getElementById("megss").style.display="block";
				$("#megs").text("新增成功");
				$("#country").val("") ;
				$("#branch").val("");
				$("#teleNumber").val("");
			}
		},
		error: function(data){
			alert(data);
		}
	});
	return false;
	
}
</script>
<script type="text/javascript">
$(function(){
	$("#teleNumber").blur(function(){
		var telNumber = $("#teleNumber").val();
		if (telNumber == ''){
			$("#notice").text("主机号码不可为空！");
			return false;
		}else {
			$("#notice").text("");
		}
	});
});
function realSubmit(number){
	var describe = $("#describe").val();
	closeAddTelWin(); // TODO : can't find this funtion's definition
	var isdefault = ($("#checkDefault").is(":checked")) ? 1 : 0 ;
	$("input[type=reset]").trigger("click");
	$.ajax({
		type: "POST",
		url: um.urls.addNewTel,
		data: {'userid': userid , 'number' : number , 'describ' : describe ,'isdefault' : isdefault},
		dataType:"text",
		success: function(msg){
			if(msg!="0"){
				$("#flexTel").flexReload();
			}else{
				alert("添加失败！");
			}
		},
		error: function(msg){
			alert(msg);
		}
	});
	return false;
}
/*
 * 选择事件
 */
function select(id){
	opener.document.getElementById("atel").value=id;
	window.close();
}
/**
 * 执行默认
 */
function defaults(id){
	$.ajax({
		type: "POST",
		url: um.urls.changeDefaultTel ,
		data: {'userid' : userid, 'id' : id },
		dataType:"text",
		success: function(msg){
			if(msg!="0"){
				$("#flexTel").flexReload();
			}else{
				alert("本号码已经是默认号码");
			}
		},
		error: function(msg){
			alert(msg);
		}
	});
}
/**
 * 执行删除
 */
function deletes(id) {
	if(confirm('确定删除吗 ？')){
	      $.ajax({
				type: "POST",
				url: um.urls.delTel ,
				data:  {'userid' : userid, 'id' : id },
				dataType:"text",
				success: function(msg){
					if(msg!="0"){
						$("#flexTel").flexReload();
						document.getElementById("megss").style.display="block";
						$("#megs").text("删除成功");
					}else{
						alert("删除失败");
					}
				},
				error: function(msg){
					alert(msg);
				}
			});
}
}
</script>
<script src="${ctx_js}/customer/urls.js${fv}"></script>

<!-- 
<div id="new" style="width:550px;display:none;z-index:10;background-color: white;position: absolute;">
	<div id="title" style="width:100%;height:30px;background-color: #E8F2FE;padding-top:10px;">
	&nbsp;&nbsp;添加固话号码
	<span style="float:right;margin-right:10px;"><a href="javascript:closeAddTelWin()">关闭</a></span>
	</div>
	<div style="width:100%;padding-left:0px;padding-top:20px;">
		<form id="addNewTelFrm" name="addNewTelFrm" method="post" onsubmit="return submitTel()">
			<br>
			<div id="mobileDiv" style="margin-left:40px;">
				<select id="country" name="country" style="width:80px;font-family: ''">
					<option value="086" selected="selected">中国</option>
					<option value="001">美国</option>
					<option value="001">日本</option>
					<option value="001">英国</option>
					<option value="001">法国</option>
					<option value="001">德国</option>
				</select>
				—
				<select id="city" style="width:80px;font-family: ''">
					<option value="010" selected="selected">北京</option>
					<option value="021">上海</option>
					<option value="025">南京</option>
					<option value="0551">合肥</option>
					<option value="0556">安庆</option>
				</select>
				—
				<input id="teleNumber" name="teleNumber" type="text" size="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				<span>—</span>
				<input id="branch" name="branch" type="text" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				<span id="notice" style="color:red;font-size:12px;"></span>
			<br>
			<br>
			<span>备注</span>
			<br>
			<textarea id="describe" rows="3" cols="50"></textarea>
			<br><br>
			<input id="checkDefault" name="checkDefault" type="checkbox"/>&nbsp;设为默认号码
			<br><br>
			<input type="submit" value="添加" style="width:60px;"/>&nbsp;
			<input type="reset" value="重写"/>
			<br><br>
			</div>
		</form>
	</div>
</div>
 -->
 <div id="nave" >
<div id="mobiletable">
	<c:if test='${sessionType == "0"}' >
		<div class="baoshang">
			<div class="sdgshang" style="">
				<a href="/customer/mobile/view.shtml?userid=${userid}">
					<div class="span" style="border-bottom: 3px solid #ccc;">
						<span>手机号码</span></div></a>
				<a href="/customer/mail/view.shtml?userid=${userid}">
					<div class="span" style="border-bottom: 3px solid #ccc;">
						<span>电子邮件</span></div></a>
				<a href="/customer/telephone/view.shtml?userid=${userid}">
					<div class="span" style="border-bottom: 3px solid #BA5A3B;">
						<span>固定电话</span></div></a>
			</div>
		</div>
	</c:if>
	
	<div id="megss" style="display: none;"><p id="megs" style="color: #000;">删除成功</p></div>
	
	<div class="shousuo">
		<form id="addNewTelFrm" name="addNewTelFrm" method="post" onsubmit="return submitTel()">
			<div>
				<span>固定电话 </span>
				<input id="country" name="country" type="text" size="8" 
						onafterpaste="this.value=this.value.replace(/\D/g,'')" 
						onkeyup="this.value=this.value.replace(/\D/g,'')"/>
				-  
				<input id="teleNumber" name="teleNumber" type="text" size="23" 
						onkeyup="this.value=this.value.replace(/\D/g,'')" 
						onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				-
				<input id="branch" name="branch" type="text" size="8" 
						onkeyup="this.value=this.value.replace(/\D/g,'')" 
						onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				<span style="margin-left: 30px;">联系人</span>	
				<input id="describe" type="text" size="10"/>
				<input id="checkDefault" name="checkDefault"type="checkbox" /><span>设为默认</span>
				<input type="submit" value="新增" />
			</div>
			<div><span style="margin-left: 72px;">区号</span>
						<span style="margin-left: 97px;">电话号码</span>
						<span style="margin-left: 101px;">分机</span>
			</div>
		</form>
	</div>
	<table id="flexTel" style="display: none"></table>
</div>
	<input id="action" type="hidden" name="action" value="select" />
</div>






