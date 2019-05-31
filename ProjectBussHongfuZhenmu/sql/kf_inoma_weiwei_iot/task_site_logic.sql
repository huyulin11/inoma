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

-- Dumping structure for table kf_inoma_weiwei_iot.task_site_logic
DROP TABLE IF EXISTS `task_site_logic`;
CREATE TABLE IF NOT EXISTS `task_site_logic` (
  `siteid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nextid` int(1) NOT NULL DEFAULT 0,
  `distance` decimal(4,2) NOT NULL DEFAULT 1.00 COMMENT '设定距离，常规为1，具体参照地图估算',
  `side` int(1) NOT NULL DEFAULT 0,
  `delflag` int(1) DEFAULT 0,
  PRIMARY KEY (`siteid`,`nextid`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务站点信息表';

-- Dumping data for table kf_inoma_weiwei_iot.task_site_logic: ~506 rows (大约)
DELETE FROM `task_site_logic`;
/*!40000 ALTER TABLE `task_site_logic` DISABLE KEYS */;
INSERT INTO `task_site_logic` (`siteid`, `nextid`, `distance`, `side`, `delflag`) VALUES
	(2, 4, 8.00, 2, 0),
	(2, 479, 3.00, 1, 0),
	(3, 12, 1.00, 1, 0),
	(4, 11, 1.00, 1, 0),
	(5, 9, 1.00, 1, 0),
	(6, 8, 1.00, 1, 0),
	(7, 6, 1.00, 1, 0),
	(7, 482, 20.00, 2, 0),
	(8, 19, 10.00, 1, 0),
	(9, 7, 1.00, 1, 0),
	(10, 6, 3.00, 2, 0),
	(10, 13, 3.00, 1, 0),
	(11, 20, 10.00, 1, 0),
	(12, 2, 1.00, 1, 0),
	(13, 14, 1.00, 1, 0),
	(14, 15, 1.00, 1, 0),
	(15, 16, 1.00, 1, 0),
	(15, 19, 1.00, 2, 0),
	(16, 17, 1.00, 1, 0),
	(17, 18, 1.00, 1, 0),
	(18, 21, 7.00, 1, 0),
	(19, 21, 6.00, 1, 0),
	(20, 21, 3.00, 1, 0),
	(21, 22, 3.00, 1, 0),
	(21, 42, 3.00, 2, 0),
	(22, 23, 3.00, 1, 0),
	(22, 71, 1.00, 2, 0),
	(23, 24, 1.00, 1, 0),
	(24, 25, 3.00, 1, 0),
	(24, 94, 1.00, 2, 0),
	(25, 26, 3.00, 1, 0),
	(25, 117, 1.00, 2, 0),
	(26, 27, 3.00, 1, 0),
	(26, 140, 1.00, 2, 0),
	(27, 28, 3.00, 1, 0),
	(27, 163, 1.00, 2, 0),
	(28, 29, 1.00, 1, 0),
	(29, 30, 3.00, 1, 0),
	(29, 186, 1.00, 2, 0),
	(30, 31, 3.00, 1, 0),
	(30, 209, 1.00, 2, 0),
	(31, 32, 1.00, 1, 0),
	(32, 33, 3.00, 1, 0),
	(32, 232, 1.00, 2, 0),
	(33, 34, 3.00, 1, 0),
	(33, 255, 1.00, 2, 0),
	(34, 35, 3.00, 1, 0),
	(34, 278, 1.00, 2, 0),
	(35, 36, 3.00, 1, 0),
	(35, 301, 1.00, 2, 0),
	(36, 37, 3.00, 1, 0),
	(36, 324, 1.00, 2, 0),
	(37, 38, 3.00, 1, 0),
	(37, 347, 1.00, 2, 0),
	(38, 39, 3.00, 1, 0),
	(38, 370, 1.00, 2, 0),
	(39, 40, 3.00, 1, 0),
	(39, 393, 1.00, 2, 0),
	(40, 41, 3.00, 1, 0),
	(40, 416, 1.00, 2, 0),
	(41, 439, 1.00, 2, 0),
	(42, 43, 1.00, 1, 0),
	(43, 44, 1.00, 1, 0),
	(44, 45, 1.00, 1, 0),
	(45, 46, 1.00, 1, 0),
	(46, 47, 1.00, 1, 0),
	(47, 48, 1.00, 1, 0),
	(48, 49, 1.00, 1, 0),
	(49, 50, 1.00, 1, 0),
	(50, 51, 1.00, 1, 0),
	(51, 52, 1.00, 1, 0),
	(52, 53, 1.00, 1, 0),
	(53, 54, 1.00, 1, 0),
	(54, 55, 1.00, 1, 0),
	(55, 56, 1.00, 1, 0),
	(56, 57, 1.00, 1, 0),
	(57, 58, 1.00, 1, 0),
	(58, 59, 1.00, 1, 0),
	(59, 60, 1.00, 1, 0),
	(60, 61, 1.00, 1, 0),
	(61, 62, 1.00, 1, 0),
	(62, 63, 1.00, 1, 0),
	(63, 64, 1.00, 1, 0),
	(64, 65, 1.00, 1, 0),
	(65, 66, 1.00, 1, 0),
	(65, 68, 3.00, 2, 0),
	(66, 67, 1.00, 1, 0),
	(66, 69, 3.00, 2, 0),
	(67, 70, 3.00, 1, 0),
	(68, 3, 10.00, 2, 0),
	(68, 481, 15.00, 1, 0),
	(69, 5, 10.00, 1, 0),
	(70, 10, 20.00, 1, 0),
	(71, 72, 1.00, 1, 0),
	(72, 73, 1.00, 1, 0),
	(73, 74, 1.00, 1, 0),
	(74, 75, 1.00, 1, 0),
	(75, 76, 1.00, 1, 0),
	(76, 77, 1.00, 1, 0),
	(77, 78, 1.00, 1, 0),
	(78, 79, 1.00, 1, 0),
	(79, 80, 1.00, 1, 0),
	(80, 81, 1.00, 1, 0),
	(81, 82, 1.00, 1, 0),
	(82, 83, 1.00, 1, 0),
	(83, 84, 1.00, 1, 0),
	(84, 85, 1.00, 1, 0),
	(85, 86, 1.00, 1, 0),
	(86, 87, 1.00, 1, 0),
	(87, 88, 1.00, 1, 0),
	(88, 89, 1.00, 1, 0),
	(89, 90, 1.00, 1, 0),
	(90, 91, 1.00, 1, 0),
	(91, 92, 1.00, 1, 0),
	(92, 93, 1.00, 1, 0),
	(93, 478, 3.00, 1, 0),
	(94, 95, 1.00, 1, 0),
	(95, 96, 1.00, 1, 0),
	(96, 97, 1.00, 1, 0),
	(97, 98, 1.00, 1, 0),
	(98, 99, 1.00, 1, 0),
	(99, 100, 1.00, 1, 0),
	(100, 101, 1.00, 1, 0),
	(101, 102, 1.00, 1, 0),
	(102, 103, 1.00, 1, 0),
	(103, 104, 1.00, 1, 0),
	(104, 105, 1.00, 1, 0),
	(105, 106, 1.00, 1, 0),
	(106, 107, 1.00, 1, 0),
	(107, 108, 1.00, 1, 0),
	(108, 109, 1.00, 1, 0),
	(109, 110, 1.00, 1, 0),
	(110, 111, 1.00, 1, 0),
	(111, 112, 1.00, 1, 0),
	(112, 113, 1.00, 1, 0),
	(113, 114, 1.00, 1, 0),
	(114, 115, 1.00, 1, 0),
	(115, 116, 1.00, 1, 0),
	(116, 477, 3.00, 1, 0),
	(117, 118, 1.00, 1, 0),
	(118, 119, 1.00, 1, 0),
	(119, 120, 1.00, 1, 0),
	(120, 121, 1.00, 1, 0),
	(121, 122, 1.00, 1, 0),
	(122, 123, 1.00, 1, 0),
	(123, 124, 1.00, 1, 0),
	(124, 125, 1.00, 1, 0),
	(125, 126, 1.00, 1, 0),
	(126, 127, 1.00, 1, 0),
	(127, 128, 1.00, 1, 0),
	(128, 129, 1.00, 1, 0),
	(129, 130, 1.00, 1, 0),
	(130, 131, 1.00, 1, 0),
	(131, 132, 1.00, 1, 0),
	(132, 133, 1.00, 1, 0),
	(133, 134, 1.00, 1, 0),
	(134, 135, 1.00, 1, 0),
	(135, 136, 1.00, 1, 0),
	(136, 137, 1.00, 1, 0),
	(137, 138, 1.00, 1, 0),
	(138, 139, 1.00, 1, 0),
	(139, 476, 3.00, 1, 0),
	(140, 141, 1.00, 1, 0),
	(141, 142, 1.00, 1, 0),
	(142, 143, 1.00, 1, 0),
	(143, 144, 1.00, 1, 0),
	(144, 145, 1.00, 1, 0),
	(145, 146, 1.00, 1, 0),
	(146, 147, 1.00, 1, 0),
	(147, 148, 1.00, 1, 0),
	(148, 149, 1.00, 1, 0),
	(149, 150, 1.00, 1, 0),
	(150, 151, 1.00, 1, 0),
	(151, 152, 1.00, 1, 0),
	(152, 153, 1.00, 1, 0),
	(153, 154, 1.00, 1, 0),
	(154, 155, 1.00, 1, 0),
	(155, 156, 1.00, 1, 0),
	(156, 157, 1.00, 1, 0),
	(157, 158, 1.00, 1, 0),
	(158, 159, 1.00, 1, 0),
	(159, 160, 1.00, 1, 0),
	(160, 161, 1.00, 1, 0),
	(161, 162, 1.00, 1, 0),
	(162, 475, 3.00, 1, 0),
	(163, 164, 1.00, 1, 0),
	(164, 165, 1.00, 1, 0),
	(165, 166, 1.00, 1, 0),
	(166, 167, 1.00, 1, 0),
	(167, 168, 1.00, 1, 0),
	(168, 169, 1.00, 1, 0),
	(169, 170, 1.00, 1, 0),
	(170, 171, 1.00, 1, 0),
	(171, 172, 1.00, 1, 0),
	(172, 173, 1.00, 1, 0),
	(173, 174, 1.00, 1, 0),
	(174, 175, 1.00, 1, 0),
	(175, 176, 1.00, 1, 0),
	(176, 177, 1.00, 1, 0),
	(177, 178, 1.00, 1, 0),
	(178, 179, 1.00, 1, 0),
	(179, 180, 1.00, 1, 0),
	(180, 181, 1.00, 1, 0),
	(181, 182, 1.00, 1, 0),
	(182, 183, 1.00, 1, 0),
	(183, 184, 1.00, 1, 0),
	(184, 185, 1.00, 1, 0),
	(185, 474, 3.00, 1, 0),
	(186, 187, 1.00, 1, 0),
	(187, 188, 1.00, 1, 0),
	(188, 189, 1.00, 1, 0),
	(189, 190, 1.00, 1, 0),
	(190, 191, 1.00, 1, 0),
	(191, 192, 1.00, 1, 0),
	(192, 193, 1.00, 1, 0),
	(193, 194, 1.00, 1, 0),
	(194, 195, 1.00, 1, 0),
	(195, 196, 1.00, 1, 0),
	(196, 197, 1.00, 1, 0),
	(197, 198, 1.00, 1, 0),
	(198, 199, 1.00, 1, 0),
	(199, 200, 1.00, 1, 0),
	(200, 201, 1.00, 1, 0),
	(201, 202, 1.00, 1, 0),
	(202, 203, 1.00, 1, 0),
	(203, 204, 1.00, 1, 0),
	(204, 205, 1.00, 1, 0),
	(205, 206, 1.00, 1, 0),
	(206, 207, 1.00, 1, 0),
	(207, 208, 1.00, 1, 0),
	(208, 473, 3.00, 1, 0),
	(209, 210, 1.00, 1, 0),
	(210, 211, 1.00, 1, 0),
	(211, 212, 1.00, 1, 0),
	(212, 213, 1.00, 1, 0),
	(213, 214, 1.00, 1, 0),
	(214, 215, 1.00, 1, 0),
	(215, 216, 1.00, 1, 0),
	(216, 217, 1.00, 1, 0),
	(217, 218, 1.00, 1, 0),
	(218, 219, 1.00, 1, 0),
	(219, 220, 1.00, 1, 0),
	(220, 221, 1.00, 1, 0),
	(221, 222, 1.00, 1, 0),
	(222, 223, 1.00, 1, 0),
	(223, 224, 1.00, 1, 0),
	(224, 225, 1.00, 1, 0),
	(225, 226, 1.00, 1, 0),
	(226, 227, 1.00, 1, 0),
	(227, 228, 1.00, 1, 0),
	(228, 229, 1.00, 1, 0),
	(229, 230, 1.00, 1, 0),
	(230, 231, 1.00, 1, 0),
	(231, 472, 3.00, 1, 0),
	(232, 233, 1.00, 1, 0),
	(233, 234, 1.00, 1, 0),
	(234, 235, 1.00, 1, 0),
	(235, 236, 1.00, 1, 0),
	(236, 237, 1.00, 1, 0),
	(237, 238, 1.00, 1, 0),
	(238, 239, 1.00, 1, 0),
	(239, 240, 1.00, 1, 0),
	(240, 241, 1.00, 1, 0),
	(241, 242, 1.00, 1, 0),
	(242, 243, 1.00, 1, 0),
	(243, 244, 1.00, 1, 0),
	(244, 245, 1.00, 1, 0),
	(245, 246, 1.00, 1, 0),
	(246, 247, 1.00, 1, 0),
	(247, 248, 1.00, 1, 0),
	(248, 249, 1.00, 1, 0),
	(249, 250, 1.00, 1, 0),
	(250, 251, 1.00, 1, 0),
	(251, 252, 1.00, 1, 0),
	(252, 253, 1.00, 1, 0),
	(253, 254, 1.00, 1, 0),
	(254, 471, 3.00, 1, 0),
	(255, 256, 1.00, 1, 0),
	(256, 257, 1.00, 1, 0),
	(257, 258, 1.00, 1, 0),
	(258, 259, 1.00, 1, 0),
	(259, 260, 1.00, 1, 0),
	(260, 261, 1.00, 1, 0),
	(261, 262, 1.00, 1, 0),
	(262, 263, 1.00, 1, 0),
	(263, 264, 1.00, 1, 0),
	(264, 265, 1.00, 1, 0),
	(265, 266, 1.00, 1, 0),
	(266, 267, 1.00, 1, 0),
	(267, 268, 1.00, 1, 0),
	(268, 269, 1.00, 1, 0),
	(269, 270, 1.00, 1, 0),
	(270, 271, 1.00, 1, 0),
	(271, 272, 1.00, 1, 0),
	(272, 273, 1.00, 1, 0),
	(273, 274, 1.00, 1, 0),
	(274, 275, 1.00, 1, 0),
	(275, 276, 1.00, 1, 0),
	(276, 277, 1.00, 1, 0),
	(277, 470, 3.00, 1, 0),
	(278, 279, 1.00, 1, 0),
	(279, 280, 1.00, 1, 0),
	(280, 281, 1.00, 1, 0),
	(281, 282, 1.00, 1, 0),
	(282, 283, 1.00, 1, 0),
	(283, 284, 1.00, 1, 0),
	(284, 285, 1.00, 1, 0),
	(285, 286, 1.00, 1, 0),
	(286, 287, 1.00, 1, 0),
	(287, 288, 1.00, 1, 0),
	(288, 289, 1.00, 1, 0),
	(289, 290, 1.00, 1, 0),
	(290, 291, 1.00, 1, 0),
	(291, 292, 1.00, 1, 0),
	(292, 293, 1.00, 1, 0),
	(293, 294, 1.00, 1, 0),
	(294, 295, 1.00, 1, 0),
	(295, 296, 1.00, 1, 0),
	(296, 297, 1.00, 1, 0),
	(297, 298, 1.00, 1, 0),
	(298, 299, 1.00, 1, 0),
	(299, 300, 1.00, 1, 0),
	(300, 469, 3.00, 1, 0),
	(301, 302, 1.00, 1, 0),
	(302, 303, 1.00, 1, 0),
	(303, 304, 1.00, 1, 0),
	(304, 305, 1.00, 1, 0),
	(305, 306, 1.00, 1, 0),
	(306, 307, 1.00, 1, 0),
	(307, 308, 1.00, 1, 0),
	(308, 309, 1.00, 1, 0),
	(309, 310, 1.00, 1, 0),
	(310, 311, 1.00, 1, 0),
	(311, 312, 1.00, 1, 0),
	(312, 313, 1.00, 1, 0),
	(313, 314, 1.00, 1, 0),
	(314, 315, 1.00, 1, 0),
	(315, 316, 1.00, 1, 0),
	(316, 317, 1.00, 1, 0),
	(317, 318, 1.00, 1, 0),
	(318, 319, 1.00, 1, 0),
	(319, 320, 1.00, 1, 0),
	(320, 321, 1.00, 1, 0),
	(321, 322, 1.00, 1, 0),
	(322, 323, 1.00, 1, 0),
	(323, 468, 3.00, 1, 0),
	(324, 325, 1.00, 1, 0),
	(325, 326, 1.00, 1, 0),
	(326, 327, 1.00, 1, 0),
	(327, 328, 1.00, 1, 0),
	(328, 329, 1.00, 1, 0),
	(329, 330, 1.00, 1, 0),
	(330, 331, 1.00, 1, 0),
	(331, 332, 1.00, 1, 0),
	(332, 333, 1.00, 1, 0),
	(333, 334, 1.00, 1, 0),
	(334, 335, 1.00, 1, 0),
	(335, 336, 1.00, 1, 0),
	(336, 337, 1.00, 1, 0),
	(337, 338, 1.00, 1, 0),
	(338, 339, 1.00, 1, 0),
	(339, 340, 1.00, 1, 0),
	(340, 341, 1.00, 1, 0),
	(341, 342, 1.00, 1, 0),
	(342, 343, 1.00, 1, 0),
	(343, 344, 1.00, 1, 0),
	(344, 345, 1.00, 1, 0),
	(345, 346, 1.00, 1, 0),
	(346, 467, 3.00, 1, 0),
	(347, 348, 1.00, 1, 0),
	(348, 349, 1.00, 1, 0),
	(349, 350, 1.00, 1, 0),
	(350, 351, 1.00, 1, 0),
	(351, 352, 1.00, 1, 0),
	(352, 353, 1.00, 1, 0),
	(353, 354, 1.00, 1, 0),
	(354, 355, 1.00, 1, 0),
	(355, 356, 1.00, 1, 0),
	(356, 357, 1.00, 1, 0),
	(357, 358, 1.00, 1, 0),
	(358, 359, 1.00, 1, 0),
	(359, 360, 1.00, 1, 0),
	(360, 361, 1.00, 1, 0),
	(361, 362, 1.00, 1, 0),
	(362, 363, 1.00, 1, 0),
	(363, 364, 1.00, 1, 0),
	(364, 365, 1.00, 1, 0),
	(365, 366, 1.00, 1, 0),
	(366, 367, 1.00, 1, 0),
	(367, 368, 1.00, 1, 0),
	(368, 369, 1.00, 1, 0),
	(369, 466, 3.00, 1, 0),
	(370, 371, 1.00, 1, 0),
	(371, 372, 1.00, 1, 0),
	(372, 373, 1.00, 1, 0),
	(373, 374, 1.00, 1, 0),
	(374, 375, 1.00, 1, 0),
	(375, 376, 1.00, 1, 0),
	(376, 377, 1.00, 1, 0),
	(377, 378, 1.00, 1, 0),
	(378, 379, 1.00, 1, 0),
	(379, 380, 1.00, 1, 0),
	(380, 381, 1.00, 1, 0),
	(381, 382, 1.00, 1, 0),
	(382, 383, 1.00, 1, 0),
	(383, 384, 1.00, 1, 0),
	(384, 385, 1.00, 1, 0),
	(385, 386, 1.00, 1, 0),
	(386, 387, 1.00, 1, 0),
	(387, 388, 1.00, 1, 0),
	(388, 389, 1.00, 1, 0),
	(389, 390, 1.00, 1, 0),
	(390, 391, 1.00, 1, 0),
	(391, 392, 1.00, 1, 0),
	(392, 465, 3.00, 1, 0),
	(393, 394, 1.00, 1, 0),
	(394, 395, 1.00, 1, 0),
	(395, 396, 1.00, 1, 0),
	(396, 397, 1.00, 1, 0),
	(397, 398, 1.00, 1, 0),
	(398, 399, 1.00, 1, 0),
	(399, 400, 1.00, 1, 0),
	(400, 401, 1.00, 1, 0),
	(401, 402, 1.00, 1, 0),
	(402, 403, 1.00, 1, 0),
	(403, 404, 1.00, 1, 0),
	(404, 405, 1.00, 1, 0),
	(405, 406, 1.00, 1, 0),
	(406, 407, 1.00, 1, 0),
	(407, 408, 1.00, 1, 0),
	(408, 409, 1.00, 1, 0),
	(409, 410, 1.00, 1, 0),
	(410, 411, 1.00, 1, 0),
	(411, 412, 1.00, 1, 0),
	(412, 413, 1.00, 1, 0),
	(413, 414, 1.00, 1, 0),
	(414, 415, 1.00, 1, 0),
	(415, 464, 3.00, 1, 0),
	(416, 417, 1.00, 1, 0),
	(417, 418, 1.00, 1, 0),
	(418, 419, 1.00, 1, 0),
	(419, 420, 1.00, 1, 0),
	(420, 421, 1.00, 1, 0),
	(421, 422, 1.00, 1, 0),
	(422, 423, 1.00, 1, 0),
	(423, 424, 1.00, 1, 0),
	(424, 425, 1.00, 1, 0),
	(425, 426, 1.00, 1, 0),
	(426, 427, 1.00, 1, 0),
	(427, 428, 1.00, 1, 0),
	(428, 429, 1.00, 1, 0),
	(429, 430, 1.00, 1, 0),
	(430, 431, 1.00, 1, 0),
	(431, 432, 1.00, 1, 0),
	(432, 433, 1.00, 1, 0),
	(433, 434, 1.00, 1, 0),
	(434, 435, 1.00, 1, 0),
	(435, 436, 1.00, 1, 0),
	(436, 437, 1.00, 1, 0),
	(437, 438, 1.00, 1, 0),
	(438, 463, 3.00, 1, 0),
	(439, 440, 1.00, 1, 0),
	(440, 441, 1.00, 1, 0),
	(441, 442, 1.00, 1, 0),
	(442, 443, 1.00, 1, 0),
	(443, 444, 1.00, 1, 0),
	(444, 445, 1.00, 1, 0),
	(445, 446, 1.00, 1, 0),
	(446, 447, 1.00, 1, 0),
	(447, 448, 1.00, 1, 0),
	(448, 449, 1.00, 1, 0),
	(449, 450, 1.00, 1, 0),
	(450, 451, 1.00, 1, 0),
	(451, 452, 1.00, 1, 0),
	(452, 453, 1.00, 1, 0),
	(453, 454, 1.00, 1, 0),
	(454, 455, 1.00, 1, 0),
	(455, 456, 1.00, 1, 0),
	(456, 457, 1.00, 1, 0),
	(457, 458, 1.00, 1, 0),
	(458, 459, 1.00, 1, 0),
	(459, 460, 1.00, 1, 0),
	(460, 461, 1.00, 1, 0),
	(461, 462, 3.00, 1, 0),
	(462, 463, 3.00, 1, 0),
	(463, 464, 3.00, 1, 0),
	(464, 465, 3.00, 1, 0),
	(465, 466, 3.00, 1, 0),
	(466, 467, 3.00, 1, 0),
	(467, 468, 3.00, 1, 0),
	(468, 469, 3.00, 1, 0),
	(469, 470, 3.00, 1, 0),
	(470, 471, 3.00, 1, 0),
	(471, 472, 3.00, 1, 0),
	(472, 473, 3.00, 1, 0),
	(473, 474, 3.00, 1, 0),
	(474, 475, 3.00, 1, 0),
	(475, 476, 3.00, 1, 0),
	(476, 477, 3.00, 1, 0),
	(477, 478, 3.00, 1, 0),
	(478, 65, 1.00, 1, 0),
	(479, 4, 1.00, 2, 0),
	(479, 480, 1.00, 1, 0),
	(480, 482, 1.00, 2, 0),
	(481, 479, 1.00, 1, 0),
	(482, 20, 1.00, 1, 0);
/*!40000 ALTER TABLE `task_site_logic` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
