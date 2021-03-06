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

-- Dumping structure for table kf_inoma_weiwei_iot.iot_client_info
DROP TABLE IF EXISTS `iot_client_info`;
CREATE TABLE IF NOT EXISTS `iot_client_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `port` varchar(50) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '设备名称',
  `devtype` varchar(10) DEFAULT NULL COMMENT '通讯设备类型（见字典SOCKET_DEV_TYPE）',
  `delflag` tinyint(1) DEFAULT 0 COMMENT '删除标志，0为未删除，1为已删除',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8 COMMENT='socket通讯设备信息表（系统作为client）';

-- Dumping data for table kf_inoma_weiwei_iot.iot_client_info: ~2 rows (大约)
DELETE FROM `iot_client_info`;
/*!40000 ALTER TABLE `iot_client_info` DISABLE KEYS */;
INSERT INTO `iot_client_info` (`id`, `ip`, `port`, `name`, `devtype`, `delflag`) VALUES
	(1, '127.0.0.1', '8182', '1号AGV', '10', 0),
	(2, '127.0.0.1', '8183', '2号AGV', '10', 0);
/*!40000 ALTER TABLE `iot_client_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
