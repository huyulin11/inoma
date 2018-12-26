<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>


<style>
:input[name="depositAddressBean.usercardcode"] {
	width: 142px;
}
</style>

<div id="pay" class="div_review_block">
	<span class="tabTitle">退件方式</span>
	<hr>
	<c:if test="${udRequestType != 'VIEW'}">
		<table id="tab3">
			<tr>
				<td><input type="radio" id="sendtype2"
					name="depositAddressBean.sendtype" value="2"
					<c:if test="${deposit.depositAddressBean.sendtype == null || deposit.depositAddressBean.sendtype =='' || deposit.depositAddressBean.sendtype==2}">checked="checked"</c:if> />
					上门自取（须携带有效证件）</td>
				<td><input type="radio" id="sendtype1"
					name="depositAddressBean.sendtype" value="1"
					<c:if test="${deposit.depositAddressBean.sendtype==1}">checked="checked"</c:if> />
					快递回邮（不保价）</td>
				<td><input type="radio" id="sendtype3"
					name="depositAddressBean.sendtype" value="3"
					<c:if test="${deposit.depositAddressBean.sendtype==3}">checked="checked"</c:if> />
					快递回邮（全额保价）</td>
			</tr>
			<tr style="display: block;">
				<td>收货人姓名：</td>
				<td><input type="text" name="depositAddressBean.receivername"
					value="${deposit.depositAddressBean.receivername}" /></td>
			</tr>

			<tr class="tr_pickup_address">
				<td colspan="3">
					<div style="float: left">
						<span style="font-size: 12px;">证件类型&nbsp;</span> <select
							id="usercardtype" name="depositAddressBean.usercardtype"
							class="select">
							<option value="1"
								<c:if test="${depositAddressBean.usercardtype == null || depositAddressBean.usercardtype =='' || depositAddressBean.usercardtype == '1' }">selected="selected"</c:if>>身份证
							</option>
							<option value="2"
								<c:if test="${depositAddressBean.usercardtype == '2' }">selected="selected"</c:if>>军官证
							</option>
							<option value="3"
								<c:if test="${depositAddressBean.usercardtype == '3' }">selected="selected"</c:if>>护照
							</option>
						</select>
					</div>
				</td>
			</tr>
			<tr class="tr_pickup_address">
				<td colspan="3">
					<div style="float: left">
						<span style="font-size: 12px;">证件号码&nbsp; <input
							type="text" name="depositAddressBean.usercardcode"
							id="usercardcode" value="${c_user.documentcode }" />
							为保证安全，请如实填写有效证件
						</span>
					</div>
				</td>
			</tr>
			<tr class="tr_pickup_address">
				<td colspan="3"><span style="font-size: 14px;"><br>取件地址：上海市漕河泾开发区田林路1016号科技绿洲三期2-1号楼
						<br> <br> <br> <br> <br> <br> <br>
						<span style="width: 100%; height: 35px; font-size: 12px;">
							＊回邮仅限中国大陆地区；快递回邮包装运输费首重1kg，江浙沪地区15元，其他地区25元；续重每kg
							10元，不足1kg，按1kg计算。<br> ＊回邮保价费为合计估价的0.5%，不足1元，按1元计，1元起收。
					</span> </span></td>
			</tr>
			<tr class="Y_toggle">
				<td colspan="3">
					<div
						style="height: 50px; vertical-align: top; diplay: inline-block; float: left;">
						<span class="red">*</span>详细地址&nbsp;&nbsp;
					</div> <textarea id="capitalvalue2" name="depositAddressBean.address"
						rows="" cols=""
						style="width: 330px; height: 50px; diplay: inline-block; float: left;">${deposit.depositAddressBean.address}</textarea>
				</td>
			</tr>
			<tr class="Y_toggle">
				<td colspan="3">
					<div style="diplay: inline-block; float: left;">
						<span class="red">*</span>邮政编码&nbsp;&nbsp;
					</div> <input type="text" id="zip" name="depositAddressBean.zip"
					value="${deposit.depositAddressBean.zip}" />
				</td>
			</tr>
			<tr class="Y_toggle">
				<td colspan="3">
					<div style="diplay: inline-block; float: left;">手机号码&nbsp;&nbsp;&nbsp;</div>
					<input type="text" name="depositAddressBean.receivermobile"
					value="${deposit.depositAddressBean.receivermobile}" />
				</td>
			</tr>
			<tr class="Y_toggle">
				<td colspan="3">
					<div style="width: 100%; font-size: 12px;">
						<span class="red">*</span>号项为必填
					</div> <br />
				</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${udRequestType == 'VIEW'}">
		<table id="tab3">
			<tr>
				<td><c:choose>
						<c:when
							test="${deposit.depositAddressBean.sendtype == null || deposit.depositAddressBean.sendtype =='' || deposit.depositAddressBean.sendtype==2}">上门自取（须携带有效证件）</c:when>
						<c:when test="${deposit.depositAddressBean.sendtype==1}">
			快递回邮（不保价）</c:when>
						<c:when test="${deposit.depositAddressBean.sendtype==3}">快递回邮（全额保价）</c:when>
					</c:choose></td>
			</tr>
			<tr style="display: block;">
				<td>收货人姓名：</td>
				<td>${deposit.depositAddressBean.receivername}</td>
			</tr>

			<c:if test="${deposit.depositAddressBean.sendtype==2}">
				<tr class="tr_pickup_address">
					<td colspan="3">
						<div style="float: left">
							<span style="font-size: 12px;">证件类型&nbsp;</span>
							<c:choose>
								<c:when
									test="${depositAddressBean.usercardtype == null || depositAddressBean.usercardtype =='' || depositAddressBean.usercardtype == '1' }">身份证</c:when>
								<c:when test="${depositAddressBean.usercardtype == '2' }">军官证</c:when>
								<c:when test="${depositAddressBean.usercardtype == '3' }">护照</c:when>
							</c:choose>
						</div>
					</td>
				</tr>
			</c:if>
			<c:if test="${deposit.depositAddressBean.sendtype==2}">
				<tr class="tr_pickup_address">
					<td colspan="3">
						<div style="float: left">
							<span style="font-size: 12px;">证件号码&nbsp;
								${c_user.documentcode } </span>
						</div>
					</td>
				</tr>
			</c:if>
			<c:if test="${deposit.depositAddressBean.sendtype!=2}">
				<tr class="Y_toggle">
					<td colspan="3">
						<div
							style="height: 50px; vertical-align: top; diplay: inline-block; float: left;">
							<span class="red">*</span>详细地址&nbsp;&nbsp;
						</div>${deposit.depositAddressBean.address}</td>
				</tr>
			</c:if>
			<c:if test="${deposit.depositAddressBean.sendtype!=2}">
				<tr class="Y_toggle">
					<td colspan="3">
						<div style="diplay: inline-block; float: left;">
							<span class="red">*</span>邮政编码&nbsp;&nbsp;
						</div> ${deposit.depositAddressBean.zip}
					</td>
				</tr>
			</c:if>
			<c:if test="${deposit.depositAddressBean.sendtype!=2}">
				<tr class="Y_toggle">
					<td colspan="3">
						<div style="diplay: inline-block; float: left;">手机号码&nbsp;&nbsp;&nbsp;</div>
						${deposit.depositAddressBean.receivermobile}
					</td>
				</tr>
			</c:if>
		</table>
	</c:if>
</div>