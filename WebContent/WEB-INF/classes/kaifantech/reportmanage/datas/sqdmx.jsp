<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT
	rm.requestcode '申请单',
	rm.totalcost '支付金额',
	rm.totalcost - ROUND(rm.totalcost * 0.06 / 1.06, 2) '不含税金额',
	ROUND(rm.totalcost * 0.06 / 1.06, 2) '税额',
	DATE_FORMAT(rm.requesttime, '%Y-%m-%d') '申请时间',
	rm.internalstates '内部状态',
	rm.entitytype '评级类型',
	rm.requeststatus '状态',
	rm.totalreqcost '评级费用',
	rm.totalpremium '保险费用',
	rm.totaltransportation '运输费用',
	rm.totalinsurance '保价费用',
	rm.totalpreferential '优惠',
	rm.othercost '其他费用',
	rm.totalamount '数量',
	rm.remark '备注',
	rm.costremark '其它费用备注',
	u.usercode '客户编号',
	u.`name` '客户姓名',
	(
		CASE
		WHEN a.inupdatetime IS NULL THEN
			'--'
		ELSE
			DATE_FORMAT(a.inupdatetime, '%Y-%m-%d')
		END
	) '入库时间',
	(
		CASE
		WHEN b.outupdatetime IS NULL THEN
			'--'
		ELSE
			DATE_FORMAT(b.outupdatetime, '%Y-%m-%d')
		END
	) '出库时间',
	(
		CASE
		WHEN rm.paystatus = '1' THEN
			IFNULL(
				(
					SELECT
						DATE_FORMAT(
							MAX(p.createdate),
							'%Y-%m-%d'
						)
					FROM
						pay_journal p
					WHERE
						FIND_IN_SET(
							rm.requestcode,
							p.requestcode
						)
				),
				'已支付'
			)
		ELSE
			'--'
		END
	) '支付时间'
FROM
	(
		SELECT DISTINCT
			packageid,
			updatetime AS inupdatetime
		FROM
			wms_inbound_info
		WHERE
			inboundstatus = 900
		  AND
		  	(('${param.inupdatetime1}' is null OR '${param.inupdatetime1}' = '' ) OR (DATE_FORMAT(updatetime, '%Y%m%d') >= '${param.inupdatetime1}' AND '${param.inupdatetime1}' is not null) )
		  AND
		  	(('${param.inupdatetime2}' is null OR '${param.inupdatetime2}' = '' ) OR (DATE_FORMAT(updatetime, '%Y%m%d') <= '${param.inupdatetime2}' AND '${param.inupdatetime2}' is not null) )
	) a
LEFT JOIN (
	SELECT DISTINCT
		packageid,
		updatetime AS outupdatetime
	FROM
		wms_outbound_info
	WHERE
		outboundstatus = 900
	AND outboundtype = 0
) b ON a.packageid = b.packageid
LEFT JOIN request_main rm ON rm.requestcode = a.packageid,
 `user` u
WHERE
	rm.userid = u.id
ORDER BY
	rm.requestcode,
	a.inupdatetime,
	b.outupdatetime
          " />

<script type="text/javascript" src="${ctx_js}/reportmanage/sqdmx.js"></script>