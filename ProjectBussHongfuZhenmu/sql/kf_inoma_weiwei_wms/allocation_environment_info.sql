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

-- Dumping structure for table kf_inoma_weiwei_wms.allocation_environment_info
DROP TABLE IF EXISTS `allocation_environment_info`;
CREATE TABLE IF NOT EXISTS `allocation_environment_info` (
  `environmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '环境编号',
  `text` varchar(40) DEFAULT NULL COMMENT '货位货品信息',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`environmentId`),
  UNIQUE KEY `rowid` (`environmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

-- Dumping data for table kf_inoma_weiwei_wms.allocation_environment_info: ~2 rows (approximately)
DELETE FROM `allocation_environment_info`;
/*!40000 ALTER TABLE `allocation_environment_info` DISABLE KEYS */;
INSERT INTO `allocation_environment_info` (`environmentId`, `text`, `delflag`) VALUES
	(1, '楼下', 0),
	(2, '楼上', 1);
/*!40000 ALTER TABLE `allocation_environment_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
