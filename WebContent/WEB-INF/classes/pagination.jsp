<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function vad() {
		var pageindex = document.getElementById('input').value;
		var patrn=/^\-?([1-9][0-9]*|0)(\.[0-9]+)?$/;
		var maxpage="<c:out value="${totalPage}"/>";
		if(!patrn.exec(pageindex) || pageindex == "0"){
				alert("请输入大于0的整数!");
				document.getElementById('input').value="";
				return false;
		}else if(parseInt(pageindex)>parseInt(maxpage)){
				alert("您的输入页数大于总页数！");
				document.getElementById('input').value="";
				return false;
		}else{
				pages(this.document.getElementById('input').value);
		}
	}
</script>
<div>
	<table style="margin:0px auto;margin-top:30px;">
		<tbody>
			<tr>
				<td><select class="pagination-page-list" id="pageSize" name="pageSize" onchange="${fn}(1)" style="display:none;">
						<option value="10"<c:if test="${pageSize==10}">selected="selected"</c:if>>10</option>
						<option value="20"<c:if test="${pageSize==20}">selected="selected"</c:if>>20</option>
						<option value="30"<c:if test="${pageSize==30}">selected="selected"</c:if>>30</option>
						<option value="40"<c:if test="${pageSize==40}">selected="selected"</c:if>>40</option>
						<option value="50"<c:if test="${pageSize==50}">selected="selected"</c:if>>50</option>
					</select>
				</td>
				<td><div class="pagination-btn-separator"></div></td>
				<td><a
					href="javascript:<c:if test="${page > 1}">${fn}(1)
					</c:if>
					"
					icon="pagination-first"
					class="l-btn l-btn-plain
					<c:if test="${page < 2}">l-btn-disabled</c:if>
					"
					id="undefined"><span class="l-btn-left"><span
							class="l-btn-text"><span
								class="l-btn-empty pagination-first">首页</span></span></span></a></td>
				<td><a
					href="javascript:<c:if test="${page > 1}">${fn}(${page-1})
					</c:if>
					"
					icon="pagination-prev"
					class="l-btn l-btn-plain
					<c:if test="${page < 2}">l-btn-disabled</c:if>
					"
					id="undefined"><span class="l-btn-left"><span
							class="l-btn-text"><span
								class="l-btn-empty pagination-prev">上一页</span></span></span></a></td>
				<!-- <td><div class="pagination-btn-separator"></div></td> -->
				<td><div class="pagination-btn-separator"></div></td>
				<td style="width:80px;color:#333;font-size:12px">第${page}/${totalPage}页</td>
				<td><div class="pagination-btn-separator"></div></td>
				<td><a
					href="javascript:<c:if test="${page < totalPage}">${fn}(${page+1})
					</c:if>
					"
					icon="pagination-next"
					class="l-btn l-btn-plain
					<c:if test="${page >= totalPage}">l-btn-disabled</c:if>
					"
					id="undefined"><span class="l-btn-left"><span
							class="l-btn-text"><span
								class="l-btn-empty pagination-next">下一页</span></span></span></a></td>
				<td><a
					href="javascript:<c:if test="${page < totalPage}">${fn}(${totalPage})
					</c:if>
					"
					icon="pagination-last"
					class="l-btn l-btn-plain
					<c:if test="${page >= totalPage}">l-btn-disabled</c:if>
					"
					id="undefined"><span class="l-btn-left"><span
							class="l-btn-text"><span
								class="l-btn-empty pagination-last">末页</span></span></span></a></td>
				<%-- <td><span style="padding-right: 6px;color:#333;">&nbsp;&nbsp;共${totalPage}页</span></td> --%>
				<td><span style="padding-left: 6px;"></span></td>
				<td><div class="pagination-btn-separator"></div></td>
				<td><form:input cssClass="pagination-num" path="page"
						id="input" size="2"
						onkeypress="if(event.keyCode==13) {return false};${fn}();return false;}" /></td>
				<td><a onclick="vad();" icon="pagination-load"
					class="l-btn l-btn-plain" id="undefined"><span
						class="l-btn-left"><span class="l-btn-text"><span
								class="l-btn-empty pagination-load">跳转</span></span></span></a></td>
				<td><div class="pagination-btn-separator"></div></td>
				<!-- <td><div class="pagination-btn-separator"></div></td> -->
				<td style="width:150px;font-size:12px;">共<span style="color:#3E78FD;">${length}</span>条记录</td>
			</tr>
		</tbody>
	</table>
	<%-- <div class="pagination-info">Displaying ${(page-1)*pageSize + 1} to ${(page)*pageSize } of ${length} items</div> --%>
	<div style="clear: both;"></div>
</div>