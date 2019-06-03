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

-- Dumping structure for table kf_inoma_weiwei_agv.agv_info
DROP TABLE IF EXISTS `agv_info`;
CREATE TABLE IF NOT EXISTS `agv_info` (
  `id` int(11) unsigned NOT NULL,
  `movestatus` varchar(50) NOT NULL DEFAULT 'CONTINUE' COMMENT '行驶状态',
  `sitestatus` varchar(50) NOT NULL DEFAULT 'INIT' COMMENT '站点状态',
  `taskstatus` varchar(50) NOT NULL DEFAULT 'FREE' COMMENT '任务状态',
  `agvstatus` varchar(10) NOT NULL DEFAULT '未准备' COMMENT '从AGV反馈消息得出的状态',
  `plcstatus` varchar(10) NOT NULL DEFAULT '未准备',
  `taskid` varchar(50) DEFAULT NULL COMMENT '关联任务ID',
  `stock` varchar(50) DEFAULT NULL COMMENT '当前AGV上缓存所在层数',
  `currentsite` int(11) DEFAULT NULL COMMENT '当前站点',
  `speed` int(11) DEFAULT NULL,
  `battery` varchar(50) DEFAULT NULL,
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `chargeid` int(3) NOT NULL DEFAULT 0 COMMENT '充电时充电站Id',
  `taskStep` tinyint(4) DEFAULT NULL COMMENT '0 ready send 1 sended 2 excute 3 taskend',
  `isFinished` tinyint(4) DEFAULT NULL COMMENT '是否完成',
  `isUsed` tinyint(4) DEFAULT NULL COMMENT '车子是否能用，可能存在一台车坏的情况',
  `delflag` tinyint(1) DEFAULT 0 COMMENT '删除标志，0为未删除，1为已删除',
  `nextXaxis` int(11) DEFAULT -1 COMMENT '下一条纵向道路的X坐标',
  `currentXaxis` int(11) DEFAULT -1 COMMENT '当前所在道路',
  `inCurrentXaxis` int(1) DEFAULT 0 COMMENT '是否在当前道路（0否、1是）',
  `nextLocation` int(1) DEFAULT 4 COMMENT '下一条纵向道路的位置（东南西北中）',
  `currentLocation` int(1) DEFAULT 4 COMMENT '当前纵向道路的位置（东南西北中）',
  `gotIt` int(1) DEFAULT 0 COMMENT '是否已经取货并离开机械手所在列',
  `lastXaxis` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='AGV信息表';

-- Dumping data for table kf_inoma_weiwei_agv.agv_info: 2 rows
DELETE FROM `agv_info`;
/*!40000 ALTER TABLE `agv_info` DISABLE KEYS */;
INSERT INTO `agv_info` (`id`, `movestatus`, `sitestatus`, `taskstatus`, `agvstatus`, `plcstatus`, `taskid`, `stock`, `currentsite`, `speed`, `battery`, `environment`, `chargeid`, `taskStep`, `isFinished`, `isUsed`, `delflag`, `nextXaxis`, `currentXaxis`, `inCurrentXaxis`, `nextLocation`, `currentLocation`, `gotIt`, `lastXaxis`) VALUES
	(2, 'CONTINUE', 'INIT', 'FREE', '未准备', '未准备', '', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, -1, -1, 0, 4, 4, 0, -1),
	(1, 'CONTINUE', 'INIT', 'FREE', '未准备', '未准备', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, -1, -1, 0, 4, 4, 0, -1);
/*!40000 ALTER TABLE `agv_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
