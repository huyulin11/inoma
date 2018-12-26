<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<div id="check" style="display: none;">
	<form>
		<span class="dialogTitle">添加</span>
		<hr />
		<table id="CoinSearchTable">
			<tr >
				<th><span>年号</span></th>
				<td>
					<input type="text" name="year" />
				</td>
				
				<th><span>国家/地区</span></th>
				<td><select name="guojia" class="tongyong">
						<option value="" selected="selected">全部</option>
						<c:forEach items="${countryList }" var="country">
							<option value="${country.id}">${country.name}</option>
						</c:forEach>
					</select>
				</td>
				
				<th><span>面值</span></th>
				<td>
					<input type="text" name="facevaluedis" />
				</td>
				
				<th><span>版别</span></th>
				<td>
					<input type="text" name="version" />
				</td>
				
				<td></td>
			</tr>
			<tr >
				<th><span>水印</span></th>
				<td>
					<input type="text" name="wmk"/>
				</td>
				
				<th><span>名称</span></th>
				<td colspan="3">
					<input type="text" name="fullname" class="ticai" />
				</td>
				
				<th><span>目录编号</span></th>
				<td>
					<input type="text" name="billnum"/>
				</td>
			</tr>
			<tr >
				<th><span>地名</span></th>
				<td>
					<input type="text" name="placenames"/>
				</td>
				
				<th><span>签字</span></th>
				<td>
					<input type="text" name="sign" />
				</td>
				
				<th><span>图案</span></th>
				<td>
					<input type="text" name="pattern" />
				</td>
				
				<th><span>刷色</span></th>
				<td>
					<input type="text" name="color"/>
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
					<th>名称</th>
					<th>面值</th>
					<th>尺寸</th>
					<th>版别</th>
					<th>水印</th>
					<th>地名</th>
					<th>签字</th>
					<th>图案</th>
					<th>刷色</th>
					<th>票面底纹</th>
					<th>备注</th>
					<th style="display: none;">估价</th>
				</tr>
			</thead>
			<tbody>
			<script type="text/template" >
				<tr id='tr{index}'>
					<td id='id' class='hiddenThis'>{{id}}</td>
					<td><input type='checkbox' name='choice'/></td>
					<td id='billnum'>{{billnum}}</td>
					<td id='years'>{{years}}</td>
					<td id='guojia'>{{guojia}}</td>
					<td id='fullsubject'>{{fullsubject}}</td>
					<td id='facevaluedis'>{{facevaluedis}}</td>
					<td id='size'>{{size}}</td>
					<td id='version'>{{version}}</td>
					<td id='wmk'>{{wmk}}</td>
					<td id='placenames'>{{placenames}}</td>
					<td id='sign'>{{sign}}</td>
					<td id='pattern'>{{pattern}}</td>
					<td id='color'>{{color}}</td>
					<td id='shading'>{{shading}}</td>
					<td id='remarks'>{{remarks}}</td>
					<td id='evaluate' class='hiddenThis'>{{evaluate}}
						<input type='hidden' id='boxCost' value='{{boxCost}}'/>
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