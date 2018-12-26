<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tag/DBData.tld" prefix="DBData"%>
<DBData:table currentPage="${param.currentPage}"
	defaultNumOfOnePage="30"
	numOfOnePage="${param.numOfOnePage}"
	sql="
SELECT 
  SUBSTR(occurdate, 1, 6) 发生月,species 种类,
  SUM(amount) 总金额 ,
  COUNT(1) 统计数量,
  GROUP_CONCAT(
    CONCAT(occurdate, remarks) ORDER BY occurdate SEPARATOR '&'
  ) 明细 
FROM
  kf_buss.dairy_work_bill_info 
WHERE delflag = 0 
GROUP BY SUBSTR(occurdate, 1, 6) DESC,species
          " />
<style>
.发生月 {
	width: 10%;
}

.总金额 {
	width: 10%;
}

.统计数量 {
	width: 10%;
}

.种类 {
	width: 10%;
}
</style>
