<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<table id="tab4" class="tab4">
	<tr>
		<th>行号</th>
		<th>国家</th>
		<th>年份</th>
		<th>名称</th>
		<th>面值</th>
		<th>材质</th>
		<th>重量</th>
		<th>规格</th>
		<th>版别</th>
		<th>单枚估价</th>
		<th>数量</th>
		<th>小计估价</th>
		<th>小计评级费</th>
	</tr>
	<c:forEach items="${detail}" var="detail" varStatus="status">
		<tr id="tr${detail.numindex}">
			<td id="rowId">${status.index+1}</td>
			<td class='hiddenThis'>
				<input type="text"
				name="list[${status.index}].years" value="${detail.years}"
				readonly autocomplete="off"/> 
				<input type="hidden" value="${detail.numindex}"
				name="list[${detail.numindex-1}].numindex" autocomplete="off"/> <input
				type="hidden" id="detailid_${detail.numindex}"
				value="${detail.id}" name="list[${detail.numindex-1}].id" autocomplete="off"/> <input
				type="hidden" name="list[${detail.numindex-1}].coinid"
				value="${detail.coinid}" autocomplete="off"/>
			</td>
			<td class='ipc'>
				<input type="text"
				name="list[${status.index}].guojia" value="${detail.guojia}"
				readonly autocomplete="off"/>
			</td>
			<td class='ipc'>
				<input type="text"
				name="list[${status.index}].years" value="${detail.years}"
				readonly autocomplete="off"/>
			</td>
			<td class='ipc2'>
				<input type="text" style="font-family:eudc;"
				name="list[${status.index}].fullsubject"
				value="${detail.fullsubject}" readonly autocomplete="off"/>
			</td>
			<td class='ipc'><input type="text"
				value="${detail.facevaluedis}" name="list[${status.index}].facevaluedis" readonly autocomplete="off"/>
			</td>
			<td class='ipc'><input type="text"
				value="${detail.caizhi}" name="list[${status.index}].caizhi" readonly autocomplete="off"/>
			</td>
			<td class='ipc'><input type="text"
				value="${detail.zhongliang}" name="list[${status.index}].zhongliang" readonly autocomplete="off"/>
			</td>
			<td class='ipc'><input type="text"
				name="list[${status.index}].size" value="${detail.size}"
				readonly autocomplete="off"/>
			</td>
			<td class='ipc'><input type="text"
				name="list[${status.index}].version" value="${detail.version}"
				readonly autocomplete="off"/>
			</td>
			<td class='ipc3'>
			<input type="text" id="evaluate_${detail.numindex}" value="${detail.guestappraisal}"
				name="list[${status.index}].guestappraisal" readonly style="text-align:right;" autocomplete="off"/> <input
				type='hidden' name='list[${status.index}].amountofissue'
				value='${detail.amountofissue}' autocomplete="off"/>
			</td>
			<td class='ipc'><input value="${detail.amount}"
				id="detailnum_${detail.numindex}"
				name="list[${status.index}].amount" readonly style="text-align:right;" autocomplete="off"/>
			</td>
			<td class='ipc4'><input type="text"
				value="${detail.totalevaluate}"
				name="list[${status.index}].total2" readonly style="text-align:right;" autocomplete="off"/>
			</td>
			<td class='ipc4'><input type="text"
				value="${detail.totalreqcost}"
				name="list[${status.index}].total1" readonly style="text-align:right;" autocomplete="off"/>
				<input type="hidden" value="${detail.evaluate}"
				name="list[${status.index}].evaluate" readonly />
			</td>
		</tr>
	</c:forEach>
