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

-- Dumping structure for table kf_inoma_weiwei_agv.task_site_logic
DROP TABLE IF EXISTS `task_site_logic`;
CREATE TABLE IF NOT EXISTS `task_site_logic` (
  `siteid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nextid` int(1) NOT NULL DEFAULT 0,
  `distance` decimal(4,2) NOT NULL DEFAULT 1.00 COMMENT '设定距离，常规为1，具体参照地图估算',
  `side` int(1) NOT NULL DEFAULT 0,
  `json` varchar(500) DEFAULT NULL,
  `delflag` int(1) DEFAULT 0,
  PRIMARY KEY (`siteid`,`nextid`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务站点信息表';

-- Dumping data for table kf_inoma_weiwei_agv.task_site_logic: ~86 rows (approximately)
DELETE FROM `task_site_logic`;
/*!40000 ALTER TABLE `task_site_logic` DISABLE KEYS */;
INSERT INTO `task_site_logic` (`siteid`, `nextid`, `distance`, `side`, `json`, `delflag`) VALUES
	(28, 29, 1.00, 2, '{"aspect":"1"}', 0),
	(29, 31, 1.00, 2, '{"aspect":"1"}', 0),
	(31, 32, 1.00, 2, '{"aspect":"1"}', 0),
	(32, 34, 1.00, 2, '{"aspect":"1"}', 0),
	(34, 91, 1.00, 2, '{"aspect":"1"}', 0),
	(35, 36, 1.00, 2, '{"aspect":"1"}', 0),
	(36, 37, 1.00, 2, '{"aspect":"1"}', 0),
	(37, 38, 1.00, 2, '{"aspect":"1"}', 0),
	(38, 39, 1.00, 2, '{"aspect":"1"}', 0),
	(39, 40, 1.00, 2, '{"aspect":"1"}', 0),
	(40, 41, 1.00, 2, '{"aspect":"1"}', 0),
	(41, 42, 1.00, 2, '{"aspect":"1"}', 0),
	(42, 43, 1.00, 1, '{"aspect":"1"}', 0),
	(43, 44, 1.00, 1, '{"aspect":"1"}', 0),
	(43, 45, 1.00, 2, '{"aspect":"1"}', 0),
	(44, 94, 1.00, 1, '{"aspect":"1"}', 0),
	(45, 46, 1.00, 2, '{"aspect":"1"}', 0),
	(47, 49, 1.00, 1, '{"aspect":"1"}', 0),
	(49, 50, 1.00, 2, '{"aspect":"1"}', 0),
	(49, 104, 1.00, 1, '{"aspect":"1"}', 0),
	(50, 54, 1.00, 2, '{"aspect":"1"}', 0),
	(50, 73, 1.00, 2, '{"aspect":"2"}', 0),
	(53, 56, 1.00, 2, '{"aspect":"2"}', 0),
	(54, 50, 1.00, 2, '{"aspect":"2"}', 0),
	(54, 55, 1.00, 2, '{"aspect":"1"}', 0),
	(55, 54, 1.00, 2, '{"aspect":"2"}', 0),
	(55, 57, 1.00, 2, '{"aspect":"1"}', 0),
	(56, 61, 1.00, 2, '{"aspect":"2"}', 0),
	(57, 55, 1.00, 2, '{"aspect":"2"}', 0),
	(57, 58, 1.00, 2, '{"aspect":"1"}', 0),
	(58, 59, 1.00, 2, '{"aspect":"1"}', 0),
	(59, 60, 1.00, 2, '{"aspect":"1"}', 0),
	(59, 92, 1.00, 1, '{"aspect":"1"}', 0),
	(60, 64, 1.00, 1, '{"aspect":"1"}', 0),
	(61, 53, 1.00, 2, '{"aspect":"1"}', 0),
	(61, 67, 1.00, 2, '{"aspect":"2"}', 0),
	(62, 63, 1.00, 2, '{"aspect":"2"}', 0),
	(63, 62, 1.00, 2, '{"aspect":"1"}', 0),
	(63, 64, 1.00, 2, '{"aspect":"2"}', 0),
	(64, 63, 1.00, 2, '{"aspect":"1"}', 0),
	(64, 65, 1.00, 2, '{"aspect":"2"}', 0),
	(65, 66, 1.00, 2, '{"aspect":"2"}', 0),
	(66, 70, 1.00, 1, '{"aspect":"2"}', 0),
	(67, 61, 1.00, 2, '{"aspect":"1","layer":"1"}', 0),
	(67, 68, 1.00, 2, '{"aspect":"2","layer":"3"}', 0),
	(67, 88, 1.00, 2, '{"aspect":"1","layer":"2"}', 0),
	(68, 67, 1.00, 1, '{"aspect":"1"}', 0),
	(68, 92, 1.00, 2, '{"aspect":"2"}', 0),
	(70, 72, 1.00, 2, '{"aspect":"2"}', 0),
	(71, 74, 1.00, 2, '{"aspect":"2"}', 0),
	(72, 57, 1.00, 2, '{"aspect":"2"}', 0),
	(73, 98, 1.00, 2, '{"aspect":"2"}', 0),
	(74, 75, 1.00, 2, '{"aspect":"2"}', 0),
	(75, 76, 1.00, 2, '{"aspect":"2"}', 0),
	(76, 77, 1.00, 2, '{"aspect":"2"}', 0),
	(77, 78, 1.00, 2, '{"aspect":"2"}', 0),
	(78, 79, 1.00, 2, '{"aspect":"2"}', 0),
	(79, 80, 1.00, 2, '{"aspect":"2"}', 0),
	(80, 81, 1.00, 2, '{"aspect":"2"}', 0),
	(81, 82, 1.00, 2, '{"aspect":"2"}', 0),
	(82, 91, 1.00, 2, '{"aspect":"2"}', 0),
	(83, 84, 1.00, 2, '{"aspect":"2"}', 0),
	(84, 85, 1.00, 2, '{"aspect":"2"}', 0),
	(85, 86, 1.00, 2, '{"aspect":"2"}', 0),
	(86, 87, 1.00, 2, '{"aspect":"2"}', 0),
	(87, 28, 1.00, 2, '{"aspect":"1"}', 0),
	(88, 90, 1.00, 2, '{"aspect":"1"}', 0),
	(89, 93, 1.00, 2, '{"aspect":"2"}', 0),
	(90, 89, 1.00, 2, '{"aspect":"2"}', 0),
	(91, 35, 1.00, 2, '{"aspect":"1"}', 0),
	(91, 83, 1.00, 2, '{"aspect":"2"}', 0),
	(92, 68, 1.00, 2, '{"aspect":"1"}', 0),
	(92, 70, 1.00, 2, '{"aspect":"2"}', 0),
	(93, 67, 1.00, 2, '{"aspect":"2"}', 0),
	(94, 95, 1.00, 1, '{"aspect":"1"}', 0),
	(95, 96, 1.00, 1, '{"aspect":"1"}', 0),
	(96, 97, 1.00, 1, '{"aspect":"1"}', 0),
	(97, 47, 1.00, 1, '{"aspect":"1"}', 0),
	(98, 99, 1.00, 2, '{"aspect":"2"}', 0),
	(99, 102, 1.00, 2, '{"aspect":"2"}', 0),
	(102, 103, 1.00, 2, '{"aspect":"2"}', 0),
	(103, 71, 1.00, 2, '{"aspect":"2"}', 0),
	(104, 105, 1.00, 2, '{"aspect":"1"}', 0),
	(105, 106, 1.00, 2, '{"aspect":"2"}', 0),
	(106, 107, 1.00, 2, '{"aspect":"2"}', 0),
	(107, 73, 1.00, 2, '{"aspect":"2"}', 0);
/*!40000 ALTER TABLE `task_site_logic` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
