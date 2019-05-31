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

-- Dumping structure for table kf_inoma_weiwei_iot.lap_agv_info
DROP TABLE IF EXISTS `lap_agv_info`;
CREATE TABLE IF NOT EXISTS `lap_agv_info` (
  `lapId` int(11) NOT NULL AUTO_INCREMENT COMMENT '机械手编号',
  `agvId` int(11) NOT NULL COMMENT 'agv编号',
  `sortBy` int(11) DEFAULT 0 COMMENT '排序参照',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`lapId`,`agvId`),
  KEY `id` (`lapId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='取货点AGV对应关系信息表';

-- Dumping data for table kf_inoma_weiwei_iot.lap_agv_info: ~9 rows (大约)
DELETE FROM `lap_agv_info`;
/*!40000 ALTER TABLE `lap_agv_info` DISABLE KEYS */;
INSERT INTO `lap_agv_info` (`lapId`, `agvId`, `sortBy`, `delflag`) VALUES
	(1, 1, 1, 0),
	(1, 3, 3, 1),
	(1, 4, 2, 1),
	(2, 2, 1, 0),
	(2, 3, 2, 1),
	(2, 4, 3, 1),
	(3, 3, 0, 0),
	(4, 5, 0, 0),
	(5, 5, 0, 0);
/*!40000 ALTER TABLE `lap_agv_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
