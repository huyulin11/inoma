<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id='queryForm'>
	<table id='queryTable'>
		<caption>评品明细</caption>
		<tr>
			<td>申请单编号:<input name="requestcode" type="text"
				value="${param.requestcode}" placeholder="格式如：19400" /></td>
			<td>评品编号:<input name="coincode" type="text"
				value="${param.coincode}" placeholder="格式如：19400001" /></td>
			<td>分数大于等于:<input name="sgt" type="text" value="${param.sgt}"
				placeholder="格式如：96" /></td>
			<td>分数小于等于:<input name="slt" type="text" value="${param.slt}"
				placeholder="格式如：99" /></td>
			<td>每页数量:<input name="numOfOnePage" type="text"
				value="${param.numOfOnePage}" placeholder="默认为：10" /></td>
			<td>当前页码:<input name="currentPage" type="text"
				value="${param.currentPage}" placeholder="默认为：1" /></td>
		</tr>
	</table>
</form>
