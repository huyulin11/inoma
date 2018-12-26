<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>

<c:if test="${udRequestType=='HEAR'}">
	<div id="addedcoininfo"
		style="font-size: 15px; word-wrap: break-word; display: none;">
		<table
			style="border: 1px solid black; border-collapse: collapse; width: 720px; margin-left: 25px;">
			<tr class="addinfotr">
				<th scope="row"
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; width: 140px; padding: 10px;">申请单编号</th>
				<td
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; padding: 10px;">${deposit.depositMainBean.innerno}</td>
			</tr>
			<tr class="addinfotr">
				<th scope="row"
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; padding: 10px;">托管清单补充信息</th>
				<td
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; height: 300px; padding: 10px;">${deposit.depositMainBean.addedcoinremark}</td>
			</tr>
			<tr class="addinfotr">
				<th scope="row"
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; padding: 10px;">打印人</th>
				<td
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; padding: 10px;">employeename</td>
			</tr>
			<tr class="addinfotr">
				<th scope="row"
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; padding: 10px;">打印时间</th>
				<td
					style="word-break: break-all; word-wrap: break-word; border: 1px solid; padding: 10px;"
					id="nowTime">null</td>
			</tr>
		</table>
	</div>
</c:if>

<c:if
	test="${!((udRequestType=='HEAR'||udRequestType=='VIEW')&&(deposit.depositMainBean.addedcoinremark==''||deposit.depositMainBean.addedcoinremark==null))}">
		<div>
		<br><span class="tabSecondTitle">托管清单补充信息</span>
		<c:if test="${udRequestType=='HEAR'}">
			<input id="reqaddedcoinPrint" type="button" value="打印送评清单补充信息"
				onclick="printAddedcoinremark('${deposit.depositMainBean.innerno}');" />
		</c:if>
		<textarea name="depositMainBean.addedcoinremark" id="addedcoinremark"
			placeholder="如无法找到（送评的币/章/邮票）数据，可在此做详细地描述" title="送评清单补充信息"
			<c:if test="${udRequestType=='HEAR'}">
			disabled="disabled"
		</c:if>>${deposit.depositMainBean.addedcoinremark}</textarea>
	</div>
</c:if>