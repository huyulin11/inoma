<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>


<div class="div_review_block" hidden>
	<span class="tabTitle">合&nbsp;&nbsp;&nbsp;&nbsp;计</span>
	<hr>
	<table id="calculateTab">
		<tr>
			<td><span>A</span>送评数</td>
			<td><input type="text" name="totalamount" id="totalamount"
				class="total" value="${deposit.depositFeeBean.totalamount}"
				autocomplete="off" readonly="readonly"></td>
			<td><span>B</span>总估价</td>
			<td><input type="text" name="totalevaluate" id="totalevaluate"
				value="${deposit.depositFeeBean.totalevaluate}" class="total"
				autocomplete="off" readonly="readonly"></td>
			<td><span>C</span>总评级费</td>
			<td><input type="text" name="totalreqcost" id="totalreqcost"
				class="total" value="${deposit.depositFeeBean.totalreqcost}"
				autocomplete="off" readonly="readonly"></td>
			<td><span>D</span>总重量</td>
			<td><input type="text" name="totalweight" id="totalweight"
				class="total" value="${deposit.depositFeeBean.totalweight}"
				autocomplete="off" readonly="readonly"></td>
			<td class="hiddenThis"><span>A</span>保险费</td>
			<td class="hiddenThis"><input type="hidden" name="totalpremium"
				id="totalpremium" class="total"
				value="${deposit.depositFeeBean.totalpremium}" autocomplete="off"
				readonly="readonly"></td>
		</tr>
		<tr>
			<td><span>E</span>包装运输</td>
			<td><input type="text" name="totaltransportation"
				id="totaltransportation"
				value="${deposit.depositFeeBean.totaltransportation}" class="total"
				autocomplete="off"
				<c:if test="${udRequestType!='HEAR'}">
				readonly="readonly"
			</c:if>></td>
			<td><span>F</span>保价费</td>
			<td><input type="text" id="totalinsurance" name="totalinsurance"
				class="total" value="${deposit.depositFeeBean.totalinsurance}"
				autocomplete="off" readonly="readonly"></td>
			<td><span>G</span>优惠</td>
			<td><input type="text" name="totalpreferential"
				id="totalpreferential" autocomplete="off"
				value="${deposit.depositFeeBean.totalpreferential}" class="total"
				readonly="readonly"></td>
		</tr>
		<tr>
			<c:if test="${udRequestType=='HEAR'}">
				<td>其他费用</td>
				<td><input id="othercost" name="othercost" type="text"
					class="total" value="${deposit.depositFeeBean.othercost}" autocomplete="off"
					onfocus="this.select()"
					<c:if test="${udRequestType!='HEAR'}">
						readonly="readonly"
					</c:if> /></td>
			</c:if>
			<td>总费用</td>
			<td><input type="text" name="totalcost" id="totalcost"
				class="total" value="${deposit.depositFeeBean.totalcost}" autocomplete="off"
				<c:if test="${udRequestType!='HEAR'}">
					readonly="readonly"
				</c:if>></td>
			<c:choose>
				<c:when test="${udRequestType!='HEAR'}">
					<td><span>C+E+F-G</span></td>
				</c:when>
				<c:when test="${udRequestType=='HEAR'}">
					<td>补费备注：</td>
					<td><input type="text" name="costremark" class="total"
						value="${deposit.depositFeeBean.costremark}" autocomplete="off" /></td>
				</c:when>
			</c:choose>
		</tr>
	</table>
</div>
