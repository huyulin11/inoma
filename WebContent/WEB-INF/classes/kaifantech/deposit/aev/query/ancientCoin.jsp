<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<div id="check" style="display: none;">
	<form action="">
		<span class="dialogTitle">添加</span>
		<hr>
		<table id="CoinSearchTable">
			<tr >
				<th><span>朝代</span></th>
				<td>
					<select name="dynasty" class="tongyong">
						<option value="0" selected="selected">全部</option>
						<c:forEach items="${dynasty}" var="dynasty">
							<option value="${dynasty.key}">${dynasty.value}</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>名称</span></th>
				<td colspan="3">
					<input type="text" name="fullname"class="ticai" />
				</td>
				
				<th><span>面值</span></th>
				<td>
					<input type="text" name="facevaluedis" />
				</td>
				
				
			</tr>
			<tr >
				<th><span>材质</span></th>
				<td>
					<select name="material" class="tongyong" >
						<option value="" selected="selected">全部</option>
						<c:forEach items="${material}" var="material">
							<option value="${material.id}">${material.fullname}</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>规格</span></th>
				<td colspan="3">
					<input type="text" name="size"class="ticai" />
				</td>
				
				<th><span>目录编号</span></th>
				<td>
					<input type="text" name="catalogue"/>
				</td>
			</tr>
			<tr><td colspan="8">
				<table>
					<tr>
						<td width='20%'>馆藏代码</td>
						<td width='30%'>
							<input type="text" >
						</td>
						<td rowspan="2">
							<span class="red">*</span> (公司客户填此栏)
						</td>
						<td><input type="button"  id="confirmBtn" /></td>
					</tr>
					<tr>
						<td width='20%'>藏品名称</td>
						<td width='30%'>
							<input type="text" >
						</td>
						<td><input type="reset"  id="btn_reset" /></td>
					</tr>
				</table>
			</td></tr>
		</table>
	</form>
	<div id="result">
		<table id="tab5">
			<thead>
				<tr id="firstTr">
					<th>
						<input type="checkbox" id="checkedAll" name="checkedAll" />
					</th>
					<th>目录编号</th>
					<th>朝代</th>
					<th>名称</th>
					<th>面值</th>
					<th>材质</th>
					<c:if test="${udRequestType=='HEAR'}">
						<th>珍稀度</th>
					</c:if>
					<th>规格</th>
					<th>版别</th>
					<th style="display: none;">估价</th>
				</tr>
			</thead>
			<tbody>
			<script type="text/template" >
				<tr id='tr{index}' >
					<td id='id' class='hiddenThis'>{{id}}</td>
					<td>
						<input type='checkbox' name='choice'/>
					</td>
					<td id='catalogue'>{{catalogue}}</td>
					<td id='guojia' class='hiddenThis'>{{guojia}}</td>
					<td id='dynastyname'>{{dynastyname}}</td>
					<td id='fullsubject'>{{fullsubject}}</td>
					<td id='facevaluedis'>{{facevaluedis}}</td>
					<td id='caizhi'>{{caizhi}}</td>
					<c:choose>
						<c:when test='${udRequestType == "HEAR"}' >
							<td id='gradename'>{{gradename}}</td>
						</c:when>
						<c:otherwise>
							<td id='gradename' class='hiddenThis'>{{gradename}}</td>
						</c:otherwise>
					</c:choose>
					<td id='size'>{{size}}</td>
					<td id='version'>{{version}}</td>
					<td id='evaluate' class='hiddenThis'>{{evaluate}}</td>
					<td class='hiddenThis'>{{fulltitle}}
						<input type='hidden' id='cointypename' value='{{cointypename}}'/>
						<input type='hidden' id='weight' value='{{weight}}'/>
						<input type='hidden' id='enfullsubject' value='{{enfullsubject}}'/>
						<input type='hidden' id='boxCost' value='{{boxCost}}'/>
					</td>
				<tr>
			</script>
			</tbody>
		</table>
	</div>
	<div class="hiddenThis searchingFlag">
		<span>正在查询，请稍后……</span>
		<img alt="" src="${ctx_images}/load.gif">
	</div>
</div>