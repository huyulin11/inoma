<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/common/common.jspf"%>
<%@ include file="generalhead.jsp"%>
<script type="text/javascript" src="${ctx_js}/general/ajax.js"></script>
<script type="text/javascript" src="${ctx_js}/general/generalForm.js"></script>
<script type="text/javascript" src="${ctx_js}/jquery.generalForm.js" /></script>

<div id='workscope'>
	<%-- 第一部分：表单 --%>
	<div>
		<form id="perInfoModifyfrm" method="POST">
			<table class="singleDataTable">
				<caption>基础信息维护（带红色*为必输字段）</caption>
				<tr id='select_row'>
					<th>选择类型：</th>
					<%-- 如果选择的表改变，页面重载，之前输入的所有内容也都会消失。 --%>
					<td><select id="tableChoose" name="tableChoose" class="select">
							<c:forEach items="${keywordList}" var="keywordItem">
								<option value="${keywordItem.keyword}"
									<c:if test="${keyword==keywordItem.keyword}">selected="selected"</c:if>>${keywordItem.chncolname}</option>
							</c:forEach>
					</select></td>
				</tr>

				<%-- 显示数据编辑表格 --%>
				<tr id='button_row'>
					<td id="savebtn" class="saveRow" colspan=2>
						<%--注意：这里不能用&lt;button&rt;标签，
					因为提交表单时会将button的值一并提交。--%> <input type="reset" id="reset"
						value="重&nbsp;&nbsp;置" /> <input type="button" id="save"
						value="保&nbsp;&nbsp;存" />

					</td>
				</tr>
				<tr hidden="hidden" class='hiddenThis'>
					<th>区分类型</th>
					<td><select id="operateType" name="operateType" class="elect"
						hidden=''>
							<option value="ADD">插入新数据</option>
							<option value="EDIT">修改表中的数据</option>
							<option value="VIEW">查询数据</option>
					</select></td>
				</tr>
			</table>
		</form>
		<p id="msg"></p>
	</div>
</div>

<div id='test'></div>