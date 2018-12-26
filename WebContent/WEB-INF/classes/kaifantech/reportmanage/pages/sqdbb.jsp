<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form id='queryForm'>
	<table id='queryTable'>
		<caption>历史统计业绩综合报表</caption>
		<tr>
			<td>每页数量:<input name="numOfOnePage" type="text"
				value="${param.numOfOnePage}" placeholder="默认为：10" /></td>
			<td>当前页码:<input name="currentPage" type="text"
				value="${param.currentPage}" placeholder="默认为：1" /></td>
		</tr>
	</table>
</form>