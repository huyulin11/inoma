<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@ page import="java.math.BigDecimal"%>


<span class="tabTitle">送管藏品信息</span>
<hr/>
<c:if test="${udRequestType != 'VIEW'}">
<input type="button" class="btn_add" id="add" />
</c:if>
<!--
<c:if test="${entitytype=='4'}">
	<span id="allDetail" class="standard">
		<a>全部明细</a>
	</span>
</c:if>
-->

<c:if test="${udRequestType=='HEAR' }">
	<div class="div-hear-pritbtns">
		<input type="text" id="showRequestCode" value="${deposit.innerno}"
			readonly="readonly" /> 
		<input id="reqCodePrint" type="button"
			value="打印申请单号" onclick="printReqCode('${deposit.innerno}');" />
		<span style="margin-left: 30px;">
			从
			<input id="coinNoStart" type="text" class="amount" size="5" value="1"
				onKeyUp="this.value=this.value.replace(/\D/g,'')"
				onafterpaste="this.value=this.value.replace(/\D/g,'')"
				autocomplete="off" />
			到
			<input id="coinNoEnd" type="text" class="amount" size="5" 
				value="${deposit.totalamount }"
				onKeyUp="this.value=this.value.replace(/\D/g,'')"
				onafterpaste="this.value=this.value.replace(/\D/g,'')"
				autocomplete="off" /> 
			<input type="button" value="打印"
				onclick="printCoinCode('${deposit.innerno}','${deposit.totalamount}');">
		</span>
		<span style="margin: 0 50px 0 50px;"> 
			<input type="button" id="btn_check_inventory" value="打印核对清单"
				onclick="printInventory('${deposit.innerno}');" />
		</span>
	</div>
</c:if>
