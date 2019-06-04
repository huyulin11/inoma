--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
delimiter //                            

DROP PROCEDURE

IF EXISTS test;
	CREATE PROCEDURE test ()

BEGIN
	DECLARE i INT;

	SET i = 1;

	TRUNCATE `kf_inoma_weiwei_agv`.`singletask_info`;

	INSERT INTO `singletask_info` (
		`environment`
		,`id`
		,`taskname`
		,`tasktext`
		,`tasktype`
		,`allocoptype`
		,`allocid`
		,`environmentid`
		,`agvid`
		,`lapid`
		,`issend`
		,`delflag`
		,`orderby`
		,`createtime`
		)
	VALUES (
		1
		,- 4
		,'C1.xml'
		,'1号车前往充电'
		,'GOTO_CHARGE'
		,'1'
		,0
		,1
		,1
		,1
		,1
		,0
		,0
		,'2019-06-03 21:50:51'
		)
		,(
		1
		,- 3
		,'D1.xml'
		,'1号车充电返回'
		,'BACK_CHARGE'
		,'1'
		,0
		,1
		,1
		,1
		,1
		,0
		,0
		,'2019-06-03 21:51:16'
		)
		,(
		1
		,- 2
		,'C2.xml'
		,'2号车前往充电'
		,'GOTO_CHARGE'
		,'1'
		,0
		,1
		,1
		,1
		,1
		,0
		,0
		,'2019-06-03 21:51:57'
		)
		,(
		1
		,- 1
		,'D2.xml'
		,'2号车充电返回'
		,'BACK_CHARGE'
		,'1'
		,0
		,1
		,1
		,1
		,1
		,0
		,0
		,'2019-06-03 21:52:25'
		);

	SET @che = 'AGV'
		,@dian = '位置';

	WHILE i <= 8 do
		IF i = 1 then
			SET @agvid = 1
				,@tasktypeCn = '存货'
				,@tasktypeEn = 'RECEIPT'
				,@tasktypeSt = 'Q'
				,@lapId = '1';

	ELSEIF i = 2 then

	SET @agvid = 1
		,@tasktypeCn = '存货'
		,@tasktypeEn = 'RECEIPT'
		,@tasktypeSt = 'Q'
		,@lapId = '2';

	ELSEIF i = 3 then

	SET @agvid = 1
		,@tasktypeCn = '取货'
		,@tasktypeEn = 'SHIPMENT'
		,@tasktypeSt = 'F'
		,@lapId = '1';

	ELSEIF i = 4 then

	SET @agvid = 1
		,@tasktypeCn = '取货'
		,@tasktypeEn = 'SHIPMENT'
		,@tasktypeSt = 'F'
		,@lapId = '2';

	ELSEIF i = 5 then

	SET @agvid = 2
		,@tasktypeCn = '存货'
		,@tasktypeEn = 'RECEIPT'
		,@tasktypeSt = 'Q'
		,@lapId = '1';

	ELSEIF i = 6 then

	SET @agvid = 2
		,@tasktypeCn = '存货'
		,@tasktypeEn = 'RECEIPT'
		,@tasktypeSt = 'Q'
		,@lapId = '2';

	ELSEIF i = 7 then

	SET @agvid = 2
		,@tasktypeCn = '取货'
		,@tasktypeEn = 'SHIPMENT'
		,@tasktypeSt = 'F'
		,@lapId = '1';

	ELSEIF i = 8 then

	SET @agvid = 2
		,@tasktypeCn = '取货'
		,@tasktypeEn = 'SHIPMENT'
		,@tasktypeSt = 'F'
		,@lapId = '2';
END

IF ;
	INSERT INTO `kf_inoma_weiwei_agv`.`singletask_info` (
		`environment`
		,`taskName`
		,`taskText`
		,`taskType`
		,`allocid`
		,`environmentId`
		,`agvId`
		,`lapId`
		,`issend`
		,`delflag`
		)
	SELECT '1'
		,CONCAT (
			@agvid
			,'-'
			,@tasktypeSt
			,@lapId
			,'-'
			,`text`
			,'.xml'
			)
		,CONCAT (
			'@'
			,@che
			,@agvid
			,'@'
			,@tasktypeCn
			,@dian
			,@lapId
			,'@'
			,`text`
			)
		,@tasktypeEn
		,`id`
		,'1'
		,@agvid
		,@lapId
		,'1'
		,'0'
	FROM kf_inoma_weiwei_wms.allocation_item_info
	ORDER BY id;

SET i = i + 1;END

WHILE ;END
	//                                      
	call test();
