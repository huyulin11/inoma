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

-- Dumping structure for table kf_hongfu_zhenmu_agv.taskexe_s2c_detail
DROP TABLE IF EXISTS `taskexe_s2c_detail`;
CREATE TABLE IF NOT EXISTS `taskexe_s2c_detail` (
  `taskexesid` varchar(36) NOT NULL DEFAULT '0' COMMENT '任务ID',
  `tasksequence` int(11) NOT NULL DEFAULT 0 COMMENT '任务序号',
  `detailsequence` int(5) NOT NULL DEFAULT 0,
  `siteid` int(10) NOT NULL DEFAULT 0 COMMENT '站点ID',
  `sitecode` varchar(16) DEFAULT NULL COMMENT '站点编码',
  `distancetozero` decimal(6,2) NOT NULL DEFAULT 0.00 COMMENT '与初始站点距离',
  `arrivedact` varchar(40) DEFAULT NULL COMMENT '到达后动作',
  `addedinfo` varchar(1000) DEFAULT NULL COMMENT '附加信息（如货位名称）',
  `addeddesc` varchar(500) DEFAULT NULL COMMENT '附加信息描述',
  `opflag` varchar(16) DEFAULT 'NEW' COMMENT '操作标志',
  `json` varchar(500) DEFAULT NULL,
  `overtime` timestamp NULL DEFAULT current_timestamp(),
  `delflag` smallint(1) unsigned zerofill DEFAULT 0,
  PRIMARY KEY (`taskexesid`,`detailsequence`,`tasksequence`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='运输任务执行表';

-- Dumping data for table kf_hongfu_zhenmu_agv.taskexe_s2c_detail: 16 rows
DELETE FROM `taskexe_s2c_detail`;
/*!40000 ALTER TABLE `taskexe_s2c_detail` DISABLE KEYS */;
INSERT INTO `taskexe_s2c_detail` (`taskexesid`, `tasksequence`, `detailsequence`, `siteid`, `sitecode`, `distancetozero`, `arrivedact`, `addedinfo`, `addeddesc`, `opflag`, `json`, `overtime`, `delflag`) VALUES
	('ARKD00000065', 1, 5, -101, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-13 18:02:24', 0),
	('ARKD00000065', 1, 6, -301, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-13 18:02:24', 0),
	('ARKD00000065', 1, 7, 1, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-13 18:02:24', 0),
	('ARKD00000065', 1, 8, -101, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-13 18:02:24', 0),
	('ARKD00000066', 1, 1, -102, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-13 18:03:21', 0),
	('ARKD00000066', 1, 2, -302, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-13 18:03:21', 0),
	('ARKD00000066', 1, 3, 1, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-13 18:03:21', 0),
	('ARKD00000066', 1, 4, -102, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-13 18:03:21', 0),
	('ARKD00000067', 1, 1, -101, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-14 09:12:26', 0),
	('ARKD00000067', 1, 2, -301, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-14 09:12:26', 0),
	('ARKD00000067', 1, 3, 1, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-14 09:12:26', 0),
	('ARKD00000067', 1, 4, -101, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-14 09:12:26', 0),
	('ARKD00000068', 1, 1, -102, NULL, 0.00, NULL, NULL, NULL, 'OVER', NULL, '2019-06-14 09:12:32', 0),
	('ARKD00000068', 1, 2, -301, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-14 09:12:32', 0),
	('ARKD00000068', 1, 3, 3, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-14 09:12:32', 0),
	('ARKD00000068', 1, 4, -102, NULL, 0.00, NULL, NULL, NULL, 'NEW', NULL, '2019-06-14 09:12:32', 0);
/*!40000 ALTER TABLE `taskexe_s2c_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
