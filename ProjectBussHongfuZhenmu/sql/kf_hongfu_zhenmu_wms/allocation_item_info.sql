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

-- Dumping structure for table kf_inoma_weiwei_wms.allocation_item_info
DROP TABLE IF EXISTS `allocation_item_info`;
CREATE TABLE IF NOT EXISTS `allocation_item_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '仓库/环境',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `skuId` int(11) DEFAULT 1 COMMENT '货品的ID',
  `num` int(11) DEFAULT 0 COMMENT '数量',
  `siteid` int(11) DEFAULT NULL COMMENT '对应站点id',
  `armactid` int(11) DEFAULT NULL COMMENT '对应机械手动作id',
  `text` varchar(40) DEFAULT NULL COMMENT '货位货品信息',
  `delflag` smallint(1) unsigned DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=63721 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table kf_inoma_weiwei_wms.allocation_item_info: ~40 rows (大约)
DELETE FROM `allocation_item_info`;
/*!40000 ALTER TABLE `allocation_item_info` DISABLE KEYS */;
INSERT INTO `allocation_item_info` (`id`, `environment`, `status`, `skuId`, `num`, `siteid`, `armactid`, `text`, `delflag`) VALUES
	(1, 1, 1, 1, 0, NULL, NULL, 'A-0-1', 0),
	(2, 1, 1, 1, 0, NULL, NULL, 'A-0-2', 0),
	(3, 1, 1, 1, 0, NULL, NULL, 'A-0-3', 0),
	(4, 1, 1, 1, 0, NULL, NULL, 'A-0-4', 0),
	(5, 1, 1, 1, 0, NULL, NULL, 'A-0-5', 0),
	(6, 1, 1, 1, 0, NULL, NULL, 'A-0-6', 0),
	(7, 1, 1, 1, 0, NULL, NULL, 'A-0-7', 0),
	(8, 1, 1, 1, 0, NULL, NULL, 'A-0-8', 0),
	(9, 1, 1, 1, 0, NULL, NULL, 'A-0-9', 0),
	(10, 1, 1, 1, 0, NULL, NULL, 'A-0-10', 0),
	(11, 1, 1, 1, 0, NULL, NULL, 'A-1-1', 0),
	(12, 1, 1, 1, 0, NULL, NULL, 'A-1-2', 0),
	(13, 1, 1, 1, 0, NULL, NULL, 'A-1-3', 0),
	(14, 1, 1, 1, 0, NULL, NULL, 'A-1-4', 0),
	(15, 1, 1, 1, 0, NULL, NULL, 'A-1-5', 0),
	(16, 1, 1, 1, 0, NULL, NULL, 'A-1-6', 0),
	(17, 1, 1, 1, 0, NULL, NULL, 'A-1-7', 0),
	(18, 1, 1, 1, 0, NULL, NULL, 'A-1-8', 0),
	(19, 1, 1, 1, 0, NULL, NULL, 'A-1-9', 0),
	(20, 1, 1, 1, 0, NULL, NULL, 'A-1-10', 0),
	(21, 1, 1, 1, 0, NULL, NULL, 'B-0-1', 0),
	(22, 1, 1, 1, 0, NULL, NULL, 'B-0-2', 0),
	(23, 1, 1, 1, 0, NULL, NULL, 'B-0-3', 0),
	(24, 1, 1, 1, 0, NULL, NULL, 'B-0-4', 0),
	(25, 1, 1, 1, 0, NULL, NULL, 'B-0-5', 0),
	(26, 1, 1, 1, 0, NULL, NULL, 'B-0-6', 0),
	(27, 1, 1, 1, 0, NULL, NULL, 'B-0-7', 0),
	(28, 1, 1, 1, 0, NULL, NULL, 'B-0-8', 0),
	(29, 1, 1, 1, 0, NULL, NULL, 'B-0-9', 0),
	(30, 1, 1, 1, 0, NULL, NULL, 'B-0-10', 0),
	(31, 1, 1, 1, 0, NULL, NULL, 'B-1-1', 0),
	(32, 1, 1, 1, 0, NULL, NULL, 'B-1-2', 0),
	(33, 1, 1, 1, 0, NULL, NULL, 'B-1-3', 0),
	(34, 1, 1, 1, 0, NULL, NULL, 'B-1-4', 0),
	(35, 1, 1, 1, 0, NULL, NULL, 'B-1-5', 0),
	(36, 1, 1, 1, 0, NULL, NULL, 'B-1-6', 0),
	(37, 1, 1, 1, 0, NULL, NULL, 'B-1-7', 0),
	(38, 1, 1, 1, 0, NULL, NULL, 'B-1-8', 0),
	(39, 1, 1, 1, 0, NULL, NULL, 'B-1-9', 0),
	(40, 1, 1, 1, 0, NULL, NULL, 'B-1-10', 0);
/*!40000 ALTER TABLE `allocation_item_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
