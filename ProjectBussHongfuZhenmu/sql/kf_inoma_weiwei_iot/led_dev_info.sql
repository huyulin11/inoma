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

-- Dumping structure for table kf_inoma_weiwei_iot.led_dev_info
DROP TABLE IF EXISTS `led_dev_info`;
CREATE TABLE IF NOT EXISTS `led_dev_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `columnId` int(11) NOT NULL COMMENT '列的序列号',
  `ip` varchar(50) NOT NULL,
  `delflag` tinyint(1) DEFAULT 0 COMMENT '删除标志，0为未删除，1为已删除',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='LED信息表';

-- Dumping data for table kf_inoma_weiwei_iot.led_dev_info: ~14 rows (approximately)
DELETE FROM `led_dev_info`;
/*!40000 ALTER TABLE `led_dev_info` DISABLE KEYS */;
INSERT INTO `led_dev_info` (`id`, `columnId`, `ip`, `delflag`) VALUES
	(126, 1, '192.168.0.222', 0),
	(127, 2, '192.168.0.2', 1),
	(128, 3, '192.168.0.3', 1),
	(129, 4, '192.168.0.4', 1),
	(130, 5, '192.168.0.5', 1),
	(131, 6, '192.168.0.6', 1),
	(132, 7, '192.168.0.7', 1),
	(133, 8, '192.168.0.8', 1),
	(134, 9, '192.168.0.9', 0),
	(135, 10, '192.168.0.10', 1),
	(136, 11, '192.168.0.11', 1),
	(137, 12, '192.168.0.12', 1),
	(138, 13, '192.168.0.13', 1),
	(139, 14, '192.168.0.14', 1);
/*!40000 ALTER TABLE `led_dev_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
