<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/coin.css" type="text/css" rel="stylesheet">

<title>钱币信息</title>
</head>
<body>
	<div id="main" class="main">
		<div id="left" class="left">
			<div id="left_number" class="left_number">
				<input type="text" size="25" value="900000009001"/>&nbsp;&nbsp;&nbsp;<input type="button" value="查找"/>
			</div>
			<div id="left_img" class="left_img">
				<div id="showimg" class="showimg">
					<a href=""><img alt="" src="images/coin_01.jpg" class="imgcontro"></a>
				</div>
				<div id="" class="imgscrolling">
					<!-- <a href="">上一张</a><a href="">下一张</a> -->
					<div id="" class="changebtn"><h2>〈</h2></div>
					<div id="smallimg" class="smallimg">1</div>
					<div id="smallimg" class="smallimg">2</div>
					<div id="smallimg" class="smallimg">3</div>
					<div id="" class="changebtn"><h2>〉</h2></div>
				</div>
			</div>
		</div>
		<div id="right" class="right">
			<table cellpadding="20" cellspacing="0" id="" class="">
				<tr>
					<td width="80px">国家/地区</td>
					<td  width="200px"><input type="text" value="中国" readonly="readonly" size="25"/></td>
					</tr>
				<tr>
					<td width="80px">年份</td>
					<td width="200px"><input type="text" value="1949" readonly="readonly" size="25"/></td>
					</tr>
				<tr>
					<td>主题</td>
					<td><input type="text" value="中华人民共和国成立" readonly="readonly" size="25"/></td>
				</tr>
				<tr>
					<td>材质</td>
					<td><input type="text" value="金" readonly="readonly" size="25"/></td>
				</tr>
				<tr>
					<td>重量</td>
					<td><input type="text" value="1盎司" readonly="readonly" size="25"/></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>