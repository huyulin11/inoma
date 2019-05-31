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

-- Dumping structure for table kf_inoma_weiwei_wms.sku_info
DROP TABLE IF EXISTS `sku_info`;
CREATE TABLE IF NOT EXISTS `sku_info` (
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货品的ID',
  `type` varchar(50) DEFAULT '1' COMMENT '品种的类别',
  `name` varchar(30) DEFAULT NULL COMMENT '货品的名称',
  `layerHeight` int(11) DEFAULT 114 COMMENT '单层高度',
  `weight` decimal(3,1) DEFAULT 25.0 COMMENT '单个货品的重量',
  `numInPallet` int(3) DEFAULT 50 COMMENT '每托盘默认的数量',
  `layerNum` int(1) DEFAULT 2 COMMENT '对应货位允许堆积的最大层数',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `skuName` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='sku信息表';

-- Dumping data for table kf_inoma_weiwei_wms.sku_info: ~0 rows (大约)
DELETE FROM `sku_info`;
/*!40000 ALTER TABLE `sku_info` DISABLE KEYS */;
INSERT INTO `sku_info` (`environment`, `id`, `type`, `name`, `layerHeight`, `weight`, `numInPallet`, `layerNum`, `delflag`) VALUES
	(0, 1, '档案类目', '档案3333', 0, 0.0, 1, 2, 0);
/*!40000 ALTER TABLE `sku_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
