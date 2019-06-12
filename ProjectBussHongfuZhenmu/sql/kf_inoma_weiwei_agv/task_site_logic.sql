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

-- Dumping structure for table kf_inoma_weiwei_agv.task_site_logic
DROP TABLE IF EXISTS `task_site_logic`;
CREATE TABLE IF NOT EXISTS `task_site_logic` (
  `siteid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nextid` int(1) NOT NULL DEFAULT 0,
  `distance` decimal(4,2) NOT NULL DEFAULT 1.00 COMMENT '设定距离，常规为1，具体参照地图估算',
  `side` int(1) NOT NULL DEFAULT 0,
  `json` varchar(500) DEFAULT NULL,
  `delflag` int(1) DEFAULT 0,
  PRIMARY KEY (`siteid`,`nextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务站点信息表';

-- Dumping data for table kf_inoma_weiwei_agv.task_site_logic: ~0 rows (大约)
DELETE FROM `task_site_logic`;
/*!40000 ALTER TABLE `task_site_logic` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_site_logic` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
