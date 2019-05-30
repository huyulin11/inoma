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

-- Dumping data for table kf_inoma_weiwei_iot.iot_client_info: ~16 rows (approximately)
DELETE FROM `iot_client_info`;
/*!40000 ALTER TABLE `iot_client_info` DISABLE KEYS */;
INSERT INTO `iot_client_info` (`id`, `ip`, `port`, `name`, `devtype`, `delflag`) VALUES
	(1, '5501', 'COM55', '1号AGV', 'A', 0),
	(2, '5502', 'COM55', '2号AGV', 'A', 0),
	(3, '5503', 'COM55', '3号AGV', 'A', 0),
	(4, '5504', 'COM55', '4号AGV', 'A', 0),
	(201, '4201', 'COM55', '1号自动门', 'B', 0),
	(202, '4202', 'COM55', '2号自动门', 'B', 0),
	(203, '4203', 'COM55', '3号自动门', 'B', 0),
	(204, '4204', 'COM55', '4号自动门', 'B', 0),
	(301, '4301', 'COM55', '1号升降机', 'C', 0),
	(302, '4302', 'COM55', '2号升降机', 'C', 0),
	(303, '4303', 'COM55', '3号升降机', 'C', 0),
	(304, '4304', 'COM55', '4号升降机', 'C', 0),
	(401, '4401', 'COM55', '1号交通灯', 'D', 0),
	(402, '4402', 'COM55', '2号交通灯', 'D', 0),
	(403, '4403', 'COM55', '3号交通灯', 'D', 0),
	(404, '4404', 'COM55', '4号交通灯', 'D', 0);
/*!40000 ALTER TABLE `iot_client_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
