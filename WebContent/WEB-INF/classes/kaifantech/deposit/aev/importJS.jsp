<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<script>
	var rv = window.rv || {}; // request view namespace
	rv.entitytype = ${entitytype};
	rv.ENTITYTYPE_COIN = 1;
	rv.ENTITYTYPE_BILL = 2;
	rv.ENTITYTYPE_ANCIENTCOIN = 3;
	rv.ENTITYTYPE_STAMP = 4;
	rv.ENTITYTYPE_MECHANISMCOIN = 5;
	rv.requestType = "${udRequestType}";
	rv.userid = "${c_user.id}";
	var sessionType = "0"; // 旧系统中用于区分employee与user
	var userid = '${c_user.id}';
	var udRequestType = "${udRequestType}";
	var entitytype = ${entitytype};
</script>
<script src="${ctx_js}/jquery-1.8.3.js"></script>
<script src="${ctx_static}/plugins/jui/jquery-ui-1.9.2.js"></script>
<script src="${ctx_js}/jquery.mytable.js"></script>
<script src="${ctx_static}/plugins/yahoo-ui/3.18.1/yui-min.js"></script>
<!-- yahoo ui -->
<c:if test="${udRequestType=='VIEW'}">
	<script type="text/javascript"
		src="${ctx_js}/common/jquery.PrintArea.js"></script>
	<script type="text/javascript" src="${ctx_js}/print/LodopFuncs.js"></script>
</c:if>
<script src="${ctx_js}/deposit/dpUrls.js${fv}"></script>
<script type="text/javascript" src="${ctx_js}/jquery.toJSON.js${fv}"></script>

<script src="${ctx_js}/deposit/depositYUI.js${fv}"></script>

<script src="${ctx_js}/deposit/aev/requires.js${fv}"></script>
<script src="${ctx_js}/deposit/aev/selector.js${fv}"></script>
<script src="${ctx_js}/deposit/aev/ajax.js${fv}"></script>

<script src="${ctx_js}/deposit/aev/form/checkForm.js${fv}"></script>
<script src="${ctx_js}/deposit/aev/form/formEvents.js${fv}"></script>

<script src="${ctx_js}/deposit/aev/list/searchCoin.js${fv}"></script>
<script src="${ctx_js}/deposit/aev/list/list.js${fv}"></script>
<script src="${ctx_js}/deposit/aev/list/searchCoinEvents.js${fv}"></script>

<script src="${ctx_js}/deposit/aev/calcFee.js${fv}"></script>
 
<script src="${ctx_js}/tools/delaydialog.js" type="text/javascript"></script>

<script src="${ctx_js}/deposit/aev/event.js${fv}"></script>
<script src="${ctx_js}/deposit/aev/eventChoosedData.js${fv}"></script>

<c:choose>
	<c:when test="${entitytype=='2'}">
		<%-- 纸钞 --%>
		<script src="${ctx_js}/deposit/aev/blockNum.js${fv}"></script>
	</c:when>
	<c:when test="${entitytype=='4'}">
		<%-- 邮票 --%>
		<script src="${ctx_js}/jquery.shortTips.js${fv}"></script>
		<script src="${ctx_js}/deposit/aev/list/stampEvents.js${fv}"></script>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${udRequestType=='HEAR'}">
		<script type="text/javascript" src="${ctx_js}/print/LodopFuncs.js"></script>
		<script src="${ctx_static}/plugins/alert/jquery.alerts.js"
			type="text/javascript"></script>
		<script src="${ctx_js}/deposit/aev/reviewHearPrint.js"
			type="text/javascript"></script>
	</c:when>
</c:choose>


