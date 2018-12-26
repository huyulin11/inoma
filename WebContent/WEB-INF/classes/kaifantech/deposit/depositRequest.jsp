<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<c:choose>
	<c:when test="${udRequestType == 'ADD'}">
		<c:set var="requestFormActionUrl"
			value="${ctx}/dpDo/doDepositAdd.shtml" />
		<c:set var="title" value="送评申请" />
	</c:when>
	<c:when test="${udRequestType == 'EDIT'}">
		<c:set var="requestFormActionUrl"
			value="${ctx}/dpDo/doDepositEdit.shtml" />
		<c:set var="title" value="申请单编辑-${deposit.depositMainBean.innerno}" />
	</c:when>
	<c:when test="${udRequestType == 'HEAR'}">
		<c:set var="requestFormActionUrl"
			value="${ctx}/dpDo/doDepositHear.shtml" />
		<c:set var="title" value="申请单受理-${deposit.depositMainBean.innerno}" />
	</c:when>
	<c:when test="${udRequestType == 'VIEW'}">
		<c:set var="requestFormActionUrl"
			value="" />
		<c:set var="title" value="申请单查看-${deposit.depositMainBean.innerno}" />
	</c:when>
</c:choose>
<%@ include file="aev/import.jsp"%>

<body>
	<div id="body">
		<c:choose>
			<c:when
				test="${udRequestType != 'ADD' || entitytype=='1'||entitytype=='2'
				||entitytype=='3'||entitytype=='4'||entitytype=='5'}">
				<form:form id="requestForm" action="${requestFormActionUrl}"
					method="post">
					<!--指引信息 -->
					<jsp:include page="aev/entityChoose.jsp" />
					<!--隐藏的数据容器 -->
					<input type="hidden" name="depositMainBean.depositstate"
						id="depositstate" value="${deposit.depositMainBean.depositstate}">
					<input type="hidden" name="depositMainBean.id"
						id="depositid" value="${deposit.depositMainBean.id}">
					<!--表单部分汇总 -->
					<jsp:include page="aev/form/form.jsp" />
					<c:if test="${udRequestType != 'VIEW'}">
					<div id="div_save_btn">
						<c:choose>
							<c:when test="${udRequestType=='ADD'}">
								<input class="savereq" type="button" id="save_add">
								<input class="btn_submit_req" type="button" id="confirminfo_add">
							</c:when>
							<c:otherwise>
								<input class="savereq" type="button" id="save_edit">
								<input class="btn_submit_req" type="button"
									id="confirminfo_edit">
							</c:otherwise>
						</c:choose>
					</div>
					</c:if>
				</form:form>
				<c:if test="${udRequestType != 'VIEW'}">
				<!--弹出查询窗口  -->
				<c:choose>
					<c:when test="${entitytype=='1'}">
						<jsp:include page="aev/query/coin.jsp" />
					</c:when>
					<c:when test="${entitytype=='2'}">
						<jsp:include page="aev/query/bill.jsp" />
					</c:when>
					<c:when test="${entitytype=='3'}">
						<jsp:include page="aev/query/ancientCoin.jsp" />
					</c:when>
					<c:when test="${entitytype=='4'}">
						<jsp:include page="aev/query/stamp.jsp" />
					</c:when>
					<c:when test="${entitytype=='5'}">
						<jsp:include page="aev/query/mechanismCoin.jsp" />
					</c:when>
				</c:choose>
				</c:if>
				<c:if test="${udRequestType == 'HEAR'}">
					<div id="checkList">
						<input
							type="checkbox" id="btn_check_print" /><span></span><span
							style="font-size: 14px;">已打印核对清单</span>
					</div>
					<div id="checkSendSms">
						<span style="font-size: 14px;">本次提交是否发送短信给客户：</span> <input
							type="radio" checked="checked" value="1" name="sms"
							style="margin-left: 20px; margin-top: 5px;">&nbsp;&nbsp;<span
							style="font-size: 14px;">是</span> <input type="radio" value="2"
							name="sms" style="margin-left: 20px; margin-top: 5px;">&nbsp;&nbsp;<span
							style="font-size: 14px;">否</span>
					</div>
					<input type="button" value="保存"
						onclick="checkConfirm('${deposit.depositMainBean.innerno}')">
					<input type="button"
						onclick="doExport('${deposit.depositMainBean.innerno}');"
						value="提交受理">
				</c:if>
			</c:when>
			<c:otherwise>
				<c:forEach items="${entitytypelist}" var="entitytypeitem">
					<c:if test="${entitytype==entitytypeitem.key}">
					${entitytypeitem.value}板块即将开通，敬请期待！
				</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	<jsp:include page="aev/importJS.jsp" />

</body>
</html>
