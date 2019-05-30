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

-- Dumping structure for table kf_inoma_weiwei_wms.sku_type
DROP TABLE IF EXISTS `sku_type`;
CREATE TABLE IF NOT EXISTS `sku_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货品类型的ID',
  `name` varchar(30) DEFAULT NULL COMMENT '货品类型的名称',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iname` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='sku种类信息表';

-- Dumping data for table kf_inoma_weiwei_wms.sku_type: ~2 rows (approximately)
DELETE FROM `sku_type`;
/*!40000 ALTER TABLE `sku_type` DISABLE KEYS */;
INSERT INTO `sku_type` (`id`, `name`, `delflag`) VALUES
	(1, '档案类目', 0),
	(100, 'gaga', 0);
/*!40000 ALTER TABLE `sku_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
