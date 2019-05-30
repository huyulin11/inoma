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

-- Dumping structure for table kf_inoma_weiwei_acs.ly_server_info
DROP TABLE IF EXISTS `ly_server_info`;
CREATE TABLE IF NOT EXISTS `ly_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_acs.ly_server_info: ~30 rows (approximately)
DELETE FROM `ly_server_info`;
/*!40000 ALTER TABLE `ly_server_info` DISABLE KEYS */;
INSERT INTO `ly_server_info` (`id`, `cpuUsage`, `setCpuUsage`, `jvmUsage`, `setJvmUsage`, `ramUsage`, `setRamUsage`, `email`, `operTime`, `mark`) VALUES
	(5, '18', '40', '49', '40', '71', '40', '121261494@qq.com', '2015-04-25 18:07:02', '<font color="red">JVM当前：49%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>'),
	(6, '3', '40', '50', '40', '71', '40', '121261494@qq.com', '2015-04-25 18:08:03', '<font color="red">JVM当前：50%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>'),
	(7, '5', '40', '50', '40', '70', '40', '121261494@qq.com', '2015-04-25 18:09:02', '<font color="red">JVM当前：50%,超出预设值 40%<br>内存当前：70%,超出预设值  40%</font>'),
	(8, '5', '40', '52', '40', '69', '40', '121261494@qq.com', '2015-04-25 18:10:03', '<font color="red">JVM当前：52%,超出预设值 40%<br>内存当前：69%,超出预设值  40%</font>'),
	(9, '2', '40', '52', '40', '68', '40', '121261494@qq.com', '2015-04-25 18:11:02', '<font color="red">JVM当前：52%,超出预设值 40%<br>内存当前：68%,超出预设值  40%</font>'),
	(10, '7', '40', '53', '40', '67', '40', '121261494@qq.com', '2015-04-25 18:12:02', '<font color="red">JVM当前：53%,超出预设值 40%<br>内存当前：67%,超出预设值  40%</font>'),
	(11, '5', '40', '54', '40', '67', '40', '121261494@qq.com', '2015-04-25 18:13:02', '<font color="red">JVM当前：54%,超出预设值 40%<br>内存当前：67%,超出预设值  40%</font>'),
	(12, '16', '40', '55', '40', '66', '40', '121261494@qq.com', '2015-04-25 18:14:02', '<font color="red">JVM当前：55%,超出预设值 40%<br>内存当前：66%,超出预设值  40%</font>'),
	(13, '5', '40', '56', '40', '65', '40', '121261494@qq.com', '2015-04-25 18:15:02', '<font color="red">JVM当前：56%,超出预设值 40%<br>内存当前：65%,超出预设值  40%</font>'),
	(14, '8', '40', '57', '40', '64', '40', '121261494@qq.com', '2015-04-25 18:16:02', '<font color="red">JVM当前：57%,超出预设值 40%<br>内存当前：64%,超出预设值  40%</font>'),
	(15, '3', '40', '58', '40', '63', '40', '121261494@qq.com', '2015-04-25 18:17:02', '<font color="red">JVM当前：58%,超出预设值 40%<br>内存当前：63%,超出预设值  40%</font>'),
	(16, '6', '40', '59', '40', '62', '40', '121261494@qq.com', '2015-04-25 18:18:03', '<font color="red">JVM当前：59%,超出预设值 40%<br>内存当前：62%,超出预设值  40%</font>'),
	(17, '1', '40', '60', '40', '61', '40', '121261494@qq.com', '2015-04-25 18:19:02', '<font color="red">JVM当前：60%,超出预设值 40%<br>内存当前：61%,超出预设值  40%</font>'),
	(18, '5', '40', '61', '40', '61', '40', '121261494@qq.com', '2015-04-25 18:20:02', '<font color="red">JVM当前：61%,超出预设值 40%<br>内存当前：61%,超出预设值  40%</font>'),
	(19, '5', '40', '38', '40', '61', '40', '121261494@qq.com', '2015-04-25 18:21:02', '<font color="red">内存当前：61%,超出预设值  40%</font>'),
	(20, '5', '40', '39', '40', '60', '40', '121261494@qq.com', '2015-04-25 18:22:02', '<font color="red">内存当前：60%,超出预设值  40%</font>'),
	(21, '4', '40', '40', '40', '59', '40', '121261494@qq.com', '2015-04-25 18:23:02', '<font color="red">内存当前：59%,超出预设值  40%</font>'),
	(22, '32', '80', '41', '80', '81', '80', '121261494@qq.com', '2015-04-26 01:43:05', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
	(23, '55', '80', '55', '80', '81', '80', '121261494@qq.com', '2015-04-26 01:50:03', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
	(24, '13', '80', '53', '80', '81', '80', '121261494@qq.com', '2015-04-26 01:59:08', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
	(25, '85', '80', '58', '80', '72', '80', '121261494@qq.com', '2015-04-26 02:46:06', '<font color="red">CPU当前：85%,超出预设值  80%<br></font>'),
	(26, '34', '80', '59', '80', '81', '80', '121261494@qq.com', '2015-04-27 00:29:06', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
	(27, '92', '80', '47', '80', '64', '80', '121261494@qq.com', '2015-04-27 00:44:07', '<font color="red">CPU当前：92%,超出预设值  80%<br></font>'),
	(28, '85', '80', '49', '80', '68', '80', '121261494@qq.com', '2015-04-27 23:38:04', '<font color="red">CPU当前：85%,超出预设值  80%<br></font>'),
	(29, '94', '80', '69', '80', '73', '80', '121261494@qq.com', '2015-04-28 01:35:03', '<font color="red">CPU当前：94%,超出预设值  80%<br></font>'),
	(30, '6', '80', '43', '80', '87', '80', '121261494@qq.com', '2015-05-09 00:00:08', '<font color="red">内存当前：87%,超出预设值  80%</font>'),
	(31, '88', '80', '59', '80', '87', '80', '121261494@qq.com', '2015-05-09 00:01:14', '<font color="red">CPU当前：88%,超出预设值  80%<br>内存当前：87%,超出预设值  80%</font>'),
	(32, '12', '80', '85', '80', '39', '80', NULL, '2016-05-05 09:52:14', '<font color="red">JVM当前：85%,超出预设值 80%<br></font>'),
	(33, '11', '80', '82', '80', '44', '80', NULL, '2016-05-05 12:12:14', '<font color="red">JVM当前：82%,超出预设值 80%<br></font>'),
	(34, '13', '80', '83', '80', '45', '80', NULL, '2016-05-05 13:02:14', '<font color="red">JVM当前：83%,超出预设值 80%<br></font>');
/*!40000 ALTER TABLE `ly_server_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
