<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<style type="text/css">
*{margin:0;padding:0;font-family:"微软雅黑";font-size:14px;}
#max {width:600px;height:500px;margin:10px;}
</style>
<script type="text/javascript">

</script>

<%
	String showMenu = "showMenu.json";
%>

<c:set var='showMenu' value='showMenu.json' scope='request' />

<script >
	var urls = {
		'showMenu'		:'showMenu.json' 
	}
</script>


<div id="max">
	<p><font color="green">success！</font></p>
</div>