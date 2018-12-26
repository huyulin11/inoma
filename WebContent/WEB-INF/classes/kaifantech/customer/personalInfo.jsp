<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>


<link type="text/css" rel="stylesheet" href="${ctx_css}/customer/personalInfo.css${fv}" />
<script type="text/javascript"
	src="/s/j/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/s/j/jquery-1.8.3.js"></script>

<script type="text/javascript">
	var sessionType = '${sessionType}';
	var userid = '${user.id}' ;
	var um = window.um || {}; // user manage namespace
	um.userid = userid ;
	um.urls = um.urls || {} ;
	um.urls.updatePersonInfo = "/customer/personalInfo/updatePersonInfo.shtml" ;

	$(function() {
		//获取文本框焦点，处理文本框样式
		$("#max_PersonalInfo #name").focus(function() {
			$(this).css({
				"background" : "#F2F3F4",
				"border-color" : "#C7CCD0"
			});
			um.personalInfo.checkNameIfNull();
		}).blur(function() {
			$(this).css({
				"background" : "#FFF",
				"border-color" : "#C7CCD0"
			});
			$("#max_PersonalInfo #div_check_name").html("");

		});

		$("#max_PersonalInfo #nickname").focus(function() {
			$(this).css({
				"background" : "#F2F3F4",
				"border-color" : "#C7CCD0"
			});
			um.personalInfo.checkNicknameIfNull();
		}).blur(function() {
			$(this).css({
				"background" : "#FFF",
				"border-color" : "#C7CCD0"
			});
			$("#max_PersonalInfo #div_check_nickname").html("");

		});

		$("#max_PersonalInfo #documentcode").focus(function() {
			$(this).css({
				"background" : "#F2F3F4",
				"border-color" : "#C7CCD0"
			});
			um.personalInfo.checkDocumentcodeIfNull();
		}).blur(function() {
			$(this).css({
				"background" : "#FFF",
				"border-color" : "#C7CCD0"
			});
			$("#max_PersonalInfo #div_check_documentcode").html("");

		});
		$("#max_PersonalInfo #nickname").on("keypress",function(){
			um.personalInfo.TextValidate()
		});
		$("#max_PersonalInfo #perInfoModifyfrm").submit(function(e){
			e.preventDefault();
			um.personalInfo.savePersonInfo();
		});
	});

</script>

<script type="text/javascript" src="${ctx_js}/customer/personalInfo.js" ></script>

<div style="background: #fff;">
	<div id="max_PersonalInfo">
		<c:if test="${sessionType == '0'}" >
			<div class="baoshang"><div><div>
				<span>基本信息</span>
			</div></div></div>
		</c:if>
		<form id="perInfoModifyfrm" onsubmit="return savePersonInfo()">
			<input id="userid" name="userid" type="hidden" value="${user.id }" />
			<table id="table" class="tab">
				<col width=85px />
				<tr>
					<td class="personinfo_td_al">会员编号</td>
					<td id="number">${user.usercode }</td>
				</tr>
				<tr>
					<td class="personinfo_td_al">姓名<span style="color: red;">*</span></td>
					<td>
						<c:choose>
							<c:when test="${user.name == null || user.name== '' }">
								<input id="name" name="name" type="text"
									onmousemove="checkname()" />
							</c:when>
							<c:when test="${user.name != ''}">
								<input id="name" name="name" type="text" value="${user.name }" />
							</c:when>
						</c:choose> 
					</td>
					<td><div id="div_check_name"></div></td>
				</tr>

				<tr>
					<td class="personinfo_td_al">称谓</td>
					<td><input id="nickname" name="nickname" type="text"
						value="${user.title }" onkeypress="TextValidate()" /></td>
					<td><div id="div_check_nickname"></div></td>
				</tr>
				<tr height="30px">
					<td class="personinfo_td_al">性别</td>
					<td><input id="male" name="gender" type="radio" value="1"
						<c:if test="${user.gender == '1' }">checked="checked"</c:if> />男 <input
						id="femal" name="gender" type="radio" value="2"
						<c:if test="${user.gender == '2' }">checked="checked"</c:if>
						style="margin-left: 10px;" />女</td>
				</tr>
				<tr height="30px">
					<td class="personinfo_td_al">生日</td>
					<td><input id="birthday" name="birthday" style="height: 25px;"
						class="Wdate" type="text"
						onClick="WdatePicker({isShowClear:false,readOnly:true})"
						value="${user.birthday }"></td>

				</tr>
				<tr>
					<td class="personinfo_td_al">证件类型</td>
					<td><select id="documenttype" name="documenttype"
						class="select">
							<option value="1"
								<c:if test="${user.documenttype == null || user.documenttype =='' 
										|| user.documenttype == '1' }">selected="selected"</c:if>>身份证</option>
							<option value="2"
								<c:if test="${user.documenttype == '2' }">selected="selected"</c:if>>军官证</option>
							<option value="3"
								<c:if test="${user.documenttype == '3' }">selected="selected"</c:if>>护照</option>
					</select></td>
					<td></td>
				</tr>
				<tr>
					<td class="personinfo_td_al">证件编号</td>
					<td><input id="documentcode" name="documentcode" type="text"
						value="${user.documentcode }" /></td>
					<td><div id="div_check_documentcode"></div></td>
				</tr>

				<tr>
					<td class="personinfo_td_al">备注</td>
					<td colspan="2"><textarea id="remark" name="remark" rows="5"
							style="width: 150px;">${user.remark }</textarea></td>

				</tr>
				<tr>
					<td></td>
					<td id="savebtn"><input type="submit" id="con_btn" style="cursor:pointer"
						value="保&nbsp;&nbsp;存"></td>
				</tr>
			</table>

		</form>
	</div>
</div>