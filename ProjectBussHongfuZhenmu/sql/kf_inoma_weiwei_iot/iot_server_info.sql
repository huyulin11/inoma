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

-- Dumping structure for table kf_inoma_weiwei_iot.iot_server_info
DROP TABLE IF EXISTS `iot_server_info`;
CREATE TABLE IF NOT EXISTS `iot_server_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `port` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '设备名称',
  `devtype` int(11) DEFAULT NULL COMMENT '通讯设备类型（见字典SOCKET_DEV_TYPE）',
  `delflag` tinyint(1) DEFAULT 0 COMMENT '删除标志，0为未删除，1为已删除',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='socket通讯设备信息表（系统作为server）';

-- Dumping data for table kf_inoma_weiwei_iot.iot_server_info: ~0 rows (approximately)
DELETE FROM `iot_server_info`;
/*!40000 ALTER TABLE `iot_server_info` DISABLE KEYS */;
INSERT INTO `iot_server_info` (`id`, `ip`, `port`, `name`, `devtype`, `delflag`) VALUES
	(1, '127.0.0.1', 5300, '1号AGV', 0, 1);
/*!40000 ALTER TABLE `iot_server_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
