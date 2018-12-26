<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT
	DATE_FORMAT(requesttime, '%Y年%m月') 统计月份,
	sde.dicvalue 类型,
	sum(totalamount) 评品数量,
	sum(
		CASE
		WHEN paystatus = 0 THEN
			totalamount
		ELSE
			0
		END
	) 未支付评品数量,
	sum(totalcost) 总金额,
	sum(
		CASE
		WHEN paystatus = 0 THEN
			totalcost
		ELSE
			0
		END
	) 未支付总金额,
	sum(1) 单数,
	sum(
		CASE
		WHEN paystatus = 0 THEN
			1
		ELSE
			0
		END
	) 未支付单数,
	sum(totalcost) / sum(totalamount) 均价
FROM
	request_main rm,
	(
		SELECT
			*
		FROM
			sys_dictionary_basic_data_info sd
		WHERE
			sd.dictype = 'ENTITY_TYPE'
	) sde
WHERE
	entitytype = sde.dickey
AND internalstates >= 3
GROUP BY
	DATE_FORMAT(requesttime, '%Y年%m月'),
	entitytype
ORDER BY
	DATE_FORMAT(requesttime, '%Y年%m月') DESC,
	sde.sortflag
          " />
