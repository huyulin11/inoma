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

-- Dumping structure for table kf_inoma_weiwei_wms.allocation_column_info
DROP TABLE IF EXISTS `allocation_column_info`;
CREATE TABLE IF NOT EXISTS `allocation_column_info` (
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `columnId` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `areaId` int(11) NOT NULL DEFAULT 1 COMMENT '区域编号（WEIWEI_AREA）',
  `colId` int(11) NOT NULL COMMENT '列号',
  `allowedSkuType` int(2) DEFAULT 0 COMMENT '允许的货品类别（0代表所有种类）',
  `allowedSkuId` int(11) DEFAULT 0 COMMENT '允许的货品ID（0代表均可）',
  `allowedLayerHeight` int(11) DEFAULT 2 COMMENT '允许的货品高度（0代表所有）',
  `text` varchar(40) DEFAULT NULL COMMENT '货位货品信息',
  `xaxis` int(11) DEFAULT 0 COMMENT '该列对应平面坐标系中的X坐标值',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`columnId`),
  UNIQUE KEY `rowid` (`areaId`,`colId`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='仓库列信息表';

-- Dumping data for table kf_inoma_weiwei_wms.allocation_column_info: ~102 rows (大约)
DELETE FROM `allocation_column_info`;
/*!40000 ALTER TABLE `allocation_column_info` DISABLE KEYS */;
INSERT INTO `allocation_column_info` (`environment`, `columnId`, `areaId`, `colId`, `allowedSkuType`, `allowedSkuId`, `allowedLayerHeight`, `text`, `xaxis`, `delflag`) VALUES
	(1, 1, 1, 1, 0, 32, 2, NULL, 15000, 0),
	(1, 2, 1, 2, 0, 32, 2, NULL, 13300, 0),
	(1, 3, 1, 3, 0, 33, 2, NULL, 11600, 0),
	(1, 4, 1, 4, 0, 33, 2, NULL, 0, 1),
	(1, 5, 2, 1, 0, 23, 2, NULL, 8740, 0),
	(1, 6, 2, 2, 0, 23, 2, NULL, 7090, 0),
	(1, 7, 2, 3, 0, 23, 2, NULL, 5440, 0),
	(1, 8, 2, 4, 0, 23, 2, NULL, 3790, 0),
	(1, 9, 2, 5, 0, 23, 2, NULL, 2140, 0),
	(1, 10, 3, 1, 0, 16, 2, NULL, -340, 0),
	(1, 11, 3, 2, 0, 16, 2, NULL, -1990, 0),
	(1, 12, 3, 3, 0, 16, 2, NULL, -3650, 0),
	(1, 13, 3, 4, 0, 16, 2, NULL, -5290, 0),
	(1, 14, 3, 5, 0, 16, 2, NULL, -6940, 0),
	(1, 15, 4, 1, 0, 31, 2, NULL, -9340, 0),
	(1, 16, 4, 2, 0, 31, 2, NULL, -10990, 0),
	(1, 17, 4, 3, 0, 31, 2, NULL, -12650, 0),
	(1, 18, 4, 4, 0, 31, 2, NULL, -14290, 0),
	(1, 19, 4, 5, 0, 31, 2, NULL, -15940, 0),
	(1, 20, 5, 1, 0, 13, 2, NULL, -18340, 0),
	(1, 21, 5, 2, 0, 13, 2, NULL, -19990, 0),
	(1, 22, 5, 3, 0, 13, 2, NULL, -21650, 0),
	(1, 23, 5, 4, 0, 13, 2, NULL, -23290, 0),
	(1, 24, 5, 5, 0, 13, 2, NULL, -24940, 0),
	(1, 25, 6, 1, 0, 21, 2, NULL, -34130, 1),
	(1, 26, 6, 2, 0, 21, 2, NULL, -35780, 0),
	(1, 27, 6, 3, 0, 21, 2, NULL, -37430, 0),
	(1, 28, 7, 1, 0, 21, 2, NULL, -39830, 0),
	(1, 29, 7, 2, 0, 21, 2, NULL, -41480, 1),
	(1, 30, 7, 3, 0, 21, 2, NULL, -43130, 1),
	(1, 31, 7, 4, 0, 21, 2, NULL, -44780, 1),
	(1, 32, 7, 5, 0, 21, 2, NULL, -46430, 0),
	(1, 33, 8, 1, 0, 30, 2, NULL, -48830, 0),
	(1, 34, 8, 2, 0, 30, 2, NULL, -50030, 0),
	(1, 35, 8, 3, 0, 30, 2, NULL, -51680, 0),
	(1, 36, 8, 4, 0, 30, 2, NULL, -53330, 0),
	(1, 37, 8, 5, 0, 29, 2, NULL, -54980, 0),
	(1, 38, 9, 1, 0, 29, 2, NULL, -57830, 0),
	(1, 39, 9, 2, 0, 29, 2, NULL, -59480, 0),
	(1, 40, 9, 3, 0, 29, 2, NULL, -61130, 0),
	(1, 41, 9, 4, 0, 11, 2, NULL, -63780, 0),
	(1, 42, 9, 5, 0, 11, 2, NULL, -64430, 0),
	(1, 43, 10, 1, 0, 10, 2, NULL, -66830, 0),
	(1, 44, 10, 2, 0, 10, 2, NULL, -68480, 0),
	(1, 45, 10, 3, 0, 10, 2, NULL, -70130, 0),
	(1, 46, 10, 4, 0, 10, 2, NULL, -71780, 0),
	(1, 47, 10, 5, 0, 9, 2, NULL, -73430, 0),
	(1, 48, 11, 1, 0, 9, 2, NULL, -75830, 0),
	(1, 49, 11, 2, 0, 9, 2, NULL, -77480, 0),
	(1, 50, 11, 3, 0, 8, 2, NULL, -79130, 0),
	(1, 51, 11, 4, 1, 8, 2, NULL, -80780, 0),
	(1, 52, 11, 5, 1, 8, 2, NULL, -82430, 0),
	(1, 53, 12, 1, 2, 0, 2, NULL, -84830, 0),
	(1, 54, 12, 2, 2, 0, 2, NULL, -86480, 0),
	(1, 55, 12, 3, 2, 0, 2, NULL, -88130, 0),
	(1, 56, 12, 4, 2, 0, 2, NULL, -89780, 0),
	(1, 57, 12, 5, 2, 0, 2, NULL, -91430, 0),
	(1, 58, 13, 1, 1, 0, 2, NULL, -93830, 0),
	(1, 59, 13, 2, 1, 0, 2, NULL, -95480, 0),
	(1, 63, 14, 1, 1, 0, 2, NULL, -93830, 0),
	(1, 64, 14, 2, 1, 0, 2, NULL, -95480, 0),
	(1, 65, 15, 1, 1, 0, 2, NULL, -84830, 0),
	(1, 66, 15, 2, 1, 0, 2, NULL, -86480, 0),
	(1, 67, 15, 3, 1, 0, 2, NULL, -88130, 0),
	(1, 68, 15, 4, 1, 0, 2, NULL, -89780, 0),
	(1, 69, 15, 5, 1, 0, 2, NULL, -91430, 0),
	(1, 70, 16, 1, 0, 0, 2, NULL, -75830, 0),
	(1, 71, 16, 2, 0, 0, 2, NULL, -77480, 0),
	(1, 72, 16, 3, 0, 0, 2, NULL, -79130, 0),
	(1, 73, 16, 4, 0, 0, 2, NULL, -80780, 0),
	(1, 74, 16, 5, 0, 0, 2, NULL, -82430, 0),
	(1, 75, 17, 1, 0, 25, 2, NULL, -66830, 0),
	(1, 76, 17, 2, 0, 25, 2, NULL, -68480, 0),
	(1, 77, 17, 3, 0, 18, 2, NULL, -70130, 0),
	(1, 78, 17, 4, 0, 18, 2, NULL, -71780, 0),
	(1, 79, 17, 5, 0, 18, 2, NULL, -73430, 0),
	(1, 80, 18, 1, 0, 24, 2, NULL, -57830, 0),
	(1, 81, 18, 2, 0, 24, 2, NULL, -59480, 0),
	(1, 82, 18, 3, 0, 17, 2, NULL, -61130, 0),
	(1, 83, 18, 4, 0, 17, 2, NULL, -63780, 0),
	(1, 84, 18, 5, 0, 17, 2, NULL, -64430, 0),
	(1, 85, 19, 1, 0, 19, 2, NULL, -48830, 0),
	(1, 86, 19, 2, 0, 19, 2, NULL, -50030, 0),
	(1, 87, 19, 3, 0, 20, 2, NULL, -51680, 0),
	(1, 88, 19, 4, 0, 20, 2, NULL, -53330, 0),
	(1, 89, 19, 5, 0, 20, 2, NULL, -54980, 0),
	(1, 90, 20, 1, 0, 19, 2, NULL, -39830, 1),
	(1, 91, 20, 2, 0, 0, 2, NULL, -41480, 1),
	(1, 92, 20, 3, 0, 0, 2, NULL, -43130, 1),
	(1, 93, 20, 4, 0, 0, 2, NULL, -44780, 1),
	(1, 94, 20, 5, 0, 0, 2, NULL, -46430, 1),
	(1, 95, 21, 1, 0, 0, 2, NULL, 0, 0),
	(1, 96, 21, 2, 0, 0, 2, NULL, 0, 0),
	(1, 97, 21, 3, 0, 0, 2, NULL, 0, 0),
	(1, 98, 21, 4, 0, 0, 2, NULL, 0, 0),
	(1, 99, 21, 5, 0, 0, 2, NULL, 0, 0),
	(2, 100, 22, 1, 6, 0, 2, NULL, 0, 0),
	(2, 101, 22, 2, 6, 0, 2, NULL, 0, 0),
	(1, 102, 99, 1, 0, -1, 2, NULL, 0, 0),
	(1, 103, 99, 2, 0, -1, 2, NULL, 0, 0),
	(1, 104, 99, 3, 0, -1, 2, NULL, 0, 0),
	(2, 105, 100, 1, 0, -1, 2, NULL, 0, 0);
/*!40000 ALTER TABLE `allocation_column_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
