<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
   
<div id="list" class="div_review_block">
	<jsp:include page="entity.jsp" />
	<div>
		<script type="text/template" id="tab4-tr-template" >
			<tr id='tr{rowId}'>
				<td class='ipc'>{rowId}</td>
				<td class='ipc'>
					<input type='hidden' name='list[{index}].numindex' value='{rowId}'/>
					<input type='hidden' name='list[{index}].coinid' value='{{id}}' />
					<input type='text' name='list[{index}].years' 
						value='{{years}}' readonly='readonly' />
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].guojia' 
							value='{{guojia}}' readonly='readonly' />
				</td>
				<td class='ipc2'>
					<input type='text' style='font-family:eudc;' readonly='readonly'
						name='list[{index}].fullsubject' value='{{shortsubject}}'  /> <%-- ? todo --%>
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].facevaluedis' 
						value='{{facevaluedis}}' readonly='readonly' />
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].version' 
						value='{{version}}' />
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].wmk' 
						value='{{wmk}}' readonly='readonly' />
				</td>
				<td class='ipc'>
					<select class='tab_input' name='list[{index}].whetherSample'>
						<option value='1'>是</option>
						<option value='2' selected="selected">否</option>
					</select>
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].blockNum' />
				</td>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<td class='ipc' 
					<c:if test='${udRequestType != "HEAR"}'>hidden</c:if> >
					<input type='text' name='list[{index}].evaluate' 
						value='{{evaluate}}' id='evaluate' />
				</td>
				
				<td class='ipc'> <%-- 用户估价 --%>
					<input type='text' name='list[{index}].guestappraisal'
						value='0.00' id='evaluate'
						autocomplete='off' class='tab_input guestappraisalClass' />
					<input type='hidden' name='list[{index}].amountofissue' 
						value='{{amountofissue}}'/>
				</td>
				</c:if>
				<td class='ipc'><!-- 数量 --> <!-- toDo -->
					<input type='text' class='tab_input amountClass' 
						name='list[{index}].amount' id='amount' value='1'  />
				</td>
				<td class='ipc'><!-- toDo -->
					<select class='tab_input'  
						name='list[{index}].whetherSeries'>
							<option value='2'>否</option>
							<option value='1'>是</option>
					</select>
				</td>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<td class='ipc'>
					<input type='text' name='list[{index}].total2' 
						id='total2' readonly='readonly'/>
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].total1' 
						id='total1' readonly='readonly'/>
				</td>
				</c:if>
				<td class='ipc'>
					<input type='button' class='delete' title='删除'/>
					<input type='button' class='upRow' title='上移'/>
					<input type='button' class='downRow' title='下移'/>
				</td>
				<td class='ipc hiddenThis'>
					<input type='text' name='list[{index}.boxCost' 
						value='{{boxCost}}'/>
				</td>
			</tr>
		</script>
		
		
		<table id="tab4">
			<thead><tr>
				<th>行号</th>
				<th>年号</th>
				<th>国家/地区</th>
				<th>名称</th>
				<th>面值</th>
				<th>版别</th>
				<th>水印</th>
				<th>是否票样</th>
				<th>冠号</th>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<c:if test="${udRequestType=='HEAR'}">
					<th>系统估价</th>
					<th>客户估价</th>
				</c:if>
				<c:if test="${udRequestType!='HEAR'}">
					<th>单枚估价</th>
				</c:if>
				</c:if>
				<th>数量</th>
				<th>是否连号</th>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<th>小计估价</th>
				<th>小计评级费</th>
				</c:if>
				<th>操作</th>
			</tr></thead>
			<tbody>
			<c:forEach items="${detail}" var="detail" varStatus="status">
				<tr id="tr${status.index}">
					<td id="rowId" class='ipc'>${status.index+1}</td>
					<td class='ipc'><input type="text"
						name="list[${status.index}].years" value="${detail.years}"
						readonly> <input type="hidden" value="${status.index+1}"
						name="list[${status.index}].numindex" /> <input type="hidden"
						id="detailid_${detail.numindex}" value="${detail.id}"
						name="list[${status.index}].id" /> <input type="hidden"
						name="list[${status.index}].coinid" value="${detail.coinid}">
					</td>
					<td class='ipc'><input type="text"
						name="list[${status.index}].guojia" value="${detail.guojia}"
						readonly></td>
					<td class='ipc2'><input type="text"
						name="list[${status.index}].fullsubject"
						value="${detail.fullsubject}" readonly></td>
					<td class='ipc'><input type="text"
						value="${detail.facevaluedis}"
						name="list[${status.index}].facevaluedis" readonly></td>
					<td class='ipc'><input type="text" class="tab_input"
						value="${detail.version}" name="list[${status.index}].version" /></td>
					<td class='ipc'><input type="text" value="${detail.wmk}"
						name="list[${status.index}].wmk" readonly autocomplete="off" /></td>
					<td class='ipc'><select
						name="list[${status.index}].whetherSample" class="tab_input">
							<option value="1"
								<c:if test="${detail.whetherSample==1 }">selected='selected'</c:if>>是</option>
							<option value="2"
								<c:if test="${detail.whetherSample==2 }">selected='selected'</c:if>>否</option>
					</select></td>
					<td class='ipc'><input type="text" class="tab_input"
						value="${detail.blockNum}" name="list[${status.index}].blockNum" /></td>
						
					<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
					<c:if test="${udRequestType=='HEAR'}">
						<td class='ipc bg'><input type="text"
							value="${detail.evaluate}" name="list[${status.index}].evaluate"
							readonly="readonly" /></td>
					</c:if>
					<c:if test="${udRequestType!='HEAR'}">
						<input type="hidden" value="${detail.evaluate}"
							name="list[${status.index}].evaluate" readonly />
					</c:if>
					<td class='ipc'><input type="text"
						class="tab_input guestappraisalClass"
						name="list[${status.index}].guestappraisal"
						value="${detail.guestappraisal}" id="evaluate" autocomplete="off" />
						<input type='hidden' name='list[${status.index}].amountofissue'
						value='${detail.amountofissue}' /></td>
					</c:if>
						
					<td class='ipc'><span><input type="text"
							value="${detail.amount}" id="amount"
							class='amountClass tab_input' name="list[${status.index}].amount" /></span></td>
					
					<td class='ipc'><select
						name="list[${status.index}].whetherSeries" class="tab_input">
							<option value="1"
								<c:if test="${detail.whetherSeries==1 }">selected='selected'</c:if>>是</option>
							<option value="2"
								<c:if test="${detail.whetherSeries==2 }">selected='selected'</c:if>>否</option>
					</select></td>
					
					<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
					<td class='ipc'><input type="text"
						value="${detail.totalevaluate}"
						name="list[${status.index}].total2" readonly></td>
					<td class='ipc'><input type="text"
						value="${detail.totalreqcost}" name="list[${status.index}].total1"
						readonly></td>
					</c:if>
					
					<td class='ipc'><input type="button" class="delete" title='删除' /><input
						type="button" class="upRow" title='上移' /><input type="button"
						class="downRow" title='下移' /><input type="hidden"
						value="${detail.enfullsubject}"
						name="list[${status.index}].enfullsubject" /> <input
						type="hidden" value="${detail.cointypename}"
						name="list[${status.index}].cointypename" /> <input type="hidden"
						value="${detail.weightshow}"
						name="list[${status.index}].weightshow" /> <input type="hidden"
						value="${detail.boxCost}" name="list[${status.index}].boxCost" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<input type="hidden" id="hidden-txt-size" value="${detail.size()}" />
		<c:if test="${udRequestType=='HEAR'}">
			<div id="div-sub-datas" style="display: none;">
				<table id="tab-sub-datas">
					<c:forEach items="${coinList}" var="reqCoin" varStatus="status">
						<tr id="retr_${reqCoin.id}">
							<td><input type="text"
								name="coinlst[${status.index}].editBlockNum"
								value="${reqCoin.blockNum}"></td>
							<td><input type="text" name="coinlst[${status.index}].id"
								value="${reqCoin.id}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="text-align: right; font-size: 14px">
				<a id="editBlockNums">纸币详情</a>
			</div>
			<div id="div-billdis" class="div-billdis">
				<div class="div-dis-1">
					<h3>纸钞冠号添加</h3>
					<table id="tab-editBlockNums">
						<tr>
							<th width="5%">行号</th>
							<th width="15%">钱币编号</th>
							<th width="">名称</th>
							<th width="15%">冠号</th>
							<th width="12%">操作</th>
							<th style="display: none;"></th>
						</tr>
						<c:forEach items="${coinList}" var="reqCoin" varStatus="status">
							<tr id="tr_${reqCoin.id}">
								<td>${status.index+1}</td>
								<td>${reqCoin.coincode}</td>
								<td>${reqCoin.fullsubject}</td>
								<td><input type="text" name="tmpEditBlockNum"
									class="input-editBlockNum" value="${reqCoin.blockNum}"></td>
								<td class="hiddenThis"><input type="hidden" name="tmpId"
									value="${reqCoin.id}" /></td>
								<td><a onclick="rv.blockNum.save('${reqCoin.id}');">保存</a> <a
									onclick="rv.blockNum.generate('${reqCoin.id}','${status.index}');">生成冠号</a></td>
								<td style="display: none;">${reqCoin.id}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="div-subdata" id="div-subdata">正在提交...</div>
			</div>
		</c:if>
	</div>
	<jsp:include page="remark.jsp" />
</div>