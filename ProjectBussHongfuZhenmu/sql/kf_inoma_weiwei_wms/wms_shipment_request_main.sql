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

-- Dumping structure for table kf_inoma_weiwei_wms.wms_shipment_request_main
DROP TABLE IF EXISTS `wms_shipment_request_main`;
CREATE TABLE IF NOT EXISTS `wms_shipment_request_main` (
  `id` varchar(36) NOT NULL DEFAULT uuid_short() COMMENT '流水号',
  `company` varchar(50) NOT NULL COMMENT '货主编码',
  `warehouse` varchar(50) NOT NULL COMMENT '仓库编码',
  `totalqty` int(16) NOT NULL COMMENT '订单出库总数量',
  `totallines` int(16) NOT NULL COMMENT '订单明细行数',
  `paperid` varchar(50) NOT NULL COMMENT '出库单编码',
  `tordercode` varchar(50) DEFAULT NULL COMMENT '淘宝订单号',
  `shipmenttype` varchar(50) NOT NULL COMMENT '订单类型（SALE销售出库、OL临借出库、TO调拨出库、OTHER其他出库）',
  `carrier` varchar(50) DEFAULT NULL COMMENT '承运商代码（如：SF(顺丰)、EMS（EMS）、SMZT(上门自提)、YGZT(业管自提)、AGV(运输机器人),双方系统的承运商代码要求一致）',
  `name` varchar(50) NOT NULL COMMENT '收货人姓名（缓存柜）',
  `cusstomername` varchar(50) NOT NULL COMMENT '客户姓名',
  `cusstomerid` varchar(50) DEFAULT NULL COMMENT '用户ID（缓存柜编号）',
  `ordertype` varchar(50) DEFAULT NULL COMMENT '订单类型',
  `itemstatus` varchar(50) DEFAULT NULL COMMENT '拍品状态',
  `postcode` varchar(50) DEFAULT NULL COMMENT '收货人邮编',
  `phone` varchar(50) DEFAULT NULL COMMENT '收货人固话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '收货人手机号码',
  `state` varchar(50) NOT NULL COMMENT '收货人所在地（省）',
  `city` varchar(50) NOT NULL COMMENT '收货人所在地（市）',
  `district` varchar(50) DEFAULT NULL COMMENT '收货人所在地（区）',
  `address` varchar(200) NOT NULL COMMENT '收货人详细地址',
  `isfree` varchar(50) DEFAULT NULL COMMENT '是否免邮资',
  `keepamount` varchar(50) DEFAULT NULL COMMENT '保价金额',
  `area` varchar(50) DEFAULT NULL COMMENT '区域',
  `shipdate` datetime DEFAULT NULL COMMENT '计划发货日期（如：2010-01-01）',
  `cod` varchar(50) DEFAULT NULL COMMENT '是否cod',
  `codvalue` varchar(50) DEFAULT NULL COMMENT 'Cod金额',
  `invoice` varchar(50) NOT NULL COMMENT '是否需要打印发票(用Y、N表示)',
  `invoiceamount` decimal(18,5) DEFAULT NULL COMMENT '发票总金额',
  `invoicetype` varchar(50) DEFAULT NULL COMMENT '发票类型',
  `invoicename` varchar(50) DEFAULT NULL COMMENT '发票标题',
  `invoicecontent` varchar(2000) DEFAULT NULL COMMENT '发票内容（若要打印订单明细，请把明细以“；”隔开）',
  `shopname` varchar(50) DEFAULT NULL COMMENT '订单来源的店铺名称',
  `remark` varchar(50) DEFAULT NULL COMMENT '订单备注',
  `status` int(2) DEFAULT NULL COMMENT '单据状态',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `createtime` datetime DEFAULT current_timestamp(),
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `paperid` (`paperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库信息主表';

-- Dumping data for table kf_inoma_weiwei_wms.wms_shipment_request_main: ~0 rows (大约)
DELETE FROM `wms_shipment_request_main`;
/*!40000 ALTER TABLE `wms_shipment_request_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `wms_shipment_request_main` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
