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

-- Dumping structure for table kf_inoma_weiwei_agv.singletask_group
DROP TABLE IF EXISTS `singletask_group`;
CREATE TABLE IF NOT EXISTS `singletask_group` (
  `parentTaskId` int(11) NOT NULL COMMENT '组id',
  `taskId` int(11) NOT NULL COMMENT '组内任务ID',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`parentTaskId`,`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务分组信息表';

-- Dumping data for table kf_inoma_weiwei_agv.singletask_group: ~0 rows (大约)
DELETE FROM `singletask_group`;
/*!40000 ALTER TABLE `singletask_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `singletask_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
