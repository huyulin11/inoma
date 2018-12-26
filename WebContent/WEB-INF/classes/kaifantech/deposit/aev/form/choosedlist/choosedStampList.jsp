<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ taglib uri="/WEB-INF/tag/sysDicValue.tld" prefix="sysDic"%>


<div id="list" class="div_review_block">
	<jsp:include
		page="entity.jsp" />
	<div>
		<script type="text/template" id="tab4-tr-template" >
			<tr id='tr{rowId}' class='tr_{{id}}' >
				<td class='ipc rowId'>{rowId}</td>
				<td class='ipc'>
					<input type='hidden' name='list[{index}].numindex' value='{rowId}'/>
					<input type='hidden' name='list[{index}].coinid' 
						value='{{id}}'/>{{zhino}}
				</td>
				<td class='ipc'>{{guojia}}</td>
				<td class='ipc'>{{issuetime}}</td>
				<td class='ipc'>{{issuedate}}</td>
				<td class='ipc2 fullsubject'>{{fullsubject}}</td>
				<td class='ipc'>{{facevaluedis}}</td>
				<td class='ipc'>{{color}}</td>
				<td class='ipc'>
					<select class="tab_input" name="list[0].stampjointype" >
						<sysDic:option dicType="STAMP_JOIN_TYPE" />
					</select>
				</td>
				<c:if test='${param.dm == "true"}' >
				<c:if test='${udRequestType == "HEAR"}' >
					<td class='ipc'>
						<input type='text' name='list[{index}].evaluate' 
							value='{{evaluate}}' id='evaluate' readonly/>
					</td>
				</c:if>
				<td class='ipc' title='更改估价时如果需要对应明细数据中的估价一并改动，/
						可以试试先将估价改为0，然后再改成期望的估价'>
					<input type='text' name='list[{index}].guestappraisal' value='0.00' 
						id='evaluate' autocomplete='off' 
						class='tab_input guestappraisalClass' />
				</c:if>
				<td class='ipc'>
					<input type='text' class='tab_input amountClass' 
						name='list[{index}].amount' id='amount' value='1' />
				</td>
				<c:if test='${param.dm == "true"}' >
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
					<c:if test='${param.dm == "true"}'><a class='coinDetail' title='详细'>详细</a></c:if>
					<input type='button' class='delete' title='删除'/>
					<input type='button' class='upRow' title='上移'/>
					<input type='button' class='downRow' title='下移'/>
				</td>
				
				<td class='ipc hiddenThis'>
					<c:if test='${udRequestType != "HEAR"}' >
						<input type='hidden' name='list[{index}].evaluate' 
								value='{{evaluate}}' id='evaluate' />
					</c:if>
					<input type='text' name='list[{index}].boxCost' 
						value='{{boxCost}}'/>
				</td>
				<td class='hiddenThis' id='issuingquantity'>{{issuingquantity}}</td>
			</tr>
		</script>
		<table id="tab4">
			<thead><tr>
				<th width="4%">行号</th>
				<th width="7%">志号</th>
				<th width="5%">国家/地区</th>
				<th width="5%">时期</th>
				<th width="5%">发行日期</th>
				<th>名称</th>
				<th width="5%">面值</th>
				<th width="5%">颜色</th>
				<th width="5%">联票方式</th>
				<c:if test='${param.dm == "true"}' >
				<c:if test="${udRequestType=='HEAR'}">
					<th width="7%">系统估价</th>
					<th width="7%">客户估价</th>
				</c:if>
				<c:if test="${udRequestType!='HEAR'}">
					<th width="8%">单枚估价</th>
				</c:if>
				</c:if>
				<th width="7%">预约数量</th>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<th width="7%">小计估价</th>
				<th width="8%">小计评级费</th>
				</c:if>
				<th width="8%">操作</th>
			</tr></thead>
			<tbody>
			<c:forEach items="${detail}" var="detail" varStatus="status">
				<tr id="tr${status.index}">
					<td class='ipc rowId'>${status.index+1}</td>
					<td class='ipc' title="${detail.zhino}">${detail.zhino}<input
						type="hidden" value="${status.index+1}"
						name="list[${status.index}].numindex" /> <input type="hidden"
						id="detailid_${detail.numindex}" value="${detail.id}"
						name="list[${status.index}].id" /> <input type="hidden"
						name="list[${status.index}].coinid" value="${detail.coinid}"></td>
					<td class='ipc'>${detail.guojia}</td>
					<td class='ipc'>${detail.issuetime}</td>
					<td class='ipc'>${detail.issuedate}</td>
					<td class='ipc2 fullsubject' title="${detail.fullsubject}">${detail.fullsubject}</td>
					<td class='ipc'>${detail.facevaluedis}</td>
					<td class='ipc'>${detail.color}</td>
					<td class='ipc'><select
						name="list[${status.index}].stampjointype" class="tab_input">
							<sysDic:option dicType="STAMP_JOIN_TYPE"
								dicValue="${detail.stampjointype}" allowOuter="true"
								outerName="**dicValue** 连" />
					</select></td>
					<c:if test='${param.dm == "true"}' >
					<c:if test="${udRequestType=='HEAR'}">
						<td class='ipc'><input type="text" value="${detail.evaluate}"
							name="list[${status.index}].evaluate" readonly="readonly" /></td>
					</c:if>
					<c:if test="${udRequestType!='HEAR'}">
						<input type="hidden" value="${detail.evaluate}"
							name="list[${status.index}].evaluate" readonly />
					</c:if>
					<td class='ipc' title='更改估价时如果需要对应明细数据中的估价一并改动,/
						可以试试先将估价改为0，然后再改成期望的估价'>
						<input type="text"
						class="tab_input guestappraisalClass"
						name="list[${status.index}].guestappraisal"
						value="${detail.guestappraisal}" id="evaluate" autocomplete="off" />
						<input type='hidden' name='list[${status.index}].amountofissue'
						value='${detail.amountofissue}' /></td>
					</c:if>
					
					<td class='ipc'><span><input type="text"
							value="${detail.amount}" id="amount"
							class='amountClass tab_input' name="list[${status.index}].amount" /></span></td>
					<c:if test='${param.dm == "true"}' >
					<td class='ipc'><input type="text"
						value="${detail.totalevaluate}"
						name="list[${status.index}].total2" readonly></td>
					<td class='ipc'><input type="text"
						value="${detail.totalreqcost}" name="list[${status.index}].total1"
						readonly></td>
					</c:if>
					<td class='hiddenThis' id='issuingquantity'>${detail.issuingquantity}</td>
					<td class='ipc'><c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%><a class="coinDetail" title='详细'>详细</a></c:if><input
						type="button" class="delete" title='删除' /><input type="button"
						class="upRow" title='上移' /><input type="button" class="downRow"
						title='下移' />
						<input type="hidden" value="${detail.enfullsubject}"
						name="list[${status.index}].enfullsubject" /><input type="hidden"
						value="${detail.cointypename}"
						name="list[${status.index}].cointypename" /><input type="hidden"
						value="${detail.weightshow}"
						name="list[${status.index}].weightshow" /><input type="hidden"
						value="${detail.boxCost}" name="list[${status.index}].boxCost" />
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<input type="text" class="hiddenThis" value="0" name="stampjointypeN"
			data-crtrow="0" id="stampjointypeN" />
	</div>
	<jsp:include page="remark.jsp" />
