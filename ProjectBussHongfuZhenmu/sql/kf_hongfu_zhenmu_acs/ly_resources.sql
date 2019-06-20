-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.7-MariaDB - mariadb.org binary distribution
-- 服务器OS:                        Win64
-- HeidiSQL 版本:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table kf_hongfu_zhenmu_acs.ly_resources
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE IF NOT EXISTS `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `parentId` int(11) DEFAULT NULL COMMENT '父级菜单编号',
  `resKey` varchar(50) DEFAULT NULL COMMENT '唯一标识',
  `type` varchar(40) DEFAULT NULL COMMENT '类型（RESOURCE_TYPE）',
  `resUrl` varchar(200) DEFAULT NULL COMMENT '访问链接',
  `level` int(4) DEFAULT NULL COMMENT '等级',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `ishide` int(3) DEFAULT 0 COMMENT '是否隐藏',
  `openType` int(1) DEFAULT 0 COMMENT '打开方式（0为常规，1为tab页打开，2为弹窗）',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `sortflag` int(11) DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- Dumping data for table kf_hongfu_zhenmu_acs.ly_resources: ~64 rows (大约)
DELETE FROM `ly_resources`;
/*!40000 ALTER TABLE `ly_resources` DISABLE KEYS */;
INSERT INTO `ly_resources` (`id`, `name`, `parentId`, `resKey`, `type`, `resUrl`, `level`, `icon`, `ishide`, `openType`, `description`, `sortflag`) VALUES
	(101, '系统基础管理', 0, 'system', '0', 'system', 1, '', 0, 0, '系统基础管理', 0),
	(102, '用户管理', 101, 'account', '1', '/user/list.shtml', 2, '', 0, 0, '', 0),
	(103, '角色管理', 101, 'role', '1', '/role/list.shtml', 7, '', 0, 0, '组管理', 0),
	(104, '菜单管理', 101, 'ly_resources', '1', '/resources/list.shtml', 12, '', 0, 0, '菜单管理', 0),
	(105, '新增用户', 102, 'account_add', '2', '/user/addUI.shtml', 3, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;', 0),
	(106, '修改用户', 102, 'account_edit', '2', '/user/editUI.shtml', 4, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;', 0),
	(107, '删除用户', 102, 'account_delete', '2', '/user/deleteById.shtml', 5, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;', 0),
	(108, '新增角色', 103, 'role_add', '2', '/role/addUI.shtml', 8, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRole&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;', 0),
	(109, '修改角色', 103, 'role_edit', '2', '/role/editUI.shtml', 9, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRole&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;', 0),
	(110, '删除角色', 103, 'role_delete', '2', '/role/delete.shtml', 10, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delRole&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;', 0),
	(111, '分配权限', 103, 'role_perss', '2', '/resources/permissions.shtml', 11, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;', 0),
	(113, '新增对应关系', 112, 'roleres_add', '2', '/roleres/addUI.shtml', 3, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRoleres&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;', 0),
	(114, '修改对应关系', 112, 'roleres_edit', '2', '/roleres/editUI.shtml', 4, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRoleres&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;', 0),
	(115, '删除对应关系', 112, 'roleres_delete', '2', '/roleres/deleteById.shtml', 5, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delRoleres&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;', 0),
	(125, '登陆信息管理', 0, 'ly_login', '0', 'ly_login', 18, '', 0, 0, '登陆信息管理', 0),
	(126, '用户登录记录', 125, 'ly_log_list', '1', '/userlogin/listUI.shtml', 19, '', 0, 0, '用户登录记录', 0),
	(127, '操作日志管理', 0, 'ly_log', '0', 'ly_log', 20, '', 0, 0, '操作日志管理', 0),
	(128, '日志查询', 127, 'ly_log', '1', '/log/list.shtml', 21, '', 0, 0, '', 0),
	(129, '新增菜单资源', 104, 'ly_resources_add', '2', '/resources/addUI.shtml', 13, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;', 0),
	(130, '修改菜单资源', 104, 'ly_resources_edit', '2', '/resources/editUI.shtml', 14, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;', 0),
	(131, '删除菜单资源', 104, 'ly_resources_delete', '2', '/resources/delete.shtml', 15, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;', 0),
	(132, '系统监控管理', 0, 'monitor', '0', 'monitor', 16, '', 0, 0, '系统监控管理', 0),
	(133, '实时监控', 132, 'sysmonitor', '1', '/monitor/monitor.shtml', 17, '', 0, 0, '实时监控', 0),
	(134, '分配权限', 102, 'permissions', '2', '/resources/permissions.shtml', 6, '', 0, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;', 0),
	(135, '告警列表', 132, 'monitor_warn', '1', '/monitor/list.shtml', NULL, '', 0, 0, '告警列表', 0),
	(201, '档案综合管理', 0, 'archives', '0', 'archives', 1, NULL, 0, 0, '档案信息管理', 0),
	(202, '档案信息检索', 201, 'archivesSearch', '1', '/s/buss/wms/h/archiveSearch.html', 2, NULL, 0, 0, '档案信息检索', 0),
	(203, '档案信息管理', 201, 'archivesMgr', '1', '/s/buss/wms/h/archiveMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(204, 'AGV管理', 0, 'AGVMgr', '0', 'AGVMgr', NULL, NULL, 0, 0, 'AGV管理', 0),
	(205, 'AGV即时信息', 0, 'AGVMgrUI', '1', '/s/buss/acs/HONGFU_ZHENMU/h/index.html', NULL, NULL, 0, 1, 'AGV管理功能项', 0),
	(206, '档案信息录入', 201, 'archivesAdd', '1', '/s/buss/wms/h/archiveAddList.html', NULL, NULL, 0, 0, 'archivesAdd', 0),
	(207, '执行入库操作', 201, 'AGVEXERK', '1', '/s/buss/wms/h/archiveStockIn.html', NULL, NULL, 0, 0, NULL, 0),
	(208, '执行出库操作', 201, 'AGVEXECK', '1', '/s/buss/wms/h/archiveStockOut.html', NULL, NULL, 0, 0, NULL, 0),
	(209, '执行盘点任务', 211, 'AGVEXEPD', '1', '/s/buss/wms/h/archiveStockInventory.html', NULL, NULL, 0, 0, NULL, 0),
	(210, '库存盘点计划', 211, 'pandian', '1', '/s/buss/wms/h/archiveInventoryPlan.html', NULL, NULL, 0, 0, NULL, 0),
	(211, '库存综合管理', 0, 'wms', '0', NULL, NULL, NULL, 0, 0, NULL, 0),
	(212, '仓库库存信息', 211, 'wms_all', '1', NULL, NULL, NULL, 0, 0, NULL, 0),
	(213, 'agv缓存查询', 211, 'wms_agv', '1', NULL, NULL, NULL, 0, 0, NULL, 0),
	(214, '缓存柜库存查询', 211, 'wms_hcg', '1', NULL, NULL, NULL, 0, 0, NULL, 0),
	(215, '财务报账', 0, 'bill', '0', NULL, NULL, NULL, 0, 0, NULL, 0),
	(216, '报账管理', 215, 'bill_mgr', '1', '/s/buss/bill/h/dairyBillMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(217, 'AGV任务管理', 204, 'AGVTASK', '1', '/s/buss/agv/task/h/agvTaskMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(218, '入库管理', 211, 'receiptMain', '1', '/s/buss/wms/receipt/main/h/receiptMainMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(219, '入库明细管理', 211, 'receiptDetail', '1', '/s/buss/wms/receipt/detail/h/receiptDetailMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(220, '出库管理', 211, 'shipmentMain', '1', '/s/buss/wms/shipment/main/h/shipmentMainMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(221, '出库明细管理', 211, 'shipmentDetail', '1', '/s/buss/wms/shipment/detail/h/shipmentDetailMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(222, '货位信息管理', 231, 'alloc_item', '1', '/s/buss/wms/alloc/item/h/allocItemMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(223, '账单日报表', 215, 'billDay', '1', '/reportmanager/view.shtml?type=billReportByDay&q=1', NULL, NULL, 0, 0, NULL, 0),
	(224, '账单月报表', 215, 'billMonth', '1', '/reportmanager/view.shtml?type=billReportByMonth&q=1', NULL, NULL, 0, 0, NULL, 0),
	(225, '账单种类报表（月）', 215, 'billMonthAndSpecies', '1', '/reportmanager/view.shtml?type=billReportByMonthAndSpecies&q=1', NULL, NULL, 0, 0, NULL, 0),
	(226, '总账单报表', 215, 'billAll', '1', '/reportmanager/view.shtml?type=billReportByAll&q=1', NULL, NULL, 0, 0, NULL, 0),
	(227, '字典信息管理', 101, 'sysdic', '1', '/s/buss/sys/dic/h/sysDicMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(228, '站点管理', 231, 'siteMgr', '1', '/s/buss/agv/site/info/h/siteMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(229, 'PLC动作管理', 231, 'armactMgr', '1', '/s/buss/agv/armact/h/armactMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(230, '盘点管理', 211, 'inventoryMgr', '1', '/s/buss/wms/inventory/main/h/inventoryMainMgr.html	', NULL, NULL, 0, 0, NULL, 0),
	(231, '货位信息管理', 0, 'allocMgr', '0', NULL, NULL, NULL, 0, 0, NULL, 0),
	(232, '设备信息管理', 0, 'lot', '0', NULL, NULL, NULL, 0, 0, NULL, 0),
	(233, 'AGV信息管理', 232, 'lot_agv_mgr', '1', '/s/buss/iot/agv/h/agvMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(234, '设备信息管理', 232, 'dev_mgr', '1', '/s/buss/iot/socketdev/h/socketdevMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(237, 'AGV配套设备管理', 232, 'lot_integration_mgr', '1', '/s/buss/iot/relation/h/relationMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(238, '地图管理', 231, 'siteLogicMgr', '1', '/s/buss/agv/site/logic/h/logicMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(239, 'SKU信息管理', 101, 'sku_info', '1', '/s/buss/wms/sku/info/h/skuInfoMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(240, '库存信息查询', 211, 'stock', '1', '/s/buss/wms/alloc/stock/h/allocItemMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(241, '取货点信息管理', 101, 'lapinfo', '1', '/s/buss/agv/lap/h/lapInfoMgr.html', NULL, NULL, 0, 0, NULL, 0),
	(242, 'AGV即时任务管理', 204, 'agvImmediateTask', '1', '/s/buss/agv/immediateTask/h/agvImmediateTaskMgr.html', NULL, NULL, 0, 0, NULL, 0);
/*!40000 ALTER TABLE `ly_resources` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
