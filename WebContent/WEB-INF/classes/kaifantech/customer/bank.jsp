<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="X-UA-Compatible" content="IE=9" >

<%	
	String showBankList			= "showBankList.shtml";
	String checkBankNum			= "checkBanknum.shtml";
	String changeBankDefault	= "changeBankDefault.shtml";
	String addNewBank			= "addNewBank.shtml";
	String delRowBank			= "delRowBank.shtml";
%>

<c:set var='showBankList' value='showBankList.shtml' scope='request' />
<c:set var='checkBankNum' value='checkBanknum.shtml' scope='request' />
<c:set var='changeBankDefault' value='changeBankDefault.shtml' scope='request' />
<c:set var='addNewBank' value='addNewBank.shtml' scope='request' />
<c:set var='delRowBank' value='delRowBank.shtml' scope='request' />

<script >
	var urls = {
		'showBankList'		:'showBankList.shtml' ,
		'checkBankNum'		:'checkBanknum.shtml' ,
		'changeBankDefault'		:'changeBankDefault.shtml' ,
		'addNewBank'		:'addNewBank.shtml' ,
		'delRowBank'		:'delRowBank.shtml' 
	}
</script>



<style type="text/css">
*{margin:0;padding:0;font-family:"微软雅黑";}
input[type=text],input[type=submit],input[type=reset],textarea,button{font-family: "微软雅黑";}
#nave{background-color: #FFF;width: 850px;margin-top: 30px; margin-bottom: 30px;padding-bottom: 30px;color:#000;}
#mobiletable{margin: 0px; width: 810px; z-index: 1;margin-left: 20px; height: 830px;}
#mobiletable .sdgshang{background-color: #FFF; border-bottom: 2px solid #ccc; height: 27px; padding-top: 7px;}
#mobiletable .baoshang{background-color: #FFF;  height: 50px;}
#mobiletable .sdgshang .span{ height: 26px; color: #000;margin-right: 20px;float:left; width: 75px; text-align:center;}
#mobiletable #megss{height:auto !important; padding:5px; background-color: #EBEBEB;}
#inlandTable td,#interTable td{padding:8px;}
#nave input[type=text],#nave select,#nave textarea{background:#f3f3f3;}
.interLeftTd{height:28px;text-align: right;}
.interLeftTd div{width:100%;height:14px;}
</style>

<link rel="stylesheet" href="${ctx_css}/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/flexigrid.css" type="text/css"></link>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/flexigrid.pack.js"></script>
<%
	String isopen = request.getParameter("isopen");
%>

