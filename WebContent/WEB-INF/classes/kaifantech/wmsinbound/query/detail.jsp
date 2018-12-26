<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="${ctx_css}/wmsinbound/detail.css"></link>
</head>
<body>
<div id="div_content" class="divcontent">
<div id="content">
	<div class="header">
	   <img class="logo" src="/s/i/wmsinbound/logo2.png"></img>
	      <h1>
	       源泰评级入库详细
	      </h1>
	      <span><strong>
		   ${nowDate }</strong>
	     </span>
	</div>
	<div id="div_print">
	入库单号：<input type="text" id="inboundcode" value="${inboundcode }">
	<input type="button" id="confirminbound" value="确认">
	<input type="button" id="printinbound" value="打印">
	</div>
	<div class="main">
	<div class="code">
	<p>
		<img src="<%=request.getContextPath() %>/barcode?msg=${inboundcode } &BARCODE_TYPE=code128" />
	</p>
	</div>	
    <table>
    		<tr>
    			<th>合同编号</th>
    			<th>箱数</th>
    		</tr>
    		<c:forEach var="item" items="${wmsInbound }" >
    			<tr>
    				<td>${item.packageid }</td>
    				<td>${item.amount }</td>
    			</tr>
    		</c:forEach>
    </table>
      <ul>
    	<li>
    	<span>质控（签字）：</span>	
    	</li>
    	<li>
    	<span>物流（签字）：</span>	
    	</li>
    	<li>
    	<span>日期：</span>	
    	</li>
    	<li>
    	<span>日期：</span>	
    	</li>
      </ul>
	</div>
	</div>
	
	</div>
</body>
<script type="text/javascript" src="/s/j/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#confirminbound").click(function(){
			var inboundcode = $("#inboundcode").val();
			window.location.href="/wms/inbound/detail.shtml?inboundcode="+inboundcode;
		});
		$("#printinbound").click(function(){
			$("#div_print").hide();
			window.print();
			$("#div_print").show();
		});
	})
</script>
</html>