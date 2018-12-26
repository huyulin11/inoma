<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<style type="text/css">
	*{
		margin:0;
		padding:0;
		font-family:"微软雅黑";
	}
	
	input[type=text],input[type=submit],input[type=reset],textarea,button{
		font-family: "微软雅黑";
	}
	
	#nave input[type=text],textarea,select{
		background:#f3f3f3;
	}
	
	#tab01 td{
		padding:8px;
	}
	#tab01 .st{
		width:80px;
		height:25px;
	}
</style>

<link rel="stylesheet" href="${ctx_css}/flexigrid.pack.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx_css}/flexigrid.css" type="text/css"></link>
<script src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx_js}/flexigrid.pack.js" charset='utf-8'></script>

<script type="text/javascript">

	var userid = '${userid}' ;
	urls = {
			showAddressList		: "/customer/addr/showAddressList.shtml" ,
			addNewAddress		: "/customer/addr/addNewAddress.shtml" ,
			changeAddressDefault: "/customer/addr/changeAddressDefault.shtml" ,
			delRowAddress		: "/customer/addr/delRowAddress.shtml" ,
			
			getCountryUrl	: "/sys/address/getCountryList.shtml",
			getProvinceUrl	: "/sys/address/getProvinceList.shtml",
			getCityUrl		: "/sys/address/getCityList.shtml",
			getDistrictUrl	: "/sys/address/getDistrictList.shtml",
			
			telUrl 		: "" ,
			mobileUrl 	: "" ,
			mailUrl		: "" 
	}
	
function deleteAddr(addrId){
	if (window.confirm("确定删除吗？")){
		 $.ajax({
				type: "POST",
				url: urls.delRowAddress + "?userid="+ userid ,
				data: "id="+addrId,
				dataType:"text",
				success: function(msg){
					if(msg!="0"){
						$("#flexAddress").flexReload();
						$("#megss").css("display","block");
					}else{
						alert("有错误发生,msg="+msg);
					}
				},
				error: function(msg){
					alert(msg);
				}
			});
	}
}
function setAddrDef(addId){
	$.ajax({
		type: "POST",
		url: urls.changeAddressDefault + "?userid="+ userid ,
		data: "id="+addId,
		dataType:"text",
		success: function(msg){
			if(msg=="1"){
				$("#flexAddress").flexReload();
			}else{
				alert("设置默认出错！");
			}
		},
		error: function(msg){
			alert(msg);
		}
	});
}
function selAddr(address){
	window.opener.getaddress(address);
	window.close();
}
</script>
<script type="text/javascript">

function remove_s1() {
	$("#s2").children().remove();
	$("#s2").append("<option>省份</option>");
	$("#s3").children().remove();
	$("#s3").append("<option>地级市</option>");
	$("#s4").children().remove();
	$("#s4").append("<option>市、县级</option>");
}
function remove_s2() {
	$("#s3").children().remove();
	$("#s3").append("<option>地级市</option>");
	$("#s4").children().remove();
	$("#s4").append("<option>市、县级</option>");
}
function remove_s3() {
	$("#s4").children().remove();
	$("#s4").append("<option>市、县级</option>");
}

$(function() {
	$('#s1').change(function() {
		remove_s1();
		var parentid = $(this).children('option:selected').val();
		$.post(urls.getProvinceUrl + '?parentid=' + parentid,function(data) {
			data = eval(data);
			$.each(data,function(k,v) {
				$("#s2").append("<option value="+v.id+">"+v.name+"</option>");
			});
		});
	});
	
	$('#s2').change(function() {
		remove_s2();
		var key = $(this).children('option:selected').val();
		$.post(urls.getCityUrl + '?parentid=' + key,function(data) {
			data = eval(data);
			$.each(data,function(k,v) {
				$("#s3").append("<option value="+v.id+">"+v.name+"</option>");
			});
		});
	});
	
	$('#s3').change(function() {
		remove_s3();
		var key = $(this).children('option:selected').val();
		$.post(urls.getDistrictUrl + '?parentid=' + key,function(data) {
			data = eval(data);
			$.each(data,function(k,v) {
				$("#s4").append("<option value="+v.id+">"+v.name+"</option>");
			});
		});
	});
			
});


