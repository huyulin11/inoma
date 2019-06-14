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

-- Dumping structure for table kf_inoma_weiwei_acs.ly_userlogin
DROP TABLE IF EXISTS `ly_userlogin`;
CREATE TABLE IF NOT EXISTS `ly_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_acs.ly_userlogin: ~5 rows (大约)
DELETE FROM `ly_userlogin`;
/*!40000 ALTER TABLE `ly_userlogin` DISABLE KEYS */;
INSERT INTO `ly_userlogin` (`id`, `userId`, `accountName`, `loginTime`, `loginIP`) VALUES
	(1, 9810026, 'cheng', '2019-03-11 17:15:42', '127.0.0.1'),
	(2, 27, '1408040', '2019-05-30 14:17:21', '127.0.0.1'),
	(3, 27, '1408040', '2019-05-30 15:38:17', '127.0.0.1'),
	(4, 27, '1408040', '2019-05-30 15:38:37', '127.0.0.1'),
	(5, 27, '1408040', '2019-05-30 15:46:58', '127.0.0.1'),
	(6, 27, '1408040', '2019-05-31 17:10:48', '127.0.0.1'),
	(7, 27, '1408040', '2019-05-31 17:11:22', '127.0.0.1'),
	(8, 27, '1408040', '2019-05-31 17:53:38', '127.0.0.1');
/*!40000 ALTER TABLE `ly_userlogin` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
