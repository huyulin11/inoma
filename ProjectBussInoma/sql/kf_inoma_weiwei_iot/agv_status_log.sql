-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5492
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_inoma_weiwei_iot.agv_status_log
DROP TABLE IF EXISTS `agv_status_log`;
CREATE TABLE IF NOT EXISTS `agv_status_log` (
  `uuid` varchar(36) NOT NULL COMMENT '主键',
  `time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '发生时间',
  `opflag` varchar(16) DEFAULT NULL COMMENT '操作标志',
  `taskid` varchar(30) DEFAULT NULL COMMENT '指令',
  `autoflag` int(1) DEFAULT 0 COMMENT '是否自动发送（1为是，0为否，-1为半自动）',
  `msg` text DEFAULT NULL COMMENT '备注信息',
  `agvId` int(11) DEFAULT NULL COMMENT 'AGV的id，0代表全部',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志，1代表已删除，0代表可用',
  `overtime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '完成时间',
  PRIMARY KEY (`uuid`),
  KEY `taskid` (`taskid`,`agvId`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='启停任务执行表';

-- Dumping data for table kf_inoma_weiwei_iot.agv_status_log: ~1 rows (approximately)
DELETE FROM `agv_status_log`;
/*!40000 ALTER TABLE `agv_status_log` DISABLE KEYS */;
INSERT INTO `agv_status_log` (`uuid`, `time`, `opflag`, `taskid`, `autoflag`, `msg`, `agvId`, `delflag`, `overtime`) VALUES
	('00081de4-43e1-11e9-bba1-d89ef3352f09', '2019-03-11 17:34:56', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:34:56'),
	('072eee68-43e1-11e9-bba1-d89ef3352f09', '2019-03-11 17:35:08', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:35:08'),
	('0e577f7b-43e1-11e9-bba1-d89ef3352f09', '2019-03-11 17:35:20', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:35:20'),
	('157dc358-43e1-11e9-bba1-d89ef3352f09', '2019-03-11 17:35:32', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:35:32'),
	('545eac2f-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:30:08', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:30:08'),
	('5b85be4a-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:30:20', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:30:20'),
	('62acf4f7-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:30:32', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:30:32'),
	('69d4001a-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:30:44', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:30:44'),
	('70fb248e-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:30:56', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:30:56'),
	('78221c7a-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:31:08', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:31:08'),
	('7f492577-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:31:20', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:31:20'),
	('86704aba-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:31:32', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:31:32'),
	('8d9758aa-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:31:44', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:31:44'),
	('94bf52fb-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:31:56', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:31:56'),
	('9be57690-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:32:08', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:32:08'),
	('a30c9295-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:32:20', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:32:20'),
	('aa335535-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:32:32', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:32:32'),
	('b15a924c-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:32:44', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:32:44'),
	('b8819a9f-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:32:56', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:32:56'),
	('bfa8a6d9-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:33:08', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:33:08'),
	('c6cfb9ad-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:33:20', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:33:20'),
	('cdf6c097-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:33:32', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:33:32'),
	('d51dcbb1-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:33:44', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:33:44'),
	('dc44b4b5-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:33:56', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:33:56'),
	('e36c1a13-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:34:08', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:34:08'),
	('ea937b12-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:34:20', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:34:20'),
	('f1ba315e-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:34:32', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:34:32'),
	('f8e1376e-43e0-11e9-bba1-d89ef3352f09', '2019-03-11 17:34:44', 'NEW', 'SYSWARNING', 1, '系统交通管制功能关闭中，请注意AGV运行情况！！！', 0, 0, '2019-03-11 17:34:44');
/*!40000 ALTER TABLE `agv_status_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
