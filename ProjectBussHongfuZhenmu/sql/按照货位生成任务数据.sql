delimiter //                            #定义标识符为双斜杠
drop procedure if exists test;          #如果存在test存储过程则删除
create procedure test()                 #创建无参存储过程,名称为test
begin
    declare i int;                      #申明变量
    set i = 1;                          #变量赋值
TRUNCATE TABLE `kf_inoma_weiwei_agv`.`singletask_info`;
    while i <= 8 do                     #结束循环的条件: 当i大于10时跳出while循环
    if i=1 then
SET @agvid = 1, @tasktypeCn = '存货', @tasktypeEn = 'RECEIPT', @tasktypeSt = 'Q', @lapId = '1';
ELSEIF i=2 then
SET @agvid = 1, @tasktypeCn = '存货', @tasktypeEn = 'RECEIPT', @tasktypeSt = 'Q', @lapId = '2';
ELSEIF i=3 then
SET @agvid = 1, @tasktypeCn = '取货', @tasktypeEn = 'SHIPMENT', @tasktypeSt = 'F', @lapId = '1';
ELSEIF i=4 then
SET @agvid = 1, @tasktypeCn = '取货', @tasktypeEn = 'SHIPMENT', @tasktypeSt = 'F', @lapId = '2';               
ELSEIF i=5 then
SET @agvid = 2, @tasktypeCn = '存货', @tasktypeEn = 'RECEIPT', @tasktypeSt = 'Q', @lapId = '1';
ELSEIF i=6 then
SET @agvid = 2, @tasktypeCn = '存货', @tasktypeEn = 'RECEIPT', @tasktypeSt = 'Q', @lapId = '2';
ELSEIF i=7 then
SET @agvid = 2, @tasktypeCn = '取货', @tasktypeEn = 'SHIPMENT', @tasktypeSt = 'F', @lapId = '1';
ELSEIF i=8 then
SET @agvid = 2, @tasktypeCn = '取货', @tasktypeEn = 'SHIPMENT', @tasktypeSt = 'F', @lapId = '2';
END if;

INSERT INTO `kf_inoma_weiwei_agv`.`singletask_info` 
		(`environment`, `taskName`, `taskText`, `taskType`, `allocid`,
 		`environmentId`, `agvId`, `lapId`, `isSendToAGV`, `delflag`)
SELECT 
	'1',CONCAT(@agvid,'-',@tasktypeSt,@lapId,'-',`text`, '.xml')
 	, CONCAT(@agvid,'车',@lapId,@tasktypeCn,'点', @tasktypeCn,'到',`text`), @tasktypeEn,
	`id`, '1', @agvid, @lapId, '1', '0'
FROM kf_inoma_weiwei_wms.allocation_item_info
ORDER BY id;
        set i = i + 1;                  #循环一次,i加一
    end while;                          #结束while循环
end
//                                      #结束定义语句
call test();                            #调用存储过程