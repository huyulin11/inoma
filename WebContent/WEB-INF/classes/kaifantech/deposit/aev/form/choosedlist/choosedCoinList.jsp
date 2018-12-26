<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>


<div id="list" class="div_review_block">
	<jsp:include
		page="entity.jsp" />
	<div>
		<script type="text/template" id="tab4-tr-template" >
			<tr id='tr{rowId}'>
				<td class='ipc'>{rowId}</td>
				<td class='ipc2'>
					<input type='text' style='font-family:eudc;' class='tab_input' 
						name='depositClasslist[{index}].entityAliasBean.aliasname' value='{{shortsubject}}'  /> <%-- ? todo --%>
				</td>

				<td class='ipc'>
					<input type='text' class='tab_input amountClass' 
						name='depositClasslist[{index}].amount' id='amount' value='1'  />
				</td>
				
				<td class='ipc'>
					<input type='button' class='delete' title='删除'/>
					<input type='button' class='upRow' title='上移'/>
					<input type='button' class='downRow' title='下移'/>
				</td>

				<td class='hiddenThis'>
					<input type='hidden' name='depositClasslist[{index}].numindex' value='{rowId}'/>
					<input type='hidden' name='depositClasslist[{index}].entityAliasBean.entityid' value='{{id}}' />
				</td>
			</tr>
		</script>
		<table id="tab4">
			<thead><tr>
				<th>行号</th>
				<th>名称</th>
				<th>数量</th>
				<c:if test="${udRequestType != 'VIEW'}">
				<th>操作</th>
				</c:if>
			</tr></thead>
			<tbody>
			<c:forEach items="${deposit.depositClasslist}" var="detail" varStatus="status">
				<c:if test="${udRequestType != 'VIEW'}">
				<tr id="tr${status.index}">
					<td id="rowId" class="bg">${status.index+1}</td>
					<td class='ipc2'>
						<input type='text' style='font-family:eudc;' class='tab_input' 
							name='depositClasslist[${status.index}].entityAliasBean.aliasname' value='${detail.entityAliasBean.aliasname}'  /> <%-- ? todo --%>
					</td>
					<td class='ipc'><input type="text" value="${detail.amount}"
						id="amount" class='tab_input amountClass'
						name="depositClasslist[${status.index}].amount" /></td>
					<td class='ipc'>
						<input type="button" class="delete" title='删除' />
						<input type="button" class="upRow"  title='上移' />
						<input type="button" class="downRow" title='下移' /></td>

					<td class='hiddenThis'>
						<input type='hidden' name='depositClasslist[${status.index}].numindex' value='${detail.numindex}'/>
						<input type='hidden' name='depositClasslist[${status.index}].entityAliasBean.entityid' value='${detail.entityAliasBean.entityid}' />
					</td>
				</tr>
				</c:if>
				<c:if test="${udRequestType == 'VIEW'}">
				<tr id="tr${status.index}">
					<td id="rowId" class="bg">${status.index+1}</td>
					<td class='ipc2' style='font-family:eudc;'>${detail.entityAliasBean.aliasname}</td>
					<td class='ipc'>${detail.amount}</td>
				</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="remark.jsp" />
</div>