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

-- Dumping structure for table kf_inoma_weiwei_agv.task_armact_info
DROP TABLE IF EXISTS `task_armact_info`;
CREATE TABLE IF NOT EXISTS `task_armact_info` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `armactname` varchar(50) NOT NULL COMMENT '站点名称',
  `armactcode` varchar(50) NOT NULL COMMENT '站点在终端的编码',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `createtime` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitename` (`armactname`),
  UNIQUE KEY `sitecode` (`armactcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='任务站点信息表';

-- Dumping data for table kf_inoma_weiwei_agv.task_armact_info: ~2 rows (大约)
DELETE FROM `task_armact_info`;
/*!40000 ALTER TABLE `task_armact_info` DISABLE KEYS */;
INSERT INTO `task_armact_info` (`id`, `armactname`, `armactcode`, `updatetime`, `createtime`, `delflag`) VALUES
	(1, '左上第一个档案', '0001', '2018-07-03 16:34:25', '2018-05-29 12:55:01', 0),
	(2, '右上第一个档案', '0002', '2018-07-03 16:34:36', '2018-05-29 12:55:57', 0);
/*!40000 ALTER TABLE `task_armact_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
