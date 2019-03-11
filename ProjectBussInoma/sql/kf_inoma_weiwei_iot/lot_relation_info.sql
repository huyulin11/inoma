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

-- Dumping structure for table kf_inoma_weiwei_iot.lot_relation_info
DROP TABLE IF EXISTS `lot_relation_info`;
CREATE TABLE IF NOT EXISTS `lot_relation_info` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `agvid` int(16) NOT NULL COMMENT 'agvID',
  `devtype` int(16) NOT NULL COMMENT '设备类型ID',
  `devid` int(50) DEFAULT NULL COMMENT '设备ID',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='硬件关系信息表';

-- Dumping data for table kf_inoma_weiwei_iot.lot_relation_info: ~8 rows (approximately)
DELETE FROM `lot_relation_info`;
/*!40000 ALTER TABLE `lot_relation_info` DISABLE KEYS */;
INSERT INTO `lot_relation_info` (`id`, `agvid`, `devtype`, `devid`, `delflag`) VALUES
	(1, 1, 4, 125, 0),
	(2, 1, 3, 112, 0),
	(3, 2, 4, 126, 0),
	(4, 2, 3, 115, 0),
	(5, 3, 4, 127, 0),
	(6, 3, 3, 116, 0),
	(7, 4, 4, 128, 0),
	(8, 4, 3, 118, 0);
/*!40000 ALTER TABLE `lot_relation_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
