-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.7-MariaDB - mariadb.org binary distribution
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.1.0.5594
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_inoma_weiwei__conf.site_axis
DROP TABLE IF EXISTS `site_axis`;
CREATE TABLE IF NOT EXISTS `site_axis` (
  `key` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  `updatetime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table kf_inoma_weiwei__conf.site_axis: ~0 rows (大约)
DELETE FROM `site_axis`;
/*!40000 ALTER TABLE `site_axis` DISABLE KEYS */;
INSERT INTO `site_axis` (`key`, `value`, `updatetime`) VALUES
	('0-1', '{"xaxis":-4470,"yaxis":8520}', '2019-06-11 16:24:35'),
	('0-10', '{"xaxis":-4470,"yaxis":21860}', '2019-06-11 16:24:35'),
	('0-2', '{"xaxis":-4470,"yaxis":10360}', '2019-06-11 16:24:35'),
	('0-3', '{"xaxis":-4470,"yaxis":13020}', '2019-06-11 16:24:35'),
	('0-4', '{"xaxis":-4470,"yaxis":14850}', '2019-06-11 16:24:35'),
	('0-5', '{"xaxis":-4470,"yaxis":16170}', '2019-06-11 16:24:35'),
	('0-6', '{"xaxis":-4470,"yaxis":17440}', '2019-06-11 16:24:35'),
	('0-7', '{"xaxis":-4470,"yaxis":18000}', '2019-06-11 16:24:35'),
	('0-8', '{"xaxis":-4470,"yaxis":19220}', '2019-06-11 16:24:35'),
	('0-9', '{"xaxis":-4470,"yaxis":20540}', '2019-06-11 16:24:35'),
	('1-1', '{"xaxis":-4470,"yaxis":8520}', '2019-06-11 16:24:35'),
	('1-10', '{"xaxis":-4470,"yaxis":21860}', '2019-06-11 16:24:35'),
	('1-2', '{"xaxis":-4470,"yaxis":10360}', '2019-06-11 16:24:35'),
	('1-3', '{"xaxis":-4470,"yaxis":13020}', '2019-06-11 16:24:35'),
	('1-4', '{"xaxis":-4470,"yaxis":14850}', '2019-06-11 16:24:35'),
	('1-5', '{"xaxis":-4470,"yaxis":16170}', '2019-06-11 16:24:35'),
	('1-6', '{"xaxis":-4470,"yaxis":17440}', '2019-06-11 16:24:35'),
	('1-7', '{"xaxis":-4470,"yaxis":18000}', '2019-06-11 16:24:35'),
	('1-8', '{"xaxis":-4470,"yaxis":19220}', '2019-06-11 16:24:35'),
	('1-9', '{"xaxis":-4470,"yaxis":20540}', '2019-06-11 16:24:35'),
	('C', 'null', '2019-06-11 16:31:26'),
	('D', 'q', '2019-06-11 16:30:56'),
	('F1', '{"xaxis":-1350,"yaxis":55500}', '2019-06-11 16:32:57'),
	('F2', '{"xaxis":100,"yaxis":55500}', '2019-06-11 16:32:51'),
	('Q1', '{"xaxis":5700,"yaxis":24900}', '2019-06-11 16:32:01'),
	('Q2', '{"xaxis":5700,"yaxis":26300}', '2019-06-11 16:32:25');
/*!40000 ALTER TABLE `site_axis` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
