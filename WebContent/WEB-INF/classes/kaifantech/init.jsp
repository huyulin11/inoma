<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String contextPath = application.getContextPath();
	String staticPath = contextPath + "/s" ;
	application.setAttribute("ctx", contextPath);
	application.setAttribute("ctx_static", staticPath);
	application.setAttribute("ctx_images", staticPath + "/i");
	application.setAttribute("ctx_js", staticPath + "/j");
	application.setAttribute("ctx_css", staticPath + "/c");
	application.setAttribute("enableDebug",true); // indicate it's in debugging 
	System.out.println("js library location: " + application.getAttribute("ctx_js"));
	System.out.println("TOMcata start");
%>