<script type="text/javascript">
var userid = '${userid}' ;
$(document).ready(function(){
     var maiheight = 410;
     var w = $("#Banktable").width();
     var gapTop =  30;
     var otherpm = 150; //GridHead，toolbar，footer,gridmargin
     var h = maiheight - gapTop - otherpm;
     $("#flexbank").flexigrid({
         width: w,
         height: h,
         /* url: '${showBankList}&action='+$("#action").val(), */
         url:"${showBankList}&userid="+ userid,
         dataType:'json',
         colModel : [
             {display: 'ID', name: 'id', width: 20, sortable: true, align: 'center', hide: true},
             {display: '默认标识', name: 'isbiaosi', width: 80, sortable: false, align: 'center', hide: true},
             {display: 'getbank', name : 'getbank', width : 50, sortable : true, align: 'center',hide: true},
             {display: '开户人', name: 'receiver', width: 150, sortable: true, align: 'center', hide: true},
             {display: '所属人', name: 'userid', width: 50, sortable: true, align: 'center', hide: true},
             {display: '银行名称', name: 'bankname', width: 90, sortable: true, align: 'center', hide: false},
             {display: '开户行', name: 'location', width: 128, sortable: true, align: 'center', hide: false},
             {display: '银行账号', name: 'accountid', width: 130, sortable: true, align: 'center', hide: false},
             {display: '状态', name: 'isdefault', width: 55, sortable: true, align: 'center', hide: false},
             {display: '开户人', name: 'receiver', width: 50, sortable: true, align: 'center', hide: false},
             {display: '银行类型', name: 'type', width: 55, sortable: true, align: 'center', hide: false},             
             {display: '国际银行账号', name: 'iban', width: 100, sortable: false, align: 'center', hide: false},
             {display: '银行识别码', name: 'swiftcode', width: 67, sortable: false, align: 'center', hide: false},
             {display: '备注', name: 'remark', width: 200, sortable: true, align: 'center', hide: true},
             {display: '操作', name: 'todo', width: 33, sortable: false, align: 'center', hide: false}
             ],
        <%--  buttons : [
             {name: '添加', id: 'add', bclass: 'add', onpress: toolbar},
             {name: '删除', id: 'delete', bclass: 'delete', onpress: toolbar},
             {name: '设为默认', id: 'default', bclass: 'default', onpress: toolbar}, 
			<%
				if("yes".equals(isopen)){
					%>
					{name: '选择',id:'select', bclass: 'default', onpress : toolbar},
					<%
				}
			%>
             {separator: true}
             ], --%>
//          searchitems : [
// 			 {display: 'ID', name : 'id', isdefault: true},
//              {display: '所在地', name: 'location'},
//              {display: '名称', name: 'bankname'},
//              {display: '账号', name: 'accountid'},
//              {display: '默认', name: 'isdefault'},
//              {display: '银行编号', name: 'bankcode'}
//              ],
         errormsg:  '发生异常',
         sortname: "isdefault",
         sortorder: "desc",
         usepager: false,
//          title: '银行账号管理',
         pagestat: '显示记录从{from}到{to}，总数 {total} 条',
         userp: true,
         rp: 10,
         rpoptions: [10, 15, 20, 30, 40, 100],////可选择设定的每页结果数
         nomsg: '没有符合条件的记录存在',
         mincoltoggle: 1,////允许显示的最小列数
         showtabletogglebtn: false,
         autoload: true,////自动加载，即第一次发起ajax请求
         resizable: false,////table是否可伸缩
         procmsg:  '加载中, 请稍等 ...',
         hideonsubmit: true,////是否在回调时显示遮盖
         blockopacity: 0.5,////透明度设置
         rowbinddata: true,
         showToggleBtn: false,
         showcheckbox: false,
         });
     $(".cDrag").css("display","none");
     
	function formatMoney(value, pid) {
         return "￥" + parseFloat(value).toFixed(2);
    }
	
			
});
function addThisNewBankfrm(){
	var typeid="0";
	var bankname="";
	var iban="";
	var location="";
	var receiver="";
	var address="";
	var remark="";
	var accountid="";
	var swiftcode="";
	var isdefault="0";
	if ($("#inlandbank").is(":checked")){
		typeid = "0";
		bankname = $("#ibankname").val();
		location = $("#ilocation").val();
		accountid = $("#iaccountid").val();
		receiver = $("#ireceiver").val();
		remark = $("#iremark").val();
	}else if($("#internationbank").is(":checked")){
		typeid = "1";
		bankname = $("#tbankname").val();
		location=$("#tlocation").val();
		iban = $("#tiban").val();
		address = $("#taddress").val();
		receiver = $("#treceiver").val();
		swiftcode = $("#tswiftcode").val();
		accountid = $("#taccountid").val();
		remark = $("#tremark").val();
	}
	if ($("#isdefault").is(":checked")){
		isdefault = "1";
	}else {
		isdefault = "0";
	}	
// 	alert("typeid:"+typeid+"bankname:"+bankname+"location:"+location+"iban:"+iban+"address:"+address+"receiver:"+receiver+"swiftcode:"+swiftcode+"accountid:"+accountid+"remark:"+remark);
// 	$("input[type=reset]").trigger("click");
	if(''==bankname||null==bankname||''==location||null==location||''==accountid||null==accountid||''==receiver||null==receiver||bankname=='00'||bankname=='银行名称（Bank name）'||location=='输入开户行'||location=='银行所在地（Bank location）'||receiver=='开户人姓名'||receiver=='收款人姓名（beneficiary’s name）'||accountid=='收款人银行账户（beneficiary’s account ID）'||accountid=='输入账号'){
		if ($("#inlandbank").is(":checked")){
			banknameBlur();iaccountidBlur();locationBlur();ireceiverBlur();
		 }
		if($("#internationbank").is(":checked")){
			tbanknameBlur();taccountidBlur();tlocationBlur();treceiverBlur();
		}		
		alert("请检查未填项！");		
	}else{
		 if($("#internationbank").is(":checked")){
			 if(''==iban||null==iban||''==address||null==address||''==swiftcode||null==swiftcode||iban=='国际银行账户号（IBAN）'||address=='银行地址（Bank address）'||swiftcode=='银行识别码（Swift Code）'){
				 taddressBlur();tibanBlur();
				 tswiftcodeBlur();
				 alert("银行相关内容不能为空！");
				 return false;
			 }else{
				 	$.ajax({
			 		type: "POST",
					url: "${addNewBank}&userid="+ userid,
			 		data: "typeid="+typeid+"&bankname="+bankname+"&location="+location+"&address="+address+"&receiver="+receiver+"&swiftcode="+swiftcode+"&accountid="+accountid+"&remark="+remark+"&isdefault="+isdefault+"&iban="+iban,
			 		dataType:"text",
			 		success: function(msg){
			 			if(msg!="0"){
			 				$("input[type=reset]").trigger("click");
			 				$("#megss").show();
			 				$("#megs").text("新增成功！");
							setTimeout('$("#megss").hide("slow")',3000); 
			 				$("#flexbank").flexReload();
			 			}else{
// 			 				alert("添加失败！");
			 				$("input[type=reset]").trigger("click");
			 				$("#megss").show();
			 				$("#megs").text("新增失败！");
							setTimeout('$("#megss").hide("slow")',3000); 
			 				$("#flexbank").flexReload();
			 			}
			 		},
			 		error: function(msg){
			 			alert(msg);
			 		}
			 	});
			 }
		 }
		 else if ($("#inlandbank").is(":checked")){
			 	$.ajax({
		 		type: "POST",
				url: "${addNewBank}&userid="+ userid,
		 		data: "typeid="+typeid+"&bankname="+bankname+"&location="+location+"&address="+address+"&receiver="+receiver+"&swiftcode="+swiftcode+"&accountid="+accountid+"&remark="+remark+"&isdefault="+isdefault+"&iban="+iban,
		 		dataType:"text",
		 		success: function(msg){
		 			if(msg!="0"){
		 				$("input[type=reset]").trigger("click");
// 		 				closeBankWin();
						$("#megss").show();
						$("#megs").text("新增成功！");
						setTimeout('$("#megss").hide("slow")',3000); 
		 				$("#flexbank").flexReload();
		 			}else{
// 		 				alert("添加失败！");
		 				$("input[type=reset]").trigger("click");
		 				$("#megss").show();
		 				$("#megs").text("新增失败！");
						setTimeout('$("#megss").hide("slow")',3000); 
		 				$("#flexbank").flexReload();
		 			}
		 		},
		 		error: function(msg){
		 			alert(msg);
		 		}
		 	});
		 }
// 		closeBankWin();
// 		alert("可以添加");
	}
	return false;
} 
function checkBankNum(num){
	var bankType;
	if(num!=''){
		if ($("#inlandbank").is(":checked")){
			//国内银行
			bankType = '0';
		}else{
			//国际银行
			bankType = '1';
		}
		$.ajax({
			type: "POST",
			url: "${checkBankNum}&userid="+ userid,
			data: "banknum="+num+"&bankType="+bankType,
			dataType:"text",
			success: function(msg){
				if(msg!="0"){
					if(bankType =='0'){
						document.getElementById("error").style.display="block";
						document.getElementById("iaccountid").style.border="1px solid red";
					}else{
						document.getElementById("error1").style.display="block";
						document.getElementById("tiban").style.border="1px solid red";
					}
					document.getElementById("submit").disabled=true;
				}else{
					document.getElementById("error").style.display="none";
					document.getElementById("error1").style.display="none";
					document.getElementById("iaccountid").style.border="1px solid #ccc";
					document.getElementById("tiban").style.border="1px solid #ccc";
					document.getElementById("submit").disabled=false;
				}
			},
			error: function(msg){
				alert(msg);
			}
		}); 
	}
}
function changeToInter(){
	document.getElementById('internationid').style.display= '';
	document.getElementById('inlandid').style.display= 'none';
	document.getElementById('error').style.display='none';
	document.getElementById('error1').style.display='none';
	document.getElementById('iaccountid').style.border='1px solid #ccc';
	document.getElementById('tiban').style.border='1px solid #ccc';
	document.getElementById('submit').disabled=false;
	document.getElementById('interTab').style.borderBottom='3px solid #BA5A3B';
	document.getElementById('inlandTab').style.borderBottom='3px solid #ccc';
	document.getElementById('internationbank').checked=true;
	$("input[type=reset]").trigger("click");
// 	$("#flexbank").flexReload();
	
}
function changeToInland(){
	document.getElementById('inlandid').style.display= '';
	document.getElementById('internationid').style.display= 'none';
	document.getElementById('error').style.display='none';
	document.getElementById('error1').style.display='none';
	document.getElementById('iaccountid').style.border='1px solid #ccc';
	document.getElementById('tiban').style.border='1px solid #ccc';
	document.getElementById('submit').disabled=false;
	document.getElementById('inlandTab').style.borderBottom='3px solid #BA5A3B';
	document.getElementById('interTab').style.borderBottom='3px solid #ccc';
	document.getElementById('inlandbank').checked=true;
	$("input[type=reset]").trigger("click");
// 	$("#flexbank").flexReload();
}
function deleteBank(bankId){
	if(window.confirm("确认删除该条记录？")){
		$.ajax({
			type: "POST",
			url: "${delRowBank}",
			data: "id="+bankId,
			dataType:"text",
			success: function(msg){
				if(msg!="0"){
	 				$("#megss").show();
	 				$("#megs").text("删除成功！");
					setTimeout('$("#megss").hide("slow")',3000); 
	 				$("#flexbank").flexReload();
				}else{
					$("#megss").show();
	 				$("#megs").text("发生错误，请重新操作！");
					setTimeout('$("#megss").hide("slow")',3000); 
	 				$("#flexbank").flexReload();
				}
			},
			error: function(msg){
				alert(msg);
			}
		});
	}
}
function changeToDefault(bankId){
	$.ajax({
		type: "POST",
		url: "${changeBankDefault}&userid="+ userid,
		data: "id="+bankId,
		dataType:"text",
		success: function(msg){
			if(msg=="1"){
				$("#megss").show();
 				$("#megs").text("设置默认成功");
				setTimeout('$("#megss").hide("slow")',3000); 
 				$("#flexbank").flexReload();
			}else{
				$("#megss").show();
 				$("#megs").text("设置默失败，请重新操作！");
				setTimeout('$("#megss").hide("slow")',3000); 
 				$("#flexbank").flexReload();
			}
		},
		error: function(msg){
			alert(msg);
		}
	});
}
</script>    

