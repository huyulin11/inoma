<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT
	requestcode 申请单编号,
	usercode 用户编号,
	customer 用户姓名,
	requesttime 受理时间,
	applytime 申请时间,
	tagindex 评品详细,
	coincode 评品编号,
	score 分数（单个）,
	scores 分数（套币）,
	ratingreasondis 评分原因
FROM
	(
		SELECT
			*
		FROM
			request_main
		WHERE
			1 = 1
		AND (
			('${param.requestcode}' = '' OR '${param.requestcode}' IS NULL)
			OR requestcode = '${param.requestcode}'
		)
	) rm,
	(
		SELECT
			*
		FROM
			request_coin
		WHERE
			1 = 1
		AND (
			(
				'${param.coincode}' = ''
				OR '${param.coincode}' IS NULL
			)
			OR coincode = '${param.coincode}'
		)
		AND (
			(
				'${param.sgt}' = ''
				OR '${param.sgt}' IS NULL
			)
			OR score >= '${param.sgt}'
		)
		AND (
			(
				'${param.slt}' = ''
				OR '${param.slt}' IS NULL
			)
			OR '${param.slt}' >= score
		)
	) rc
WHERE
	rm.id = rc.requestid
ORDER BY
	requestcode
          " />
