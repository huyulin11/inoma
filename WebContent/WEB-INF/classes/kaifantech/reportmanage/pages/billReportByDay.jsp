<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id='queryForm'>
	<table id='queryTable' data-searchFirstTime='1'>
		<caption>每日账单报表</caption>
		<tr>
			<td>每页数量:<input name="numOfOnePage" type="text"
				value="${param.numOfOnePage}" placeholder="默认为：30" /></td>
			<td>当前页码:<input name="currentPage" type="text"
				value="${param.currentPage}" placeholder="默认为：1" /></td>
		</tr>
	</table>
</form>
<script>
	$("title").html("每日账单报表");
</script>