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

-- Dumping structure for table kf_inoma_weiwei_wms.wms_receipt_request_detail
DROP TABLE IF EXISTS `wms_receipt_request_detail`;
CREATE TABLE IF NOT EXISTS `wms_receipt_request_detail` (
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
  `opFlag` varchar(10) DEFAULT 'NEW' COMMENT '操作状态（对应该条明细AGV的执行情况）',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `createtime` datetime DEFAULT current_timestamp(),
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库信息明细表';

-- Dumping data for table kf_inoma_weiwei_wms.wms_receipt_request_detail: ~15 rows (大约)
DELETE FROM `wms_receipt_request_detail`;
/*!40000 ALTER TABLE `wms_receipt_request_detail` DISABLE KEYS */;
INSERT INTO `wms_receipt_request_detail` (`id`, `paperid`, `item`, `itemname`, `itemcount`, `sprice`, `inventorysts`, `expirationdate`, `lot`, `sequence`, `remark`, `userdef1`, `userdef2`, `userdef3`, `userdef4`, `status`, `opFlag`, `updatetime`, `createtime`, `delflag`) VALUES
	('97769748598620169', 'ARKD00000035', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '002-F1-02', '1', '1', '1', 1, 'NEW', '2018-08-09 09:50:00', '2018-08-09 09:50:00', 0),
	('97769748598620170', 'ARKD00000035', '1', '1', 1, 1.00000, '1', NULL, '1', 2, '1', '111-F1-02', '1', '1', '1', 1, 'NEW', '2018-08-09 09:50:06', '2018-08-09 09:50:00', 0),
	('97769748598620171', 'ARKD00000035', '1', '1', 1, 1.00000, '1', NULL, '1', 3, '1', '111-F2-03', '1', '1', '1', 1, 'NEW', '2018-08-09 09:50:07', '2018-08-09 09:50:00', 0),
	('97769748598620172', 'ARKD00000035', '1', '1', 1, 1.00000, '1', NULL, '1', 4, '1', '231-F1-03', '1', '1', '1', 1, 'NEW', '2018-08-09 09:50:07', '2018-08-09 09:50:00', 0),
	('97791459238871041', 'A-1-62e3e0c6674b46c5a5d93620efdd6ea2', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '001-F1-03', '1', '1', '1', 1, 'NEW', '2018-08-10 11:41:39', '2018-08-10 11:41:39', 0),
	('97791459238871043', 'A-1-62e3e0c6674b46c5a5d93620efdd6ea2', '1', '1', 1, 1.00000, '1', NULL, '1', 2, '1', '001-F1-03', '1', '1', '1', 1, 'NEW', '2018-08-16 16:09:16', '2018-08-10 13:09:53', 0),
	('97798769457758209', 'ARKD00000036', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '009-F1-02', '1', '1', '1', 1, 'NEW', '2018-08-16 17:29:49', '2018-08-16 17:29:49', 0),
	('97808926484987905', 'ARKD00000038', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '001-F1-01', '1', '1', '1', 1, 'NEW', '2018-08-22 16:22:39', '2018-08-22 16:22:39', 0),
	('97827800030904321', 'ARKD00000039', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '002-F1-01', '1', '1', '1', 1, 'NEW', '2018-09-05 10:51:26', '2018-09-05 10:51:26', 0),
	('97827800030904322', 'ARKD00000039', '1', '1', 1, 1.00000, '1', NULL, '1', 2, '1', '100-F1-02', '1', '1', '1', 1, 'NEW', '2018-09-05 10:51:36', '2018-09-05 10:51:26', 0),
	('97891542663954433', 'ARKD00000044', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '001-F1-06', '1', '1', '1', 1, 'NEW', '2018-10-18 16:45:35', '2018-10-18 16:45:35', 0),
	('97891542663954435', 'ARKD00000045', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '001-F1-12', '1', '1', '1', 1, 'NEW', '2018-10-18 16:54:56', '2018-10-18 16:54:56', 0),
	('97891542663954437', 'ARKD00000046', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '001-F1-13', '1', '1', '1', 1, 'NEW', '2018-10-18 16:58:09', '2018-10-18 16:58:09', 0),
	('97898813892591617', 'ARKD00000047', '1', '1', 1, 1.00000, '1', NULL, '1', 1, '1', '001-F1-02', '1', '1', '1', 1, 'NEW', '2018-10-23 09:24:42', '2018-10-23 09:24:42', 0),
	('97898813892591618', 'ARKD00000047', '1', '1', 1, 1.00000, '1', NULL, '1', 2, '1', '102-F1-03', '1', '1', '1', 1, 'NEW', '2018-10-23 09:24:50', '2018-10-23 09:24:42', 0);
/*!40000 ALTER TABLE `wms_receipt_request_detail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
