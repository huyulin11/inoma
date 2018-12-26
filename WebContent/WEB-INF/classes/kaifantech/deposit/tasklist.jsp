<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<%@include file="/WEB-INF/jsp/common/include-jquery-ui-theme.jsp"%>
<script type="text/javascript" src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript" src="/s/j/jquery.shortTips.js"></script>

<%@include file="/WEB-INF/jsp/common/include-custom-styles.jsp"%>
<link rel="stylesheet" href="${ctx_css}/demo.css" type="text/css" />
<link rel="stylesheet" href="${ctx_css}/task.css" type="text/css" />
<link rel="stylesheet" href="${ctx_css}/main.css" type="text/css" />

<c:set var="page" value="${pageable.page}" scope="request" />
<c:set var="length" value="${pageable.length}" scope="request" />
<c:set var="pageSize" value="${pageable.pageSize}" scope="request" />
<c:set var="totalPage" value="${pageable.totalPage}" scope="request" />
<c:set var="fn" value="pages" scope="request" />

<%
	String screenUrl		= ".json";
	String setoutRequestUrl = "setoutRequest.shtml" ;
%>

<c:set var='screenUrl' value='.json' scope='request' />
<c:set var='setoutRequestUrl' value='setoutRequest.shtml' scope='request' />

<script >
	var urls = {
		'screenUrl'		:'.json' ,
		'setoutRequestUrl'		:'setoutRequest.shtml' 
	}
</script>

<%
	String hearURL = "" ;
	String reviewURL = "";
	String unpackURL = "" ;
	String seeURL = "" ;
	String draftingURL = "" ;
	String packagURL = "" ;
	String chartURL = "" ;
