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

-- Dumping structure for table kf_inoma_weiwei_acs.ly_user_role
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE IF NOT EXISTS `ly_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_acs.ly_user_role: ~32 rows (大约)
DELETE FROM `ly_user_role`;
/*!40000 ALTER TABLE `ly_user_role` DISABLE KEYS */;
INSERT INTO `ly_user_role` (`userId`, `roleId`) VALUES
	(3, 201),
	(3, 205),
	(27, 201),
	(27, 229),
	(28, 201),
	(29, 201),
	(30, 206),
	(30, 207),
	(30, 208),
	(32, 210),
	(34, 201),
	(34, 205),
	(35, 201),
	(35, 205),
	(36, 1),
	(36, 201),
	(36, 205),
	(36, 206),
	(36, 207),
	(36, 208),
	(36, 210),
	(36, 211),
	(36, 225),
	(36, 226),
	(53, 201),
	(54, 1),
	(9810007, 228),
	(9810009, 9),
	(9810026, 242),
	(9810027, 241),
	(9810028, 241),
	(9810030, 243);
/*!40000 ALTER TABLE `ly_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
