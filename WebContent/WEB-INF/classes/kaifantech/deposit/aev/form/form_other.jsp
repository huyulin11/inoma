<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<div class="div_review_block">
	<span class="tabTitle">付款方式</span>
	<hr>
	<div style="padding: 20px 0 15px 10px; font-size: 12px;">
		<input type="radio" name="payment" value="1"
			<c:if test="${deposit.depositMainBean.payment==1}">checked="checked"</c:if> />现金付款
		&nbsp;&nbsp;<input type="radio" name="payment" class="pay" value="2"
			<c:if test="${deposit.depositMainBean.payment==2}">checked="checked"</c:if> />余额支付
		&nbsp;&nbsp;<input type="radio" name="payment" class="pay" value="4"
			<c:if test="${deposit.depositMainBean.payment==4}">checked="checked"</c:if> />银行转账
		&nbsp;&nbsp;<input type="radio" name="payment" class="wangluo"
			value="5"
			<c:if test="${deposit.depositMainBean.payment==5}">checked="checked"</c:if> />网上支付
	</div>
</div>
<div class="div_review_block">
	<span class="tabTitle">完成通知</span>
	<hr>
	<div style="padding: 20px 0 15px 10px; font-size: 12px;">
		<input type="radio" name="notice" value="1"
			<c:if test="${deposit.depositMainBean.notice==1}">checked="checked"</c:if> />短信
		<input type="radio" name="notice" value="1"
			<c:if test="${deposit.depositMainBean.notice==2}">checked="checked"</c:if> />电话
		<input type="radio" name="notice" value="3"
			<c:if test="${deposit.depositMainBean.notice==3}">checked="checked"</c:if> />电子邮件
		<input type="radio" name="notice" value="4"
			<c:if test="${deposit.depositMainBean.notice==4}">checked="checked"</c:if> />不通知
	</div>
</div>
<div class="div_review_block">
	<span class="tabTitle">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
	<hr>
	<div style="padding: 20px 0 15px 0;">
		<textarea name="remark" style="width: 810px; height: 50px;">${deposit.depositMainBean.remark}</textarea>
		<input id="coinInfo" type="hidden" name="coinInfo" value="" />
		<p>*重要提示：</p>
		<p>1.  申请人交付的藏品，鉴定机构不提供现场清点和鉴定，申请人须完全认可鉴定机构对托管藏品的鉴评方式（拆箱、拆包、拆封、拆袋、拆卷等）和鉴评结果。
		</p>
		<p>2.  申请人交付的藏品合格数量以源泰评级鉴评合格数量为准。</p>

	</div>
	<c:if test="${udRequestType!='HEAR'}">
		<div style="padding: 20px 0 15px 10px;">
			<input type="checkbox" name="agreement" id="agreement"
				<c:if test="${tmpRequestObj.agreement==1}">checked="checked"</c:if> />
			我已阅读并接受<span style="font-weight: bold;">《<a id="a_server"
				style="cursor: pointer; color: #A92D06; font-size: 12px;" href="#">赵涌牛邮币卡交易平台藏品托管须知</a>》
			</span>
		</div>
	</c:if>
</div>