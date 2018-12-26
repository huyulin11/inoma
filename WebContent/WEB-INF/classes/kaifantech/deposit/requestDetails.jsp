<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("udRequestType", "VIEW");//区分是新增还是修改
	pageContext.setAttribute("title", "申请单查看");
%>
<%@include file="aev/import.jsp"%>
<body>
<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
	var printInReqDetailUrl ;
	var confirmRowRequestURL ;

	function closeWin(){
		if($("#refresh").val()=='yes'){
			window.opener.location.href = window.opener.location.href;
		}
		window.close();
	}
	function doExport() {
		document.getElementById("formdetail").action = '${addCoinActionUrl}';
		document.getElementById("formdetail").submit();
	}
	$(function(){
		$("#tips").mouseenter(function(){
			$("#tipsDiv").show();
		});
		
	});
	function tipsclose(){
		$("#tipsDiv").hide();
	}
function queren(str1,str2) {
	if(!window.confirm("确认信息无误？")){
		return false;
	}
	var updatetime = $("#updateTimeStr").val();
	$.ajax({
		type: "POST",
		url: confirmRowRequestURL,
		data: "innerno="+str1+"&depositstate="+str2+"&updatetime="+updatetime,
		dataType:"text",
		success: function(msg){
			if(msg!="0" && msg!="-1"){
				alert("成功确认"+msg+"条记录");
				window.opener.location.href = window.opener.location.href;
				window.close();
				
			}else if(msg=="-1"){
				alert("当前申请单已被修改，请刷新后查看新单子！");
			}else{
				alert("申请单已被确认！");
			}
		},
		error: function(msg){
			alert(msg);
		}
	}); 
}
function preview(oper){
	if (oper < 10)
	{
	var bdhtml=window.document.body.innerHTML;//获取当前页的html代码
	var sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
	var eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
	var prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html
	prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
    	window.print();
    	window.document.body.innerHTML=bdhtml;
}else {
	window.print();
	}
}
function printReq(rows){
	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 	    	
	LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_内嵌显示演示11");
	LODOP.SET_PRINT_PAGESIZE("1","210mm","297mm","申请单打印纸"); 
	if(rows<=12){
		LODOP.ADD_PRINT_HTM(0,-20,"210mm","297mm",document.getElementById("printReqDiv").innerHTML);
		LODOP.PREVIEW();
	}else{
		LODOP.ADD_PRINT_HTM(0,-20,"210mm","297mm",document.getElementById("printReqIIDiv").innerHTML);
		LODOP.PREVIEW();
	}
}
//对账单打印
function printStatement(param){
	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));
	LODOP.PRINT_INIT("对账单打印");
	LODOP.SET_PRINT_PAGESIZE("1","210mm","297mm","申请单打印纸"); 
	$.post(printInReqDetailUrl+ '?reqCode='+param,function(data){
		LODOP.ADD_PRINT_HTM(0,-20,"210mm","297mm",data); 
		LODOP.PREVIEW();
	});
}
function pStatement(param){
	$.post(printInReqDetailUrl+ '?reqCode='+param,function(data){
		$("#statementView").html(data);
		var winHeight = $(window).height()-20;
		$("html").css("overflow","hidden");
		$("#statementView").dialog({
			title : '对账单查看',
			modal : true,
			width : 880,
			height : winHeight,
			open : function() {
				//恢复窗体滚动
				$("html").css("overflow","scroll");
			},
			buttons : [ {
				text : '确定',
				click : function() {
					//恢复窗体滚动
					$("html").css("overflow","scroll");
					$(this).dialog('close');
				}
			}]
		});
		});
}
function closeAndFresh(param){
	window.opener.location.href=window.opener.location.href;
	window.close();
}
</script>
<input type="hidden" id="refresh" value="${refresh}" />

