<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id='queryForm'>
	<table id='queryTable'>
		<caption>申请单综合查询</caption>
		<tr>
			<td>客户编号：</td>
			<td><input id="usercode" name="usercode" type="text"
				class="inputValue" value=""></td>
			<td>收件人姓名：</td>
			<td><input id="customer" name="customer" type="text"
				class="inputValue" value=""></td>
			<td>收件人手机号码：</td>
			<td><input id="receiverMobile" name="receiverMobile"
				class="inputValue" type="text" value=""></td>
			<td class="timeChoose" title="时间选取规则：时间日期大于等于前者且小于等于后者">申请时间：</td>
			<td class="timeChoose" title="时间选取规则：时间日期大于等于前者且小于等于后者"><input
				id="d4311" name="applyTimeK" class="Wdate inputValue" type="text"
				onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2050-10-01\'}'})"
				size="15" value=""> &nbsp;&nbsp;至 &nbsp;&nbsp; <input
				id="d4312" name="applyTimeJ" class="Wdate inputValue" type="text"
				onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2050-10-01'})"
				size="15" value=""></td>
		</tr>
		<tr>
			<td>申请单号：</td>
			<td><input id="requestcode" name="requestcode" type="text"
				class="inputValue" value=""></td>
			<td>外部状态：</td>
			<td><select id="requestStatus" name="requestStatus"
				class="inputValue">
					<option value="" selected>全部</option>
					<option value="0">草稿</option>
					<option value="1">已提交</option>
					<option value="2">受理中</option>
					<option value="3">待确认</option>
					<option value="4">待支付</option>
					<option value="5">评级中</option>
					<option value="6">待发货</option>
					<option value="7">发货</option>
					<option value="-1">已删除</option>
					<option value="-2">异常处理</option>
			</select></td>
			<td>内部状态：</td>
			<td><select id="internalStates" name="internalStates"
				class="inputValue">
					<option value="" selected>全部</option>
					<option value="0">待处理</option>
					<option value="1">受理中</option>
					<option value="2">待确认</option>
					<option value="3">受理结束</option>
					<option value="4">制图中</option>
					<option value="5">制图结束</option>
					<option value="6">评级中</option>
					<option value="7">评级结束</option>
					<option value="8">打盒中</option>
					<option value="9">打盒结束</option>
					<option value="10">打盒制图中</option>
					<option value="11">打盒制图结束</option>
					<option value="13">封箱中</option>
					<option value="14">封箱结束</option>
					<option value="12">入库</option>
					<option value="-1">已删除</option>
					<option value="-2">异常处理</option>
			</select></td>
			<td class="timeChoose" title="时间选取规则：时间日期大于等于前者且小于等于后者">受理时间：</td>
			<td class="timeChoose" title="时间选取规则：时间日期大于等于前者且小于等于后者"><input
				id="requestTimeK" name="requestTimeK" class="Wdate inputValue"
				type="text"
				onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2050-10-01\'}'})"
				size="15" value=""> &nbsp;&nbsp;至 &nbsp;&nbsp; <input
				id="requestTimeJ" name="requestTimeJ" class="Wdate inputValue"
				type="text"
				onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2050-10-01'})"
				size="15" value=""></td>
			<td></td>
		</tr>
		<tr>
			<td>申请单类型：</td>
			<td><select id="entitytype" name="entitytype" class="inputValue">
					<option value="" selected="selected">全部</option>
					<option value="6">套装系列</option>
					<option value="1">现代钱币</option>
					<option value="3">古钱</option>
					<option value="5">机制币</option>
					<option value="2">纸钞</option>
					<option value="4">邮票</option>
			</select></td>
			<td>每页数量:<input name="numOfOnePage" type="text"
				value="${param.numOfOnePage}" placeholder="默认为：10" /></td>
			<td>当前页码:<input name="currentPage" type="text"
				value="${param.currentPage}" placeholder="默认为：1" /></td>
		</tr>
	</table>
</form>
