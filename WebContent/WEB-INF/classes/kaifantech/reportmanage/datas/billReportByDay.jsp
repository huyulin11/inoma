<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	defaultNumOfOnePage="30"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT 
  occurdate 发生日期,
  SUM(amount) 总金额,
  COUNT(1) 统计数量,
  GROUP_CONCAT(DISTINCT species) 细分种类 ,
  GROUP_CONCAT(remarks SEPARATOR '&') 明细 
FROM
  kf_buss.dairy_work_bill_info 
WHERE delflag = 0 
GROUP BY occurdate DESC 
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