<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<div id="check" style="display: none;">
	<form action="">
		<span class="dialogTitle">添加</span>
		<hr>
		<table id="CoinSearchTable">
			<tr>
				<th><span>志号</span></th>
				<td>
					<input type="text" name="zhino" />
				</td>
				
				<th><span>国家/地区</span></th>
				<td><select name="guojia" class="tongyong" >
						<option value="" selected="selected">全部</option>
						<c:forEach items="${countryList }" var="country">
							<option value="${country.id}">${country.name}</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>发行日期</span></th>
				<td>
					<input type="text" name="issuedate"/>
				</td>
				
				<th><span>面值</span></th>
				<td>
					<input type="text" name="facevaluedis" />
				</td>
				
			</tr>
			<tr>
				<th><span>名称</span></th>
				<td colspan="5">
					<input type="text" name="fullname" class="ticai" />
				</td>
				
				<th><span>刷色</span></th>
				<td>
					<input type="text" name="color" />
				</td>
				
			</tr>
			<tr><td colspan="8">
				<table>
					<tr>
						<td width='20%'>馆藏代码</td>
						<td width='30%'>
							<input type="text" >
						</td>
						<td rowspan="2">
							<span class="red">*</span> (公司客户填此栏)
						</td>
						<td><input type="button"  id="confirmBtn" /></td>
					</tr>
					<tr>
						<td width='20%'>藏品名称</td>
						<td width='30%'>
							<input type="text" >
						</td>
						<td><input type="reset"  id="btn_reset" /></td>
					</tr>
				</table>
			</td></tr>
		</table>
	</form>
	<div id="result">
		<table id="tab5">
			<thead>
				<tr id="firstTr">
					<th><input type="checkbox" id="checkedAll" name="checkedAll" /></th>
					<th>志号</th>
					<th>国家/地区</th>
					<th>时期</th>
					<th>发行日期</th>
					<th>名称</th>
					<th>简称</th>
					<th>面值</th>
					<th>颜色</th>
					<th style="display: none;">估价</th>
				</tr>
			</thead>
			<tbody>
				<script type="text/template" >
					<tr id='tr{index}'>
						<td id='id' class='hiddenThis'>{{id}}</td>
						<td><input type='checkbox' name='choice'/></td>
						<td id='zhino'>{{zhino}}</td>
						<td id='guojia'>{{guojia}}</td>
						<td id='issuetime'>{{issuetime}}</td>
						<td id='issuedate'>{{issuedate}}</td>
						<td id='fullsubject'>{{fullsubject}}</td>
						<td id='shortsubject'>{{shortsubject}}</td>
						<td id='facevaluedis'>{{facevaluedis}}</td>
						<td id='color'>{{color}}</td>
						<td id='issuingquantity' class='hiddenThis'>{{issuingquantity}}</td>
						<td id='evaluate' class='hiddenThis'>{{evaluate}}
							<input type='hidden' id='boxCost' value='{{boxCost}}'/>
						</td>
					</tr>
				</script>
			</tbody>
		</table>
	</div>
	<div class="hiddenThis searchingFlag">
		<span>正在查询，请稍后……</span><img alt="" src="${ctx_images}/load.gif">
	</div>
</div>