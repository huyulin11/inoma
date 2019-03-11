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

-- Dumping structure for table kf_inoma_weiwei_iot.taskexe_s2c_detail_works
DROP TABLE IF EXISTS `taskexe_s2c_detail_works`;
CREATE TABLE IF NOT EXISTS `taskexe_s2c_detail_works` (
  `taskid` varchar(36) NOT NULL DEFAULT '0' COMMENT '任务ID',
  `tasksequence` int(11) NOT NULL DEFAULT 0,
  `detailsequence` int(5) NOT NULL DEFAULT 0,
  `worksequence` int(5) NOT NULL DEFAULT 0 COMMENT '到达该站点后需要执行工作步骤的序列',
  `siteid` int(10) NOT NULL DEFAULT 0 COMMENT '站点ID',
  `sitecode` varchar(16) DEFAULT NULL COMMENT '站点编码',
  `arrivedact` varchar(40) DEFAULT NULL COMMENT '到达后动作',
  `addedinfo` varchar(500) DEFAULT NULL COMMENT '附加信息（如货位名称）',
  `opflag` varchar(16) DEFAULT 'NEW' COMMENT '操作标志',
  `overtime` timestamp NULL DEFAULT current_timestamp(),
  `delflag` smallint(1) unsigned zerofill DEFAULT 0,
  PRIMARY KEY (`taskid`,`tasksequence`,`detailsequence`,`worksequence`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='运输任务执行表';

-- Dumping data for table kf_inoma_weiwei_iot.taskexe_s2c_detail_works: 0 rows
DELETE FROM `taskexe_s2c_detail_works`;
/*!40000 ALTER TABLE `taskexe_s2c_detail_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskexe_s2c_detail_works` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
