-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.7-MariaDB - mariadb.org binary distribution
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_hongfu_zhenmu_acs.employee_role
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE IF NOT EXISTS `employee_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(3) DEFAULT NULL,
  `rolename` varchar(16) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `delflag` varchar(1) DEFAULT '0' COMMENT '删除标志“1”为删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolekey` (`roleKey`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_hongfu_zhenmu_acs.employee_role: ~9 rows (大约)
DELETE FROM `employee_role`;
/*!40000 ALTER TABLE `employee_role` DISABLE KEYS */;
INSERT INTO `employee_role` (`id`, `state`, `rolename`, `roleKey`, `description`, `delflag`) VALUES
	(201, '1', '管理员', 'admin', '管理员', '0'),
	(202, '1', '普通角色', 'simple', '普通角色', '1'),
	(203, '1', '超级管理员', 'SUPER', '超级管理员', '1'),
	(204, '1', '任务管理开发', 'taskDev', '任务管理开发', '1'),
	(229, '1', '控制台1', 'ctrl1', '控制台1', '0'),
	(240, '1', '档案管理员', 'archiveManager', NULL, '0'),
	(241, '1', '报账员', 'bill', NULL, '0'),
	(242, '1', 'AGV管理员', 'AGVMGR', 'AGV管理员', '0'),
	(243, '1', '宇锋AGV管理员', 'yf_agv', NULL, '0');
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
