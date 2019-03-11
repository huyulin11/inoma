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

-- Dumping structure for table kf_inoma_weiwei_acs.dairy_bill_info
DROP TABLE IF EXISTS `dairy_bill_info`;
CREATE TABLE IF NOT EXISTS `dairy_bill_info` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `occurdate` varchar(8) DEFAULT NULL COMMENT '发生日期（YYYYMMDD）',
  `species` varchar(20) DEFAULT NULL COMMENT '类别',
  `remarks` text DEFAULT NULL COMMENT '说明',
  `amount` decimal(11,2) DEFAULT 0.00 COMMENT '金额',
  `status` int(11) DEFAULT 1 COMMENT '状态',
  `createuserid` int(11) DEFAULT NULL COMMENT '操作人编号',
  `createtime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '生成时间',
  `delflag` int(1) DEFAULT 0 COMMENT '删除标志（DELFLAG）',
  PRIMARY KEY (`id`),
  KEY `occurdate` (`occurdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日常报账信息表';

-- Dumping data for table kf_inoma_weiwei_acs.dairy_bill_info: ~0 rows (approximately)
DELETE FROM `dairy_bill_info`;
/*!40000 ALTER TABLE `dairy_bill_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `dairy_bill_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
