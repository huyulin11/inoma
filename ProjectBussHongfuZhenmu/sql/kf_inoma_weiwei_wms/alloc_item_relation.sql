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

-- Dumping structure for table kf_inoma_weiwei_wms.alloc_item_relation
DROP TABLE IF EXISTS `alloc_item_relation`;
CREATE TABLE IF NOT EXISTS `alloc_item_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(10) unsigned DEFAULT 1 COMMENT '对应区域编号',
  `colId` int(11) unsigned DEFAULT 1 COMMENT '列号',
  `zId` int(11) unsigned DEFAULT 1 COMMENT '纵号',
  `columnId` int(11) unsigned DEFAULT 1 COMMENT '对应列编号',
  `delflag` smallint(5) unsigned DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68221 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_wms.alloc_item_relation: ~40 rows (大约)
DELETE FROM `alloc_item_relation`;
/*!40000 ALTER TABLE `alloc_item_relation` DISABLE KEYS */;
INSERT INTO `alloc_item_relation` (`id`, `areaId`, `colId`, `zId`, `columnId`, `delflag`) VALUES
	(1, 1, 1, 1, 1, 0),
	(2, 1, 1, 1, 1, 0),
	(3, 1, 1, 1, 1, 0),
	(4, 1, 1, 1, 1, 0),
	(5, 1, 1, 1, 1, 0),
	(6, 1, 1, 1, 1, 0),
	(7, 1, 1, 1, 1, 0),
	(8, 1, 1, 1, 1, 0),
	(9, 1, 1, 1, 1, 0),
	(10, 1, 1, 1, 1, 0),
	(11, 1, 1, 1, 1, 0),
	(12, 1, 1, 1, 1, 0),
	(13, 1, 1, 1, 1, 0),
	(14, 1, 1, 1, 1, 0),
	(15, 1, 1, 1, 1, 0),
	(16, 1, 1, 1, 1, 0),
	(17, 1, 1, 1, 1, 0),
	(18, 1, 1, 1, 1, 0),
	(19, 1, 1, 1, 1, 0),
	(20, 1, 1, 1, 1, 0),
	(21, 1, 1, 1, 1, 0),
	(22, 1, 1, 1, 1, 0),
	(23, 1, 1, 1, 1, 0),
	(24, 1, 1, 1, 1, 0),
	(25, 1, 1, 1, 1, 0),
	(26, 1, 1, 1, 1, 0),
	(27, 1, 1, 1, 1, 0),
	(28, 1, 1, 1, 1, 0),
	(29, 1, 1, 1, 1, 0),
	(30, 1, 1, 1, 1, 0),
	(31, 1, 1, 1, 1, 0),
	(32, 1, 1, 1, 1, 0),
	(33, 1, 1, 1, 1, 0),
	(34, 1, 1, 1, 1, 0),
	(35, 1, 1, 1, 1, 0),
	(36, 1, 1, 1, 1, 0),
	(37, 1, 1, 1, 1, 0),
	(38, 1, 1, 1, 1, 0),
	(39, 1, 1, 1, 1, 0),
	(40, 1, 1, 1, 1, 0);
/*!40000 ALTER TABLE `alloc_item_relation` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