%>
<script type="text/javascript"> 
	window.name = "tasklistPage";
	function openwin(url, name, width, height) {
		var left = (screen.width - width) / 2;
		var top = (screen.height - height) / 2;
		window
				.open(
						url,
						name,
						"left="
								+ left
								+ ",top="
								+ top
								+ ",height="
								+ height
								+ ", width="
								+ width
								+ ", toolbar =no, menubar=no, scrollbars=yes, resizable=yes, location=no, status=no"); // 写成一行
	}
	function pages(str1) {
		var pageSize = document.getElementById("pageSize").value;
		window.location.href = "${screenUrl}" + '&entityType='
				+ $('#entityType').val() + "&page=" + str1 + "&pageSize="
				+ pageSize;
		return false;
	}
	function refuse() {
		window.location.reload();
	}
	function selhear(parm, entityType) {
		window
				.open(
						"<%=hearURL%>&entityType=" + entityType + '&requestcode='
								+ parm,
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	function see(parm) {
		window
				.open(
						"<%=reviewURL%>" + '&myaction=RequestDetail'
								+ '&requestcode=' + parm,
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	function see1(parm) {
		window
				.open(
						"<%=seeURL%>" + '&myaction=firstAssessment' + '&requestid='
								+ parm + '&entitytype=' + $('#entityType').val(),
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	function see2(parm) {
		window.open("<%=seeURL%>" + '&myaction=secondAssessment'
								+ '&requestid=' + parm + '&entitytype='
								+ $('#entityType').val(),
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	var screenUrl = "<%=screenUrl.toString()%>";
	function setoutRequest(requestcode) {
		if (window.confirm("确定要发货吗？")) {
			$.ajax({
				type : "POST",
				url : "${setoutRequestUrl}&requestcode=" + requestcode,
				dataType : "json",
				success : function(msg) {
					if (msg != 0) {
						alert("发货完成!");
						var page = ${page};
						pages(page);
						return true;
					} else {
						alert("发货异常！");
					}
				},
				error : function(msg) {
					alert(msg);
					alert("网络连接出错！");
				}
			});
		}
	}
	function chart(parm) {
		window
				.open(
						"<%=chartURL%>" + '&myaction=coinCharting' + '&requestid='
								+ parm + '&entitytype=' + $('#entityType').val(),
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	function drafting(parm) {
		window
				.open(
						"<%=draftingURL%>" + '&myaction=coinDrawing'
								+ '&requestid=' + parm + '&entitytype='
								+ $('#entityType').val(),
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	function packaged(parm) {
		window
				.open(
						"<%=packagURL%>" + '&myaction=coinPackaged' + '&requestid='
								+ parm + '&entitytype=' + $('#entityType').val(),
						'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
	}
	function unpack(parm) {
		openwin("<%=unpackURL%>" + '&packno=' + parm, 'newwindow', 1024, 550);
	}
	function mouse_over_tab4(rowid) {
		$("#tr" + rowid).addClass("over_coin_tab");
	}
	function mouse_out_tab4(rowid) {
		$("#tr" + rowid).removeClass("over_coin_tab");
	}
	function codeCheck() {
		var code = $("#txt_billnumber").val();
		if (code == "") {
			return true;
		} else {
			var firstWord = code.substring(0, 1);
			if (firstWord == "P" || firstWord == "R") {
				// 待续....
				return true;
			} else {
				alert("包裹或申请单号格式输入有误！");
				return false;
			}
		}
	}
	$(function() {
		$("#btn_billnumber").click(
				function() {
					var billnumber = $("#txt_billnumber").val();
					if (codeCheck()) {
						window.location.href = "<%=screenUrl%>&billnumber="
								+ billnumber + "&entityType="
								+ $("#entityType").val();
					}
				});
		$("#txt_billnumber").keypress(
				function(event) {
					if (event.keyCode == 13) {
						var billnumber = $("#txt_billnumber").val();
						if (codeCheck()) {
							window.location.href = "<%=screenUrl%>&billnumber="
									+ billnumber + "&entityType="
									+ $("#entityType").val();
						}
					}
				});
	});
	function checkEvent() {
		$("#btn_billnumber").trigger("click");
	}
	$(function() {
		$("#entityType").change(
				function() {
					window.location.href = "<%=screenUrl%>&entityType="
							+ $("#entityType").val();
				});
	});

	$(function() {{
		$("#tab4 tr:gt(0)").find("td.requestcodeitem").initTips(
				{
					showType : "click",
					pointX : 10,
					pointY : 10,
					timeoutTime : 200,
					targetLabel : "#requestMsg",
					initDataFun : function(dataSrc) {
						var tmpEntitytype = $(dataSrc).parents('tr').find(
								'td.tdentitytype span').html();
						var tipInnerContent = "";
						if (tmpEntitytype == "1") {
							tipInnerContent = "金银币";
						} else if (tmpEntitytype == "2") {
							tipInnerContent = "纸钞";
						} else if (tmpEntitytype == "3") {
							tipInnerContent = "古钱";
						} else if (tmpEntitytype == "4") {
							tipInnerContent = "邮票";
						} else if (tmpEntitytype == "5") {
							tipInnerContent = "机制币";
						} else {
							tipInnerContent = "包裹";
						}
						tipInnerContent = "单据号：" + $(dataSrc).html() + "<br/>"
								+ "类型：" + tipInnerContent;
						$("#requestMsg div.requestMsgConetnt")
								.html(tipInnerContent);
						return true;
					}
				});
	});
</script>
<div id="body">
	<div id="list">
		<div id="chooseType">
			类型： <select id="entityType">
				<option value="0"
					<c:if test="${entityType==0}">selected="selected"</c:if>>包裹</option>
				<optgroup label="申请单">
					<option value="-1"
						<c:if test="${entityType==-1}">selected="selected"</c:if>>全部申请单</option>
					<c:forEach items="${entitytypelist}" var="entitytypeitem">
						<option value="${entitytypeitem.key}"
							<c:if test="${entityType==entitytypeitem.key}">selected="selected"</c:if>>${entitytypeitem.value}</option>
					</c:forEach>
				</optgroup>
			</select>
		</div>
		<div id="searchRequest">
			<input type="text" id="txt_billnumber"
				onkeypress="if(event.keyCode==13){checkEvent();}" /><input
				type="button" id="btn_billnumber" value="查&nbsp;询" />
		</div>
		<form id="coin">
			<table id="tab4">
				<tr>
					<th>编号</th>
					<th>客户确认时间</th>
					<th>状态</th>
					<th>剩余时间</th>
					<th>支付时间</th>
					<th>支付后剩余时间</th>
					<th>数量</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageable.data}" var="task">
					<tr id="tr${task.code}" onMouseOver="mouse_over_tab4(${task.code})"
						onMouseOut="mouse_out_tab4(${task.code})">
						<td class="requestcodeitem"><c:if test="${task.flag==1}">P${task.code}</c:if>
							<c:if test="${task.flag==0}">R${task.code}</c:if></td>
						<td>${task.updatetime}</td>
						<td><c:if test="${task.depositstate==7}">发货</c:if> <c:if
								test="${task.depositstate!=7}">
								<c:if test="${task.flag==1}">未拆分</c:if>
								<c:if test="${task.flag==0}">
									<c:if test="${task.status==0}">待处理</c:if>
									<c:if test="${task.status==1}">受理中</c:if>
									<c:if test="${task.status==101}">已作废</c:if>
									<c:if test="${task.status==2}">待确认</c:if>
									<c:if test="${task.status==3}">受理结束</c:if>
									<c:if test="${task.status==4}">制图中</c:if>
									<c:if test="${task.status==5}">制图结束</c:if>
									<c:if test="${task.status==6}">评级中</c:if>
									<c:if test="${task.status==7}">评级结束</c:if>
									<c:if test="${task.status==8}">打盒中</c:if>
									<c:if test="${task.status==9}">打盒结束</c:if>
									<c:if test="${task.status==10}">打盒制图中</c:if>
									<c:if test="${task.status==11}">打盒制图结束</c:if>
									<c:if test="${task.status==12}">待发货</c:if>
								</c:if>
							</c:if></td> ${task.remainingtime}
						<td>${task.payinfo}</td> ${task.payremainingtime}
						<td>${task.totalamount}</td>
						<td><c:if
								test="${task.depositstate==6 && task.sendtype==2 && task.rebackreqNum==0}">
								<input type="button" value="发货"
									onclick="setoutRequest('${task.code}')" />
							</c:if> <c:if test="${task.depositstate!=6}">
								<c:if test="${task.flag==0}">
									<c:if
										test="${task.status==0||task.status==1
								||task.status==2||task.status==101}">
										<input type="button" value="查看" onclick="see('${task.code}')" />
									</c:if>
									<c:if test="${task.status==5||task.status==6}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==4}">
												<input type="button" value="一审"
													onclick="see1('${task.requestid}')" />
											</c:if>
											<c:if test="${addr==5}">
												<input type="button" value="二审"
													onclick="see2('${task.requestid}')" />
											</c:if>
										</c:forEach>

									</c:if>
									<c:if test="${task.status==1 || task.status==2}">
										<input type="button" value="受理"
											onclick="selhear('${task.code}','${task.entityType}')" />
									</c:if>
									<c:if test="${task.status==3}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==3}">
												<input type="button" value="制图"
													onclick="drafting('${task.requestid}')" />
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${task.status==4}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==3}">
												<input type="button" value="制图"
													onclick="drafting('${task.requestid}')" />
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${task.status==7}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==7}">
												<input type="button" value="打盒"
													onclick="packaged('${task.requestid}')" />
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${task.status==8}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==7}">
												<input type="button" value="打盒"
													onclick="packaged('${task.requestid}')" />
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${task.status==9}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==8}">
												<input type="button" value="打盒制图"
													onclick="chart('${task.requestid}')" />
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${task.status==10}">
										<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
											end="${fn:length(fn:split(role,','))}" varStatus="stat">
											<c:if test="${addr==8}">
												<input type="button" value="打盒制图"
													onclick="chart('${task.requestid}')" />
											</c:if>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${task.flag==1}">
									<c:forEach items="${fn:split(role,',')}" var="addr" begin="0"
										end="${fn:length(fn:split(role,','))}" varStatus="stat">
										<c:if test="${fn:contains(addr, 2)}">
											<input type="button" value="开始处理"
												onclick="unpack('${task.code}')" />
										</c:if>
									</c:forEach>
								</c:if>
							</c:if></td>
						<td class="hiddenThis tdentitytype"><span>${task.entityType}</span></td>
					</tr>
				</c:forEach>
				<c:if test="${empty pageable.data}">
					<tr>
						<td colspan="8">当前没有可处理的任务</td>
					</tr>
				</c:if>
			</table>
		</form>
		<jsp:include page="/WEB-INF/jsp/pagination.jsp" flush="false" />
	</div>
</div>
<div id="requestMsg" class="requestMsgHide">
	<div class="requestMsgTitle">申请单卡片</div>
	<br />
	<div class="requestMsgConetnt"></div>
</div>