-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5505
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_inoma_weiwei__conf.conf_key
DROP TABLE IF EXISTS `conf_key`;
CREATE TABLE IF NOT EXISTS `conf_key` (
  `key` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  `updatetime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table kf_inoma_weiwei__conf.conf_key: ~11 rows (approximately)
DELETE FROM `conf_key`;
/*!40000 ALTER TABLE `conf_key` DISABLE KEYS */;
INSERT INTO `conf_key` (`key`, `value`, `updatetime`) VALUES
	('ACS_CONTROL', '[{"id":"PAUSE_USER","name":"暂停所有"},{"id":"togglePiBtn","name":"交通管制"},{"id":"autoTaskBtn","name":"自动任务"},{"id":"autoChargeBtn","name":"自动充电"},{"id":"errBackBtn","name":"错误回家"}]', '2019-03-11 17:13:54'),
	('AGV_CONTROL', '[{"id":"PAUSE_USER","name":"暂停"},{"id":"CONTINUE","name":"继续"},{"id":"GOTO_CHARGE","name":"前往充电"},{"id":"BACK_CHARGE","name":"停止充电"},{"id":"SHUTDOWN","name":"取消任务","color":"red"},{"id":"GOTO_INIT","name":"返回初始位置","color":"red"},{"id":"RE_PATH","name":"重新规划路径","color":"black"}]', '2019-03-11 17:14:07'),
	('AGV_GENERAL_SEARCH_INTEVAL', '200', '2019-06-01 09:18:50'),
	('AGV_JUDGED_TIMES_INTEVAL', '1000', '2019-06-01 09:18:50'),
	('IS_AUTO_CHARGE', 'TRUE', '2019-06-01 09:18:55'),
	('IS_AUTO_TASK', 'TRUE', '2019-06-01 09:18:55'),
	('IS_ERR_BACK', 'FALSE', '2019-06-01 09:18:55'),
	('IS_OPEN_PI', 'TRUE', '2019-06-01 09:18:55'),
	('NGINX_PATH', 'G:/JavaTools/nginx-1.10.1/html/static/s/jsons/', '2019-03-11 17:14:28'),
	('NGINX_PORT', '99', '2019-06-02 10:00:51'),
	('PROJECT_INFO', '{"fullProjectName":"客户公司名称智能搬运AGV调度系统","corporation":{"address":"地址：安徽省合肥市经开区百鸟路石柱路5F创客空间","telephone":"电话：15077923697","fullname":"合肥凯钒信息科技有限公司","shortname":"山东省济南市档案局"},"client":{"address":"","fullname":"凯钒科技","shortname":"凯钒科技","tips":"AHYF"},"projectName":"AGV调度系统"}', '2019-05-30 15:46:06');
/*!40000 ALTER TABLE `conf_key` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
