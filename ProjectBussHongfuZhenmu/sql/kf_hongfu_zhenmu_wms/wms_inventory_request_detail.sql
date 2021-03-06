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

-- Dumping structure for table kf_inoma_weiwei_wms.wms_inventory_request_detail
DROP TABLE IF EXISTS `wms_inventory_request_detail`;
CREATE TABLE IF NOT EXISTS `wms_inventory_request_detail` (
  `id` varchar(36) NOT NULL DEFAULT uuid_short() COMMENT '流水号',
  `paperid` varchar(50) NOT NULL COMMENT '入库单编码',
  `item` varchar(50) NOT NULL COMMENT '货品编码',
  `itemname` varchar(200) NOT NULL COMMENT '货品名称',
  `itemcount` int(16) NOT NULL COMMENT '入库数量',
  `sprice` decimal(18,5) DEFAULT NULL COMMENT '商品单价',
  `inventorysts` varchar(50) DEFAULT NULL COMMENT '商品库存状态（可售、不可售、残次）',
  `expirationdate` varchar(50) DEFAULT NULL COMMENT '效期',
  `lot` varchar(50) DEFAULT NULL COMMENT '入库批号',
  `sequence` int(5) DEFAULT NULL COMMENT '次序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userdef1` varchar(50) DEFAULT NULL COMMENT '自定义字段1',
  `userdef2` varchar(50) DEFAULT NULL COMMENT '自定义字段2',
  `userdef3` varchar(50) DEFAULT NULL COMMENT '自定义字段3',
  `userdef4` varchar(50) DEFAULT NULL COMMENT '自定义字段4',
  `status` int(2) DEFAULT NULL COMMENT '明细状态',
  `opFlag` varchar(10) DEFAULT 'NEW' COMMENT '操作状态',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `createtime` datetime DEFAULT current_timestamp(),
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库信息明细表';

-- Dumping data for table kf_inoma_weiwei_wms.wms_inventory_request_detail: ~0 rows (大约)
DELETE FROM `wms_inventory_request_detail`;
/*!40000 ALTER TABLE `wms_inventory_request_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `wms_inventory_request_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
