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

-- Dumping structure for table kf_hongfu_zhenmu_acs.ly_role_res
DROP TABLE IF EXISTS `ly_role_res`;
CREATE TABLE IF NOT EXISTS `ly_role_res` (
  `resId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table kf_hongfu_zhenmu_acs.ly_role_res: ~79 rows (大约)
DELETE FROM `ly_role_res`;
/*!40000 ALTER TABLE `ly_role_res` DISABLE KEYS */;
INSERT INTO `ly_role_res` (`resId`, `roleId`) VALUES
	(7, 3),
	(8, 3),
	(138, 3),
	(101, 201),
	(102, 201),
	(103, 201),
	(104, 201),
	(105, 201),
	(106, 201),
	(107, 201),
	(108, 201),
	(109, 201),
	(110, 201),
	(111, 201),
	(125, 201),
	(126, 201),
	(127, 201),
	(128, 201),
	(129, 201),
	(130, 201),
	(131, 201),
	(132, 201),
	(133, 201),
	(134, 201),
	(135, 201),
	(204, 201),
	(205, 201),
	(211, 201),
	(217, 201),
	(218, 201),
	(220, 201),
	(222, 201),
	(227, 201),
	(228, 201),
	(229, 201),
	(230, 201),
	(231, 201),
	(7, 205),
	(9, 205),
	(7, 206),
	(8, 206),
	(7, 207),
	(9, 207),
	(7, 208),
	(9, 208),
	(91, 208),
	(92, 208),
	(7, 211),
	(9, 211),
	(93, 211),
	(7, 225),
	(9, 225),
	(95, 225),
	(7, 228),
	(8, 228),
	(12, 228),
	(13, 228),
	(138, 228),
	(139, 228),
	(1302, 228),
	(1303, 228),
	(201, 240),
	(202, 240),
	(203, 240),
	(206, 240),
	(215, 241),
	(216, 241),
	(223, 241),
	(224, 241),
	(225, 241),
	(226, 241),
	(204, 242),
	(205, 242),
	(211, 242),
	(217, 242),
	(240, 242),
	(242, 242),
	(204, 243),
	(205, 243);
/*!40000 ALTER TABLE `ly_role_res` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
