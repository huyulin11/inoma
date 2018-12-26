<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>


<div class="baoshang">
	<div class="sdgshang">
		<div class="span">
			<span> 托管物品类型： <c:choose>
					<c:when test="${udRequestType=='ADD'}">
						<select id="entitytypeSelect" name="depositMainBean.entitytype">
							<optgroup label="切换托管单类型">
								<c:forEach items="${entitytypelist}" var="entitytypeitem">
									<option value="${entitytypeitem.key}"
										<c:if test="${entitytype==entitytypeitem.key}">selected="selected"</c:if>>${entitytypeitem.value}</option>
								</c:forEach>
							</optgroup>
						</select>
					</c:when>
					<c:otherwise>
						<c:forEach items="${entitytypelist}" var="entitytypeitem">
							<c:if test="${entitytype==entitytypeitem.key}">
					${entitytypeitem.value}
				</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</span>
		</div>
	</div>
</div>
