<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en" class="app">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<nav class="nav-primary hidden-xs">
	<ul class="nav">
		<c:forEach var="key" items="${menuTree}" varStatus="s">
			<!-- <li class="active"> 某一项展开-->
			<li <c:if test="${s.index==0}">class="active"</c:if>><a
				<c:if test="${fn:length(key.children)==0}">
							data-tip="${key.name},${key.name},${key.resUrl}?id=${key.id},${key.openType}"</c:if>
				<c:if test="${s.index==0}">class="active"</c:if>> <c:if
						test="${fn:length(key.children)>0}">
						<i class="fa icon"> <c:if test="${s.index==0}">
								<b class="bg-danger"></b>
							</c:if> <c:if test="${s.index==1}">
								<b class="bg-warning"></b>
							</c:if> <c:if test="${s.index==2}">
								<b class="bg-primary"></b>
							</c:if> <c:if test="${s.index==3}">
								<b class="bg-info"></b>
							</c:if> <c:if test="${s.index==4}">
								<b class="bg-success"></b>
							</c:if>
						</i>
						<span class="pull-right"> <i class="fa fa-angle-down text"></i>
							<i class="fa fa-angle-up text-active"></i></span>
					</c:if> <span>${key.name}</span>
			</a>
				<ul class="nav lt">
					<c:forEach var="kc" items="${key.children}">
						<li class="active"><a class="active"
							data-tip="${key.name},${kc.name},${kc.resUrl}?id=${kc.id},${kc.openType}">
								<i class="fa fa-angle-right"></i> <span>${kc.name}</span>
						</a></li>
					</c:forEach>
				</ul></li>
		</c:forEach>
	</ul>
</nav>