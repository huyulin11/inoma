<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<c:if test="${reservationTypes!=null}">
	<div hidden>
		<table id="resTypesTab" class="graytab">
			<c:if test="${udRequestType!='VIEW'}">
				<tr>
					<th></th>
					<th>活动编号</th>
					<th>活动名称</th>
					<th>起止时间</th>
					<th>电子券</th>
					<th class="hiddenThis">可优惠次数</th>
					<th class="hiddenThis">已优惠次数</th>
					<th class="hiddenThis">每单可用次数</th>
				</tr>
				<tr class="hiddenThis">
					<td><input type="text" name="reservationtypeid"
						value="${requestReservations.reservationtypeid}" /><input
						type="text" name="couponid"
						value="${requestReservations.couponid}" /></td>
				</tr>
			</c:if>
			<c:forEach var="res" items="${reservationTypes}" varStatus="status">
				<c:if test="${udRequestType!='VIEW'}">
					<tr>
						<td><input type="radio" name="resChoose"
							<c:if test="${res.reservationtypeid==requestReservations.reservationtypeid}">checked</c:if> /></td>
						<td class="reservationtypeid">${res.reservationtypeid}</td>
						<td title="${res.reservationtypeinfo}">${res.reservationtypename}</td>
						<td>${res.starttime}~${res.endtime}</td>
						<td><c:choose>
								<c:when test="${res.needcoupon==1}">
									<c:if
										test="${(res.usetimes==-1||res.usedtimes>=res.usetimes)&&(udRequestType=='ADD'||udRequestType=='EDIT')}">该活动已达到您的使用限制次数，无法再使用
										<input type="text" class="couponid hiddenThis" value="" />
									</c:if>
									<c:if
										test="${(res.usetimes!=-1&&res.usedtimes<res.usetimes)||!(udRequestType=='ADD'||udRequestType=='EDIT')}">
										<input type="text" class="couponid" placeholder="请输入电子券编号"
											<c:if test="${res.reservationtypeid==requestReservations.reservationtypeid}">value="${requestReservations.couponid}"</c:if> />
									</c:if>
								</c:when>
								<c:otherwise>不需要</c:otherwise>
							</c:choose></td>
						<td class="hiddenThis"><c:choose>
								<c:when test="${res.usetimes==-1}">无限次数</c:when>
								<c:otherwise>${res.usetimes}</c:otherwise>
							</c:choose></td>
						<td class="hiddenThis">${res.usedtimes}</td>
						<td class="requestusetimes hiddenThis">${res.requestusetimes}</td>
						<td class="reservfeetype hiddenThis">${res.reservfeetype}</td>
						<td class="reservsubtype hiddenThis">${res.reservsubtype}</td>
						<td class="needcoupon hiddenThis">${res.needcoupon}</td>
					</tr>
				</c:if>
				<c:if
					test="${udRequestType=='VIEW' && res.reservationtypeid==requestReservations.reservationtypeid}">
					<tr>
						<th>活动编号</th>
						<th>活动名称</th>
						<th>起止时间</th>
						<th>电子券</th>
					</tr>
					<tr>
						<td class="reservationtypeid">${res.reservationtypeid}</td>
						<td title="${res.reservationtypeinfo}">${res.reservationtypename}</td>
						<td>${res.starttime}~${res.endtime}</td>
						<td><c:choose>
								<c:when test="${res.needcoupon==1}">
									<c:if
										test="${res.reservationtypeid==requestReservations.reservationtypeid}">${requestReservations.couponid}</c:if>
								</c:when>
								<c:otherwise>不需要</c:otherwise>
							</c:choose></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</c:if>
