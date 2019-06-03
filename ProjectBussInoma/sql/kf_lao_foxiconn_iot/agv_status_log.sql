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

-- Dumping structure for table kf_lao_foxiconn_iot.agv_status_log
DROP TABLE IF EXISTS `agv_status_log`;
CREATE TABLE IF NOT EXISTS `agv_status_log` (
  `uuid` varchar(36) NOT NULL COMMENT '主键',
  `time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '发生时间',
  `opflag` varchar(16) DEFAULT NULL COMMENT '操作标志',
  `tasktype` varchar(30) DEFAULT NULL COMMENT '指令',
  `autoflag` int(1) DEFAULT 0 COMMENT '是否自动发送（1为是，0为否，-1为半自动）',
  `msg` text DEFAULT NULL COMMENT '备注信息',
  `agvId` int(11) DEFAULT NULL COMMENT 'AGV的id，0代表全部',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志，1代表已删除，0代表可用',
  `overtime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '完成时间',
  PRIMARY KEY (`uuid`),
  KEY `taskid` (`tasktype`,`agvId`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='启停任务执行表';

-- Dumping data for table kf_lao_foxiconn_iot.agv_status_log: ~1 rows (大约)
DELETE FROM `agv_status_log`;
/*!40000 ALTER TABLE `agv_status_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `agv_status_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
