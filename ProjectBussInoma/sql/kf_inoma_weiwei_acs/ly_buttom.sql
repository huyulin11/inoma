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

-- Dumping structure for table kf_inoma_weiwei_acs.ly_buttom
DROP TABLE IF EXISTS `ly_buttom`;
CREATE TABLE IF NOT EXISTS `ly_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `buttom` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei_acs.ly_buttom: ~13 rows (approximately)
DELETE FROM `ly_buttom`;
/*!40000 ALTER TABLE `ly_buttom` DISABLE KEYS */;
INSERT INTO `ly_buttom` (`id`, `name`, `buttom`, `description`) VALUES
	(1, '新增', '<button type="button" id="addFun" class="btn btn-primary marR10">新增</button>', ''),
	(2, '编辑', '<button type="button" id="editFun" class="btn btn-info marR10">编辑</button>', NULL),
	(3, '删除', '<button type="button" id="delFun" class="btn btn-danger marR10">删除</button>', NULL),
	(4, '上传', '<button type="button" id="upLoad" class="btn btn-primary marR10">上传</button>', NULL),
	(5, '下载', '<button type="button" id="downLoad" class="btn btn-primary marR10">下载</button>', NULL),
	(6, '上移', '<button type="button" id="lyGridUp" class="btn btn-success marR10">上移</button>', NULL),
	(7, '下移', '<button type="button" id="lyGridDown" class="btn btn btn-grey marR10">下移</button>', NULL),
	(8, '分配权限', '<button type="button" id="permissions" class="btn btn btn-grey marR10">分配权限</button>', NULL),
	(9, '确认分配', '<button TYPE="button" id="assign" class="btn btn-PRIMARY marR10">确认分配</button>', NULL),
	(10, '分配查看', '<button TYPE="button" id="bulksearcharrange" class="btn btn-PRIMARY marR10">分配查看</button>', NULL),
	(11, '批量评鉴', '<button TYPE="button" id="bulkevaluation" class="btn btn-PRIMARY marR10">批量评鉴</button>', NULL),
	(12, '批量复核', '<button TYPE="button" id="bulkreview" class="btn btn-PRIMARY marR10">批量复核</button>', NULL),
	(13, '批量封箱', '<button TYPE="button" id="bulksealing" class="btn btn-PRIMARY marR10">批量封箱</button>', NULL);
/*!40000 ALTER TABLE `ly_buttom` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
