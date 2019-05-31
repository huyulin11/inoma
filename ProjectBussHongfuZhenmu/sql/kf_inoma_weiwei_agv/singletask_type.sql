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

-- Dumping structure for table kf_inoma_weiwei_agv.singletask_type
DROP TABLE IF EXISTS `singletask_type`;
CREATE TABLE IF NOT EXISTS `singletask_type` (
  `taskTypeId` int(50) NOT NULL COMMENT '任务类型ID',
  `value` varchar(40) DEFAULT NULL COMMENT '任务类型名称',
  `company` varchar(40) DEFAULT NULL COMMENT '客户公司代码',
  `remark` varchar(50) DEFAULT NULL COMMENT '字典说明',
  `delflag` varchar(1) DEFAULT '0' COMMENT '删除标志-1表示删除，0代表未删除',
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常规字典表明细表';

-- Dumping data for table kf_inoma_weiwei_agv.singletask_type: ~7 rows (大约)
DELETE FROM `singletask_type`;
/*!40000 ALTER TABLE `singletask_type` DISABLE KEYS */;
INSERT INTO `singletask_type` (`taskTypeId`, `value`, `company`, `remark`, `delflag`) VALUES
	(0, '不受控', 'CANGZHOU', NULL, '0'),
	(1, '送料', 'CANGZHOU', NULL, '0'),
	(2, '上料', 'CANGZHOU', NULL, '0'),
	(3, '送光轴', 'CANGZHOU', NULL, '0'),
	(4, '上货', 'XUZHOU_WEIWEI', NULL, '0'),
	(5, '自动充电', 'XUZHOU_WEIWEI', NULL, '0'),
	(6, '充电离开', 'XUZHOU_WEIWEI', NULL, '0');
/*!40000 ALTER TABLE `singletask_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
