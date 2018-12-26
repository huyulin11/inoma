<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT
	re.requestcode '申请单号',
	re.applytime '提交时间',
	re.requesttime '受理时间',
	re.duetime '截止时间',
	re.totalamount '总数量',
	re.internalstates '内部状态',
	re.requeststatus '外部状态',
	re.customer '收件人姓名',
	re.usercode '用户编号',
	re.receivermobile '收件人手机号码',
	re.packagecode '包裹号',
	re.remark '备注',
	re.delflag '删除标志',
	u. NAME AS '用户姓名',
	re.sendtype '取件方式',
	(
		CASE
		WHEN re.paystatus = '1' THEN
			IFNULL(
				(
					SELECT
						DATE_FORMAT(
							MAX(p.createdate),
							'%Y-%m-%d %H:%i:%S'
						)
					FROM
						pay_journal p
					WHERE
						FIND_IN_SET(
							re.requestcode,
							p.requestcode
						)
				),
				'已支付'
			)
		ELSE
			'--'
		END
	) '支付时间',
	re.entitytype '评级类型'
FROM
	request_main re
LEFT JOIN USER u ON re.usercode = u.usercode
WHERE
	re.delflag != '2'
AND (
	re.requestcode = '${param.requestcode}' 
	OR (
		'${param.requestcode}' IS NULL
		OR '${param.requestcode}' = ''
	)
)
AND (
	re.customer = '${param.customer}' 
	OR (
		'${param.customer}' IS NULL
		OR '${param.customer}' = ''
	)
)
AND (
	re.receiverMobile = '${param.receiverMobile}' 
	OR (
		'${param.receiverMobile}' IS NULL
		OR '${param.receiverMobile}' = ''
	)
)
AND (
	re.internalStates = '${param.internalStates}' 
	OR (
		'${param.internalStates}' IS NULL
		OR '${param.internalStates}' = ''
	)
)
AND (
	re.usercode = '${param.usercode}' 
	OR (
		'${param.usercode}' IS NULL
		OR '${param.usercode}' = ''
	)
)
AND (
	re.applyTime >= '${param.applyTimeK}' 
	OR (
		'${param.applyTimeK}' IS NULL
		OR '${param.applyTimeK}' = ''
	)
)
AND (
	re.applyTime <= '${param.applyTimeJ}' 
	OR (
		'${param.applyTimeJ}' IS NULL
		OR '${param.applyTimeJ}' = ''
	)
)
AND (
	re.requestTime >= '${param.requestTimeK}' 
	OR (
		'${param.requestTimeK}' IS NULL
		OR '${param.requestTimeK}' = ''
	)
)
AND (
	re.requestTime <= '${param.requestTimeJ}' 
	OR (
		'${param.requestTimeJ}' IS NULL
		OR '${param.requestTimeJ}' = ''
	)
)
AND (
	re.entitytype = '${param.entitytype}' 
	OR (
		'${param.entitytype}' IS NULL
		OR '${param.entitytype}' = ''
	)
)
ORDER BY
	re.applytime DESC
          " />

<script type="text/javascript" src="${ctx_js}/reportmanage/sqdzhcx.js"></script>