<div id="body" style="margin: -20px auto; border: solid #fff 1px;" >
	<div class="topinfo">
		<span style="float: left;">订单编号：${deposit.depositMainBean.innerno}</span> <input
			id="updateTimeStr" type="hidden"
			value="<fmt:formatDate value='${deposit.depositMainBean.updatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
			autocomplete="off" />

		<c:if test="${deposit.depositMainBean.depositstate==3}">
			<input type="button" value="确认"
				onclick="queren(${deposit.depositMainBean.innerno},${deposit.depositMainBean.depositstate}); return false;" />
		</c:if>
		<%
			if ("1".equals("1")) { // sessionType 
		%>
		<input type="button" value="打印申请单" style="text-align: center;"
			onclick="printReq(${detail.size()})" />
		<%
			}
		%>
		<c:if test="${deposit.depositMainBean.depositstate=='7'}">
			<input type="button" id="statementViewBtn" value="查看对账单"
				style="text-align: center;"
				onclick="pStatement('${deposit.depositMainBean.innerno}')" />
		</c:if>

		<input type="button" value="关闭" onclick="closeWin();" />
		<c:if test="${deposit.depositMainBean.depositstate==3}">
			<a id="tips" href="#" style="height: 16px; vertical-align: middle;"><img
				src="${ctx_images}/tipinfo.png" alt="提示"
				style="vertical-align: middle;" /></a>
		</c:if>
		<div id="tipsDiv"
			style="width: 130px; padding: 0 5px 5px 5px; position: absolute; border: 1px solid #ddd; border-radius: 3px; background: #f5f5f5; left: 50%; margin-left: 515px; text-align: left; display: none;">
			<div
				style="float: right; display: inline-block; width: 100%; text-align: right;">
				<a class="tipsclose" href="javascript:tipsclose()">×</a>
			</div>
			如果对合同有异议，请拨打热线400-821-0715说明详细情况。
		</div>
	</div>
	<div class="schedule">
		<div
			<c:choose>
			<c:when test="${deposit.depositMainBean.depositstate=='0'}">class="reqstatus_2"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='1'}">class="reqstatus_3"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='31'}">class="reqInvalid_slip"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='2'}">class="reqstatus_4"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='3'}">class="reqstatus_5"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='4'}">class="reqstatus_6"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='5'}">
				<c:if test="${deposit.depositMainBean.paystate=='0'}">class="reqstatus_6"</c:if>
				<c:if test="${deposit.depositMainBean.paystate=='1'}">class="reqstatus_7"</c:if>
			</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='6'}">
				<c:if test="${deposit.depositMainBean.paystate=='0'}">class="reqstatus_4"</c:if>
				<c:if test="${deposit.depositMainBean.paystate=='1'}">
					<c:if test="${deposit.depositMainBean.sendtype=='1'||deposit.depositMainBean.sendtype=='3'}">
						class="reqstatus_9"
					</c:if>
					<c:if test="${deposit.depositMainBean.sendtype=='2'}">
						class="reqstatus_8"
					</c:if>
				</c:if>
			</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='7'}">
				<c:if test="${deposit.depositMainBean.paystate=='0'}">class="reqstatus_4"</c:if>
				<c:if test="${deposit.depositMainBean.paystate=='1'}">
					<c:if test="${deposit.depositMainBean.sendtype=='1'||deposit.depositMainBean.sendtype=='3'}">
						class="reqstatus_10"
					</c:if>
					<c:if test="${deposit.depositMainBean.sendtype=='2'}">
						class="reqstatus_11"
					</c:if>
				</c:if>	
			</c:when>
		</c:choose>></div>
	</div>
	<div class="outline">
		<div
			style="width: 100%; padding: 10px 0; margin-bottom: 30px; background: #DDDDDD; text-align: center; line-height: auto important!;">订单详情</div>
		<div class="mainArea">
			<div id="basic">
				<span class="tabTitle">基本信息</span>
				<hr>
				<table id="tab">
					<tr>
						<td width="60px">申&nbsp;请&nbsp;人</td>
						<td width="100px">${deposit.depositMainBean.customer}</td>
						<td width="60px">会员编号</td>
						<td width="100px">${deposit.depositMainBean.usercode}</td>
						<td width="60px">手&nbsp;&nbsp;&nbsp;&nbsp;机</td>
						<td width="100px">${deposit.depositMainBean.mobile}</td>
						<td width="60px">电子邮件</td>
						<td width="100px">${deposit.depositMainBean.mail}</td>
					</tr>
					<tr>
						<td>评级类型</td>
						<c:if test="${deposit.depositMainBean.serviceid==1}">
							<td>新评</td>
						</c:if>
						<c:if test="${deposit.depositMainBean.serviceid==2}">
							<td>重评</td>
						</c:if>
						<c:if test="${deposit.depositMainBean.serviceid==5}">
							<td>真品鉴定</td>
						</c:if>
						<td>速&nbsp;&nbsp;&nbsp;&nbsp;度</td>
						<td colspan="3"><c:choose>
								<c:when test="${deposit.depositMainBean.speed==1}">2</c:when>
								<c:when test="${deposit.depositMainBean.speed==2}">5</c:when>
								<c:when test="${deposit.depositMainBean.speed==3}">8</c:when>
								<c:when test="${deposit.depositMainBean.speed==4}">15</c:when>
							</c:choose> （工作日）</td>
						<td><input type="hidden" name="userid"
							value="${deposit.depositMainBean.userid}" class="input" readonly
							autocomplete="off" /> <input type="hidden" name="id"
							id="requestids" value="${deposit.depositMainBean.id}" autocomplete="off" /> <input
							type="hidden" name="innerno" value="${deposit.depositMainBean.innerno}"
							autocomplete="off" /></td>
					</tr>
				</table>
			</div>
			<div id="ser">
				<div class="ser_left">
					<div style="width: 100%; height: 90px;">
						<span class="tabTitle">送评方式</span>
						<hr>
						<br>
						<c:if test="${deposit.depositMainBean.applytype=='1'}">
							<span class="ml10 mt20">上门</span>
						</c:if>
						<c:if test="${deposit.depositMainBean.applytype=='2'}">
							<span class="ml10 mt20">物流&nbsp;&nbsp;物流单号&nbsp;&nbsp;${deposit.depositMainBean.packagecode}</span>
						</c:if>
					</div>
					<div style="width: 100%;">
						<span class="tabTitle">取件方式</span>
						<hr>
						<br>
						<div style="width: 100%; padding: 0 10px;">
							<span> <c:choose>
									<c:when test="${deposit.depositMainBean.sendtype==2}">上门自取（须携带有效证件）<br />
										<c:if test="${deposit.depositMainBean.usercardtype=='1'}">
										身份证号码：
									</c:if>
										<c:if test="${deposit.depositMainBean.usercardtype=='2'}">
										军官证号码：
									</c:if>
										<c:if test="${deposit.depositMainBean.usercardtype=='3'}">
										护照号码：
									</c:if>
									${deposit.depositMainBean.usercardcode}
									</c:when>
									<c:otherwise>
										<c:if test="${deposit.depositMainBean.sendtype==1}">快递回邮（不保价）</c:if>
										<c:if test="${deposit.depositMainBean.sendtype==3}">快递回邮（全额保价）</c:if>
										<br>
										<br>
										<span> 收件地址&nbsp;&nbsp; ${country1} - ${province} -
											${city} - ${district} - ${deposit.depositMainBean.address} </span>
										<br>
										<br>
										<span style="font-size: 13px;">
											＊回邮仅限中国大陆地区；快递回邮包装运输费首重1kg，江浙沪地区15元，其他地区25元；续重每kg
											10元，不足1kg，按1kg计算。<br> ＊回邮保价费为合计估价的0.5%，不足1元，按1元计，1元起收。
										</span>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>

				</div>
				<div class="standardShow">
					<span class="tabTitle">评级收费</span>
					<hr>
					<div class="feeDiv">
						<c:if test="${deposit.depositMainBean.entitytype=='1' }">
							<img src="${ctx_images}/standard2.png">
						</c:if>
						<c:if test="${deposit.depositMainBean.entitytype=='2' }">
							<img src="${ctx_images}/standardBill.png">
						</c:if>
						<c:if test="${deposit.depositMainBean.entitytype=='3' ||deposit.depositMainBean.entitytype=='5'}">
							<img src="${ctx_images}/standardancientcoin2.png">
						</c:if>
						<c:if test="${deposit.depositMainBean.entitytype=='4' }">
							<img src="${ctx_images}/standardStamp.jpg">
						</c:if>
					</div>
				</div>
			</div>

			<div id="list">
				<span class="tabTitle">送评清单</span>
				<c:if test="${entitytype=='4'}">
					<span id="allDetail" class="standard"><a>全部明细</a></span>
				</c:if>
				<hr>
				<c:if test="${deposit.depositMainBean.entitytype=='1' }">
					<%@include file="aev/detail/coinList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='2' }">
					<%@include file="aev/detail/billList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='3' }">
					<%@include file="aev/detail/ancientCoinList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='4' }">
					<%@include file="aev/detail/stampList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='5' }">
					<%@include file="aev/detail/mechanismCoinList.jsp"%>
				</c:if>
				<br> <span class="tabSecondTitle"
					style="<c:if test="${deposit.depositMainBean.addedcoinremark==''}">display:none;</c:if>">送评清单补充信息</span>
				<div class="container"
					style="padding:5px 0 0 0;word-wrap:break-word;<c:if test="${deposit.depositMainBean.addedcoinremark==''}">display:none;</c:if>">
					<span class="pl10"> <c:if
							test="${deposit.depositMainBean.addedcoinremark!=''}">${deposit.depositMainBean.addedcoinremark}</c:if>
					</span> <input id="coinInfo" type="hidden" name="coinInfo" value=""
						autocomplete="off">
				</div>
				<span class="tabTitle">合&nbsp;&nbsp;&nbsp;&nbsp;计</span>
				<hr>
				<table id="detail_calculateTab">
					<tr>
						<td><span class="calTag">A</span>送评数<span class="ml10">&nbsp;${deposit.depositMainBean.totalamount}枚</span></td>
						<td><span class="calTag">B</span>总估价<span class="ml10">&nbsp;${deposit.depositMainBean.totalevaluate}元</span></td>
						<td><span class="calTag">C</span>总评级费<span class="ml10">&nbsp;${deposit.depositMainBean.totalreqcost}元</span></td>
						<td><span class="calTag">D</span>总重量<span class="ml10">&nbsp;${deposit.depositMainBean.totalweight}g</span></td>
					</tr>
					<tr>
						<td><span class="calTag">E</span>包装运输<span class="ml10">&nbsp;${deposit.depositMainBean.totaltransportation}元</span></td>
						<td><span class="calTag">F</span>保价费<span class="ml10">&nbsp;${deposit.depositMainBean.totalinsurance}元</span></td>
						<td><span class="calTag">G</span>优惠<span class="ml10">&nbsp;${deposit.depositMainBean.totalpreferential}元</span></td>
						<td><span class="calTag">H</span>其他费用<span class="ml10"
							title="补费备注：${deposit.depositMainBean.costremark }"> <c:choose>
									<c:when
										test="${deposit.depositMainBean.othercost!='' && deposit.depositMainBean.othercost!=null}">
										${deposit.depositMainBean.othercost}
									</c:when>
									<c:otherwise>
										0.00
									</c:otherwise>
								</c:choose>元
						</span></td>
					</tr>
					<tr>
						<td colspan="2"><b>总费用</b><span class="ml10">&nbsp;${deposit.depositMainBean.totalcost}元</span></td>
					</tr>
				</table>
			</div>
			<!--优惠券 -->
			<jsp:include page="aev/form/form_coupon.jsp" />
			<div class="container">
				<span class="tabTitle">付款方式</span>
				<hr>
				<br> <span class="pl10"> <c:if
						test="${deposit.depositMainBean.payment==1}">现金付款</c:if> <c:if
						test="${deposit.depositMainBean.payment==2}">余额支付</c:if> <c:if
						test="${deposit.depositMainBean.payment==3}">邮政汇款</c:if> <c:if
						test="${deposit.depositMainBean.payment==4}">银行转账</c:if> <c:if
						test="${deposit.depositMainBean.payment==5}">网上支付</c:if>
				</span>
			</div>
			<div class="container">
				<span class="tabTitle">完成通知</span>
				<hr>
				<br> <span class="pl10"> <c:if
						test="${deposit.depositMainBean.notice==1}">短信</c:if> <c:if
						test="${deposit.depositMainBean.notice==2}">电话</c:if> <c:if
						test="${deposit.depositMainBean.notice==3}">电子邮件</c:if> <c:if
						test="${deposit.depositMainBean.notice==4}">不通知</c:if>
				</span>
			</div>
			<div class="container">
				<span class="tabTitle">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
				<hr>
				<br> <span class="pl10"> <c:if
						test="${deposit.depositMainBean.remark==''}">无</c:if> <c:if
						test="${deposit.depositMainBean.remark!=''}">${deposit.depositMainBean.remark}</c:if>
				</span> <input id="coinInfo" type="hidden" name="coinInfo" value=""
					autocomplete="off">
			</div>
		</div>
	</div>
	<div id="statementView"
		style="width: 700px; height: 650px; margin-left: 50px; display: none;"></div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("udRequestType", "VIEW");//区分是新增还是修改
	pageContext.setAttribute("title", "申请单查看");