<div id="nave" >
<div id="mobiletable">
<%
			 if(!"yes".equals(isopen)){                  	                     
                %>
	<div class="baoshang">
		<div class="sdgshang" style="">
			<a href="javascript:changeToInland()"><div id="inlandTab" class="span" style="border-bottom: 3px solid #BA5A3B;"><span>国内银行</span></div></a>
			<a href="javascript:changeToInter()"><div id="interTab" class="span" style="border-bottom: 3px solid #ccc;"><span>国际银行</span></div></a>
			
		</div>
	</div>
<%} %>
	<div id="megss" style="display: none;"><p id="megs" style="color: #000;">删除成功！</p></div>

<div id="newBank" style="width:450px;display:block;z-index:10;background-color: #fff;">
	<div id="typeid" style="margin-left:40px;display:none;">
		<input id="inlandbank" type="radio" value="国内银行" name="identity" checked="checked" onclick="document.getElementById('inlandid').style.display= '';document.getElementById('internationid').style.display= 'none';document.getElementById('error').style.display='none';document.getElementById('error1').style.display='none';document.getElementById('iaccountid').style.border='';document.getElementById('taccountid').style.border='';document.getElementById('submit').disabled=false;"/>国内银行
		<input id="internationbank" type="radio" value="国际银行" name="identity" onclick="document.getElementById('internationid').style.display= '';document.getElementById('inlandid').style.display= 'none';document.getElementById('error').style.display='none';document.getElementById('error1').style.display='none';document.getElementById('iaccountid').style.border='';document.getElementById('taccountid').style.border='';document.getElementById('submit').disabled=false;"/>国际银行
	</div>
	<form id="addNewBankfrm" name="addNewBankfrm" method="post" onsubmit='return addThisNewBankfrm();'>				
	<div id="inlandid" style="width:100%;" >	
		<table id="inlandTable" border="0">
		<col width=90px/>
			<tr>
				<td align="right">选择银行</td>
				<td>
					<select id="ibankname" name="ibankname" autocomplete="off" style="width:150px;height:27px;">
							<option value="00" selected="selected">选择银行</option>
							<c:forEach items="${allbank }" var="allbank">
									<option value="${allbank.displayname}">${allbank.displayname}</option>	
							</c:forEach>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="right">开户行</td>
				<td>
					<input id="ilocation" name="ilocation" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="right">账号</td>
				<td>
					<input id="iaccountid" name="iaccountid" type="text" autocomplete="off" onblur="checkBankNum(this.value);" style="width:150px;" 
						onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')"/>
				</td>
				<td>
					<div id="error" style="display: none;float: left;color: red;">帐号已存在</div>
				</td>
			</tr>
			<tr>
				<td align="right">开户人姓名</td>
				<td>
					<input id="ireceiver" name="ireceiver" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="right">备注</td>
				<td>
					<textarea id="iremark" name="iremark" autocomplete="off" cols="10" rows="5" style="width:150px;"></textarea>
				</td>
				<td></td>
			</tr>
		</table>
					
	</div>
	<div id="internationid" style="display: none;width:100%;">
		<table id="interTable" border="0">
		
			<tr>
				<td class="interLeftTd">
					<div>银行所在地</div>
					<div>Bank Location</div>
				</td>
				<td>
					<input id="tlocation" name="tlocation" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>银行名称</div>
					<div>Bank Name</div>
				</td>
				<td>
					<input id="tbankname" name="tbankname" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>银行地址</div>
					<div>Bank Address</div>
				</td>
				<td>
					<input id="taddress" name="taddress" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>收款人银行账户</div>
					<div>Beneficiary’s Account</div>
				</td>
				<td>
					<input id="taccountid" name="taccountid" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>国际银行账户号</div>
					<div>IBAN</div>
				</td>
				<td>
					<input id="tiban" name="tiban" type="text" autocomplete="off" onblur="checkBankNum(this.value)" style="width:150px;"
					onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')"/>
				</td>
				<td>
					<div id="error1" style="display: none;float: left;color: red;">帐号已存在</div>
				</td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>收款人姓名</div>
					<div>Beneficiary’s name</div>
				</td>
				<td>
					<input id="treceiver" name="treceiver" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>银行识别码</div>
					<div>Swift Code</div>
				</td>
				<td>
					<input id="tswiftcode" name="tswiftcode" type="text" autocomplete="off" style="width:150px;"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="interLeftTd">
					<div>备注</div>
					<div>Remark</div>
				</td>
				<td>
					<textarea id="tremark" name="tremark" autocomplete="off" cols="10" rows="3" style="width:150px;"></textarea>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
	<div style="width:100%;padding-left:100px;">
			<br>
			<input id="isdefault" name="isdefault" type="checkbox"/>&nbsp;设为默认银行账号	
			<br><br>
			<input id="submit" type="submit" value="" style="width:52px;height:28px;background: url(${ctx_images}/addnew.png) no-repeat 0 0;"/>
			<input type="reset" value="重写" style="display:none;"/>
			<br><br>
	</div>
	</form>
</div>

<div id="Banktable" style="margin:0px;width:810px;">
	<table id="flexbank" style="display:none">

</table>
</div>
</div>
</div>


