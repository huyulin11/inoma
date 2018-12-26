<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	defaultNumOfOnePage="30"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT 
  SUM(sumamount) 总金额,
  GROUP_CONCAT(
    CONCAT(
      species,
      '(金额:',
      sumamount,
      ',数量:',
      cnt,
      ')'
    ) 
    ORDER BY sumamount DESC SEPARATOR '&'
  ) 种类信息 
FROM
  (SELECT 
    species,
    SUM(amount) sumamount,
    COUNT(1) cnt 
  FROM
    kf_buss.dairy_work_bill_info 
  WHERE delflag = 0 
  GROUP BY species) aa 
          " />
<style>
.发生日期 {
	width: 10%;
}

.总金额 {
	width: 10%;
}

.统计数量 {
	width: 10%;
}

.细分种类 {
	width: 10%;
}
</style>