%>
<%@include file="aev/import.jsp"%>
<body>
<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<script type="text/javascript">
	var printInReqDetailUrl ;
	var confirmRowRequestURL ;

	function closeWin(){
		if($("#refresh").val()=='yes'){
			window.opener.location.href = window.opener.location.href;
		}
		window.close();
	}
	function doExport() {
		document.getElementById("formdetail").action = '${addCoinActionUrl}';
		document.getElementById("formdetail").submit();
	}
	$(function(){
		$("#tips").mouseenter(function(){
			$("#tipsDiv").show();
		});
		
	});
	function tipsclose(){
		$("#tipsDiv").hide();
	}
function queren(str1,str2) {
	if(!window.confirm("确认信息无误？")){
		return false;
	}
	var updatetime = $("#updateTimeStr").val();
	$.ajax({
		type: "POST",
		url: confirmRowRequestURL,
		data: "innerno="+str1+"&depositstate="+str2+"&updatetime="+updatetime,
		dataType:"text",
		success: function(msg){
			if(msg!="0" && msg!="-1"){
				alert("成功确认"+msg+"条记录");
				window.opener.location.href = window.opener.location.href;
				window.close();
				
			}else if(msg=="-1"){
				alert("当前申请单已被修改，请刷新后查看新单子！");
			}else{
				alert("申请单已被确认！");
			}
		},
		error: function(msg){
			alert(msg);
		}
	}); 
}
function preview(oper){
	if (oper < 10)
	{
	var bdhtml=window.document.body.innerHTML;//获取当前页的html代码
	var sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
	var eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
	var prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html
	prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
		window.document.body.innerHTML=prnhtml;
    	window.print();
    	window.document.body.innerHTML=bdhtml;
}else {
	window.print();
	}
}
function printReq(rows){
	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 	    	
	LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_内嵌显示演示11");
	LODOP.SET_PRINT_PAGESIZE("1","210mm","297mm","申请单打印纸"); 
	if(rows<=12){
		LODOP.ADD_PRINT_HTM(0,-20,"210mm","297mm",document.getElementById("printReqDiv").innerHTML);
		LODOP.PREVIEW();
	}else{
		LODOP.ADD_PRINT_HTM(0,-20,"210mm","297mm",document.getElementById("printReqIIDiv").innerHTML);
		LODOP.PREVIEW();
	}
}
//对账单打印
function printStatement(param){
	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));
	LODOP.PRINT_INIT("对账单打印");
	LODOP.SET_PRINT_PAGESIZE("1","210mm","297mm","申请单打印纸"); 
	$.post(printInReqDetailUrl+ '?reqCode='+param,function(data){
		LODOP.ADD_PRINT_HTM(0,-20,"210mm","297mm",data); 
		LODOP.PREVIEW();
	});
}
function pStatement(param){
	$.post(printInReqDetailUrl+ '?reqCode='+param,function(data){
		$("#statementView").html(data);
		var winHeight = $(window).height()-20;
		$("html").css("overflow","hidden");
		$("#statementView").dialog({
			title : '对账单查看',
			modal : true,
			width : 880,
			height : winHeight,
			open : function() {
				//恢复窗体滚动
				$("html").css("overflow","scroll");
			},
			buttons : [ {
				text : '确定',
				click : function() {
					//恢复窗体滚动
					$("html").css("overflow","scroll");
					$(this).dialog('close');
				}
			}]
		});
		});
}
function closeAndFresh(param){
	window.opener.location.href=window.opener.location.href;
	window.close();
}
</script>
<input type="hidden" id="refresh" value="${refresh}" />

