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

-- Dumping structure for table kf_inoma_weiwei_agv.control_info
DROP TABLE IF EXISTS `control_info`;
CREATE TABLE IF NOT EXISTS `control_info` (
  `type` varchar(60) NOT NULL COMMENT '类型',
  `value` int(11) DEFAULT NULL COMMENT '当前状态',
  `prefix` varchar(10) DEFAULT NULL COMMENT '前缀内容（如果需要）',
  `explan` varchar(100) DEFAULT NULL COMMENT '字段解释',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统控制基础参数表';

-- Dumping data for table kf_inoma_weiwei_agv.control_info: ~20 rows (大约)
DELETE FROM `control_info`;
/*!40000 ALTER TABLE `control_info` DISABLE KEYS */;
INSERT INTO `control_info` (`type`, `value`, `prefix`, `explan`) VALUES
	('AGVS_AUTO_TASK', 0, NULL, '是否开启自动任务（0否1是）'),
	('AGVS_CONNECTED', 0, NULL, '是否连接AGV'),
	('AGVS_OPEN_PI', 0, NULL, '是否开启防撞控制（0否1是）'),
	('AGV_CHARGE_SID', 2871, 'CHRG', '充电任务取号器'),
	('AGV_DELIVER_SID', 0, 'DELV', '送货单取号器'),
	('AGV_TOINIT_SID', 298, 'INIT', '回归初始站点任务取号器'),
	('AGV_TRANSPORT_SID', 16, 'TRANS', '运输任务取号器'),
	('CURRENT_ENVIRONMENT_ID', 0, NULL, NULL),
	('CURRENT_SKUID', 25, NULL, NULL),
	('CURRENT_TASKEXE_STATUS', -2, NULL, NULL),
	('INIT_DATA_ALLOC', -1, NULL, '是否初始化系统数据（包括列、货位），大于等于0表示是'),
	('INIT_DATA_LED', -1, NULL, '是否初始化系统的LED数据，大于等于0表示是'),
	('INIT_DATA_TASK', -1, NULL, '是否初始化系统数据（任务），大于等于0表示是'),
	('LOCAL_TEST', 1, NULL, NULL),
	('MAX_POINT_NUM_IN_PATH_INFO', 600, NULL, NULL),
	('MAX_Z_ID', 2, NULL, NULL),
	('SAY_GO_TO_ROBATICARM_STEP', 0, NULL, NULL),
	('WMS_INVENTORY_SID', 13, 'APDD', '盘点单取号器'),
	('WMS_RECEIPT_SID', 51, 'ARKD', '入库单取号器'),
	('WMS_SHIPMENT_SID', 30, 'ACKD', '出库单取号器');
/*!40000 ALTER TABLE `control_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
