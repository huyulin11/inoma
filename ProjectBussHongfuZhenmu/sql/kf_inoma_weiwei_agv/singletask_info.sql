-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.7-MariaDB - mariadb.org binary distribution
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.1.0.5577
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_inoma_weiwei_agv.singletask_info
DROP TABLE IF EXISTS `singletask_info`;
CREATE TABLE IF NOT EXISTS `singletask_info` (
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(50) NOT NULL COMMENT '对应客户端任务文件名',
  `taskText` varchar(50) NOT NULL COMMENT '服务端显示名称',
  `taskType` varchar(50) NOT NULL DEFAULT '-1' COMMENT '1、楼下任务  2 楼上送空托盘，并取货',
  `allocOpType` varchar(50) DEFAULT '1' COMMENT '操作目标货位的类型：1为向目标货位放货；2为从目标货位取货；3为与其它任务一道的组合任务；',
  `allocid` int(11) DEFAULT NULL COMMENT '目标货位',
  `environmentId` int(11) DEFAULT 0 COMMENT '针对沧州项目多控制台，0代表不属于哪个控制台',
  `agvId` int(11) DEFAULT 0 COMMENT '指定的agv才能执行此任务，0代表都可以执行',
  `lapId` int(11) DEFAULT NULL COMMENT '对应取货点ID（维维为机械手）',
  `isSendToAGV` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否发送到AGV执行',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  `orderby` int(11) DEFAULT 0 COMMENT '排序依据',
  `createtime` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskName` (`taskName`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COMMENT='任务信息表';

-- Dumping data for table kf_inoma_weiwei_agv.singletask_info: ~320 rows (大约)
DELETE FROM `singletask_info`;
/*!40000 ALTER TABLE `singletask_info` DISABLE KEYS */;
INSERT INTO `singletask_info` (`environment`, `id`, `taskName`, `taskText`, `taskType`, `allocOpType`, `allocid`, `environmentId`, `agvId`, `lapId`, `isSendToAGV`, `delflag`, `orderby`, `createtime`) VALUES
	(1, 1, '1-Q1-A-0-1.xml', '1车1存货点A-0-1存货', 'RECEIPT', '1', 1, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 2, '1-Q1-A-0-2.xml', '1车1存货点A-0-2存货', 'RECEIPT', '1', 2, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 3, '1-Q1-A-0-3.xml', '1车1存货点A-0-3存货', 'RECEIPT', '1', 3, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 4, '1-Q1-A-0-4.xml', '1车1存货点A-0-4存货', 'RECEIPT', '1', 4, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 5, '1-Q1-A-0-5.xml', '1车1存货点A-0-5存货', 'RECEIPT', '1', 5, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 6, '1-Q1-A-0-6.xml', '1车1存货点A-0-6存货', 'RECEIPT', '1', 6, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 7, '1-Q1-A-0-7.xml', '1车1存货点A-0-7存货', 'RECEIPT', '1', 7, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 8, '1-Q1-A-0-8.xml', '1车1存货点A-0-8存货', 'RECEIPT', '1', 8, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 9, '1-Q1-A-0-9.xml', '1车1存货点A-0-9存货', 'RECEIPT', '1', 9, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 10, '1-Q1-A-0-10.xml', '1车1存货点A-0-10存货', 'RECEIPT', '1', 10, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 11, '1-Q1-A-1-1.xml', '1车1存货点A-1-1存货', 'RECEIPT', '1', 11, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 12, '1-Q1-A-1-2.xml', '1车1存货点A-1-2存货', 'RECEIPT', '1', 12, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 13, '1-Q1-A-1-3.xml', '1车1存货点A-1-3存货', 'RECEIPT', '1', 13, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 14, '1-Q1-A-1-4.xml', '1车1存货点A-1-4存货', 'RECEIPT', '1', 14, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 15, '1-Q1-A-1-5.xml', '1车1存货点A-1-5存货', 'RECEIPT', '1', 15, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 16, '1-Q1-A-1-6.xml', '1车1存货点A-1-6存货', 'RECEIPT', '1', 16, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 17, '1-Q1-A-1-7.xml', '1车1存货点A-1-7存货', 'RECEIPT', '1', 17, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 18, '1-Q1-A-1-8.xml', '1车1存货点A-1-8存货', 'RECEIPT', '1', 18, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 19, '1-Q1-A-1-9.xml', '1车1存货点A-1-9存货', 'RECEIPT', '1', 19, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 20, '1-Q1-A-1-10.xml', '1车1存货点A-1-10存货', 'RECEIPT', '1', 20, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 21, '1-Q1-B-0-1.xml', '1车1存货点B-0-1存货', 'RECEIPT', '1', 21, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 22, '1-Q1-B-0-2.xml', '1车1存货点B-0-2存货', 'RECEIPT', '1', 22, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 23, '1-Q1-B-0-3.xml', '1车1存货点B-0-3存货', 'RECEIPT', '1', 23, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 24, '1-Q1-B-0-4.xml', '1车1存货点B-0-4存货', 'RECEIPT', '1', 24, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 25, '1-Q1-B-0-5.xml', '1车1存货点B-0-5存货', 'RECEIPT', '1', 25, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 26, '1-Q1-B-0-6.xml', '1车1存货点B-0-6存货', 'RECEIPT', '1', 26, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 27, '1-Q1-B-0-7.xml', '1车1存货点B-0-7存货', 'RECEIPT', '1', 27, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 28, '1-Q1-B-0-8.xml', '1车1存货点B-0-8存货', 'RECEIPT', '1', 28, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 29, '1-Q1-B-0-9.xml', '1车1存货点B-0-9存货', 'RECEIPT', '1', 29, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 30, '1-Q1-B-0-10.xml', '1车1存货点B-0-10存货', 'RECEIPT', '1', 30, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 31, '1-Q1-B-1-1.xml', '1车1存货点B-1-1存货', 'RECEIPT', '1', 31, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 32, '1-Q1-B-1-2.xml', '1车1存货点B-1-2存货', 'RECEIPT', '1', 32, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 33, '1-Q1-B-1-3.xml', '1车1存货点B-1-3存货', 'RECEIPT', '1', 33, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 34, '1-Q1-B-1-4.xml', '1车1存货点B-1-4存货', 'RECEIPT', '1', 34, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 35, '1-Q1-B-1-5.xml', '1车1存货点B-1-5存货', 'RECEIPT', '1', 35, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 36, '1-Q1-B-1-6.xml', '1车1存货点B-1-6存货', 'RECEIPT', '1', 36, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 37, '1-Q1-B-1-7.xml', '1车1存货点B-1-7存货', 'RECEIPT', '1', 37, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 38, '1-Q1-B-1-8.xml', '1车1存货点B-1-8存货', 'RECEIPT', '1', 38, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 39, '1-Q1-B-1-9.xml', '1车1存货点B-1-9存货', 'RECEIPT', '1', 39, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 40, '1-Q1-B-1-10.xml', '1车1存货点B-1-10存货', 'RECEIPT', '1', 40, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:13'),
	(1, 64, '1-Q2-A-0-1.xml', '1车2存货点A-0-1存货', 'RECEIPT', '1', 1, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 65, '1-Q2-A-0-2.xml', '1车2存货点A-0-2存货', 'RECEIPT', '1', 2, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 66, '1-Q2-A-0-3.xml', '1车2存货点A-0-3存货', 'RECEIPT', '1', 3, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 67, '1-Q2-A-0-4.xml', '1车2存货点A-0-4存货', 'RECEIPT', '1', 4, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 68, '1-Q2-A-0-5.xml', '1车2存货点A-0-5存货', 'RECEIPT', '1', 5, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 69, '1-Q2-A-0-6.xml', '1车2存货点A-0-6存货', 'RECEIPT', '1', 6, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 70, '1-Q2-A-0-7.xml', '1车2存货点A-0-7存货', 'RECEIPT', '1', 7, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 71, '1-Q2-A-0-8.xml', '1车2存货点A-0-8存货', 'RECEIPT', '1', 8, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 72, '1-Q2-A-0-9.xml', '1车2存货点A-0-9存货', 'RECEIPT', '1', 9, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 73, '1-Q2-A-0-10.xml', '1车2存货点A-0-10存货', 'RECEIPT', '1', 10, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 74, '1-Q2-A-1-1.xml', '1车2存货点A-1-1存货', 'RECEIPT', '1', 11, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 75, '1-Q2-A-1-2.xml', '1车2存货点A-1-2存货', 'RECEIPT', '1', 12, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 76, '1-Q2-A-1-3.xml', '1车2存货点A-1-3存货', 'RECEIPT', '1', 13, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 77, '1-Q2-A-1-4.xml', '1车2存货点A-1-4存货', 'RECEIPT', '1', 14, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 78, '1-Q2-A-1-5.xml', '1车2存货点A-1-5存货', 'RECEIPT', '1', 15, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 79, '1-Q2-A-1-6.xml', '1车2存货点A-1-6存货', 'RECEIPT', '1', 16, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 80, '1-Q2-A-1-7.xml', '1车2存货点A-1-7存货', 'RECEIPT', '1', 17, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 81, '1-Q2-A-1-8.xml', '1车2存货点A-1-8存货', 'RECEIPT', '1', 18, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 82, '1-Q2-A-1-9.xml', '1车2存货点A-1-9存货', 'RECEIPT', '1', 19, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 83, '1-Q2-A-1-10.xml', '1车2存货点A-1-10存货', 'RECEIPT', '1', 20, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 84, '1-Q2-B-0-1.xml', '1车2存货点B-0-1存货', 'RECEIPT', '1', 21, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 85, '1-Q2-B-0-2.xml', '1车2存货点B-0-2存货', 'RECEIPT', '1', 22, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 86, '1-Q2-B-0-3.xml', '1车2存货点B-0-3存货', 'RECEIPT', '1', 23, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 87, '1-Q2-B-0-4.xml', '1车2存货点B-0-4存货', 'RECEIPT', '1', 24, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 88, '1-Q2-B-0-5.xml', '1车2存货点B-0-5存货', 'RECEIPT', '1', 25, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 89, '1-Q2-B-0-6.xml', '1车2存货点B-0-6存货', 'RECEIPT', '1', 26, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 90, '1-Q2-B-0-7.xml', '1车2存货点B-0-7存货', 'RECEIPT', '1', 27, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 91, '1-Q2-B-0-8.xml', '1车2存货点B-0-8存货', 'RECEIPT', '1', 28, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 92, '1-Q2-B-0-9.xml', '1车2存货点B-0-9存货', 'RECEIPT', '1', 29, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 93, '1-Q2-B-0-10.xml', '1车2存货点B-0-10存货', 'RECEIPT', '1', 30, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 94, '1-Q2-B-1-1.xml', '1车2存货点B-1-1存货', 'RECEIPT', '1', 31, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 95, '1-Q2-B-1-2.xml', '1车2存货点B-1-2存货', 'RECEIPT', '1', 32, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 96, '1-Q2-B-1-3.xml', '1车2存货点B-1-3存货', 'RECEIPT', '1', 33, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 97, '1-Q2-B-1-4.xml', '1车2存货点B-1-4存货', 'RECEIPT', '1', 34, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 98, '1-Q2-B-1-5.xml', '1车2存货点B-1-5存货', 'RECEIPT', '1', 35, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 99, '1-Q2-B-1-6.xml', '1车2存货点B-1-6存货', 'RECEIPT', '1', 36, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 100, '1-Q2-B-1-7.xml', '1车2存货点B-1-7存货', 'RECEIPT', '1', 37, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 101, '1-Q2-B-1-8.xml', '1车2存货点B-1-8存货', 'RECEIPT', '1', 38, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 102, '1-Q2-B-1-9.xml', '1车2存货点B-1-9存货', 'RECEIPT', '1', 39, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 103, '1-Q2-B-1-10.xml', '1车2存货点B-1-10存货', 'RECEIPT', '1', 40, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 127, '1-F1-A-0-1.xml', '1车1取货点A-0-1取货', 'SHIPMENT', '1', 1, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 128, '1-F1-A-0-2.xml', '1车1取货点A-0-2取货', 'SHIPMENT', '1', 2, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 129, '1-F1-A-0-3.xml', '1车1取货点A-0-3取货', 'SHIPMENT', '1', 3, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 130, '1-F1-A-0-4.xml', '1车1取货点A-0-4取货', 'SHIPMENT', '1', 4, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 131, '1-F1-A-0-5.xml', '1车1取货点A-0-5取货', 'SHIPMENT', '1', 5, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 132, '1-F1-A-0-6.xml', '1车1取货点A-0-6取货', 'SHIPMENT', '1', 6, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 133, '1-F1-A-0-7.xml', '1车1取货点A-0-7取货', 'SHIPMENT', '1', 7, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 134, '1-F1-A-0-8.xml', '1车1取货点A-0-8取货', 'SHIPMENT', '1', 8, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 135, '1-F1-A-0-9.xml', '1车1取货点A-0-9取货', 'SHIPMENT', '1', 9, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 136, '1-F1-A-0-10.xml', '1车1取货点A-0-10取货', 'SHIPMENT', '1', 10, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 137, '1-F1-A-1-1.xml', '1车1取货点A-1-1取货', 'SHIPMENT', '1', 11, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 138, '1-F1-A-1-2.xml', '1车1取货点A-1-2取货', 'SHIPMENT', '1', 12, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 139, '1-F1-A-1-3.xml', '1车1取货点A-1-3取货', 'SHIPMENT', '1', 13, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 140, '1-F1-A-1-4.xml', '1车1取货点A-1-4取货', 'SHIPMENT', '1', 14, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 141, '1-F1-A-1-5.xml', '1车1取货点A-1-5取货', 'SHIPMENT', '1', 15, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 142, '1-F1-A-1-6.xml', '1车1取货点A-1-6取货', 'SHIPMENT', '1', 16, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 143, '1-F1-A-1-7.xml', '1车1取货点A-1-7取货', 'SHIPMENT', '1', 17, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 144, '1-F1-A-1-8.xml', '1车1取货点A-1-8取货', 'SHIPMENT', '1', 18, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 145, '1-F1-A-1-9.xml', '1车1取货点A-1-9取货', 'SHIPMENT', '1', 19, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 146, '1-F1-A-1-10.xml', '1车1取货点A-1-10取货', 'SHIPMENT', '1', 20, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 147, '1-F1-B-0-1.xml', '1车1取货点B-0-1取货', 'SHIPMENT', '1', 21, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 148, '1-F1-B-0-2.xml', '1车1取货点B-0-2取货', 'SHIPMENT', '1', 22, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 149, '1-F1-B-0-3.xml', '1车1取货点B-0-3取货', 'SHIPMENT', '1', 23, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 150, '1-F1-B-0-4.xml', '1车1取货点B-0-4取货', 'SHIPMENT', '1', 24, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 151, '1-F1-B-0-5.xml', '1车1取货点B-0-5取货', 'SHIPMENT', '1', 25, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 152, '1-F1-B-0-6.xml', '1车1取货点B-0-6取货', 'SHIPMENT', '1', 26, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 153, '1-F1-B-0-7.xml', '1车1取货点B-0-7取货', 'SHIPMENT', '1', 27, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 154, '1-F1-B-0-8.xml', '1车1取货点B-0-8取货', 'SHIPMENT', '1', 28, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 155, '1-F1-B-0-9.xml', '1车1取货点B-0-9取货', 'SHIPMENT', '1', 29, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 156, '1-F1-B-0-10.xml', '1车1取货点B-0-10取货', 'SHIPMENT', '1', 30, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 157, '1-F1-B-1-1.xml', '1车1取货点B-1-1取货', 'SHIPMENT', '1', 31, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 158, '1-F1-B-1-2.xml', '1车1取货点B-1-2取货', 'SHIPMENT', '1', 32, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 159, '1-F1-B-1-3.xml', '1车1取货点B-1-3取货', 'SHIPMENT', '1', 33, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 160, '1-F1-B-1-4.xml', '1车1取货点B-1-4取货', 'SHIPMENT', '1', 34, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 161, '1-F1-B-1-5.xml', '1车1取货点B-1-5取货', 'SHIPMENT', '1', 35, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 162, '1-F1-B-1-6.xml', '1车1取货点B-1-6取货', 'SHIPMENT', '1', 36, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 163, '1-F1-B-1-7.xml', '1车1取货点B-1-7取货', 'SHIPMENT', '1', 37, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 164, '1-F1-B-1-8.xml', '1车1取货点B-1-8取货', 'SHIPMENT', '1', 38, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 165, '1-F1-B-1-9.xml', '1车1取货点B-1-9取货', 'SHIPMENT', '1', 39, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 166, '1-F1-B-1-10.xml', '1车1取货点B-1-10取货', 'SHIPMENT', '1', 40, 1, 1, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 190, '1-F2-A-0-1.xml', '1车2取货点A-0-1取货', 'SHIPMENT', '1', 1, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 191, '1-F2-A-0-2.xml', '1车2取货点A-0-2取货', 'SHIPMENT', '1', 2, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 192, '1-F2-A-0-3.xml', '1车2取货点A-0-3取货', 'SHIPMENT', '1', 3, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 193, '1-F2-A-0-4.xml', '1车2取货点A-0-4取货', 'SHIPMENT', '1', 4, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 194, '1-F2-A-0-5.xml', '1车2取货点A-0-5取货', 'SHIPMENT', '1', 5, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 195, '1-F2-A-0-6.xml', '1车2取货点A-0-6取货', 'SHIPMENT', '1', 6, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 196, '1-F2-A-0-7.xml', '1车2取货点A-0-7取货', 'SHIPMENT', '1', 7, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 197, '1-F2-A-0-8.xml', '1车2取货点A-0-8取货', 'SHIPMENT', '1', 8, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 198, '1-F2-A-0-9.xml', '1车2取货点A-0-9取货', 'SHIPMENT', '1', 9, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 199, '1-F2-A-0-10.xml', '1车2取货点A-0-10取货', 'SHIPMENT', '1', 10, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 200, '1-F2-A-1-1.xml', '1车2取货点A-1-1取货', 'SHIPMENT', '1', 11, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 201, '1-F2-A-1-2.xml', '1车2取货点A-1-2取货', 'SHIPMENT', '1', 12, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 202, '1-F2-A-1-3.xml', '1车2取货点A-1-3取货', 'SHIPMENT', '1', 13, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 203, '1-F2-A-1-4.xml', '1车2取货点A-1-4取货', 'SHIPMENT', '1', 14, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 204, '1-F2-A-1-5.xml', '1车2取货点A-1-5取货', 'SHIPMENT', '1', 15, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 205, '1-F2-A-1-6.xml', '1车2取货点A-1-6取货', 'SHIPMENT', '1', 16, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 206, '1-F2-A-1-7.xml', '1车2取货点A-1-7取货', 'SHIPMENT', '1', 17, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 207, '1-F2-A-1-8.xml', '1车2取货点A-1-8取货', 'SHIPMENT', '1', 18, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 208, '1-F2-A-1-9.xml', '1车2取货点A-1-9取货', 'SHIPMENT', '1', 19, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 209, '1-F2-A-1-10.xml', '1车2取货点A-1-10取货', 'SHIPMENT', '1', 20, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 210, '1-F2-B-0-1.xml', '1车2取货点B-0-1取货', 'SHIPMENT', '1', 21, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 211, '1-F2-B-0-2.xml', '1车2取货点B-0-2取货', 'SHIPMENT', '1', 22, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 212, '1-F2-B-0-3.xml', '1车2取货点B-0-3取货', 'SHIPMENT', '1', 23, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 213, '1-F2-B-0-4.xml', '1车2取货点B-0-4取货', 'SHIPMENT', '1', 24, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 214, '1-F2-B-0-5.xml', '1车2取货点B-0-5取货', 'SHIPMENT', '1', 25, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 215, '1-F2-B-0-6.xml', '1车2取货点B-0-6取货', 'SHIPMENT', '1', 26, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 216, '1-F2-B-0-7.xml', '1车2取货点B-0-7取货', 'SHIPMENT', '1', 27, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 217, '1-F2-B-0-8.xml', '1车2取货点B-0-8取货', 'SHIPMENT', '1', 28, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 218, '1-F2-B-0-9.xml', '1车2取货点B-0-9取货', 'SHIPMENT', '1', 29, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 219, '1-F2-B-0-10.xml', '1车2取货点B-0-10取货', 'SHIPMENT', '1', 30, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 220, '1-F2-B-1-1.xml', '1车2取货点B-1-1取货', 'SHIPMENT', '1', 31, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 221, '1-F2-B-1-2.xml', '1车2取货点B-1-2取货', 'SHIPMENT', '1', 32, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 222, '1-F2-B-1-3.xml', '1车2取货点B-1-3取货', 'SHIPMENT', '1', 33, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 223, '1-F2-B-1-4.xml', '1车2取货点B-1-4取货', 'SHIPMENT', '1', 34, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 224, '1-F2-B-1-5.xml', '1车2取货点B-1-5取货', 'SHIPMENT', '1', 35, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 225, '1-F2-B-1-6.xml', '1车2取货点B-1-6取货', 'SHIPMENT', '1', 36, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 226, '1-F2-B-1-7.xml', '1车2取货点B-1-7取货', 'SHIPMENT', '1', 37, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 227, '1-F2-B-1-8.xml', '1车2取货点B-1-8取货', 'SHIPMENT', '1', 38, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 228, '1-F2-B-1-9.xml', '1车2取货点B-1-9取货', 'SHIPMENT', '1', 39, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 229, '1-F2-B-1-10.xml', '1车2取货点B-1-10取货', 'SHIPMENT', '1', 40, 1, 1, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 253, '2-Q1-A-0-1.xml', '2车1存货点A-0-1存货', 'RECEIPT', '1', 1, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 254, '2-Q1-A-0-2.xml', '2车1存货点A-0-2存货', 'RECEIPT', '1', 2, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 255, '2-Q1-A-0-3.xml', '2车1存货点A-0-3存货', 'RECEIPT', '1', 3, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 256, '2-Q1-A-0-4.xml', '2车1存货点A-0-4存货', 'RECEIPT', '1', 4, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 257, '2-Q1-A-0-5.xml', '2车1存货点A-0-5存货', 'RECEIPT', '1', 5, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 258, '2-Q1-A-0-6.xml', '2车1存货点A-0-6存货', 'RECEIPT', '1', 6, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 259, '2-Q1-A-0-7.xml', '2车1存货点A-0-7存货', 'RECEIPT', '1', 7, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 260, '2-Q1-A-0-8.xml', '2车1存货点A-0-8存货', 'RECEIPT', '1', 8, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 261, '2-Q1-A-0-9.xml', '2车1存货点A-0-9存货', 'RECEIPT', '1', 9, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 262, '2-Q1-A-0-10.xml', '2车1存货点A-0-10存货', 'RECEIPT', '1', 10, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 263, '2-Q1-A-1-1.xml', '2车1存货点A-1-1存货', 'RECEIPT', '1', 11, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 264, '2-Q1-A-1-2.xml', '2车1存货点A-1-2存货', 'RECEIPT', '1', 12, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 265, '2-Q1-A-1-3.xml', '2车1存货点A-1-3存货', 'RECEIPT', '1', 13, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 266, '2-Q1-A-1-4.xml', '2车1存货点A-1-4存货', 'RECEIPT', '1', 14, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 267, '2-Q1-A-1-5.xml', '2车1存货点A-1-5存货', 'RECEIPT', '1', 15, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 268, '2-Q1-A-1-6.xml', '2车1存货点A-1-6存货', 'RECEIPT', '1', 16, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 269, '2-Q1-A-1-7.xml', '2车1存货点A-1-7存货', 'RECEIPT', '1', 17, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 270, '2-Q1-A-1-8.xml', '2车1存货点A-1-8存货', 'RECEIPT', '1', 18, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 271, '2-Q1-A-1-9.xml', '2车1存货点A-1-9存货', 'RECEIPT', '1', 19, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 272, '2-Q1-A-1-10.xml', '2车1存货点A-1-10存货', 'RECEIPT', '1', 20, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 273, '2-Q1-B-0-1.xml', '2车1存货点B-0-1存货', 'RECEIPT', '1', 21, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 274, '2-Q1-B-0-2.xml', '2车1存货点B-0-2存货', 'RECEIPT', '1', 22, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 275, '2-Q1-B-0-3.xml', '2车1存货点B-0-3存货', 'RECEIPT', '1', 23, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 276, '2-Q1-B-0-4.xml', '2车1存货点B-0-4存货', 'RECEIPT', '1', 24, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 277, '2-Q1-B-0-5.xml', '2车1存货点B-0-5存货', 'RECEIPT', '1', 25, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 278, '2-Q1-B-0-6.xml', '2车1存货点B-0-6存货', 'RECEIPT', '1', 26, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 279, '2-Q1-B-0-7.xml', '2车1存货点B-0-7存货', 'RECEIPT', '1', 27, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 280, '2-Q1-B-0-8.xml', '2车1存货点B-0-8存货', 'RECEIPT', '1', 28, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 281, '2-Q1-B-0-9.xml', '2车1存货点B-0-9存货', 'RECEIPT', '1', 29, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 282, '2-Q1-B-0-10.xml', '2车1存货点B-0-10存货', 'RECEIPT', '1', 30, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 283, '2-Q1-B-1-1.xml', '2车1存货点B-1-1存货', 'RECEIPT', '1', 31, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 284, '2-Q1-B-1-2.xml', '2车1存货点B-1-2存货', 'RECEIPT', '1', 32, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 285, '2-Q1-B-1-3.xml', '2车1存货点B-1-3存货', 'RECEIPT', '1', 33, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 286, '2-Q1-B-1-4.xml', '2车1存货点B-1-4存货', 'RECEIPT', '1', 34, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 287, '2-Q1-B-1-5.xml', '2车1存货点B-1-5存货', 'RECEIPT', '1', 35, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 288, '2-Q1-B-1-6.xml', '2车1存货点B-1-6存货', 'RECEIPT', '1', 36, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 289, '2-Q1-B-1-7.xml', '2车1存货点B-1-7存货', 'RECEIPT', '1', 37, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 290, '2-Q1-B-1-8.xml', '2车1存货点B-1-8存货', 'RECEIPT', '1', 38, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 291, '2-Q1-B-1-9.xml', '2车1存货点B-1-9存货', 'RECEIPT', '1', 39, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 292, '2-Q1-B-1-10.xml', '2车1存货点B-1-10存货', 'RECEIPT', '1', 40, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 316, '2-Q2-A-0-1.xml', '2车2存货点A-0-1存货', 'RECEIPT', '1', 1, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 317, '2-Q2-A-0-2.xml', '2车2存货点A-0-2存货', 'RECEIPT', '1', 2, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 318, '2-Q2-A-0-3.xml', '2车2存货点A-0-3存货', 'RECEIPT', '1', 3, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 319, '2-Q2-A-0-4.xml', '2车2存货点A-0-4存货', 'RECEIPT', '1', 4, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 320, '2-Q2-A-0-5.xml', '2车2存货点A-0-5存货', 'RECEIPT', '1', 5, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 321, '2-Q2-A-0-6.xml', '2车2存货点A-0-6存货', 'RECEIPT', '1', 6, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 322, '2-Q2-A-0-7.xml', '2车2存货点A-0-7存货', 'RECEIPT', '1', 7, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 323, '2-Q2-A-0-8.xml', '2车2存货点A-0-8存货', 'RECEIPT', '1', 8, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 324, '2-Q2-A-0-9.xml', '2车2存货点A-0-9存货', 'RECEIPT', '1', 9, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 325, '2-Q2-A-0-10.xml', '2车2存货点A-0-10存货', 'RECEIPT', '1', 10, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 326, '2-Q2-A-1-1.xml', '2车2存货点A-1-1存货', 'RECEIPT', '1', 11, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 327, '2-Q2-A-1-2.xml', '2车2存货点A-1-2存货', 'RECEIPT', '1', 12, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 328, '2-Q2-A-1-3.xml', '2车2存货点A-1-3存货', 'RECEIPT', '1', 13, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 329, '2-Q2-A-1-4.xml', '2车2存货点A-1-4存货', 'RECEIPT', '1', 14, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 330, '2-Q2-A-1-5.xml', '2车2存货点A-1-5存货', 'RECEIPT', '1', 15, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 331, '2-Q2-A-1-6.xml', '2车2存货点A-1-6存货', 'RECEIPT', '1', 16, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 332, '2-Q2-A-1-7.xml', '2车2存货点A-1-7存货', 'RECEIPT', '1', 17, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 333, '2-Q2-A-1-8.xml', '2车2存货点A-1-8存货', 'RECEIPT', '1', 18, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 334, '2-Q2-A-1-9.xml', '2车2存货点A-1-9存货', 'RECEIPT', '1', 19, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 335, '2-Q2-A-1-10.xml', '2车2存货点A-1-10存货', 'RECEIPT', '1', 20, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 336, '2-Q2-B-0-1.xml', '2车2存货点B-0-1存货', 'RECEIPT', '1', 21, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 337, '2-Q2-B-0-2.xml', '2车2存货点B-0-2存货', 'RECEIPT', '1', 22, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 338, '2-Q2-B-0-3.xml', '2车2存货点B-0-3存货', 'RECEIPT', '1', 23, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 339, '2-Q2-B-0-4.xml', '2车2存货点B-0-4存货', 'RECEIPT', '1', 24, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 340, '2-Q2-B-0-5.xml', '2车2存货点B-0-5存货', 'RECEIPT', '1', 25, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 341, '2-Q2-B-0-6.xml', '2车2存货点B-0-6存货', 'RECEIPT', '1', 26, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 342, '2-Q2-B-0-7.xml', '2车2存货点B-0-7存货', 'RECEIPT', '1', 27, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 343, '2-Q2-B-0-8.xml', '2车2存货点B-0-8存货', 'RECEIPT', '1', 28, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 344, '2-Q2-B-0-9.xml', '2车2存货点B-0-9存货', 'RECEIPT', '1', 29, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 345, '2-Q2-B-0-10.xml', '2车2存货点B-0-10存货', 'RECEIPT', '1', 30, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 346, '2-Q2-B-1-1.xml', '2车2存货点B-1-1存货', 'RECEIPT', '1', 31, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 347, '2-Q2-B-1-2.xml', '2车2存货点B-1-2存货', 'RECEIPT', '1', 32, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 348, '2-Q2-B-1-3.xml', '2车2存货点B-1-3存货', 'RECEIPT', '1', 33, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 349, '2-Q2-B-1-4.xml', '2车2存货点B-1-4存货', 'RECEIPT', '1', 34, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 350, '2-Q2-B-1-5.xml', '2车2存货点B-1-5存货', 'RECEIPT', '1', 35, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 351, '2-Q2-B-1-6.xml', '2车2存货点B-1-6存货', 'RECEIPT', '1', 36, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 352, '2-Q2-B-1-7.xml', '2车2存货点B-1-7存货', 'RECEIPT', '1', 37, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 353, '2-Q2-B-1-8.xml', '2车2存货点B-1-8存货', 'RECEIPT', '1', 38, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 354, '2-Q2-B-1-9.xml', '2车2存货点B-1-9存货', 'RECEIPT', '1', 39, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 355, '2-Q2-B-1-10.xml', '2车2存货点B-1-10存货', 'RECEIPT', '1', 40, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 379, '2-F1-A-0-1.xml', '2车1取货点A-0-1取货', 'SHIPMENT', '1', 1, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 380, '2-F1-A-0-2.xml', '2车1取货点A-0-2取货', 'SHIPMENT', '1', 2, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 381, '2-F1-A-0-3.xml', '2车1取货点A-0-3取货', 'SHIPMENT', '1', 3, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 382, '2-F1-A-0-4.xml', '2车1取货点A-0-4取货', 'SHIPMENT', '1', 4, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 383, '2-F1-A-0-5.xml', '2车1取货点A-0-5取货', 'SHIPMENT', '1', 5, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 384, '2-F1-A-0-6.xml', '2车1取货点A-0-6取货', 'SHIPMENT', '1', 6, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 385, '2-F1-A-0-7.xml', '2车1取货点A-0-7取货', 'SHIPMENT', '1', 7, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 386, '2-F1-A-0-8.xml', '2车1取货点A-0-8取货', 'SHIPMENT', '1', 8, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 387, '2-F1-A-0-9.xml', '2车1取货点A-0-9取货', 'SHIPMENT', '1', 9, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 388, '2-F1-A-0-10.xml', '2车1取货点A-0-10取货', 'SHIPMENT', '1', 10, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 389, '2-F1-A-1-1.xml', '2车1取货点A-1-1取货', 'SHIPMENT', '1', 11, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 390, '2-F1-A-1-2.xml', '2车1取货点A-1-2取货', 'SHIPMENT', '1', 12, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 391, '2-F1-A-1-3.xml', '2车1取货点A-1-3取货', 'SHIPMENT', '1', 13, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 392, '2-F1-A-1-4.xml', '2车1取货点A-1-4取货', 'SHIPMENT', '1', 14, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 393, '2-F1-A-1-5.xml', '2车1取货点A-1-5取货', 'SHIPMENT', '1', 15, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 394, '2-F1-A-1-6.xml', '2车1取货点A-1-6取货', 'SHIPMENT', '1', 16, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 395, '2-F1-A-1-7.xml', '2车1取货点A-1-7取货', 'SHIPMENT', '1', 17, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 396, '2-F1-A-1-8.xml', '2车1取货点A-1-8取货', 'SHIPMENT', '1', 18, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 397, '2-F1-A-1-9.xml', '2车1取货点A-1-9取货', 'SHIPMENT', '1', 19, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 398, '2-F1-A-1-10.xml', '2车1取货点A-1-10取货', 'SHIPMENT', '1', 20, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 399, '2-F1-B-0-1.xml', '2车1取货点B-0-1取货', 'SHIPMENT', '1', 21, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 400, '2-F1-B-0-2.xml', '2车1取货点B-0-2取货', 'SHIPMENT', '1', 22, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 401, '2-F1-B-0-3.xml', '2车1取货点B-0-3取货', 'SHIPMENT', '1', 23, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 402, '2-F1-B-0-4.xml', '2车1取货点B-0-4取货', 'SHIPMENT', '1', 24, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 403, '2-F1-B-0-5.xml', '2车1取货点B-0-5取货', 'SHIPMENT', '1', 25, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 404, '2-F1-B-0-6.xml', '2车1取货点B-0-6取货', 'SHIPMENT', '1', 26, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 405, '2-F1-B-0-7.xml', '2车1取货点B-0-7取货', 'SHIPMENT', '1', 27, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 406, '2-F1-B-0-8.xml', '2车1取货点B-0-8取货', 'SHIPMENT', '1', 28, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 407, '2-F1-B-0-9.xml', '2车1取货点B-0-9取货', 'SHIPMENT', '1', 29, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 408, '2-F1-B-0-10.xml', '2车1取货点B-0-10取货', 'SHIPMENT', '1', 30, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 409, '2-F1-B-1-1.xml', '2车1取货点B-1-1取货', 'SHIPMENT', '1', 31, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 410, '2-F1-B-1-2.xml', '2车1取货点B-1-2取货', 'SHIPMENT', '1', 32, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 411, '2-F1-B-1-3.xml', '2车1取货点B-1-3取货', 'SHIPMENT', '1', 33, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 412, '2-F1-B-1-4.xml', '2车1取货点B-1-4取货', 'SHIPMENT', '1', 34, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 413, '2-F1-B-1-5.xml', '2车1取货点B-1-5取货', 'SHIPMENT', '1', 35, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 414, '2-F1-B-1-6.xml', '2车1取货点B-1-6取货', 'SHIPMENT', '1', 36, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 415, '2-F1-B-1-7.xml', '2车1取货点B-1-7取货', 'SHIPMENT', '1', 37, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 416, '2-F1-B-1-8.xml', '2车1取货点B-1-8取货', 'SHIPMENT', '1', 38, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 417, '2-F1-B-1-9.xml', '2车1取货点B-1-9取货', 'SHIPMENT', '1', 39, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 418, '2-F1-B-1-10.xml', '2车1取货点B-1-10取货', 'SHIPMENT', '1', 40, 1, 2, 1, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 442, '2-F2-A-0-1.xml', '2车2取货点A-0-1取货', 'SHIPMENT', '1', 1, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 443, '2-F2-A-0-2.xml', '2车2取货点A-0-2取货', 'SHIPMENT', '1', 2, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 444, '2-F2-A-0-3.xml', '2车2取货点A-0-3取货', 'SHIPMENT', '1', 3, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 445, '2-F2-A-0-4.xml', '2车2取货点A-0-4取货', 'SHIPMENT', '1', 4, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 446, '2-F2-A-0-5.xml', '2车2取货点A-0-5取货', 'SHIPMENT', '1', 5, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 447, '2-F2-A-0-6.xml', '2车2取货点A-0-6取货', 'SHIPMENT', '1', 6, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 448, '2-F2-A-0-7.xml', '2车2取货点A-0-7取货', 'SHIPMENT', '1', 7, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 449, '2-F2-A-0-8.xml', '2车2取货点A-0-8取货', 'SHIPMENT', '1', 8, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 450, '2-F2-A-0-9.xml', '2车2取货点A-0-9取货', 'SHIPMENT', '1', 9, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 451, '2-F2-A-0-10.xml', '2车2取货点A-0-10取货', 'SHIPMENT', '1', 10, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 452, '2-F2-A-1-1.xml', '2车2取货点A-1-1取货', 'SHIPMENT', '1', 11, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 453, '2-F2-A-1-2.xml', '2车2取货点A-1-2取货', 'SHIPMENT', '1', 12, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 454, '2-F2-A-1-3.xml', '2车2取货点A-1-3取货', 'SHIPMENT', '1', 13, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 455, '2-F2-A-1-4.xml', '2车2取货点A-1-4取货', 'SHIPMENT', '1', 14, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 456, '2-F2-A-1-5.xml', '2车2取货点A-1-5取货', 'SHIPMENT', '1', 15, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 457, '2-F2-A-1-6.xml', '2车2取货点A-1-6取货', 'SHIPMENT', '1', 16, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 458, '2-F2-A-1-7.xml', '2车2取货点A-1-7取货', 'SHIPMENT', '1', 17, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 459, '2-F2-A-1-8.xml', '2车2取货点A-1-8取货', 'SHIPMENT', '1', 18, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 460, '2-F2-A-1-9.xml', '2车2取货点A-1-9取货', 'SHIPMENT', '1', 19, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 461, '2-F2-A-1-10.xml', '2车2取货点A-1-10取货', 'SHIPMENT', '1', 20, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 462, '2-F2-B-0-1.xml', '2车2取货点B-0-1取货', 'SHIPMENT', '1', 21, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 463, '2-F2-B-0-2.xml', '2车2取货点B-0-2取货', 'SHIPMENT', '1', 22, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 464, '2-F2-B-0-3.xml', '2车2取货点B-0-3取货', 'SHIPMENT', '1', 23, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 465, '2-F2-B-0-4.xml', '2车2取货点B-0-4取货', 'SHIPMENT', '1', 24, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 466, '2-F2-B-0-5.xml', '2车2取货点B-0-5取货', 'SHIPMENT', '1', 25, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 467, '2-F2-B-0-6.xml', '2车2取货点B-0-6取货', 'SHIPMENT', '1', 26, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 468, '2-F2-B-0-7.xml', '2车2取货点B-0-7取货', 'SHIPMENT', '1', 27, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 469, '2-F2-B-0-8.xml', '2车2取货点B-0-8取货', 'SHIPMENT', '1', 28, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 470, '2-F2-B-0-9.xml', '2车2取货点B-0-9取货', 'SHIPMENT', '1', 29, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 471, '2-F2-B-0-10.xml', '2车2取货点B-0-10取货', 'SHIPMENT', '1', 30, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 472, '2-F2-B-1-1.xml', '2车2取货点B-1-1取货', 'SHIPMENT', '1', 31, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 473, '2-F2-B-1-2.xml', '2车2取货点B-1-2取货', 'SHIPMENT', '1', 32, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 474, '2-F2-B-1-3.xml', '2车2取货点B-1-3取货', 'SHIPMENT', '1', 33, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 475, '2-F2-B-1-4.xml', '2车2取货点B-1-4取货', 'SHIPMENT', '1', 34, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 476, '2-F2-B-1-5.xml', '2车2取货点B-1-5取货', 'SHIPMENT', '1', 35, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 477, '2-F2-B-1-6.xml', '2车2取货点B-1-6取货', 'SHIPMENT', '1', 36, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 478, '2-F2-B-1-7.xml', '2车2取货点B-1-7取货', 'SHIPMENT', '1', 37, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 479, '2-F2-B-1-8.xml', '2车2取货点B-1-8取货', 'SHIPMENT', '1', 38, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 480, '2-F2-B-1-9.xml', '2车2取货点B-1-9取货', 'SHIPMENT', '1', 39, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14'),
	(1, 481, '2-F2-B-1-10.xml', '2车2取货点B-1-10取货', 'SHIPMENT', '1', 40, 1, 2, 2, 1, 0, 0, '2019-06-03 12:36:14');
/*!40000 ALTER TABLE `singletask_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
