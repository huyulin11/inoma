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
  `allocOpType` smallint(1) DEFAULT 1 COMMENT '操作目标货位的类型：1为向目标货位放货；2为从目标货位取货；3为与其它任务一道的组合任务；',
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
) ENGINE=InnoDB AUTO_INCREMENT=13067 DEFAULT CHARSET=utf8 COMMENT='任务信息表';

-- Dumping data for table kf_inoma_weiwei_agv.singletask_info: ~8,643 rows (大约)
DELETE FROM `singletask_info`;
/*!40000 ALTER TABLE `singletask_info` DISABLE KEYS */;
INSERT INTO `singletask_info` (`environment`, `id`, `taskName`, `taskText`, `taskType`, `allocOpType`, `allocid`, `environmentId`, `agvId`, `lapId`, `isSendToAGV`, `delflag`, `orderby`, `createtime`) VALUES
	(1, 1, '1-A-1-1-1-114.xml', '1-A-1-1-1-114任务', '-1', 1, 1, 0, 1, 1, 1, 0, 0, '2018-05-09 16:08:24'),
	(1, 2, '2-A-1-1-1-114.xml', '2-A-1-1-1-114任务', '-1', 1, 1, 0, 2, 2, 1, 0, 0, '2018-05-09 16:08:24'),
	(1, 3, '3-A-1-1-1-114.xml', '3-A-1-1-1-114任务', '-1', 1, 1, 0, 3, 3, 1, 0, 0, '2018-05-09 16:08:24'),
	(1, 5, '1-A-1-2-1-114.xml', '1-A-1-2-1-114任务', '-1', 1, 2, 0, 1, 1, 1, 0, 0, '2018-05-09 16:08:24'),
	(1, 6, '2-A-1-2-1-114.xml', '2-A-1-2-1-114任务', '-1', 1, 2, 0, 2, 2, 1, 0, 0, '2018-05-09 16:08:24');
/*!40000 ALTER TABLE `singletask_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