</div>

<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
<div class="hiddenThis detailStampInfoTab" id="detailStampInfoTab">
	<table id="tabDetailHead" class="tabDetail">
		<tr>
			<th>所有</th>
		</tr>
	</table>
	<div id="detailInfo">
		<script type="text/template" id="datail-tr-template">
			<tr id='tr{rowId}-{detailRowId}' class='tr_{{id}}' >
				<td class='ipc rowId'>{rowId}-{detailRowId}</td>
				<td class='ipc'></td>
				<td class='ipc'>
					<input type='hidden' name='coinlst[{index}].coinid' value='{{id}}'/>{{zhino}}</td>
				<td class='ipc2 fullsubject'>{{fullsubject}}</td>
				<td class='ipc'>{{facevaluedis}}</td>
		
				<td class='ipc stampjointype'>单枚</td>
				<td class='ipc'>
					<select class='tab_input' name='coinlst[{index}].coincovernewold'>
						<sysDic:option dicType="COVERNEWOLD" />
					</select>
				</td>
				<td class='ipc'>
					<input type='text'  class='tab_input' name='coinlst[{index}].coinremark' value='' />
				</td>
				<td class='ipc'>
					<textarea name='coinlst[{index}].coinmottoShow' value='' readonly  >
					</textarea>
					<input type='hidden' name='coinlst[{index}].coinmotto' readonly>
				</td>
				<td class='ipc'>
					<input type='text' name='coinlst[{index}].coinnum' value='{{issuingquantity}}×1'  readonly='readonly' />
				</td>
				<td class='ipc'>
					<select class='tab_input' name='coinlst[{index}].coinboxid'>
						<sysDic:option dicType="STAMP_BOX_TYPE" />
					</select>
				</td>
				<c:if test='${udRequestType == "HEAR"}' >
					<td class='ipc'>
						<input type='text' name='coinlst[{index}].evaluate' 
							value='{{evaluate}}' id='evaluate' readonly />
					</td>
				</c:if>
				
				<td class='ipc'>
					<input type='text' name='coinlst[{index}].coinevaluate'
						value='0.00'  id='evaluate' autocomplete='off' 
						class='tab_input guestappraisalClass' />
				<td class='ipc'>
					<input type='text' name='coinlst[{index}].reqcost'
						id='reqcost' readonly='readonly'/>
				</td>
			</tr>
		</script>
		<table id="tabDetail" class="tabDetail">
			<tr>
				<th width="4%">行号</th>
				<th>鉴品编号</th>
				<th>志号</th>
				<th>名称</th>
				<th width="7%">面值</th>
				<th width="7%">联票方式</th>
				<th>新旧盖</th>
				<th width="7%">说明</th>
				<th width="14%">铭记情况</th>
				<th>枚数</th>
				<th>件型</th>
				<c:if test='${param.dm == "true"}'> <%-- dm: develop mode --%>
				<c:if test="${udRequestType=='HEAR'}">
					<th>系统估价</th>
				</c:if>
				<th>估价</th>
				<th>单件评级费</th>
				</c:if>
			</tr>
			<c:forEach items="${coinDtl}" var="coinDtl" varStatus="status">
				<tr id="tr${status.index}" class="tr_${coinDtl.coinid}">
					<td class='ipc rowId'>${status.index+1}</td>
					<td class='ipc'>${coinDtl.coincode}</td>
					<td class='ipc'>${coinDtl.zhino}</td>
					<td class='ipc2 fullsubject'>${coinDtl.fullsubject}</td>
					<td class='ipc'>${coinDtl.facevaluedis}</td>
					<td class='ipc stampjointype'><sysDic:value
							dicType="STAMP_JOIN_TYPE" dicValue="${coinDtl.coinstampjointype}"
							allowOuter="true" outerName="**dicValue** 连" /></td>
					<td class='ipc'><select
						name="coinlst[${status.index}].coincovernewold" class="tab_input">
							<sysDic:option dicType="COVERNEWOLD"
								dicValue="${coinDtl.coincovernewold}" />
					</select></td>
					<td class='ipc'><input type="text" class="tab_input"
						value="${coinDtl.coinremark}"
						name="coinlst[${status.index}].coinremark"></td>
					<td class='ipc'><textarea
							name="coinlst[${status.index}].coinmottoShow" readonly="readonly"><sysDic:value
								dicType="STAMP_MOTTO" dicValue="${coinDtl.coinmotto}" /></textarea><input
						type="hidden" value="${coinDtl.coinmotto}"
						name="coinlst[${status.index}].coinmotto" readonly></td>
					<td class='ipc'><input type="text" value="${coinDtl.coinnum}"
						name="coinlst[${status.index}].coinnum" readonly></td>
					<td class='ipc'><select
						name="coinlst[${status.index}].coinboxid" class="tab_input">
							<sysDic:option dicType="STAMP_BOX_TYPE"
								dicValue="${coinDtl.coinboxid}" />
					</select></td>
					<c:if test="${udRequestType=='HEAR'}">
						<td class='ipc' >
							<input type="text" value="${coinDtl.evaluate}"
								name="coinlst[${status.index}].evaluate" readonly="readonly" />
						</td>
					</c:if>
					<td class='ipc'><input type="text"
						class="tab_input guestappraisalClass"
						name="coinlst[${status.index}].coinevaluate"
						value="${coinDtl.coinevaluate}" id="coinevaluate"
						autocomplete="off" /></td>
					<td class='ipc'><input type="text"
						name="coinlst[${status.index}].reqcost" value="${coinDtl.reqcost}"
						readonly></td>
					<td class='hiddenThis'><input type="hidden"
						name="coinlst[${status.index}].coinid" value="${coinDtl.coinid}"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class=" coinmottolist" id="coinmottolist" data-crtrow="0-0">
		<ul id="tmpcoinmottolist">
			<sysDic:multUl checkboxName="tmpcoinmotto" dicType="STAMP_MOTTO" />
		</ul>
	</div>
</div>
</c:if>

<div id="fade" class="black_overlay">
	<img alt="" src="${ctx_images}/loading2.gif">
</div>