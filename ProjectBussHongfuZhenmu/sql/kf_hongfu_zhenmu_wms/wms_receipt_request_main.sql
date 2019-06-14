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

-- Dumping structure for table kf_inoma_weiwei_wms.wms_receipt_request_main
DROP TABLE IF EXISTS `wms_receipt_request_main`;
CREATE TABLE IF NOT EXISTS `wms_receipt_request_main` (
  `id` varchar(36) NOT NULL DEFAULT uuid_short() COMMENT '流水号',
  `company` varchar(50) NOT NULL COMMENT '货主编码',
  `warehouse` varchar(50) NOT NULL COMMENT '仓库编码',
  `totalqty` int(16) NOT NULL COMMENT '入库单入库总数量',
  `totallines` int(16) NOT NULL COMMENT '订单明细行数',
  `paperid` varchar(50) NOT NULL COMMENT '入库单编码',
  `receipttype` varchar(50) NOT NULL COMMENT '入库类型（采购入库、退货入库）',
  `orderdate` datetime DEFAULT NULL COMMENT '预计到货日期（如：2010-01-01）',
  `status` int(2) DEFAULT NULL COMMENT '单据状态',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `updatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `createtime` datetime DEFAULT current_timestamp(),
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `paperid` (`paperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库信息主表';

-- Dumping data for table kf_inoma_weiwei_wms.wms_receipt_request_main: ~9 rows (大约)
DELETE FROM `wms_receipt_request_main`;
/*!40000 ALTER TABLE `wms_receipt_request_main` DISABLE KEYS */;
INSERT INTO `wms_receipt_request_main` (`id`, `company`, `warehouse`, `totalqty`, `totallines`, `paperid`, `receipttype`, `orderdate`, `status`, `name`, `updatetime`, `createtime`, `delflag`) VALUES
	('97769748598620168', 'JINANDANGANJU', '1', 1, 4, 'ARKD00000035', 'AGV', NULL, 4, '1', '2018-09-05 10:50:12', '2018-08-09 09:50:00', 1),
	('97791459238871040', 'JINANDANGANJU', '1', 1, 1, 'A-1-62e3e0c6674b46c5a5d93620efdd6ea2', 'AGV', NULL, 4, '1', '2018-09-05 10:50:12', '2018-08-10 11:41:39', 1),
	('97798769457758208', 'JINANDANGANJU', '1', 1, 1, 'ARKD00000036', 'AGV', NULL, 4, '1', '2018-09-05 10:50:12', '2018-08-16 17:29:49', 1),
	('97808926484987904', 'JINANDANGANJU', '1', 1, 1, 'ARKD00000038', 'AGV', NULL, 4, '1', '2018-09-05 10:50:12', '2018-08-22 16:22:39', 1),
	('97827800030904320', 'JINANDANGANJU', '1', 1, 2, 'ARKD00000039', 'AGV', NULL, 4, '1', '2018-09-13 16:12:38', '2018-09-05 10:51:26', 0),
	('97891542663954432', 'JINANDANGANJU', '1', 1, 1, 'ARKD00000044', 'AGV', NULL, 1, '1', '2018-10-18 16:45:35', '2018-10-18 16:45:35', 0),
	('97891542663954434', 'JINANDANGANJU', '1', 1, 1, 'ARKD00000045', 'AGV', NULL, 1, '1', '2018-10-18 16:54:56', '2018-10-18 16:54:56', 0),
	('97891542663954436', 'JINANDANGANJU', '1', 1, 1, 'ARKD00000046', 'AGV', NULL, 1, '2', '2018-10-18 16:58:09', '2018-10-18 16:58:09', 0),
	('97898813892591616', 'JINANDANGANJU', '1', 1, 2, 'ARKD00000047', 'AGV', NULL, 3, '1', '2018-10-23 09:24:50', '2018-10-23 09:24:42', 0);
/*!40000 ALTER TABLE `wms_receipt_request_main` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
