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

-- Dumping structure for table kf_inoma_weiwei__cache_conf.cache_key
DROP TABLE IF EXISTS `cache_key`;
CREATE TABLE IF NOT EXISTS `cache_key` (
  `key` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  `updatetime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`key`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei__cache_conf.cache_key: 3 rows
DELETE FROM `cache_key`;
/*!40000 ALTER TABLE `cache_key` DISABLE KEYS */;
INSERT INTO `cache_key` (`key`, `value`, `updatetime`) VALUES
	('IS_LOCAL_TEST', 'FALSE', '2019-03-11 17:13:19'),
	('IS_SHUTDOWN_THEN_TO_INIT', 'FALSE', '2019-03-11 17:13:19'),
	('IS_RECEIPT_NEED_SCAN', 'TRUE', '2019-03-11 17:13:19');
/*!40000 ALTER TABLE `cache_key` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
