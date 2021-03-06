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

-- Dumping structure for table kf_inoma_weiwei_wms.sku_type_info
DROP TABLE IF EXISTS `sku_type_info`;
CREATE TABLE IF NOT EXISTS `sku_type_info` (
  `skuTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '货品类型的ID',
  `skuTypeName` varchar(30) DEFAULT NULL COMMENT '货品类型的名称',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`skuTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='sku种类信息表';

-- Dumping data for table kf_inoma_weiwei_wms.sku_type_info: ~0 rows (大约)
DELETE FROM `sku_type_info`;
/*!40000 ALTER TABLE `sku_type_info` DISABLE KEYS */;
INSERT INTO `sku_type_info` (`skuTypeId`, `skuTypeName`, `delflag`) VALUES
	(1, '档案类目', 0);
/*!40000 ALTER TABLE `sku_type_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