<c:if test="${udRequestType == 'HEAR'}">
	<script>
		$(document).ready(function() {
			checkSendSmsOrNot();
			$("input:radio[name*='notice']").on('click', function() {
				checkSendSmsOrNot();
			});
			function checkSendSmsOrNot() {
				if ($("input:radio[name*='notice']").val() == 1) {
					$("#checkSendSms").show();
				} else {
					$("#checkSendSms").hide();
				}
			}
		});
		function doExport(reqcode) {
			if (!$("#btn_check_print").attr("checked")) {
				alert("如果已打印核对清单，请勾选已打印");
				return false;
			}
			if (!rv.checkForm.checkBeforePriting()) {
				return false;
			}
			var preferential = Number($("#totalcost").val().split(",").join(""));
			if (preferential < 0) {
				alert("总费用不能小于0");
				return false;
			}
			var coinnum = $("#tab4 tr").length - 1;
			if (coinnum == "0") {
				jConfirm(
						'没有钱币信息，是否申请单作废?',
						'提示',
						function(r) {
							//jAlert('是否确定: ' + r, '确定内容');
							if (r == 1) {
								$.ajax({
									type : "POST",
									url : "reqInvalid.shtml",
									data : "reqcode=" + reqcode,
									dataType : "text",
									success : function(data) {
										if (data == "1") {
											alert("作废成功");
										} else {
											alert("遇到问题，请联系客服");
										}
										window.opener.refuse();
										window.close();
									},
									error : function(data) {
										alert(data);
									}
								});
							} else if (r == 3) {
								return false;
							} else if (!rv.checkForm.checkExpressSpeed()) {
								return false;
							} else {
								//检查当前申请单是否已被确认
								$("#div-billdis").css("display", "");
								$
										.ajax({
											type : "POST",
											url : "/checkConfirmOrNot.shtml",
											data : "reqcode=" + reqcode,
											dataType : "text",
											success : function(data) {
												if (data == "0") {
													if ($("#totalamount").val() <= 999999) {
														document
																.getElementById("requestForm").action = '${addCoinActionUrl}'; // todo
														document
																.getElementById(
																		"requestForm")
																.submit();
														return true;
													} else {
														alert("每张申请单目前最多支持拆分数量999999！");
														return false;
													}
												} else {
													alert("该申请单已被确认，当前更改无效！");
													return;
												}
											},
											error : function(data) {
												alert(data);
											}
										});
							}
						});
			} else {
				if (!window.confirm("是否已经打印标签？")) {
					return false;
				} else if (!rv.checkForm.checkExpressSpeed()) {
					return false;
				} else {
					//检查当前申请单是否已被确认
					$
							.ajax({
								type : "POST",
								url : "/checkConfirmOrNot.shtml",
								data : "reqcode=" + reqcode,
								dataType : "text",
								success : function(data) {
									if (data == "0") {
										if ($("#totalamount").val() <= 999999) {
											document
													.getElementById("requestForm").action = '${addCoinActionUrl}'; // todo
											document.getElementById(
													"requestForm").submit();
											return true;
										} else {
											alert("每张申请单目前最多支持拆分数量999999！");
											return false;
										}
									} else {
										alert("该申请单已被确认，当前更改无效！");
										return;
									}
								},
								error : function(data) {
									alert(data);
								}
							});
				}
			}
		}
		function checkConfirm(reqcode) {
			//检查速度是否符合
			if (!rv.checkForm.checkExpressSpeed()) {
				return false;
			}
			var preferential = Number($("#totalcost").val().split(",").join(""));
			if (preferential < 0) {
				alert("总费用不能小于0");
				return false;
			}
			if (!rv.checkForm.checkEvaluate()) {
				return false;
			}
			//检查当前申请单是否已被确认
			//0为未确认，1为已确认
			$("#div-billdis").css("display", "");
			$
					.ajax({
						type : "POST",
						url : "/checkConfirmOrNot.shtml",
						data : "reqcode=" + reqcode,
						dataType : "text",
						success : function(data) {
							if (data == "0") {
								if ($("#totalamount").val() <= 999999) {
									document.getElementById("requestForm").action = '${addDetailActionUrl}';
									$("#requestForm").submit();
									return true;
								} else {
									alert("每张申请单目前最多支持拆分数量999999！");
									return false;
								}
							} else {
								alert("该申请单已被确认，当前更改无效！");
								return false;
							}
						},
						error : function(data) {
							return false;
						}
					});
		}
		function closeWin() {
			alert("操作成功！");
			window.opener.refuse();
			window.close();
		}
		function delcfm() {
			if (!confirm("确定后此申请单不能再次修改！")) {
				window.event.returnValue = false;
			} else {
				updateSucc();
			}
		}
		function updateSucc() {
			var id = document.getElementById("requestids").value;
			$.getJSON('updateSucc.shtml&id=' + id, function(data) {
				$.each(data, function(key, value) {
					if (value == "ok") {
						alert("操作成功！");
						window.close();
					} else if (value == "error") {
						return false;
					}
				});
			});
		}
	</script>
</c:if>
<%-- delete this because it include head meta
<%@include file="/WEB-INF/jsp/includeBackToTop.jsp"
 --%>

