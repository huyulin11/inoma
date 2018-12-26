<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT 
  fullsubject '全称',
  shortsubject '简称',
  allcount '总数',
  num100 '100分',
  num99 '99分',
  num98 '98分',
  num97 '97分',
  num96 '96分',
  num95 '95分',
  num94 '94分',
  num93 '93分',
  num92 '92分',
  num91 '91分',
  num90 '90分',
  num89 '1到89分',
  num0 '零分',
  numminus '负分',
  numnull '无分' 
FROM
  (SELECT 
    rc.coinid,
    SUM(
      CASE
        WHEN rc.score = 100 
        THEN 1 
        ELSE 0 
      END
    ) num100,
    SUM(
      CASE
        WHEN rc.score = 99 
        THEN 1 
        ELSE 0 
      END
    ) num99,
    SUM(
      CASE
        WHEN rc.score = 98 
        THEN 1 
        ELSE 0 
      END
    ) num98,
    SUM(
      CASE
        WHEN rc.score = 97 
        THEN 1 
        ELSE 0 
      END
    ) num97,
    SUM(
      CASE
        WHEN rc.score = 96 
        THEN 1 
        ELSE 0 
      END
    ) num96,
    SUM(
      CASE
        WHEN rc.score = 95 
        THEN 1 
        ELSE 0 
      END
    ) num95,
    SUM(
      CASE
        WHEN rc.score = 94 
        THEN 1 
        ELSE 0 
      END
    ) num94,
    SUM(
      CASE
        WHEN rc.score = 93 
        THEN 1 
        ELSE 0 
      END
    ) num93,
    SUM(
      CASE
        WHEN rc.score = 92 
        THEN 1 
        ELSE 0 
      END
    ) num92,
    SUM(
      CASE
        WHEN rc.score = 91 
        THEN 1 
        ELSE 0 
      END
    ) num91,
    SUM(
      CASE
        WHEN rc.score = 90 
        THEN 1 
        ELSE 0 
      END
    ) num90,
    SUM(
      CASE
        WHEN rc.score <= 89 
        AND rc.score >= 1 
        THEN 1 
        ELSE 0 
      END
    ) num89,
    SUM(
      CASE
        WHEN rc.score = 0 
        THEN 1 
        ELSE 0 
      END
    ) num0,
    SUM(
      CASE
        WHEN rc.score < 0 
        THEN 1 
        ELSE 0 
      END
    ) numminus,
    SUM(
      CASE
        WHEN rc.score IS NULL 
        THEN 1 
        ELSE 0 
      END
    ) numnull,
    SUM(1) allcount 
  FROM
    request_main rm,
    request_coin rc 
  WHERE rm.id = rc.requestid 
    AND rm.requeststatus >= 6 
  GROUP BY rc.coinid) sc,
  (SELECT 
    id,
    fullsubject,
    shortsubject 
  FROM
    coin 
  UNION
  ALL 
  SELECT 
    id,
    fullsubject,
    shortsubject 
  FROM
    sys_bill_basic_info 
  UNION
  ALL 
  SELECT 
    id,
    fullsubject,
    shortsubject 
  FROM
    sys_mechanism_coin_basic_info 
  UNION
  ALL 
  SELECT 
    id,
    fullsubject,
    shortsubject 
  FROM
    sys_stamp_basic_info 
  UNION
  ALL 
  SELECT 
    id,
    fullsubject,
    shortsubject 
  FROM
    sys_ancient_coin_basic_info 
  UNION
  ALL 
  SELECT 
    id,
    fullsubject,
    shortsubject 
  FROM
    sys_suit_basic_info) sss 
WHERE sc.coinid = sss.id 
          " />
