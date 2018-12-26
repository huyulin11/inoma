<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<style>
	:input[name="usercardcode"] {
		width: 142px ;
	}
</style>


<div id="basic" class="div_review_block">
	<span class="tabTitle">基本信息</span>
	<hr>
	<table id="tab">
		<tr>
			<td>申&nbsp;请&nbsp;人</td>
			<input type="hidden" name="depositMainBean.userid" id="userid"
				value="${c_user.id}" />
			<td><label type="text" id="receivername" class="basicInput" >${c_user.name}</label></td>
			<td>会员编号</td>
			<td><label type="text" id="usercode" class="basicInput" >${c_user.usercode}</label></td>
		</tr>
		<tr>
			<td>预约单号</td>
			<td><label type="text" id="reservno" class="basicInput" >${deposit.depositMainBean.reservno}</label></td>
			<td>内部流转号</td>
			<td><label type="text" id="innerno" class="basicInput" >${deposit.depositMainBean.innerno}</label></td>
 			</tr>
	</table>
</div>
