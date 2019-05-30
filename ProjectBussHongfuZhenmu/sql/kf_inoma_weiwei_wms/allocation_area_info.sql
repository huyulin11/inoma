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

-- Dumping structure for table kf_inoma_weiwei_wms.allocation_area_info
DROP TABLE IF EXISTS `allocation_area_info`;
CREATE TABLE IF NOT EXISTS `allocation_area_info` (
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域编号（WEIWEI_AREA）',
  `allowedSkuType` int(2) DEFAULT 0 COMMENT '允许的货品类别（0代表所有种类）',
  `allowedSkuId` int(11) DEFAULT 0 COMMENT '允许的货品ID（0代表均可）',
  `allowedLayerHeight` int(11) DEFAULT 0 COMMENT '允许的货品高度（0代表所有）',
  `text` varchar(40) DEFAULT NULL COMMENT '货位货品信息',
  `colNum` int(11) DEFAULT 5 COMMENT '列数',
  `rowNum` int(11) DEFAULT 6 COMMENT '行数',
  `zNum` int(2) DEFAULT 2 COMMENT '层数',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  `location` int(1) DEFAULT 4 COMMENT '货位所在方位（0中，1东，2西，3，南，4北）',
  PRIMARY KEY (`areaId`),
  UNIQUE KEY `rowid` (`areaId`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='仓库区域信息表';

-- Dumping data for table kf_inoma_weiwei_wms.allocation_area_info: ~24 rows (approximately)
DELETE FROM `allocation_area_info`;
/*!40000 ALTER TABLE `allocation_area_info` DISABLE KEYS */;
INSERT INTO `allocation_area_info` (`environment`, `areaId`, `allowedSkuType`, `allowedSkuId`, `allowedLayerHeight`, `text`, `colNum`, `rowNum`, `zNum`, `delflag`, `location`) VALUES
	(1, 1, 0, 0, 0, 'A', 4, 6, 1, 0, 2),
	(1, 2, 0, 0, 0, 'B', 5, 6, 1, 0, 2),
	(1, 3, 0, 0, 0, 'C', 5, 6, 1, 0, 2),
	(1, 4, 0, 0, 0, 'D', 5, 6, 1, 0, 2),
	(1, 5, 0, 0, 0, 'E', 5, 6, 1, 0, 2),
	(1, 6, 0, 0, 0, 'F', 3, 6, 2, 0, 2),
	(1, 7, 0, 0, 0, 'G', 5, 6, 2, 0, 2),
	(1, 8, 0, 0, 0, 'H', 5, 6, 2, 0, 2),
	(1, 9, 0, 0, 0, 'I', 5, 6, 2, 0, 2),
	(1, 10, 0, 0, 0, 'J', 5, 6, 2, 0, 2),
	(1, 11, 0, 0, 0, 'K', 5, 6, 2, 0, 2),
	(1, 12, 0, 0, 0, 'L', 5, 6, 2, 0, 2),
	(1, 13, 0, 0, 0, 'M', 2, 4, 2, 1, 2),
	(1, 14, 0, 0, 0, 'N', 2, 13, 2, 1, 4),
	(1, 15, 0, 0, 0, 'O', 5, 13, 2, 1, 4),
	(1, 16, 0, 0, 0, 'P', 5, 13, 2, 1, 4),
	(1, 17, 0, 0, 0, 'Q', 5, 13, 2, 0, 4),
	(1, 18, 0, 0, 0, 'R', 5, 13, 2, 0, 4),
	(1, 19, 0, 0, 0, 'S', 5, 13, 2, 0, 4),
	(1, 20, 0, 0, 0, 'T', 5, 13, 2, 0, 4),
	(1, 21, 0, 0, 0, 'U', 3, 8, 1, 1, 4),
	(2, 22, 0, 0, 0, 'UA', 2, 2, 1, 0, 4),
	(1, 99, 0, 0, 0, 'CHG充电', 3, 1, 1, 0, 4),
	(2, 100, 0, 0, 0, 'UCHG充电', 1, 1, 1, 0, 4);
/*!40000 ALTER TABLE `allocation_area_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