</table>
<div style="display:none;">
<c:if test="${detail.size()<=12 }">
	<div id="printReqDiv" style="height:1050px;border:solid red 1px; width:720px; font-size:11px; font-family:'黑体';">
	<table style="font-size:11px; font-family:'黑体';width:720px;height:100px;margin:20px 40px 0px 40px;border-collapse: collapse;empty-cells: hide;">
	  <tr>
	    <td width="201">&nbsp;</td>
	    <td width="323" style="font-size:18px;">&nbsp;送评申请表（古钱、近代机制币）</td>	
	    <td colspan="4" width="15%" align="right" style="font-size:12px;">编号：&nbsp;${deposit.innerno}</td>
	  </tr>
	  <tr>
	    <td height="19">&nbsp;</td>
	    <td style="font-size:9px;" colspan="5">源泰送评中心/授权经销商姓名：<div style="border-top:1px solid #A0A0A0;float:right; margin-right:0px; width:71%;"></div></td>
	  </tr>
	  <tr>
	    <td height="11">&nbsp;</td>
	    <td style="font-size:9px;" colspan="5">源泰送评中心/授权经销商编号：<div style="border-top:1px solid #A0A0A0; float:right; margin-right:0px; width:71%;"></div></td>
	  </tr>
	  <tr>
	    <td colspan="5">&nbsp;</td>
	    <td width="10%" style="color:#AFB5BA;text-align:right;" >人民币元</td>
	  </tr>
	</table>
	<table style="font-size:11px; font-family:'黑体';width:720px;height:90px;margin:0px 30px 10px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;">
	  <tr style="background-color:#DCDCDD;font-size:11px; font-family:'黑体';">
	    <td style="border-bottom:1px solid #A0A0A0;"><span style=" font-size:11px;">&nbsp;基&nbsp;本&nbsp;信&nbsp;息&nbsp;</span><span style="font-size:9px;">（注：每张评论表仅能选取一种评级类型和速度，请以正楷清晰书写）</span></td>
	  </tr>
	  <tr style="font-size:11px;">
	    <td width="700" style="border-bottom:1px solid #A0A0A0;">
	    <div style="width:50px; float:left; margin-left:8px;">申请人：</div>
	    <div style="width:100px; float:left;">${deposit.customer}</div>
	    <div style="width:60px; float:left;">会员编号：</div>
	    <div style="width:100px; float:left;">${deposit.usercode}</div>	   
	    <div style="width:45px; float:left;">手机：</div>
	    <div style="width:110px; float:left;">${deposit.receivermobile}</div>
	    <div style="width:60px; float:left;">电子邮件：</div>
	     <div style="width:135px; float:left;">${deposit.mail}</div>
	     <!--<div style="width:135px; border:solid black 1px; float:left;">xiangwangrong@ytgrading.com</div>-->
	    </td>
	  </tr>
	  <tr style="font-size:11px;">
	    <td>
	    <div style="width:65px; float:left;margin-left:8px;">评级类型：</div>
	    <c:choose>
		  	<c:when test="${deposit.serviceid==1 }">
			    <div style="width:85px;float:left;margin-left:20px;">
			    <img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 新评</div>
			    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>		
			    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>		    
			</c:when>
				<c:when test="${deposit.serviceid==2 }">
			    <div style="width:85px; float:left;margin-left: 20px;">
			    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
			    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 重评</div>	
			    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>		 	
			</c:when>
				<c:when test="${deposit.serviceid==5 }">
			    <div style="width:85px; float:left;margin-left: 20px;">
			    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
			    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>		
			    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 真品鉴定</div>		 
			</c:when>
		</c:choose>
	    <div style="width:40px; float:left; margin-left:90px">速度：</div>
	    <c:choose>
		  	<c:when test="${deposit.speed==4}">
		  		<div style="width:115px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 15天（普通）</div>
		  		<div style="width:130px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 2天（快评）</div>
		  	</c:when>
		  	<c:when test="${deposit.speed==1}">
		  		<div style="width:115px; float:left;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/> 15天（普通）</div>
		  		<div style="width:130px; float:left;"><img src="${ctx_images}/sel.jpg" width="8" height="8"/> 2天（快评）</div>
		  	</c:when>
		</c:choose>
	    </td>
	  </tr>
	</table>
	<div>
	<table style="font-size:11px; font-family:'黑体';width:720px;margin:20px 20px 0px 40px;height:150px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;">
	  <tr  style="font-size:11px;">
	    <td style="background-color:#DCDCDD;width:48%; border-bottom:1px solid #A0A0A0;border:black solid 1px;">&nbsp;取&nbsp;件&nbsp;取&nbsp;件</td>
	 	<td rowspan="5" style="border:black solid 1px;"><img style="width:350px;height:150px;border:solid #DCDCDD 1px;float:right; margin-right:-1%;" src=""${ctx_images}/standardancientcoin1.png"></td>
	  </tr>
  	  <tr style="font-size:11px;">
	      <td style="border:1px solid #A0A0A0;">
		      <span style="margin-left:8px;"></span>取件方式：(单选)<span style="margin-left:10px;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 快递回邮   
		      <span style="margin-left:10px;"></span></span><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 上门自取(须携有效证件) </td>
		  </tr>
		  <tr style="font-size:11px;" height="38">
		    <td style="border:1px solid #A0A0A0;"><span style="margin-left:8px;"></span>回邮地址；</td>	
		  </tr>
		  <tr style="font-size:11px;">
		    <td style="border:1px solid #A0A0A0;"><span style="margin-left:8px;"></span>回邮保价：（单选）全额保价  不保价</td>
		  </tr>
		  <tr height="8">
		    <td style="border:1px solid #A0A0A0;line-height:8px;font-size:8px; height:8px;padding-top:0px;">
		    	<span style="margin-left:8px;"></span>*回邮仅限中国大陆地区，快递回邮包装运输费首重1kg,25元续重每kg10元
		    	<br/><span style="margin-left:8px;"></span> *回邮保价费为合计估价的0.5%，不足1元，按1元计，1元起收</td>
		  </tr>
	</table>
	</div>
	<table style="font-size:11px; font-family:'黑体';width:720px; height:430px;margin:10px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide; float:left;">
	  <tr align="center" style="background-color:#DCDCDD;font-size:11px;">
	   <td width="25" style="border:1px solid #A0A0A0;">行号</td>
	    <td width="63" style="border:1px solid #A0A0A0;">国家/朝代</td>
	    <td width="180" style="border:1px solid #A0A0A0;">名称</td>
	    <td width="40" style="border:1px solid #A0A0A0;">面值</td>
	    <td width="60" style="border:1px solid #A0A0A0;">版别</td>
	    <td width="59" style="border:1px solid #A0A0A0;">材质</td>
	    <td width="79" style="border:1px solid #A0A0A0;">单枚估价</td>
	    <td width="36" style="border:1px solid #A0A0A0;">数量</td>
	    <td width="78" style="border:1px solid #A0A0A0;">小计评级费</td>
	    <td  style="border:1px solid #A0A0A0;">小计估价</td>
	  </tr>
	  	<c:if test="${detail.size()<12 }">
		  	<c:forEach var="item" items="${detail}" varStatus="status">
		  		<tr align="center" style="font-size:11px;">
		  			<td style="border:1px solid #A0A0A0;">${status.index+1}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.guojia}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.fullsubject}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.facevaluedis}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.version}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.caizhi}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.guestappraisal}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.amount}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalreqcost}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalevaluate}</td>
		  		</tr>
	  		</c:forEach>
	  		<c:forEach var="x" begin="1" end="${12-detail.size()}" step="1">
	  			<tr  style="font-size:11px;">
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
	  			</tr>
	  		</c:forEach>
	  	</c:if>
	  	<c:if test="${detail.size()==12 }">
	  		<c:forEach var="item" items="${detail}" varStatus="status">
		  		<tr align="center" style="font-size:11px;">
		  			<td style="border:1px solid #A0A0A0;">${status.index+1}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.guojia}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.fullsubject}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.facevaluedis}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.version}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.caizhi}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.guestappraisal}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.amount}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalreqcost}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalevaluate}</td>
		  		</tr>
	  		</c:forEach>
	  	</c:if>
	   <tr style="font-size:11px;">
	    <td height="28" rowspan="3"style="border:1px solid #A0A0A0;">合计</td>
	    <td  colspan="10" style="border:1px solid #A0A0A0;">
	    	<div style="width:90px; float:left;">A评级数（枚）：</div>
	        <div style="width:70px; float:left;">${deposit.totalamount}</div>
	        <div style="width:80px; float:left;">B估价（元）：</div>
	        <div style="width:70px; float:left;">${deposit.totalevaluate}</div>
	        <div style="width:90px; float:left;">C评级费（元）：</div>
	        <div style="width:70px; float:left;">${deposit.totalreqcost}</div>
	        <div style="width:80px; float:left;">D重量（kg）:</div>
			<div style="width:70px; float:left;">${deposit.totalweight/1000}</div>
	    </td>
	  </tr>
	  <tr><td style="border:1px solid #A0A0A0;" colspan="10">
			
			<div style="width:100px; float:left;">E包装运输（元）:</div>
			<div style="width:70px; float:left;">${deposit.totaltransportation}</div>
			<div style="width:90px; float:left;">F保价费（元）:</div>
			<div style="width:70px; float:left;">${deposit.totalinsurance}</div>
			<c:if test="${deposit.usedeals!='1'}">
				<div style="width:100px; float:left;">G其他费用（元）:</div>
				<div style="width:80px; float:left;">${deposit.othercost}</div>
			</c:if>
			<c:if test="${deposit.usedeals=='1'}">
				<div style="width:80px; float:left;">G优惠(元)：</div>
				<div style="width:90px; float:left;">${deposit.totalpreferential}</div>
				<div style="width:100px; float:left;">H其他费用（元）:</div>
				<div style="width:80px; float:left;">${deposit.othercost}</div>
			</c:if>
		</td></tr>
	   <tr><td style="border:1px solid #A0A0A0;" colspan="10">
	   		<c:if test="${deposit.usedeals!='1'}">
				<div style="width:190px; float:left;">总费用：(C+E+F+G)（小写）：CNY</div>
			</c:if>
			<c:if test="${deposit.usedeals=='1'}">
				<div style="width:200px; float:left;">总费用：(C+E+F+H-G)（小写）：CNY</div>
			</c:if>
			<div style="width:100px; float:left;">${deposit.totalcost}</div>
		   	<div style="width:100px; float:left;">（大写）：人民币</div>
		   	<div style="width:100px; float:left;"></div>
	   	</td>
	   </tr>
	</table>
	<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
	  <tr style="background-color:#DCDCDD;font-size:11px;">
	  <td width="25" align="right" style="border-bottom:1px solid #A0A0A0;">付</td>
	    <td colspan="5" style="border-bottom:1px solid #A0A0A0;">&nbsp;款 方 式</td>
	    <td colspan="3" style="border:1px solid #A0A0A0;">&nbsp;&nbsp;完 成 通 知</td>
	  </tr>
	  <tr style="font-size:11px;">
	  <c:choose>
	  	<c:when test="${deposit.payment==1}">
	  			<td width="25" align="center" style="border-bottom:1px solid #A0A0A0;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/></td>
	    <td width="74" style="letter-spacing:1px"> 现金付款</td>
	    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
	    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
	    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
	    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
	  	</c:when>
	  	<c:when test="${deposit.payment==2}">
	  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
	    <td width="74" style="letter-spacing:1px"> 现金付款</td>
	    <td width="97"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 余额支付</td>
	    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
	    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
	    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
	  	</c:when>
	  	<c:when test="${deposit.payment==3}">
	  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
	    <td width="74" style="letter-spacing:1px"> 现金付款</td>
	    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
	    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
	    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
	    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
	  	</c:when>
	  	<c:when test="${deposit.payment==4}">
	  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
	    <td width="74" style="letter-spacing:1px"> 现金付款</td>
	    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
	    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
	    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 银行转账</span></td>
	    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
	  	</c:when>
	  	<c:when test="${deposit.payment==5}">
	  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
	    <td width="74" style="letter-spacing:1px"> 现金付款</td>
	    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
	    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
	    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
	    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 网络支付</span></td>
	  	</c:when>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${deposit.notice==1}">
	  		<td width="86">&nbsp;&nbsp;<img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 短 息</td>
		    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电 话</td>
		    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电子邮件</td>
	  	</c:when>
	  		<c:when test="${deposit.notice==2}">
	  		<td width="86">&nbsp;&nbsp;<img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 短 息</td>
		    <td width="73"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 电 话</td>
		    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电子邮件</td>
	  	</c:when>
	  		<c:when test="${deposit.notice==3}">
	  		<td width="86">&nbsp;&nbsp;<img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 短 息</td>
		    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电 话</td>
		    <td width="73"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 电子邮件</td>
	  	</c:when>
	  </c:choose>    
	  </tr>
	</table>
	<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
	  <tr style="background-color:#DCDCDD;">
	    <td style="border-bottom:1px solid #A0A0A0;">&nbsp;&nbsp;备 注</td>
	  </tr>
	  <tr style="font-size:11px;">
	    <td>&nbsp;${deposit.remark }</td>
	  </tr>
	</table>
	<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
	  <tr>
	    <td width="387"style="font-size:8px;border:1px solid #A0A0A0;">本人授权源泰评级修改订单并收取可能适用的任何额外的评级，处理及运送费用以及1%价值的费用</td>
	    <td width="351">&nbsp;</td>
	  </tr>
	  <tr style="font-size:11px;">
	    <td valign="middle" style="border:1px solid #A0A0A0;"><div style="float:left;">&nbsp;&nbsp;申请人签字:</div>
	    <div style="float:right;">日&nbsp;&nbsp;</div>
	    <div style="float:right; margin-right:30px;">月</div>
	     <div style="float:right;margin-right:30px;">年</div>
	    </td>
	    <td>
	    <div style="float:left;">&nbsp;&nbsp;&nbsp;签收人：</div>
	    <div style="float:left;margin-left:40px;">盖章有效</div>
	    <div style="float:right; margin-right:30px;">日;</div>
	    <div style="float:right; margin-right:30px;">月</div>
	     <div style="float:right;margin-right:30px;">年</div></td>
	  </tr>
	  </table>
	  <table style="font-size:11px; font-family:'黑体';width:720px;height:30px;margin:5px 40px;border-collapse: collapse;empty-cells: hide;float:left;">
	  <tr>
	  	  <td align="center" colspan="2">送评服务协议，请见背面</td>
	  </tr>
	  <tr>
  	    <td colspan="2" style="font-size:8px;">
      	<div style="float:left;width:195px;">●2014上海源泰艺术品服务有限公司版权所有</div>
      	<div style="float:left;width:125px;">客服电话：400-821-0715</div>
      	<div style="float:left;width:165px;">客服信箱：service@ytgrading.com</div>
      	<div style="float:left;width:180px;">地址：上海市漕河泾开发区田林路1016号科技绿洲三期2-1号楼</div>
      	<div style="float:right;width:50px;">邮编：200233</div>
      </td>
	  </tr>
	</table>
	</div>
