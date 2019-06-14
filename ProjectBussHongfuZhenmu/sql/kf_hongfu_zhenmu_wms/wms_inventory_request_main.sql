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

-- Dumping structure for table kf_inoma_weiwei_wms.wms_inventory_request_main
DROP TABLE IF EXISTS `wms_inventory_request_main`;
CREATE TABLE IF NOT EXISTS `wms_inventory_request_main` (
  `id` varchar(36) NOT NULL DEFAULT uuid_short() COMMENT '流水号',
  `company` varchar(50) NOT NULL COMMENT '货主编码',
  `warehouse` varchar(50) NOT NULL COMMENT '仓库编码',
  `totalqty` int(16) NOT NULL COMMENT '入库单入库总数量',
  `totallines` int(16) NOT NULL COMMENT '订单明细行数',
  `paperid` varchar(50) NOT NULL COMMENT '入库单编码',
  `inventorytype` varchar(50) NOT NULL COMMENT '入库类型（采购入库、退货入库）',
  `orderdate` datetime DEFAULT NULL COMMENT '预计到货日期（如：2010-01-01）',
  `status` int(2) DEFAULT NULL COMMENT '单据状态',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `createtime` datetime DEFAULT current_timestamp(),
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `paperid` (`paperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库信息主表';

-- Dumping data for table kf_inoma_weiwei_wms.wms_inventory_request_main: ~0 rows (大约)
DELETE FROM `wms_inventory_request_main`;
/*!40000 ALTER TABLE `wms_inventory_request_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `wms_inventory_request_main` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
