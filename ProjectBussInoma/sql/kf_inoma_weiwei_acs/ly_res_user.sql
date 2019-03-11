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

-- Dumping structure for table kf_inoma_weiwei_acs.ly_res_user
DROP TABLE IF EXISTS `ly_res_user`;
CREATE TABLE IF NOT EXISTS `ly_res_user` (
  `resId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_acs.ly_res_user: ~91 rows (approximately)
DELETE FROM `ly_res_user`;
/*!40000 ALTER TABLE `ly_res_user` DISABLE KEYS */;
INSERT INTO `ly_res_user` (`resId`, `userId`) VALUES
	(127, 27),
	(128, 27),
	(1, 28),
	(2, 28),
	(7, 28),
	(8, 28),
	(9, 28),
	(10, 28),
	(11, 28),
	(12, 28),
	(13, 28),
	(91, 28),
	(93, 28),
	(94, 28),
	(127, 28),
	(128, 28),
	(138, 28),
	(139, 28),
	(1, 29),
	(2, 29),
	(7, 29),
	(9, 29),
	(11, 29),
	(91, 29),
	(92, 29),
	(93, 29),
	(94, 29),
	(95, 29),
	(101, 29),
	(102, 29),
	(103, 29),
	(104, 29),
	(105, 29),
	(106, 29),
	(107, 29),
	(108, 29),
	(109, 29),
	(110, 29),
	(111, 29),
	(125, 29),
	(126, 29),
	(127, 29),
	(128, 29),
	(129, 29),
	(130, 29),
	(131, 29),
	(132, 29),
	(133, 29),
	(134, 29),
	(135, 29),
	(137, 29),
	(7, 30),
	(9, 30),
	(91, 30),
	(92, 30),
	(93, 30),
	(94, 30),
	(95, 30),
	(139, 32),
	(140, 32),
	(7, 34),
	(9, 34),
	(91, 34),
	(92, 34),
	(93, 34),
	(94, 34),
	(95, 34),
	(7, 35),
	(9, 35),
	(91, 35),
	(92, 35),
	(93, 35),
	(94, 35),
	(95, 35),
	(7, 36),
	(9, 36),
	(91, 36),
	(92, 36),
	(93, 36),
	(94, 36),
	(95, 36),
	(7, 9810007),
	(8, 9810007),
	(12, 9810007),
	(13, 9810007),
	(138, 9810007),
	(139, 9810007),
	(7, 9810008),
	(13, 9810008),
	(1304, 9810009),
	(1305, 9810009);
/*!40000 ALTER TABLE `ly_res_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
