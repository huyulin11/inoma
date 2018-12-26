<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<!--基本信息 -->
<jsp:include page="form_basicInfo.jsp" />
<!--送评方式 -->
<jsp:include page="form_applytype.jsp" />
<!--取件方式 -->
<jsp:include page="form_getWay.jsp" />
<!--已选择币列表 -->
<jsp:include page="choosedlist/choosedCoinList.jsp" />
<%-- <c:choose> --%>
<%-- 	<c:when test="${entitytype=='1'}"> --%>
<%-- 		<jsp:include page="choosedlist/choosedCoinList.jsp" /> --%>
<%-- 	</c:when> --%>
<%-- 	<c:when test="${entitytype=='2'}"> --%>
<%-- 		<jsp:include page="choosedlist/choosedBillList.jsp" /> --%>
<%-- 	</c:when> --%>
<%-- 	<c:when test="${entitytype=='3'}"> --%>
<%-- 		<jsp:include page="choosedlist/choosedAncientCoinList.jsp" /> --%>
<%-- 	</c:when> --%>
<%-- 	<c:when test="${entitytype=='4'}"> --%>
<%-- 		<jsp:include page="choosedlist/choosedStampList.jsp" /> --%>
<%-- 	</c:when> --%>
<%-- 	<c:when test="${entitytype=='5'}"> --%>
<%-- 		<jsp:include page="choosedlist/choosedMechanismCoinList.jsp" /> --%>
<%-- 	</c:when> --%>
<%-- </c:choose> --%>
<!--收费 -->
<%-- <jsp:include page="form_cost.jsp" /> --%>

<!--优惠券 -->
<%-- <jsp:include page="form_coupon.jsp" /> --%>

<!--其它 -->
<%-- <jsp:include page="form_other.jsp" /> --%>
