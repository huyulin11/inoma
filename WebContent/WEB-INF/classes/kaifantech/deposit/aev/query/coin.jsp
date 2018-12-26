<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<div id="check" style="display: none;">
	<form action="" id="coinSForm">
		<span class="dialogTitle">添加</span>
		<hr>
		<table id="CoinSearchTable">
			<tr >
				<th><span>年号</span></th>
				<td><select id="year" name="year">
						<option value="" selected="selected">全部</option>
					</select>
				</td>
				
				<th><span>国家/地区</span></th>
				<td><select name="country" class="tongyong">
						<option value="" selected="selected">全部</option>
						<c:forEach items="${countryList }" var="country">
							<option value="${country.id}">${country.name}</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>面值</span></th>
				<td>
					<select name="facevaluedis" class="tongyong" >
						<option value="" selected="selected">全部</option>
						<c:forEach items="${facevalue}" var="facevalue">
							<option value="${facevalue.facevaluedis}">${facevalue.facevaluedis}</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>题材</span></th>
				<td>
					<input type="text" name="fullsubject" class="ticai" />
				</td>
			</tr>
			<tr>
				<th><span>材质</span></th>
				<td><select name="material" class="tongyong">
						<option value="" selected="selected">全部</option>
						<c:forEach items="${material }" var="material">
							<option value="${material.id }">${material.fullname }</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>重量</span></th>
				<td><select class="tongyong" name="munits">
						<option value="" selected="selected">全部</option>
						<c:forEach items="${munits }" var="munits">
							<option value="${munits.id}@${munits.value }">${munits.showValue }
								${munits.danwei }</option>
						</c:forEach>
				</select></td>
				<th><span>制造质量</span></th>
				<td>
					<select class="tongyong" name="mquality">
						<option value="" selected="selected">全部</option>
						<c:forEach items="${mquality }" var="mquality">
							<option value="${mquality.id}">${mquality.fullname }</option>
						</c:forEach>
					</select>
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
					<th><input type="checkbox" id="checkedAll" name="checkedAll" /></th>
					<th>目录编号</th>
					<th>年号</th>
					<th>国家/地区</th>
					<th>材质</th>
					<th>重量</th>
					<th>制造质量</th>
					<th>题材</th>
					<th style="display: none;">版别</th>
					<th>面值</th>
					<th style="display: none;">估价</th>
					<th>成分</th>
					<th style="display: none">title</th>
				</tr>
			</thead>
			<tbody>
			<script type="text/template" >
				<tr id='tr{index}'>
					<td id='id' class='hiddenThis'>{{id}}</td>
					<td>
						<input type='checkbox' name='choice'/>
					</td>
					<td id='catalogue'>{{catalogue}}</td>
					<td id='years'>{{years}}</td>
					<td id='guojia'>{{guojia}}</td>
					<td id='caizhi'>{{caizhi}}</td>
					<td>
						<input type='hidden' id='weight' value='{{weight}}'/>
						{{weightshow}}
					</td>
					<td id='zhiliang'>{{zhiliang}}</td>
					<td id='shortsubject'>{{shortsubject}}</td>
					<td id='version' class='hiddenThis'>{{version}}</td>
					<td id='facevaluedis'>{{facevaluedis}}</td>
					<td id='evaluate' class='hiddenThis'>{{evaluate}}</td>
					<td id='components'>{{components}}</td>
					<td id='amountofissue' class='hiddenThis'>{{amountofissue}}</td>
					<td class='hiddenThis'>{{fulltitle}}
						<input type='hidden' id='cointypename' value='{{cointypename}}'/>
						<input type='hidden' id='enfullsubject' value='{{enfullsubjec}'/>
						<input type='hidden' id='size' value='{{size}}'/>
					</td>
				</tr>
			</script>
			</tbody>
		</table>
	</div>
	<div class="hiddenThis searchingFlag">
		<span>正在查询，请稍后……</span><img alt="" src="${ctx_images}/load.gif">
	</div>
</div>