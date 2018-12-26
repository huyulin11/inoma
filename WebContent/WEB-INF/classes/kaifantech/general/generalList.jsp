<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <%@ include file="/WEB-INF/jsp/common/common.jspf"%> --%>
<%@ include file="generalhead.jsp"%>
<script type="text/javascript" src='/s/j/jquery/jquery-1.12.2.min.js'></script>
<script type="text/javascript" src="${ctx_js}/general/ajax.js"></script>
<script type="text/javascript" src="${ctx_js}/general/generalData.js" /></script>
<script type="text/javascript" src="${ctx_js}/general/form/GnForm.js" /></script>
<div id='workscope'>
	<div id="view" style="display: none;">
		<p class="center">
			共搜索到 <em id="dataCount">3031</em> 条数据 &nbsp;&nbsp; 每页显示行数 <input
				type="text" id="count" name="rowNumber" value="50">
			<button id="reGet">重新生成</button>
		</p>
		<div id='searchDiv'></div>
		<div id="viewData"></div>
		<%-- 用于包含数据列表的容器 --%>

		<div id="pageChoose">
			<a>首页</a> <a>上一页</a> &nbsp;第<span></span>页&nbsp; <a>下一页</a> <a>尾页</a>
			&nbsp;&nbsp;&nbsp; 跳转到<input type="text" />(1~<span
				id="endPageIndex"></span>)
			<button id="jump">跳转</button>
		</div>
	</div>
</div>