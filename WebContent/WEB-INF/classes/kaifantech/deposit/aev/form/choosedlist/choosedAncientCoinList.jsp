<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@ page import="java.math.BigDecimal"%>


<div id="list" class="div_review_block">
	<jsp:include
		page="entity.jsp" />
	<div>
		<script type="text/template" id="tab4-tr-template" >
			<tr id='tr{rowId}'>
				<td class='ipc'>{rowId}</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].dynastyname' 
						value='{{dynastyname}}' readonly='readonly' />
				</td>
				<td class='ipc2'>
					<input type='text' style='font-family:eudc;' readonly='readonly'
						name='list[{index}].fullsubject' value='{{shortsubject}}'  /> <%-- TODO --%>
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].facevaluedis' 
						value='{{facevaluedis}}' readonly='readonly' />
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].caizhi' 
						value='{{caizhi}}' readonly='readonly' />
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].zhongliang' 
						value='{{weight}}' readonly='readonly' class='tab_input'/>
				</td>
				<td class='ipc' 
					<c:if test='${udRequestType != "HEAR"}'>hidden="hidden"</c:if> >
					<input type='text' name='list[{index}].gradename' 
						value='{{gradename}}'  
						<c:if test="${request.depositstate <= 1}">
							readonly="readonly"
						</c:if>
					/>
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].size' 
						value='{{size}}'  />
				</td>
				<td class='ipc'>
					<input type='text' name='list[{index}].version' 
						value='{{version}}'  />
				</td>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<td class='ipc'
					<c:if test='${udRequestType != "HEAR"}'>hidden="hidden"</c:if> > <!-- 系统估价 -->
					<input type='text' name='list[{index}].evaluate' 
						value='{{evaluate}}' />
				</td>
				<td class='ipc'> <!-- 用户估价 -->
					<input type='text' autocomplete='off'
						class='tab_input guestappraisalClass' 
						name='list[{index}].guestappraisal' value='0.00' />
					<input type='hidden' name='list[{index}].amountofissue' 
						value='{{amountofissue}}'/>
				</td>
				</c:if>
				
				<td class='ipc'>
					<input type='text' class='tab_input amountClass' 
						name='list[{index}].amount' id='amount' value='1' />
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
					<input type='hidden' name='list[{index}].guojia' 
							value='{{guojia}}' readonly='readonly' />
					<input type='text' name='list[{index}].fulltitle' 
						value='{{fulltitle}}' readonly='readonly' />	
					<input type='hidden' value='{{enfullsubject}}' 
						name='list[{index}].enfullsubject' />
					<input type='hidden' value='{{cointypename}}' 
						name='list[{index}].cointypename' />
					<input type='hidden' name='list[{index}].numindex' value='{rowId}'/>
					<input type='hidden' name='list[{index}].coinid' value='{{id}}' />
					<input type='text' name='list[{index}].boxCost' 
							value='{{boxCost}}'/>
					<input type='hidden' value='{{size}}' 
						name='list[{index}].size' />
					<input type='hidden' value='{{zhongliang}}' 
						name='list[{index}].weightshow' />
				</td>
			</tr>
		</script>
		<table id="tab4">
			<thead><tr>
				<th>行号</th>
				<th>朝代</th>
				<th>名称</th>
				<th>面值</th>
				<th>材质</th>
				<th>重量</th>
				<c:if test="${udRequestType=='HEAR'}">
					<th>珍稀度</th>
				</c:if>
				<th>规格</th>
				<th>版别</th>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<c:if test="${udRequestType=='HEAR'}">
					<th>系统估价</th>
					<th>客户估价</th>
				</c:if>
				<c:if test="${udRequestType!='HEAR'}">
					<th>单枚估价</th>
				</c:if>
				</c:if>
				<th>预约数量</th>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<th>小计估价</th>
				<th>小计评级费</th>
				</c:if>
				<th>操作</th>
			</tr></thead>
			<tbody>
			<c:forEach items="${detail}" var="detail" varStatus="status">
				<tr id="tr${status.index}">
					<td id="rowId" class="bg">${status.index+1}</td>
					<td class='ipc hiddenThis'><input type="text"
						name="list[${status.index}].guojia" value="${detail.guojia}"
						readonly></td>
					<td class='ipc'><input type="text"
						name="list[${status.index}].dynastyname"
						value="${detail.dynastyname}" readonly> <input
						type="hidden" value="${status.index+1}"
						name="list[${status.index}].numindex" /> <input type="hidden"
						id="detailid_${detail.numindex}" value="${detail.id}"
						name="list[${status.index}].id" /> <input type="hidden"
						name="list[${status.index}].coinid" value="${detail.coinid}">
					</td>
					<td class='ipc2'><input type="text"
						name="list[${status.index}].fullsubject"
						value="${detail.fullsubject}" readonly></td>
					<td class='ipc'><input type="text"
						value="${detail.facevaluedis}"
						name="list[${status.index}].facevaluedis" readonly></td>
					<td class="ipc"><input type="text" value="${detail.caizhi}"
						name="list[${status.index}].caizhi" readonly autocomplete="off" /></td>
					<td class="ipc"><input type="text" class="tab_input"
						value="${detail.zhongliang}"
						name="list[${status.index}].zhongliang" /></td>
					<c:if test="${udRequestType=='HEAR'}">
						<td class="ipc"><input type="text" class="tab_input"
							value="${detail.gradename}"
							name="list[${status.index}].gradename" /></td>
					</c:if>
					<c:if test="${udRequestType=='EDIT'}">
						<td class="hiddenThis"><input type="text" class="tab_input"
							value="${detail.gradename}"
							name="list[${status.index}].gradename" /></td>
					</c:if>
					<td class="ipc"><input type="text" class="tab_input"
						value="${detail.size}" name="list[${status.index}].size" /></td>
					<td class="ipc"><input type="text" class="tab_input"
						value="${detail.version}" name="list[${status.index}].version" /></td>
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
					<td class='ipc txtr'><input type="text"
						class="tab_input guestappraisalClass"
						name="list[${status.index}].guestappraisal"
						value="${detail.guestappraisal}" id="evaluate" autocomplete="off" /></td>
					</c:if>
					<td class="ipc"><input type="text" value="${detail.amount}"
						class='amountClass tab_input' name="list[${status.index}].amount"
						id="amount" /></td>
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
						class="downRow" title='下移' /></td>
					<td class='hiddenThis'><input type="hidden"
						value="${detail.enfullsubject}"
						name="list[${status.index}].enfullsubject" /><input type="hidden"
						value="${detail.cointypename}"
						name="list[${status.index}].cointypename" /><input type="hidden"
						value="${detail.weightshow}"
						name="list[${status.index}].weightshow" /><input type='hidden'
						name='list[${status.index}].amountofissue'
						value='${detail.amountofissue}' /> <input type="hidden"
						value="${detail.boxCost}" name="list[${status.index}].boxCost" />
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="remark.jsp" />
</div>