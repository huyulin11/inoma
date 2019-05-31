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

-- Dumping structure for table kf_inoma_weiwei_agv.taskexe_s2c_task
DROP TABLE IF EXISTS `taskexe_s2c_task`;
CREATE TABLE IF NOT EXISTS `taskexe_s2c_task` (
  `uuid` varchar(36) NOT NULL COMMENT '主键',
  `taskid` varchar(36) DEFAULT NULL COMMENT '任务ID',
  `tasksequence` int(11) DEFAULT 1 COMMENT '序列',
  `time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '发生时间',
  `lapId` int(3) DEFAULT NULL COMMENT '货源编号（维维为机械手）',
  `tasktype` varchar(50) DEFAULT '0' COMMENT '字典值（TASK_TYPE）',
  `addedinfo` varchar(50) DEFAULT '0' COMMENT '附加消息（在盘点功能中增加）',
  `addeddesc` varchar(50) DEFAULT '0' COMMENT '附加消息描述（在盘点功能中增加）',
  `opflag` varchar(16) DEFAULT NULL COMMENT '操作标志',
  `agvId` int(11) DEFAULT NULL COMMENT 'AGV的id，0代表全部',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志，1代表已删除，0代表可用',
  `overtime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '完成时间',
  `autoflag` int(1) DEFAULT 0 COMMENT '是否自动发送（1为是，0为否，-1为半自动）',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `UNIQ` (`taskid`,`tasksequence`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='运输任务执行表';

-- Dumping data for table kf_inoma_weiwei_agv.taskexe_s2c_task: 0 rows
DELETE FROM `taskexe_s2c_task`;
/*!40000 ALTER TABLE `taskexe_s2c_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskexe_s2c_task` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
