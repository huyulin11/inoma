<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<div id="ser" class="div_review_block">
	<span class="tabTitle">送管方式</span>
	<hr>
	<table id="tab2">
		<c:if test="${udRequestType != 'VIEW'}">
			<tr>
				<td><input type="radio" id="applytype1" class=""
					name="depositMainBean.applytype" value="1"
					<c:if test="${deposit.depositMainBean.applytype=='1'}">checked="checked"</c:if> />
					上门&nbsp;&nbsp;&nbsp; <input type="radio" id="applytype2" class=""
					name="depositMainBean.applytype" value="2"
					<c:if test="${deposit.depositMainBean.applytype=='2'}">checked="checked"</c:if> />
					物流</td>
				<td>物流单号</td>
				<td style="width: 400px"><input type="text" id="packagecode"
					name="depositMainBean.packagecode"
					value="${deposit.depositMainBean.packagecode}" /></td>
			</tr>
		</c:if>
		<c:if test="${udRequestType == 'VIEW'}">
			<tr>
				<td><c:if test="${deposit.depositMainBean.applytype=='1'}">上门</c:if>
					<c:if test="${deposit.depositMainBean.applytype=='2'}">物流</c:if></td>
				<c:if test="${deposit.depositMainBean.applytype=='2'}">物流
			<td>物流单号</td>
					<td><label>deposit.depositMainBean.packagecode</label></td>
				</c:if>
			</tr>
		</c:if>
	</table>
</div>