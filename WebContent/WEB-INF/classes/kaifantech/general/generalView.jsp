<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/common.jspf"%>
<%@ include file="generalhead.jsp" %>
<script type="text/javascript"
	src="${ctx_js}/general/ajax.js">
	
</script>
</head>
<body>
	<div id='workscope'>
		<!-- 第一部分：表单 -->
		<div>
			<form id="perInfoModifyfrm" method="POST">
				<table class="singleDataTable">
					<caption>基础信息维护（带红色*为必输字段）</caption>
					<tr id='select_row'>
						<th>选择类型：</th>
						<!-- 如果选择的表改变，页面重载，之前输入的所有内容也都会消失。 -->
						<td><select id="tableChoose" name="tableChoose"
							class="select">
								<c:forEach items="${keywordList}" var="keywordItem">
									<option value="${keywordItem.keyword}"
										<c:if test="${keyword==keywordItem.keyword}">selected="selected"</c:if>>${keywordItem.chncolname}</option>
								</c:forEach>
						</select></td>
					</tr>

					<!-- 显示数据编辑表格 -->
					<!--
			<basicsysinfoTag:AEVItemTag keyword="${keyword}" />
			-->
					<!-- <c:out escapeXml="false" value="${tableDetailhtml}" 
					default="没有找到任何表列名定义" /> -->
					<tr id='button_row'>
						<td id="savebtn" class="saveRow" colspan=2>
							<!--注意：这里不能用&lt;button&rt;标签，
					因为提交表单时会将button的值一并提交。--> <input type="reset" id="reset"
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

		<!-- 第二部分：查看数据 -->
		<div id="view" hidden="hidden">
			<input type="button" id="toMax" value="放大" />
			<p class="center">
				共搜索到 <em id="dataCount">3031</em> 条数据 &nbsp;&nbsp; 每页显示行数 <input
					type="text" id="count" name="rowNumber" value="50">
				<button id="reGet">重新生成</button>
			</p>
			<div id='searchDiv'></div>
			<div id="viewData"></div>
			<!-- 用于包含数据列表的容器 -->

			<div id="pageChoose">
				<!-- 注意：必须删去<a>的"href"属性，否则页面会提交到相应的url地址上
			 即使href=""也不行，程序会提交本页URL地址到服务器，这时相当于页面跳转而非Ajax
		 	如果<a>绑定click()事件Ajax请求，先完成Ajax请求，后跳转到href属性的页面
		-->
				<a>首页</a> <a>上一页</a> &nbsp;第<span></span>页&nbsp; <a>下一页</a> <a>尾页</a>
				&nbsp;&nbsp;&nbsp; 跳转到<input type="text" />(1~<span
					id="endPageIndex"></span>)
				<button id="jump">跳转</button>
			</div>
		</div>
	</div>
</body>
</html>