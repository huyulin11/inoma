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

-- Dumping structure for table kf_inoma_weiwei_agv.task_path_memory
DROP TABLE IF EXISTS `task_path_memory`;
CREATE TABLE IF NOT EXISTS `task_path_memory` (
  `uuid` varchar(36) DEFAULT NULL,
  `forkliftId` int(11) DEFAULT NULL COMMENT 'agv的id',
  `taskId` int(11) DEFAULT NULL COMMENT '任务id',
  `x` int(11) DEFAULT NULL COMMENT 'x坐标',
  `y` int(11) DEFAULT NULL COMMENT 'y坐标',
  `angle` decimal(10,6) DEFAULT 0.000000 COMMENT '角度',
  `secondToStart` int(11) DEFAULT 0 COMMENT '距离开始此任务时秒数',
  `taskStep` int(11) DEFAULT NULL COMMENT '步骤',
  `delflag` int(1) DEFAULT 0,
  `time` timestamp NULL DEFAULT current_timestamp(),
  KEY `query` (`forkliftId`,`taskId`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='任务点阵表';

-- Dumping data for table kf_inoma_weiwei_agv.task_path_memory: 0 rows
DELETE FROM `task_path_memory`;
/*!40000 ALTER TABLE `task_path_memory` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_path_memory` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
