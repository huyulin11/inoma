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

-- Dumping structure for table kf_inoma_weiwei_acs.ly_user
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE IF NOT EXISTS `ly_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `md5password` varchar(100) DEFAULT NULL,
  `credentialsSalt` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `locked` varchar(3) DEFAULT '0',
  `createTime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletestatus` int(1) DEFAULT 0 COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountName` (`accountName`)
) ENGINE=InnoDB AUTO_INCREMENT=9810031 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_acs.ly_user: ~7 rows (大约)
DELETE FROM `ly_user`;
/*!40000 ALTER TABLE `ly_user` DISABLE KEYS */;
INSERT INTO `ly_user` (`id`, `userName`, `accountName`, `password`, `md5password`, `credentialsSalt`, `description`, `locked`, `createTime`, `deletestatus`) VALUES
	(3, '管理员', 'admin', 'cee3dbdbca4b59fc11a13e749203f1f2', 'c485c275c0c104d824a9961c23223b76', '35c630c401303f28adb841a9299d60a4', '3535eee', '1', '2018-03-27 11:13:42', 0),
	(27, '管理员hu', '1408040', 'fbba0fdfe0ba1fa0054786373654f79a', '224bf06d54a75a77851726b453fdd5db', 'dc2482085b715c20eff2f50508461102', NULL, '1', '2018-05-22 23:30:50', 0),
	(9810026, '橙色云设计', 'cheng', 'd81f124ad4a2f4a0b2a00b3e073b03f1', '5d41402abc4b2a76b9719d911017c592', '0f87d9349224135123170cca313fdd0c', NULL, '1', '2018-03-27 11:14:07', 0),
	(9810027, '丽', '13774234928', '30b14d381010e31ffd159d7e22d253cd', 'b5640eeac335c505796027cb6311e93e', 'b9d46bc924fec36aebddb8994fdd316d', NULL, '1', '2018-03-27 11:15:29', 0),
	(9810028, '胡', '15077923697', '6ffe2cf02408dc253c2493e0eb385507', '77569fce4862ff5cc6a2bce37a80824b', '934afa7bb94a238228f305e2f628092c', NULL, '1', '2018-03-27 11:12:54', 0),
	(9810029, 'AGV管理员', 'agv', '9773816042e395a08ade24f387f305d0', 'c4ca4238a0b923820dcc509a6f75849b', '85fcff8f7708d693b30b3a2f9546fbdf', NULL, '1', '2018-03-27 11:09:27', 0),
	(9810030, 'yf', 'yf', 'cb81e02c385ce16dd795ecbc7ebf363a', '4e7a17a46bbf09a94af971efe37a8340', '1e38b605a5523e030c6204ecefba2f01', NULL, '1', '2018-06-04 22:17:31', 0);
/*!40000 ALTER TABLE `ly_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
