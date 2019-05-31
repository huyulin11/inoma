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

-- Dumping structure for table kf_inoma_weiwei_iot.connect_msg_socketdev
DROP TABLE IF EXISTS `connect_msg_socketdev`;
CREATE TABLE IF NOT EXISTS `connect_msg_socketdev` (
  `uuid` varchar(36) DEFAULT NULL,
  `id` int(11) DEFAULT NULL COMMENT 'AGV的id',
  `time` timestamp NULL DEFAULT current_timestamp(),
  `msg` text DEFAULT NULL,
  `flag` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='与AGV交互信息中间表';

-- Dumping data for table kf_inoma_weiwei_iot.connect_msg_socketdev: ~0 rows (大约)
DELETE FROM `connect_msg_socketdev`;
/*!40000 ALTER TABLE `connect_msg_socketdev` DISABLE KEYS */;
INSERT INTO `connect_msg_socketdev` (`uuid`, `id`, `time`, `msg`, `flag`) VALUES
	('1', 1, '2018-06-21 13:23:43', NULL, NULL);
/*!40000 ALTER TABLE `connect_msg_socketdev` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
