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

-- Dumping structure for table kf_inoma_weiwei_iot.lap_info
DROP TABLE IF EXISTS `lap_info`;
CREATE TABLE IF NOT EXISTS `lap_info` (
  `environment` int(11) NOT NULL DEFAULT 1 COMMENT '环境编号',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lapName` varchar(50) NOT NULL COMMENT '对应客户端任务文件名',
  `skuId` int(11) DEFAULT NULL COMMENT '当前生产的产品id',
  `inUesd` int(1) DEFAULT 0 COMMENT '1代表对应的任务在执行中，不接受新任务',
  `delflag` smallint(1) DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='取货点信息表';

-- Dumping data for table kf_inoma_weiwei_iot.lap_info: ~5 rows (大约)
DELETE FROM `lap_info`;
/*!40000 ALTER TABLE `lap_info` DISABLE KEYS */;
INSERT INTO `lap_info` (`environment`, `id`, `lapName`, `skuId`, `inUesd`, `delflag`) VALUES
	(1, 1, '习艺楼A', 1, 0, 0),
	(1, 2, '习艺楼B', 1, 0, 0),
	(1, 3, '习艺楼C', 1, 0, 0),
	(2, 4, '4号机械手-楼上', 26, 0, 1),
	(2, 5, '5号机械手-楼上', 27, 0, 1);
/*!40000 ALTER TABLE `lap_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
