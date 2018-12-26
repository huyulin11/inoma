<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 生成文件版本号，用于控制缓存问题
	同一Request请求下fv值相同： 优点假如同一页面内有js、css引用重复可利用403减少重复下载
--%>
<% 
	// System.err.println(application.getAttribute("enableDebug"));
	if (request.getAttribute("fv") == null){ // 同一request防文件重复下载
		if(new Boolean(true).equals(application.getAttribute("enableDebug"))){
			Integer random = (int)(Math.random()*1000);
	    	request.setAttribute("fv", "?r=".concat(random.toString()));
		}
	}
%>