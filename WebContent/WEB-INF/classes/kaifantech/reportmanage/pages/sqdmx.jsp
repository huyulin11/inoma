<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id='queryForm'>
	<table id='queryTable'>
		<caption>申请单入库明细</caption>
		<tr>
			<td>入库时间从:<input name="inupdatetime1" type="text"
				value="${param.inupdatetime1}" placeholder="格式如：201611111" /></td>
			<td>到:<input name="inupdatetime2" type="text"
				value="${param.inupdatetime2}" placeholder="格式如：201611112" /></td>
			<td>每页数量:<input name="numOfOnePage" type="text"
				value="${param.numOfOnePage}" placeholder="默认为：10" /></td>
			<td>当前页码:<input name="currentPage" type="text"
				value="${param.currentPage}" placeholder="默认为：1" /></td>
		</tr>
	</table>
</form>