<div id="body" style="margin: -20px auto; border: solid #fff 1px;" >
	<div class="topinfo">
		<span style="float: left;">订单编号：${deposit.depositMainBean.innerno}</span> <input
			id="updateTimeStr" type="hidden"
			value="<fmt:formatDate value='${deposit.depositMainBean.updatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
			autocomplete="off" />

		<c:if test="${deposit.depositMainBean.depositstate==3}">
			<input type="button" value="确认"
				onclick="queren(${deposit.depositMainBean.innerno},${deposit.depositMainBean.depositstate}); return false;" />
		</c:if>
		<%
			if ("1".equals("1")) { // sessionType 
		%>
		<input type="button" value="打印申请单" style="text-align: center;"
			onclick="printReq(${detail.size()})" />
		<%
			}
		%>
		<c:if test="${deposit.depositMainBean.depositstate=='7'}">
			<input type="button" id="statementViewBtn" value="查看对账单"
				style="text-align: center;"
				onclick="pStatement('${deposit.depositMainBean.innerno}')" />
		</c:if>

		<input type="button" value="关闭" onclick="closeWin();" />
		<c:if test="${deposit.depositMainBean.depositstate==3}">
			<a id="tips" href="#" style="height: 16px; vertical-align: middle;"><img
				src="${ctx_images}/tipinfo.png" alt="提示"
				style="vertical-align: middle;" /></a>
		</c:if>
		<div id="tipsDiv"
			style="width: 130px; padding: 0 5px 5px 5px; position: absolute; border: 1px solid #ddd; border-radius: 3px; background: #f5f5f5; left: 50%; margin-left: 515px; text-align: left; display: none;">
			<div
				style="float: right; display: inline-block; width: 100%; text-align: right;">
				<a class="tipsclose" href="javascript:tipsclose()">×</a>
			</div>
			如果对合同有异议，请拨打热线400-821-0715说明详细情况。
		</div>
	</div>
	<div class="schedule">
		<div
			<c:choose>
			<c:when test="${deposit.depositMainBean.depositstate=='0'}">class="reqstatus_2"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='1'}">class="reqstatus_3"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='31'}">class="reqInvalid_slip"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='2'}">class="reqstatus_4"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='3'}">class="reqstatus_5"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='4'}">class="reqstatus_6"</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='5'}">
				<c:if test="${deposit.depositMainBean.paystate=='0'}">class="reqstatus_6"</c:if>
				<c:if test="${deposit.depositMainBean.paystate=='1'}">class="reqstatus_7"</c:if>
			</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='6'}">
				<c:if test="${deposit.depositMainBean.paystate=='0'}">class="reqstatus_4"</c:if>
				<c:if test="${deposit.depositMainBean.paystate=='1'}">
					<c:if test="${deposit.depositMainBean.sendtype=='1'||deposit.depositMainBean.sendtype=='3'}">
						class="reqstatus_9"
					</c:if>
					<c:if test="${deposit.depositMainBean.sendtype=='2'}">
						class="reqstatus_8"
					</c:if>
				</c:if>
			</c:when>
			<c:when test="${deposit.depositMainBean.depositstate=='7'}">
				<c:if test="${deposit.depositMainBean.paystate=='0'}">class="reqstatus_4"</c:if>
				<c:if test="${deposit.depositMainBean.paystate=='1'}">
					<c:if test="${deposit.depositMainBean.sendtype=='1'||deposit.depositMainBean.sendtype=='3'}">
						class="reqstatus_10"
					</c:if>
					<c:if test="${deposit.depositMainBean.sendtype=='2'}">
						class="reqstatus_11"
					</c:if>
				</c:if>	
			</c:when>
		</c:choose>></div>
	</div>
	<div class="outline">
		<div
			style="width: 100%; padding: 10px 0; margin-bottom: 30px; background: #DDDDDD; text-align: center; line-height: auto important!;">订单详情</div>
		<div class="mainArea">
			<div id="basic">
				<span class="tabTitle">基本信息</span>
				<hr>
				<table id="tab">
					<tr>
						<td width="60px">申&nbsp;请&nbsp;人</td>
						<td width="100px">${deposit.depositMainBean.customer}</td>
						<td width="60px">会员编号</td>
						<td width="100px">${deposit.depositMainBean.usercode}</td>
						<td width="60px">手&nbsp;&nbsp;&nbsp;&nbsp;机</td>
						<td width="100px">${deposit.depositMainBean.mobile}</td>
						<td width="60px">电子邮件</td>
						<td width="100px">${deposit.depositMainBean.mail}</td>
					</tr>
					<tr>
						<td>评级类型</td>
						<c:if test="${deposit.depositMainBean.serviceid==1}">
							<td>新评</td>
						</c:if>
						<c:if test="${deposit.depositMainBean.serviceid==2}">
							<td>重评</td>
						</c:if>
						<c:if test="${deposit.depositMainBean.serviceid==5}">
							<td>真品鉴定</td>
						</c:if>
						<td>速&nbsp;&nbsp;&nbsp;&nbsp;度</td>
						<td colspan="3"><c:choose>
								<c:when test="${deposit.depositMainBean.speed==1}">2</c:when>
								<c:when test="${deposit.depositMainBean.speed==2}">5</c:when>
								<c:when test="${deposit.depositMainBean.speed==3}">8</c:when>
								<c:when test="${deposit.depositMainBean.speed==4}">15</c:when>
							</c:choose> （工作日）</td>
						<td><input type="hidden" name="userid"
							value="${deposit.depositMainBean.userid}" class="input" readonly
							autocomplete="off" /> <input type="hidden" name="id"
							id="requestids" value="${deposit.depositMainBean.id}" autocomplete="off" /> <input
							type="hidden" name="innerno" value="${deposit.depositMainBean.innerno}"
							autocomplete="off" /></td>
					</tr>
				</table>
			</div>
			<div id="ser">
				<div class="ser_left">
					<div style="width: 100%; height: 90px;">
						<span class="tabTitle">送评方式</span>
						<hr>
						<br>
						<c:if test="${deposit.depositMainBean.applytype=='1'}">
							<span class="ml10 mt20">上门</span>
						</c:if>
						<c:if test="${deposit.depositMainBean.applytype=='2'}">
							<span class="ml10 mt20">物流&nbsp;&nbsp;物流单号&nbsp;&nbsp;${deposit.depositMainBean.packagecode}</span>
						</c:if>
					</div>
					<div style="width: 100%;">
						<span class="tabTitle">取件方式</span>
						<hr>
						<br>
						<div style="width: 100%; padding: 0 10px;">
							<span> <c:choose>
									<c:when test="${deposit.depositMainBean.sendtype==2}">上门自取（须携带有效证件）<br />
										<c:if test="${deposit.depositMainBean.usercardtype=='1'}">
										身份证号码：
									</c:if>
										<c:if test="${deposit.depositMainBean.usercardtype=='2'}">
										军官证号码：
									</c:if>
										<c:if test="${deposit.depositMainBean.usercardtype=='3'}">
										护照号码：
									</c:if>
									${deposit.depositMainBean.usercardcode}
									</c:when>
									<c:otherwise>
										<c:if test="${deposit.depositMainBean.sendtype==1}">快递回邮（不保价）</c:if>
										<c:if test="${deposit.depositMainBean.sendtype==3}">快递回邮（全额保价）</c:if>
										<br>
										<br>
										<span> 收件地址&nbsp;&nbsp; ${country1} - ${province} -
											${city} - ${district} - ${deposit.depositMainBean.address} </span>
										<br>
										<br>
										<span style="font-size: 13px;">
											＊回邮仅限中国大陆地区；快递回邮包装运输费首重1kg，江浙沪地区15元，其他地区25元；续重每kg
											10元，不足1kg，按1kg计算。<br> ＊回邮保价费为合计估价的0.5%，不足1元，按1元计，1元起收。
										</span>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>

				</div>
				<div class="standardShow">
					<span class="tabTitle">评级收费</span>
					<hr>
					<div class="feeDiv">
						<c:if test="${deposit.depositMainBean.entitytype=='1' }">
							<img src="${ctx_images}/standard2.png">
						</c:if>
						<c:if test="${deposit.depositMainBean.entitytype=='2' }">
							<img src="${ctx_images}/standardBill.png">
						</c:if>
						<c:if test="${deposit.depositMainBean.entitytype=='3' ||deposit.depositMainBean.entitytype=='5'}">
							<img src="${ctx_images}/standardancientcoin2.png">
						</c:if>
						<c:if test="${deposit.depositMainBean.entitytype=='4' }">
							<img src="${ctx_images}/standardStamp.jpg">
						</c:if>
					</div>
				</div>
			</div>

			<div id="list">
				<span class="tabTitle">送评清单</span>
				<c:if test="${entitytype=='4'}">
					<span id="allDetail" class="standard"><a>全部明细</a></span>
				</c:if>
				<hr>
				<c:if test="${deposit.depositMainBean.entitytype=='1' }">
					<%@include file="aev/detail/coinList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='2' }">
					<%@include file="aev/detail/billList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='3' }">
					<%@include file="aev/detail/ancientCoinList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='4' }">
					<%@include file="aev/detail/stampList.jsp"%>
				</c:if>
				<c:if test="${deposit.depositMainBean.entitytype=='5' }">
					<%@include file="aev/detail/mechanismCoinList.jsp"%>
				</c:if>
				<br> <span class="tabSecondTitle"
					style="<c:if test="${deposit.depositMainBean.addedcoinremark==''}">display:none;</c:if>">送评清单补充信息</span>
				<div class="container"
					style="padding:5px 0 0 0;word-wrap:break-word;<c:if test="${deposit.depositMainBean.addedcoinremark==''}">display:none;</c:if>">
					<span class="pl10"> <c:if
							test="${deposit.depositMainBean.addedcoinremark!=''}">${deposit.depositMainBean.addedcoinremark}</c:if>
					</span> <input id="coinInfo" type="hidden" name="coinInfo" value=""
						autocomplete="off">
				</div>
				<span class="tabTitle">合&nbsp;&nbsp;&nbsp;&nbsp;计</span>
				<hr>
				<table id="detail_calculateTab">
					<tr>
						<td><span class="calTag">A</span>送评数<span class="ml10">&nbsp;${deposit.depositMainBean.totalamount}枚</span></td>
						<td><span class="calTag">B</span>总估价<span class="ml10">&nbsp;${deposit.depositMainBean.totalevaluate}元</span></td>
						<td><span class="calTag">C</span>总评级费<span class="ml10">&nbsp;${deposit.depositMainBean.totalreqcost}元</span></td>
						<td><span class="calTag">D</span>总重量<span class="ml10">&nbsp;${deposit.depositMainBean.totalweight}g</span></td>
					</tr>
					<tr>
						<td><span class="calTag">E</span>包装运输<span class="ml10">&nbsp;${deposit.depositMainBean.totaltransportation}元</span></td>
						<td><span class="calTag">F</span>保价费<span class="ml10">&nbsp;${deposit.depositMainBean.totalinsurance}元</span></td>
						<td><span class="calTag">G</span>优惠<span class="ml10">&nbsp;${deposit.depositMainBean.totalpreferential}元</span></td>
						<td><span class="calTag">H</span>其他费用<span class="ml10"
							title="补费备注：${deposit.depositMainBean.costremark }"> <c:choose>
									<c:when
										test="${deposit.depositMainBean.othercost!='' && deposit.depositMainBean.othercost!=null}">
										${deposit.depositMainBean.othercost}
									</c:when>
									<c:otherwise>
										0.00
									</c:otherwise>
								</c:choose>元
						</span></td>
					</tr>
					<tr>
						<td colspan="2"><b>总费用</b><span class="ml10">&nbsp;${deposit.depositMainBean.totalcost}元</span></td>
					</tr>
				</table>
			</div>
			<!--优惠券 -->
			<jsp:include page="aev/form/form_coupon.jsp" />
			<div class="container">
				<span class="tabTitle">付款方式</span>
				<hr>
				<br> <span class="pl10"> <c:if
						test="${deposit.depositMainBean.payment==1}">现金付款</c:if> <c:if
						test="${deposit.depositMainBean.payment==2}">余额支付</c:if> <c:if
						test="${deposit.depositMainBean.payment==3}">邮政汇款</c:if> <c:if
						test="${deposit.depositMainBean.payment==4}">银行转账</c:if> <c:if
						test="${deposit.depositMainBean.payment==5}">网上支付</c:if>
				</span>
			</div>
			<div class="container">
				<span class="tabTitle">完成通知</span>
				<hr>
				<br> <span class="pl10"> <c:if
						test="${deposit.depositMainBean.notice==1}">短信</c:if> <c:if
						test="${deposit.depositMainBean.notice==2}">电话</c:if> <c:if
						test="${deposit.depositMainBean.notice==3}">电子邮件</c:if> <c:if
						test="${deposit.depositMainBean.notice==4}">不通知</c:if>
				</span>
			</div>
			<div class="container">
				<span class="tabTitle">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
				<hr>
				<br> <span class="pl10"> <c:if
						test="${deposit.depositMainBean.remark==''}">无</c:if> <c:if
						test="${deposit.depositMainBean.remark!=''}">${deposit.depositMainBean.remark}</c:if>
				</span> <input id="coinInfo" type="hidden" name="coinInfo" value=""
					autocomplete="off">
			</div>
		</div>
	</div>
	<div id="statementView"
		style="width: 700px; height: 650px; margin-left: 50px; display: none;"></div>
</div>
</body>
</html>