</c:if>	
	
	
	
	
	
<c:if test="${detail.size()>12 }">
	<div id="printReqIIDiv" style="height:1050px;border:solid red 1px; width:720px; font-size:11px; font-family:'黑体';">
			<table style="font-size:11px; font-family:'黑体';width:720px;height:100px;margin:20px 40px 0px 40px;border-collapse: collapse;empty-cells: hide;">
			  <tr>
			    <td width="201">&nbsp;</td>
			    <td width="323" style="font-size:18px;">&nbsp;中国古币送评申请表</td>	
			    <td colspan="4" width="15%" align="right" style="font-size:12px;">编号：&nbsp;${deposit.innerno}</td>
			  </tr>
			  <tr>
			    <td height="19">&nbsp;</td>
			    <td style="font-size:9px;" colspan="5">源泰送评中心/授权经销商姓名：<div style="border-top:1px solid #A0A0A0;float:right; margin-right:0px; width:71%;"></div></td>
			  </tr>
			  <tr>
			    <td height="11">&nbsp;</td>
			    <td style="font-size:9px;" colspan="5">源泰送评中心/授权经销商编号：<div style="border-top:1px solid #A0A0A0; float:right; margin-right:0px; width:71%;"></div></td>
			  </tr>
			  <tr>
			    <td colspan="5">&nbsp;</td>
			    <td width="10%" style="color:#AFB5BA;text-align:right;" >人民币元</td>
			  </tr>
			</table>
			<table style="font-size:11px; font-family:'黑体';width:720px;height:90px;margin:0px 30px 10px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;">
			  <tr style="background-color:#DCDCDD;font-size:11px; font-family:'黑体';">
			    <td style="border-bottom:1px solid #A0A0A0;"><span style=" font-size:11px;">&nbsp;基&nbsp;本&nbsp;信&nbsp;息&nbsp;</span><span style="font-size:9px;">（注：每张评论表仅能选取一种评级类型和速度，请以正楷清晰书写）</span></td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td width="700" style="border-bottom:1px solid #A0A0A0;">
			    <div style="width:50px; float:left; margin-left:8px;">申请人：</div>
			    <div style="width:100px; float:left;">${deposit.customer}</div>
			    <div style="width:60px; float:left;">会员编号：</div>
			    <div style="width:100px; float:left;">${deposit.usercode}</div>	   
			    <div style="width:45px; float:left;">手机：</div>
			    <div style="width:110px; float:left;">${deposit.receivermobile}</div>
			    <div style="width:60px; float:left;">电子邮件：</div>
			     <div style="width:135px; float:left;">${deposit.mail}</div>
			     <!--<div style="width:135px; border:solid black 1px; float:left;">xiangwangrong@ytgrading.com</div>-->
			    </td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td>
			    <div style="width:65px; float:left;margin-left:8px;">评级类型：</div>
			    <c:choose>
				  	<c:when test="${deposit.serviceid==1 }">
					    <div style="width:85px;float:left;margin-left:20px;">
					    <img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>	
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>		    
					</c:when>
						<c:when test="${deposit.serviceid==2 }">
					    <div style="width:85px; float:left;margin-left: 20px;">
					    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 重评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>		
					</c:when>
						<c:when test="${deposit.serviceid==5 }">
					    <div style="width:85px; float:left;margin-left: 20px;">
					    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 真品鉴定</div>		
					</c:when>
				</c:choose>
			    <div style="width:40px; float:left; margin-left:90px">速度：</div>
			    <c:choose>
				  	<c:when test="${deposit.speed==4}">
				  		<div style="width:115px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 15天（普通）</div>
				  		<div style="width:130px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 2天（快评）</div>
				  	</c:when>
				  	<c:when test="${deposit.speed==1}">
				  		<div style="width:115px; float:left;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/> 15天（普通）</div>
				  		<div style="width:130px; float:left;"><img src="${ctx_images}/sel.jpg" width="8" height="8"/> 2天（快评）</div>
				  	</c:when>
				</c:choose>
			    </td>
			  </tr>
			</table>
			<div>
			<table style="font-size:11px; font-family:'黑体';width:720px;margin:20px 20px 0px 40px;height:150px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;">
			  <tr  style="font-size:11px;">
			    <td style="background-color:#DCDCDD;width:48%; border-bottom:1px solid #A0A0A0;border:black solid 1px;">&nbsp;取&nbsp;件&nbsp;取&nbsp;件</td>
			 	<td rowspan="5" style="border:black solid 1px;"><img style="width:350px;height:150px;border:solid #DCDCDD 1px;float:right; margin-right:-1%;" src=""${ctx_images}/standardancientcoin1.png"></td>
			  </tr>
		  	  <tr style="font-size:11px;">
			      <td style="border:1px solid #A0A0A0;">
				      <span style="margin-left:8px;"></span>取件方式：(单选)<span style="margin-left:10px;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 快递回邮   
				      <span style="margin-left:10px;"></span></span><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 上门自取(须携有效证件) </td>
				  </tr>
				  <tr style="font-size:11px;" height="38">
				    <td style="border:1px solid #A0A0A0;"><span style="margin-left:8px;"></span>回邮地址；</td>	
				  </tr>
				  <tr style="font-size:11px;">
				    <td style="border:1px solid #A0A0A0;"><span style="margin-left:8px;"></span>回邮保价：（单选）全额保价  不保价</td>
				  </tr>
				  <tr height="8">
				    <td style="border:1px solid #A0A0A0;line-height:8px;font-size:8px; height:8px;padding-top:0px;">
				    	<span style="margin-left:8px;"></span>*回邮仅限中国大陆地区，快递回邮包装运输费首重1kg,25元,续重每kg10元
				    	<br/><span style="margin-left:8px;"></span> *回邮保价费为合计估价的0.5%，不足1元，按1元计，1元起收</td>
				  </tr>
			</table>
			</div>
			<table style="font-size:11px; font-family:'黑体';width:720px; height:430px;margin:10px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide; float:left;">
			  <tr align="center" style="background-color:#DCDCDD;font-size:11px;">
			  	   <td width="25" style="border:1px solid #A0A0A0;">行号</td>
				    <td width="63" style="border:1px solid #A0A0A0;">国家/朝代</td>
				    <td width="180" style="border:1px solid #A0A0A0;">名称</td>
				    <td width="40" style="border:1px solid #A0A0A0;">面值</td>
				    <td width="60" style="border:1px solid #A0A0A0;">版别</td>
				    <td width="59" style="border:1px solid #A0A0A0;">材质</td>
				    <td width="79" style="border:1px solid #A0A0A0;">单枚估价</td>
				    <td width="36" style="border:1px solid #A0A0A0;">数量</td>
				    <td width="78" style="border:1px solid #A0A0A0;">小计评级费</td>
				    <td  style="border:1px solid #A0A0A0;">小计估价</td>
			  </tr>
			  	<c:forEach var="item" begin="0" end="11" items="${detail}" varStatus="status">
			  		<tr align="center" style="font-size:11px;">
			  			<td style="border:1px solid #A0A0A0;">${status.index+1}</td>
			  			<td style="border:1px solid #A0A0A0;">${item.guojia}</td>
			  			<td style="border:1px solid #A0A0A0;">${item.fullsubject}</td>
			  			<td style="border:1px solid #A0A0A0;">${item.facevaluedis}</td>
			  			<td style="border:1px solid #A0A0A0;">${item.version}</td>
			  			<td style="border:1px solid #A0A0A0;">${item.caizhi}</td>
			  			<td style="border:1px solid #A0A0A0;" align="right">${item.guestappraisal}</td>
			  			<td style="border:1px solid #A0A0A0;">${item.amount}</td>
			  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalreqcost}</td>
			  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalevaluate}</td>
			  		</tr>
		  		</c:forEach>		 
			   <tr style="font-size:11px;">
			    <td height="28" rowspan="3"style="border:1px solid #A0A0A0;">合计</td>
			    <td  colspan="10" style="border:1px solid #A0A0A0;">
			    	<div style="width:90px; float:left;">A评级数（枚）：</div>
			        <div style="width:70px; float:left;">${deposit.totalamount}</div>
			        <div style="width:80px; float:left;">B估价（元）：</div>
			        <div style="width:70px; float:left;">${deposit.totalevaluate}</div>
			        <div style="width:90px; float:left;">C评级费（元）：</div>
			        <div style="width:70px; float:left;">${deposit.totalreqcost}</div>
			        <div style="width:80px; float:left;">D重量（kg）:</div>
					<div style="width:70px; float:left;">${deposit.totalweight/1000}</div>
			    </td>
			  </tr>
			  <tr>
		  		<td style="border:1px solid #A0A0A0;" colspan="10">
				<div style="width:100px; float:left;">E包装运输（元）:</div>
				<div style="width:70px; float:left;">${deposit.totaltransportation}</div>
				<div style="width:90px; float:left;">F保价费（元）:</div>
				<div style="width:70px; float:left;">${deposit.totalinsurance}</div>
				<c:if test="${deposit.usedeals!='1'}">
					<div style="width:100px; float:left;">G其他费用（元）:</div>
					<div style="width:80px; float:left;">${deposit.othercost}</div>
				</c:if>
				<c:if test="${deposit.usedeals=='1'}">
					<div style="width:80px; float:left;">G优惠(元)：</div>
					<div style="width:90px; float:left;">${deposit.totalpreferential}</div>
					<div style="width:100px; float:left;">H其他费用（元）:</div>
					<div style="width:80px; float:left;">${deposit.othercost}</div>
				</c:if>
				</td></tr>
			   <tr><td style="border:1px solid #A0A0A0;" colspan="10">
			   		<c:if test="${deposit.usedeals!='1'}">
						<div style="width:190px; float:left;">总费用：(C+E+F+G)（小写）：CNY</div>
					</c:if>
					<c:if test="${deposit.usedeals=='1'}">
						<div style="width:200px; float:left;">总费用：(C+E+F+H-G)（小写）：CNY</div>
					</c:if>
					<div style="width:100px; float:left;">${deposit.totalcost}</div>
				   	<div style="width:100px; float:left;">（大写）：人民币</div>
				   	<div style="width:100px; float:left;"></div>
			   	</td>
			   </tr>
			</table>
			<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr style="background-color:#DCDCDD;font-size:11px;">
			  <td width="25" align="right" style="border-bottom:1px solid #A0A0A0;">付</td>
			    <td colspan="5" style="border-bottom:1px solid #A0A0A0;">&nbsp;款 方 式</td>
			    <td colspan="3" style="border:1px solid #A0A0A0;">&nbsp;&nbsp;完 成 通 知</td>
			  </tr>
			  <tr style="font-size:11px;">
			  <c:choose>
			  	<c:when test="${deposit.payment==1}">
			  			<td width="25" align="center" style="border-bottom:1px solid #A0A0A0;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/></td>
			    <td width="74" style="letter-spacing:1px"> 现金付款</td>
			    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
			    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
			    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
			    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
			  	</c:when>
			  	<c:when test="${deposit.payment==2}">
			  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
			    <td width="74" style="letter-spacing:1px"> 现金付款</td>
			    <td width="97"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 余额支付</td>
			    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
			    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
			    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
			  	</c:when>
			  	<c:when test="${deposit.payment==3}">
			  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
			    <td width="74" style="letter-spacing:1px"> 现金付款</td>
			    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
			    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
			    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
			    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
			  	</c:when>
			  	<c:when test="${deposit.payment==4}">
			  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
			    <td width="74" style="letter-spacing:1px"> 现金付款</td>
			    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
			    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
			    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 银行转账</span></td>
			    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 网络支付</span></td>
			  	</c:when>
			  	<c:when test="${deposit.payment==5}">
			  			<td width="10" align="center" style="border-bottom:1px solid #A0A0A0;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/></td>
			    <td width="74" style="letter-spacing:1px"> 现金付款</td>
			    <td width="97"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 余额支付</td>
			    <td width="94"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 邮政汇款</span></td>
			    <td width="101"><span style="letter-spacing:2px"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 银行转账</span></td>
			    <td width="102" style="border-right:1px solid #A0A0A0;"><span style="letter-spacing:2px"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 网络支付</span></td>
			  	</c:when>
			  </c:choose>
			  <c:choose>
			  	<c:when test="${deposit.notice==1}">
			  		<td width="86">&nbsp;&nbsp;<img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 短 息</td>
				    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电 话</td>
				    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电子邮件</td>
			  	</c:when>
			  		<c:when test="${deposit.notice==2}">
			  		<td width="86">&nbsp;&nbsp;<img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 短 息</td>
				    <td width="73"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 电 话</td>
				    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电子邮件</td>
			  	</c:when>
			  		<c:when test="${deposit.notice==3}">
			  		<td width="86">&nbsp;&nbsp;<img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 短 息</td>
				    <td width="73"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 电 话</td>
				    <td width="73"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 电子邮件</td>
			  	</c:when>
			  </c:choose>    
			  </tr>
			</table>
			<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr style="background-color:#DCDCDD;">
			    <td style="border-bottom:1px solid #A0A0A0;">&nbsp;&nbsp;备 注</td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td>&nbsp;${deposit.remark }</td>
			  </tr>
			</table>
			<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr>
			    <td width="387"style="font-size:8px;border:1px solid #A0A0A0;">本人授权源泰评级修改订单并收取可能适用的任何额外的评级，处理及运送费用以及1%价值的费用</td>
			    <td width="351">&nbsp;</td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td valign="middle" style="border:1px solid #A0A0A0;"><div style="float:left;">&nbsp;&nbsp;申请人签字:</div>
			    <div style="float:right;">日&nbsp;&nbsp;</div>
			    <div style="float:right; margin-right:30px;">月</div>
			     <div style="float:right;margin-right:30px;">年</div>
			    </td>
			    <td>
			    <div style="float:left;">&nbsp;&nbsp;&nbsp;签收人：</div>
			    <div style="float:left;margin-left:40px;">盖章有效</div>
			    <div style="float:right; margin-right:30px;">日;</div>
			    <div style="float:right; margin-right:30px;">月</div>
			     <div style="float:right;margin-right:30px;">年</div></td>
			  </tr>
			  </table>
			  <table style="font-size:11px; font-family:'黑体';width:720px;height:30px;margin:5px 40px;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr>
			  	  <td align="center" colspan="2">送评服务协议，请见背面</td>
			  </tr>
			  <tr>
		  	    <td colspan="2" style="font-size:8px;">
		      	<div style="float:left;width:195px;">●2014上海源泰艺术品服务有限公司版权所有</div>
		      	<div style="float:left;width:125px;">客服电话：400-821-0715</div>
		      	<div style="float:left;width:165px;">客服信箱：service@ytgrading.com</div>
		      	<div style="float:left;width:180px;">地址：上海市漕河泾开发区田林路1016号科技绿洲三期2-1号楼</div>
		      	<div style="float:right;width:50px;">邮编：200233</div>
		      </td>
			  </tr>
			</table>
	
		<c:forEach var="i" begin="1" end="${pagecount-1}" step="1"> 
		<div style="width:720px;">
		<table style="font-size:11px; font-family:'黑体';width:720px;height:100px;margin:40px 40px 0px 40px;border-collapse: collapse;empty-cells: hide;">
			  <tr>
			    <td width="201">&nbsp;</td>
			    <td width="323" style="font-size:18px;">&nbsp;中国古币送评申请表</td>	
			    <td colspan="4" width="15%" align="right" style="font-size:12px;">编号：&nbsp;${deposit.innerno}</td>
			  </tr>
			  <tr>
			    <td height="19">&nbsp;</td>
			    <td style="font-size:9px;" colspan="5"></td>
			  </tr>
			  <tr>
			    <td colspan="5">&nbsp;</td>
			    <td width="10%" style="color:#AFB5BA;text-align:right;" >人民币元</td>
			  </tr>
			</table>
		<table style="font-size:11px; font-family:'黑体';width:720px;height:90px;margin:0px 30px 10px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;">
			  <tr style="background-color:#DCDCDD;font-size:11px; font-family:'黑体';">
			    <td style="border-bottom:1px solid #A0A0A0;"><span style=" font-size:11px;">&nbsp;基&nbsp;本&nbsp;信&nbsp;息&nbsp;</span><span style="font-size:9px;">（注：每张评论表仅能选取一种评级类型和速度，请以正楷清晰书写）</span></td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td width="700" style="border-bottom:1px solid #A0A0A0;">
			    <div style="width:50px; float:left; margin-left:8px;">申请人：</div>
			    <div style="width:100px; float:left;">${deposit.customer}</div>
			    <div style="width:60px; float:left;">会员编号：</div>
			    <div style="width:100px; float:left;">${deposit.usercode}</div>	   
			    <div style="width:45px; float:left;">手机：</div>
			    <div style="width:110px; float:left;">${deposit.receivermobile}</div>
			    <div style="width:60px; float:left;">电子邮件：</div>
			     <div style="width:135px; float:left;">${deposit.mail}</div>
			     <!--<div style="width:135px; border:solid black 1px; float:left;">xiangwangrong@ytgrading.com</div>-->
			    </td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td>
			    <div style="width:65px; float:left;margin-left:8px;">评级类型：</div>
			    <c:choose>
				  	<c:when test="${deposit.serviceid==1 }">
					    <div style="width:85px;float:left;margin-left:20px;">
					    <img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>	
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>		    
					</c:when>
						<c:when test="${deposit.serviceid==2 }">
					    <div style="width:85px; float:left;margin-left: 20px;">
					    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 重评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>			
					</c:when>
						<c:when test="${deposit.serviceid==5 }">
					    <div style="width:85px; float:left;margin-left: 20px;">
					    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 真品鉴定</div>			
					</c:when>
				</c:choose>
			    <div style="width:40px; float:left; margin-left:90px">速度：</div>
			    <c:choose>
				  	<c:when test="${deposit.speed==4}">
				  		<div style="width:115px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 15天（普通）</div>
				  		<div style="width:130px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 2天（快评）</div>
				  	</c:when>
				  	<c:when test="${deposit.speed==1}">
				  		<div style="width:115px; float:left;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/> 15天（普通）</div>
				  		<div style="width:130px; float:left;"><img src="${ctx_images}/sel.jpg" width="8" height="8"/> 2天（快评）</div>
				  	</c:when>
				</c:choose>
			    </td>
			  </tr>
			</table>
		<table style="font-size:11px; font-family:'黑体';width:720px; height:730px;margin:0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide; float:left;">
		  <tr align="center" style="background-color:#DCDCDD;font-size:11px;">
		 	   <td width="25" style="border:1px solid #A0A0A0;">行号</td>
			    <td width="63" style="border:1px solid #A0A0A0;">国家/朝代</td>
			    <td width="180" style="border:1px solid #A0A0A0;">名称</td>
			    <td width="40" style="border:1px solid #A0A0A0;">面值</td>
			    <td width="60" style="border:1px solid #A0A0A0;">版别</td>
			    <td width="59" style="border:1px solid #A0A0A0;">材质</td>
			    <td width="79" style="border:1px solid #A0A0A0;">单枚估价</td>
			    <td width="36" style="border:1px solid #A0A0A0;">数量</td>
			    <td width="78" style="border:1px solid #A0A0A0;">小计评级费</td>
			    <td  style="border:1px solid #A0A0A0;">小计估价</td>
		  </tr>
		 	<c:forEach var="item" begin="${26*i-14 }" end="${i*26+11 }" items="${detail}" varStatus="status">
		  		<tr align="center" style="font-size:11px;">
		  			<td style="border:1px solid #A0A0A0;">${status.index+1}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.guojia}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.fullsubject}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.facevaluedis}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.version}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.caizhi}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.guestappraisal}</td>
		  			<td style="border:1px solid #A0A0A0;">${item.amount}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalreqcost}</td>
		  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalevaluate}</td>
		  		</tr>
	  		</c:forEach>
		</table>
		 				<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr>
			    <td width="387"style="font-size:8px;border:1px solid #A0A0A0;">本人授权源泰评级修改订单并收取可能适用的任何额外的评级，处理及运送费用以及1%价值的费用</td>
			    <td width="351">&nbsp;</td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td valign="middle" style="border:1px solid #A0A0A0;"><div style="float:left;">&nbsp;&nbsp;申请人签字:</div>
			    <div style="float:right;">日&nbsp;&nbsp;</div>
			    <div style="float:right; margin-right:30px;">月</div>
			     <div style="float:right;margin-right:30px;">年</div>
			    </td>
			    <td>
			    <div style="float:left;">&nbsp;&nbsp;&nbsp;签收人：</div>
			    <div style="float:left;margin-left:40px;">盖章有效</div>
			    <div style="float:right; margin-right:30px;">日;</div>
			    <div style="float:right; margin-right:30px;">月</div>
			     <div style="float:right;margin-right:30px;">年</div></td>
			  </tr>
			  </table>
			  <table style="font-size:11px; font-family:'黑体';width:720px;height:30px;margin:5px 40px;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr>
			  	  <td align="center" colspan="2">送评服务协议，请见背面</td>
			  </tr>
			  <tr>
		  	    <td colspan="2" style="font-size:8px;">
		      	<div style="float:left;width:195px;">●2014上海源泰艺术品服务有限公司版权所有</div>
		      	<div style="float:left;width:125px;">客服电话：400-821-0715</div>
		      	<div style="float:left;width:165px;">客服信箱：service@ytgrading.com</div>
		      	<div style="float:left;width:180px;">地址：上海市漕河泾开发区田林路1016号科技绿洲三期2-1号楼</div>
		      	<div style="float:right;width:50px;">邮编：200233</div>
		      </td>
			  </tr>
			</table>
		</div>
		</c:forEach>
		<table style="font-size:11px; font-family:'黑体';width:720px;height:100px;margin:40px 40px 0px 40px;border-collapse: collapse;empty-cells: hide;">
			  <tr>
			    <td width="201">&nbsp;</td>
			    <td width="323" style="font-size:18px;">&nbsp;中国古币送评申请表</td>	
			    <td colspan="4" width="15%" align="right" style="font-size:12px;">编号：&nbsp;${deposit.innerno}</td>
			  </tr>
			  <tr>
			    <td height="19">&nbsp;</td>
			    <td style="font-size:9px;" colspan="5"></td>
			  </tr>
			  <tr>
			    <td colspan="5">&nbsp;</td>
			    <td width="10%" style="color:#AFB5BA;text-align:right;" >人民币元</td>
			  </tr>
			</table>
			<table style="font-size:11px; font-family:'黑体';width:720px;height:90px;margin:0px 30px 10px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;">
			  <tr style="background-color:#DCDCDD;font-size:11px; font-family:'黑体';">
			    <td style="border-bottom:1px solid #A0A0A0;"><span style=" font-size:11px;">&nbsp;基&nbsp;本&nbsp;信&nbsp;息&nbsp;</span><span style="font-size:9px;">（注：每张评论表仅能选取一种评级类型和速度，请以正楷清晰书写）</span></td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td width="700" style="border-bottom:1px solid #A0A0A0;">
			    <div style="width:50px; float:left; margin-left:8px;">申请人：</div>
			    <div style="width:100px; float:left;">${deposit.customer}</div>
			    <div style="width:60px; float:left;">会员编号：</div>
			    <div style="width:100px; float:left;">${deposit.usercode}</div>	   
			    <div style="width:45px; float:left;">手机：</div>
			    <div style="width:110px; float:left;">${deposit.receivermobile}</div>
			    <div style="width:60px; float:left;">电子邮件：</div>
			     <div style="width:135px; float:left;">${deposit.mail}</div>
			     <!--<div style="width:135px; border:solid black 1px; float:left;">xiangwangrong@ytgrading.com</div>-->
			    </td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td>
			    <div style="width:65px; float:left;margin-left:8px;">评级类型：</div>
			    <c:choose>
				  	<c:when test="${deposit.serviceid==1 }">
					    <div style="width:85px;float:left;margin-left:20px;">
					    <img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>	
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>	    
					</c:when>
						<c:when test="${deposit.serviceid==2 }">
					    <div style="width:85px; float:left;margin-left: 20px;">
					    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 重评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 真品鉴定</div>		
					</c:when>
						<c:when test="${deposit.serviceid==5 }">
					    <div style="width:85px; float:left;margin-left: 20px;">
					    <img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 新评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 重评</div>
					    <div style="width:70px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 真品鉴定</div>		
					</c:when>
				</c:choose>
			    <div style="width:40px; float:left; margin-left:90px">速度：</div>
			    <c:choose>
				  	<c:when test="${deposit.speed==4}">
				  		<div style="width:115px; float:left;"><img src=""${ctx_images}/sel.jpg" width="8" height="8"/> 15天（普通）</div>
				  		<div style="width:130px; float:left;"><img src=""${ctx_images}/no_sel.jpg" width="8" height="8"/> 2天（快评）</div>
				  	</c:when>
				  	<c:when test="${deposit.speed==1}">
				  		<div style="width:115px; float:left;"><img src="${ctx_images}/no_sel.jpg" width="8" height="8"/> 15天（普通）</div>
				  		<div style="width:130px; float:left;"><img src="${ctx_images}/sel.jpg" width="8" height="8"/> 2天（快评）</div>
				  	</c:when>
				</c:choose>
			    </td>
			  </tr>
			</table>
		<table style="font-size:11px; font-family:'黑体';width:720px; height:730px;margin:0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide; float:left;">
		  <tr align="center" style="background-color:#DCDCDD;font-size:11px;">
		  	   <td width="25" style="border:1px solid #A0A0A0;">行号</td>
			    <td width="63" style="border:1px solid #A0A0A0;">国家/朝代</td>
			    <td width="180" style="border:1px solid #A0A0A0;">名称</td>
			    <td width="50" style="border:1px solid #A0A0A0;">面值</td>
			    <td width="60" style="border:1px solid #A0A0A0;">版别</td>
			    <td width="59" style="border:1px solid #A0A0A0;">材质</td>
			    <td width="79" style="border:1px solid #A0A0A0;">单枚估价</td>
			    <td width="36" style="border:1px solid #A0A0A0;">数量</td>
			    <td width="78" style="border:1px solid #A0A0A0;">小计评级费</td>
			    <td  style="border:1px solid #A0A0A0;">小计估价</td>
		  </tr>
		<c:forEach var="item" begin="${pagecount*26-14 }" end="${detail.size()}" items="${detail}" varStatus="status">
	  		<tr align="center" style="font-size:11px;">
	  			<td style="border:1px solid #A0A0A0;">${status.index+1}</td>
	  			<td style="border:1px solid #A0A0A0;">${item.guojia}</td>
	  			<td style="border:1px solid #A0A0A0;">${item.fullsubject}</td>
	  			<td style="border:1px solid #A0A0A0;">${item.facevaluedis}</td>
	  			<td style="border:1px solid #A0A0A0;">${item.version}</td>
	  			<td style="border:1px solid #A0A0A0;">${item.caizhi}</td>
	  			<td style="border:1px solid #A0A0A0;" align="right">${item.guestappraisal}</td>
	  			<td style="border:1px solid #A0A0A0;">${item.amount}</td>
	  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalreqcost}</td>
	  			<td style="border:1px solid #A0A0A0;" align="right">${item.totalevaluate}</td>
	  		</tr>
  		</c:forEach>
  		<c:forEach var="x" begin="${detail.size()}" end="${pagecount*26+11}" step="1">
  			<tr  style="font-size:11px;">
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  				<td style="border:1px solid #A0A0A0;">&nbsp;</td>
  			</tr>
  		</c:forEach> 
  		</table>
  			<table style="font-size:11px; font-family:'黑体';width:720px;height:60px;margin:10px 40px 0px 40px;border:1px solid #6C655F;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr>
			    <td width="387"style="font-size:8px;border:1px solid #A0A0A0;">本人授权源泰评级修改订单并收取可能适用的任何额外的评级，处理及运送费用以及1%价值的费用</td>
			    <td width="351">&nbsp;</td>
			  </tr>
			  <tr style="font-size:11px;">
			    <td valign="middle" style="border:1px solid #A0A0A0;"><div style="float:left;">&nbsp;&nbsp;申请人签字:</div>
			    <div style="float:right;">日&nbsp;&nbsp;</div>
			    <div style="float:right; margin-right:30px;">月</div>
			     <div style="float:right;margin-right:30px;">年</div>
			    </td>
			    <td>
			    <div style="float:left;">&nbsp;&nbsp;&nbsp;签收人：</div>
			    <div style="float:left;margin-left:40px;">盖章有效</div>
			    <div style="float:right; margin-right:30px;">日;</div>
			    <div style="float:right; margin-right:30px;">月</div>
			     <div style="float:right;margin-right:30px;">年</div></td>
			  </tr>
			  </table>
			  <table style="font-size:11px; font-family:'黑体';width:720px;height:30px;margin:5px 40px;border-collapse: collapse;empty-cells: hide;float:left;">
			  <tr>
			  	  <td align="center" colspan="2">送评服务协议，请见背面</td>
			  </tr>
			  <tr>
		  	    <td colspan="2" style="font-size:8px;">
		      	<div style="float:left;width:195px;">●2014上海源泰艺术品服务有限公司版权所有</div>
		      	<div style="float:left;width:125px;">客服电话：400-821-0715</div>
		      	<div style="float:left;width:165px;">客服信箱：service@ytgrading.com</div>
		      	<div style="float:left;width:180px;">地址：上海市漕河泾开发区田林路1016号科技绿洲三期2-1号楼</div>
		      	<div style="float:right;width:50px;">邮编：200233</div>
		      </td>
			  </tr>
			</table>
	</div>
</c:if>
</div>