<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/common.jspf"%>
<script type="text/javascript" src="${ctx_js}/task/tasklist/evaluation/edit.js"></script>
<script>
function save(index){
	var id=$(".evaclass"+index).text();
	var aliasname=$(".entityname"+index).text();
	var numreal=$("#numreal"+index).val();
	var numtestok=$("#numtestok"+index).val();
	var numtestnotok=$("#numtestnotok"+index).val();
	var evaremark=$("#evaremark"+index).text();
	$.ajax({
		url:"/task/tasklist/evaluationsave.shtml",
		type:"post",
		data:"id="+id+"&aliasname="+aliasname+"&numreal="+numreal+"&numtestok="+numtestok+"&numtestnotok="+numtestnotok+"&evaremark="+evaremark,
		dataType:"text",
		seccuss:function(msg){
			debugger;
			if(msg=="ok"){
				layer.confirm('添加成功!是否关闭窗口?', function(index) {
					parent.grid.loadData();
					parent.layer.close(parent.pageii);
					return false;
				});
			}else{
				layer.alert('添加失败！', 3);
			}
		},
		error:function(msg){
			aler("网络错误！");
		}
	});
}
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
#evaluationtab{
	text-align: center;
}
.text,.text1,.text2{
	width: 80px;
	height: 20px;
}
.text1{
	margin:13px;
}
</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
		<table id="evaluationtab" border="1">
			<tr>
				<th><input type="checkbox"></th>
				<th>藏品编号</th>
				<th>藏品类型</th>
				<th>藏品名称</th>
				<th>预约数量</th>
				<th>实际数量</th>
				<th>鉴定结果</th>
				<th>鉴定结果说明</th>
				<th>操作</th>
			</tr>
			<c:forEach var="item" items="${task}" varStatus="status">
			<tr>
				<td><input type="checkbox"></td>
				<td class="evaclass${status.index}">${item.id }</td>
				<td>${item.entitytype }</td>
				<td class="entityname${status.index}">${item.aliasname }</td>
				<td>${item.amount }</td>
				<td><input type="text" id="numreal${status.index}" class="text" value="${item.numreal }"/></td>
				<td>合格<input type="text" id="numtestok${status.index}" class="text1" height="20" value="${item.numtestok }"/><br/>
				不合格<input type="text" id="numtestnotok${status.index}" class="text2"  value="${item.numtestnotok }"/></td>
				<td><textarea id="evaremark${status.index}">${item.remark }</textarea></td>
				<td><input type="button" value="保存" onclick="save('${status.index}')"></td>
			</tr>
			</c:forEach>
		</table>
<script type="text/javascript">
	onloadurl();
</script>
</body>
</html>