$(document).ready(function(){
     var maiheight = 400;
     var w = $("#Addresstable").width();
     var gapTop =  30;
     var otherpm = 150; //GridHead，toolbar，footer,gridmargin
     var h = maiheight - gapTop - otherpm;
     $("#flexAddress").flexigrid({
         width: w,
         height: h,
         url: urls.showAddressList + "?userid="+ userid,
         dataType:'json',
         colModel : [
              {display: 'id', name: 'id', width: 50, sortable: true, align: 'center', hide: true},
              {display: 'getaddress', name : 'getaddress', width : 50, sortable : true, align: 'center',hide: true},
//               {display: '默认', name: 'isdefault', width: 50, sortable: true, align: 'center', hide: false},
              {display: '国家地区', name: 'country', width: 52, sortable: false, align: 'center', hide: false},
              {display: '省  市  区', name: 'location', width: 122, sortable: false, align: 'center', hide: false},
              {display: '街道地址', name: 'address', width: 150, sortable: false, align: 'center', hide: false},
              {display: '邮编', name: 'zip', width: 40, sortable: false, align: 'center', hide: false},
              {display: '联系人', name: 'receiver', width: 50, sortable: false, align: 'center', hide: false},
              {display: '手机', name: 'mobile', width: 75, sortable: false, align: 'center', hide: false},
//               {display: '邮编', name: 'zip', width: 80, sortable: false, align: 'center', hide: false},
              {display: '固定电话', name: 'tel', width: 108, sortable: false, align: 'center', hide: false},
              {display: '状态', name: 'isdefault', width: 55, sortable: false, align: 'center', hide: false},
              {display: '电子邮件', name: 'mail', width: 150, sortable: false, align: 'center', hide: true},
              {display: '传真', name: 'fax', width: 100, sortable: false, align: 'center', hide: true}, 
              {display: '备注', name: 'remark', width: 150, sortable: false, align: 'center', hide: true},     
              {display: '所有人', name: 'userid', width: 100, sortable: false, align: 'center', hide: true},    
              {display: '操作', name: 'todo', width: 55, sortable: false, align: 'center', hide: false}    
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
//           searchitems : [
//               {display: '街道地址', name: 'address'},
//               {display: '收件人', name: 'receiver'},
//               {display: '邮编', name: 'zip'},
//               {display: '所有人', name: 'userid'},
//               {display: '移动电话', name: 'mobile'},
//               {display: '是否删除', name: 'delflag'}
//               ],
         errormsg:  '发生异常',
         sortname: "isdefault",
         sortorder: "desc",
         usepager: false,
//          title: '通讯地址管理',
         pagestat: '显示记录从{from}到{to}，总数 {total} 条',
         userp: false,
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
         showcheckbox: true,
         });
     $(".cDrag").css("display","none");
 	function toolbar(com,grid){
		//删除记录如果是默认号码...确定删除后默认号码自动换为已认证的其他手机？
		//另外，如果确定删除当前默认号码，user表中defaultmobile的处理！！
		if (com=='delete'){
			$("action").value="delete";
			if($("div#Addresstable .trSelected").length==0){
				alert("请选择要删除的数据");
			}else{
				if(confirm('是否删除这 ' + $('.trSelected',grid).length + ' 条记录吗?')){
					 var  ids ="";
				     for(var i=0;i<$('.trSelected',grid).length;i++){
				        ids+=","+$('.trSelected',grid).find("td:first").eq(i).text();//获取id
				      }
				      ids=ids.substring(1);
				      $.ajax({
							type: "POST",
							url: urls.delRowAddress + "?userid="+ userid ,
							data: "id="+ids,
							dataType:"text",
							success: function(msg){
								if(msg!="0"){
									$("#flexAddress").flexReload();
									alert("成功删除"+msg+"条记录");
								}else{
									alert("有错误发生,msg="+msg);
								}
							},
							error: function(msg){
								alert(msg);
							}
						});
		      	}
		   }
		}else if (com=='add'){
			showAddressWin();
		}else if (com=='modify'){
			$("action").value="modify";
			if($("div#Addresstable.trSelected").length==1){
				alert("flexGridServlet.do?action="+$("action").value+"&id="+$('.trSelected',grid).find("td").eq(0).text());
				window.location.href="flexGridServlet.do?action="+$("action").value+"&id="+$('.trSelected',grid).find("td").eq(0).text();
				
			}else if($("div#Addresstable .trSelected").length>1){
				alert("请选择一个修改,不能同时修改多个");
			}else if($("div#Addresstable .trSelected").length==0){
				alert("请选择一个您要修改的记录");
			}
			 
			//$("#flex1").flexReload({});
		}else if (com=='default'){
			if($("div#Addresstable .trSelected").length==1){
				//已经为默认号码的应从页面提取，不必连库查询，待完成
				var id="";
				id = $('.trSelected',grid).find("td:first").eq(0).text();
				
				$.ajax({
					type: "POST",
					url: urls.changeAddressDefault + "?userid="+ userid ,
					data: "id="+id,
					dataType:"text",
					success: function(msg){
						if(msg=="1"){
							alert("设置默认成功");
							$("#flexAddress").flexReload();
						}else{
							alert("设置默认出错！");
						}
					},
					error: function(msg){
						alert(msg);
					}
				});
				
			}else if($("div#Addresstable .trSelected").length>1){
				alert("仅能选择一个作为默认账号");
			}else if($("div#Addresstable .trSelected").length==0){
				alert("请选择一个您要设为默认的账号");
			}
		}else if(com=='select'){
				if($("div#Addresstable .trSelected").length==1){
				var getThisAddress = "";
				getThisAddress=$('.trSelected',grid).eq(0).children("td").find("span").eq(0).text();

				window.opener.getaddress(getThisAddress);
				window.close();
			}else if($("div#Addresstable .trSelected").length>1){
				alert("仅能选择一个通讯地址");
			}else if($("div#Addresstable .trSelected").length==0){
				alert("请选择一个您需要的通讯地址");
			}
		}
	}
	function formatMoney(value, pid) {
         return "￥" + parseFloat(value).toFixed(2);
    }
	
			
});
function addNewAddressfrm(){
	var country="";
	var province="";
	var city="";
	var area="";
	var address="";
	var receiver="";
	var zip="";
	var tel="";
	var mail="";
	var mobile="";
	var isdefault="0";
	var remark="";
	 country=$("#s1").val();
	 province=$("#s2").val();
	 city=$("#s3").val();
	 area=$("#s4").val();
	 address=$("#aaddress").val();
	 receiver=$("#areceiver").val();
	 zip=$("#azip").val();
	 tel=$("#atel").val();
	 mail=$("#amail").val();
	 mobile=$("#amobile").val();
	 remark=$("#aremark").val();
	if ($("#aisdefault").is(":checked")){
		isdefault = "1";
	}else {
		isdefault = "0";
	}
// 	alert("country:"+country+"province:"+province+"city:"+city+"area:"+area+"address:"+address);	
	if(country=="请选择"||province=="请选择"||city=="请选择"||area=="请选择"||'省份'==province||'地级市'==city||'市、县级'==area||''==receiver||null==receiver||zip==''){
		// countryBlur();provinceBlur();cityBlur();districtBlur();aaddressBlur();areceiverBlur();azipBlur();
		alert("请完善地址信息！");
	}else{
		$.ajax({
			type: "POST",
			url: urls.addNewAddress + "?userid="+ userid ,
			data: "country="+country+"&province="+province+"&city="+city+"&area="+area+"&address="+address+"&receiver="+receiver+"&zip="+zip+"&tel="+tel+"&mail="+mail+"&mobile="+mobile+"&isdefault="+isdefault+"&remark="+remark,
			dataType:"text",
			success: function(msg){
				if(msg!="0"){
					$("input[type=reset]").trigger("click");
// 					closeAddressWin();
					$("#flexAddress").flexReload();
					$("#addNewAddressfrm")[0].reset();
				}else{
					alert("添加失败！");
				}
			},
			error: function(msg){
				alert(msg);
			}
		});
	}

	return false;
} 
</script>    

<script type="text/javascript">

	function seltel(){
// 		var userid = $("div#Addresstable tr").children("td").find("span").eq(1).text();
// 		'kh.asp?khgw='+"khgw"+'khlb='+"khlb"+',target='rightifrm'
		window.open (urls.telUrl + "?userid="+ userid ,'telnewwindow','height=800,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no');	
	}
	function selmobile(){
// 		var userid = ("div#Addresstable tr").children("td").find("span").eq(1).text();
		window.open ( urls.mobileUrl + "?userid="+ userid ,'mobilenewwindow','height=800,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no');	
	}
	function selmail(){
// 		var userid = $("div#Addresstable tr").children("td").find("span").eq(1).text();
		window.open (urls.mailUrl + "?userid="+ userid ,'mailnewwindow','height=800,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no');	
	}
//     function checkaddress(addressEntry){
//     	var thisaddress=document.getElementById(addressEntry).value; 
//     	if(""==thisaddress||null==thisaddress){
//     		if("aaddress"==addressEntry){
//     			alert("街道地址不能为空！");
//     			return false;
//     		}else if("areceiver"==addressEntry){
//     			alert("收件人不能为空！");
//     			return false;
//     		}else if("azip"==addressEntry){
//     			alert("邮政编码不能为空！");
//     			return false;
//     		}  		
//     	}
//     }
    function selectmail(mail){
    	alert("mail:"+mail);
    }
    function frmSubmit(){
    	$("#addNewAddressfrm").submit();
    }
</script>

<div id="nave" style="margin-top:0;margin-bottom:0;">
	<div id="mobiletable">
	<c:if test='${sessionType == "0"}' >
		<div class="baoshang">
			<div class="sdgshang" style="">
				<div class="span"><span>地址管理</span></div>
			</div>
		</div>
	</c:if>
	<div id="megss" style="display: none;"><p id="megs" style="color: #000;">删除成功！</p></div>
	

<div id="newAddress" style="width:500px;display:block;z-index:1;background-color: #fff;color:#000;">
	
	<form id="addNewAddressfrm" method="post" onsubmit="return addNewAddressfrm()">				
	<div id="newaddress" style=";width:100%;padding-left:15px;">
	<table border="0" id="tab01">
		<tr>
			<td>国家地区</td>
			<td>
				<select class="st" id="s1" name="acountry" style="width:80px;height:25px;">
						<option selected="selected">请选择</option>
						<c:forEach items="${country }" var="country">
							<option value="${country.id}" <c:if test="${useraddress.country == country.id}">selected="selected"</c:if>	>${country.fullname}</option>	
						</c:forEach>					
				</select>			
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>省&nbsp;市&nbsp;区</td>
			<td colspan="2">
				<select class="st" id="s2" name="aprovince" >
					<option selected="selected" >请选择</option>
					<c:forEach items="${province }" var="province">
						<option value="${province.id}" <c:if test="${useraddress.province == province.id}">selected="selected"</c:if>	>${province.name}</option>	
					</c:forEach>	
				</select>
				<select class="st" id="s3" name="acity" >
					<option selected="selected" >请选择</option>
					<c:forEach items="${city }" var="city">
						<option value="${city.id}" <c:if test="${useraddress.city == city.id}">selected="selected"</c:if>	>${city.fullname}</option>	
					</c:forEach>
				</select>
				<select id="s4" name="aarea" class="st">
					<option selected="selected" >请选择</option>
					<c:forEach items="${district }" var="district">
						<option value="${district.id}" <c:if test="${useraddress.area == district.id}">selected="selected"</c:if>	>${district.fullname}</option>	
					</c:forEach>
				</select>
			</td>
			
		</tr>
		<tr>
			<td><span style="vertical-align:top ;">街道地址</span></td>
			<td colspan="2"><textarea id="aaddress" name="aaddress" style="width:250px;"></textarea></td>
			
		</tr>
		
		<tr>
			<td align="right">邮编</td>
			<td><input id="azip" name="azip"type="text"  style="width:80px;" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
			<td></td>
		</tr>
		<tr>
			<td>联&nbsp;系&nbsp;人</td>
			<td><input id="areceiver" name="areceiver"type="text"  style="width:170px;"/></td>
			<td></td>
		</tr>
			<tr>
			<td align="right">手机</td>
			<td><span><input id="amobile" name="amobile" type="text" disabled="disabled" value="${mobile.telephone}" style="width:170px;"/>&nbsp;<input type="button" id="selamobile" name="selamobile" value="查找" onclick ='selmobile();'/></span></td>
			<td></td>
		</tr>
		<tr>
			<td>固定电话</td>
			<td><span><input id="atel" name="atel" type="text" disabled="disabled" value="${tel.telephone}" style="width:170px;"/>&nbsp;<input type="button" id="selatel" name="selatel" value="查找" onclick ='seltel();'/></span></td>
			<td></td>
		</tr>
	
		<tr style="display:none;">
			<td>电子邮件</td>
			<td><span><input id="amail" name="amail" type="text" disabled="disabled" value="${mail.mail}" style="width:244px;"/>&nbsp;<input type="button" id="selamail" name="selamail" value="查找" onclick ='selmail();'/></span></td>
			<td></td>
		</tr>
		<tr style="display:none;">
			<td><span style="vertical-align:top ;">备注</span></td>
			<td><textarea id="aremark" name="aremark" style="width:244px;"></textarea>	</td>
			<td></td>
		</tr>																		
		<tr>
			<td></td>
			<td><input id="aisdefault" name="aisdefault" type="checkbox"/>&nbsp;设为默认</td>
			<td></td>
		</tr>	
		<tr>
			<td></td>
			<td>
				<a href="javascript:frmSubmit()"><img src="${ctx_images}/addnew.png"></a>
			</td>
			<td></td>
		</tr>																							
	</table>		
	</div>

	</form>
</div>

	
</div>
	<div id="Addresstable" style="margin-left:20px;width:810px;">
		<table id="flexAddress" style="display:none"></table>
	</div>

</div>



<style type="text/css">
#nave{background-color: #FFF;width: 850px;margin-top: 30px; margin-bottom: 30px;padding-bottom: 30px;}
#mobiletable{margin: 0px; width: 810px; z-index: 1;margin-left: 20px; height: 500px;}
#mobiletable .sdgshang{background-color: #FFF; border-bottom: 2px solid #ccc; height: 27px; padding-top: 7px;}
#mobiletable .baoshang{background-color: #FFF;  height: 50px;}
#mobiletable .sdgshang .span{ height: 26px; color: #000;margin-right: 20px;float:left; width: 75px; text-align:center;border-bottom: 3px solid #BA5A3B;}
#mobiletable #megss{ height: 30px; background-color: #EBEBEB;}
#mobiletable .shousuo{background-color: #FFF;padding-top: 18px;}
#mobiletable .shousuo span{color: #000;}
</style>