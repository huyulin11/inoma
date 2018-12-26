<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<td id="leftFrame" class="leftFrame" valign="top">
	<table id="tab1">
		<caption>申请单信息</caption>
		<col width="100" />
		<col width="100" />
		<tr>
			<th>鉴品单编号</th>
			<td>${request.requestcode}</td>
		</tr>
		<tr>
			<th>速度</th>
			<td>${request.speed}</td>
		</tr>
		<tr>
			<th>服务种类</th>
			<td>${request.serviceid}</td>
		</tr>
		<tr>
			<th>鉴评总数</th>
			<td>${request.totalamount}</td>
		</tr>
		<tr style="display: none">
			<th>备注</th>
			<td><textarea rows="3" cols="15" id="remark" readonly="readonly">${request.remark}</textarea></td>
		</tr>
	</table>
</td>
<td width="10px" style="border: #CCC solid 1px; cursor: pointer;"
	onclick="HideShow()"><img
	src="${ctx_images}/arrow_left.png" alt="隐藏" id="switchPoint"
	style="cursor: hand" /></td>
<td class="hiddenThis"><input type="hidden" name="id" id="id"
	value="${request.id}" /> <input type="hidden" name="internalstates"
	id="internalstates" value="${request.internalstates}" /></td>