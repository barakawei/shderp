# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 10.0.10-MariaDB)
# Database: shderp
# Generation Time: 2014-06-08 17:15:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dict`;

CREATE TABLE `dict` (
  `id` bigint(20) NOT NULL,
  `enable` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;

INSERT INTO `dict` (`id`, `enable`, `name`, `type`)
VALUES
	(1,00000001,'春秋夹克','name'),
	(2,00000001,'单夹克','name'),
	(3,00000001,'休闲夹克','name'),
	(4,00000001,'夏长袖','name'),
	(5,00000001,'夏短袖','name'),
	(6,00000001,'马甲','name'),
	(7,00000001,'棉马甲','name'),
	(8,00000001,'围裙','name'),
	(9,00000001,'帽子','name'),
	(10,00000001,'夹克式棉衣(脱卸)','name'),
	(11,00000001,'夹克式棉衣(不脱卸)','name'),
	(12,00000001,'中长棉衣(脱卸)','name'),
	(13,00000001,'中长棉衣(不脱卸)','name'),
	(14,00000001,'商务棉衣(脱卸)','name'),
	(15,00000001,'商务棉衣(不脱卸)','name'),
	(16,00000001,'羽绒服','name'),
	(17,00000001,'户外防寒服','name'),
	(18,00000001,'户外春秋','name'),
	(19,00000001,'连体服','name'),
	(20,00000001,'大褂','name'),
	(21,00000001,'西服','name'),
	(22,00000001,'标准衬衣(长袖)','name'),
	(23,00000001,'标准衬衣(短袖)','name'),
	(24,00000001,'春秋裤','name'),
	(25,00000001,'夏裤','name'),
	(26,00000001,'西裤','name'),
	(27,00000001,'休闲裤','name'),
	(28,00000001,'户外裤','name'),
	(29,00000001,'圣华盾','brand'),
	(30,00000001,'客供','brand'),
	(31,00000001,'SHD0906(男)','sizeStandardsMale'),
	(32,00000001,'SHD1206(男)','sizeStandardsMale'),
	(33,00000001,'专用','sizeStandardsMale'),
	(34,00000001,'SHD0906(女)','sizeStandardsFemale'),
	(35,00000001,'SHD1206(女)','sizeStandardsFemale'),
	(36,00000001,'专用','sizeStandardsFemale'),
	(37,00000001,'男女同款','style'),
	(38,00000001,'男女异款','style'),
	(39,00000001,'男款','style'),
	(40,00000001,'女款','style'),
	(41,00000001,'门襟反向','style'),
	(42,00000001,'单裥','style'),
	(43,00000001,'双裥','style'),
	(44,00000001,'无裥','style'),
	(45,00000001,'固定腰','style'),
	(46,00000001,'橡筋腰(两侧)','style'),
	(47,00000001,'橡筋腰(整腰)','style'),
	(48,00000001,'后双开袋','style'),
	(49,00000001,'后单开袋','style'),
	(50,00000001,'后双贴袋','style'),
	(51,00000001,'后单贴袋','style'),
	(52,00000001,'后无袋','style'),
	(53,00000001,'单开线','style'),
	(54,00000001,'双开线','style'),
	(55,00000001,'带袋盖','style'),
	(56,00000001,'拉链袋','style'),
	(57,00000001,'单腿袋','style'),
	(58,00000001,'双腿袋','style'),
	(59,00000001,'脚口小袢','style'),
	(60,00000001,'插袋装拉链','style'),
	(61,00000001,'普洗','handleMethod'),
	(62,00000001,'漂洗','handleMethod'),
	(63,00000001,'酵洗','handleMethod'),
	(64,00000001,'酵漂洗','handleMethod'),
	(65,00000001,'普洗压烫','handleMethod'),
	(66,00000001,'酵洗压烫','handleMethod'),
	(67,00000001,'免烫','handleMethod'),
	(68,00000001,'确认样','sampleStyle'),
	(69,00000001,'款式样','sampleStyle'),
	(70,00000001,'标准样','sampleStyle'),
	(71,00000001,'参考样','sampleStyle'),
	(72,00000001,'客供','sampleProvider'),
	(73,00000001,'销售部','sampleProvider'),
	(74,00000001,'按原订单','sampleProvider'),
	(75,00000001,'是','materialReserve'),
	(76,00000001,'否','materialReserve'),
	(77,00000001,'客供','materialReserve'),
	(78,00000001,'32*32','outshellStyle'),
	(79,00000001,'130*70','outshellStyle'),
	(80,00000001,'32*21','outshellStyle'),
	(81,00000001,'133*78','outshellStyle'),
	(82,00000001,'20*16','outshellStyle'),
	(83,00000001,'128*60','outshellStyle'),
	(84,00000001,'32/2*32/2','outshellStyle'),
	(85,00000001,'100*53','outshellStyle'),
	(86,00000001,'40/2*40/2','outshellStyle'),
	(87,00000001,'133*72','outshellStyle'),
	(88,00000001,'21/2*10','outshellStyle'),
	(89,00000001,'72*40','outshellStyle'),
	(90,00000001,'32/2*16','outshellStyle'),
	(91,00000001,'108*65(牛仔)','outshellStyle'),
	(92,00000001,'105*58（牛仔','outshellStyle'),
	(93,00000001,'32/2*1','outshellStyle'),
	(94,00000001,'40/2*40/2','outshellStyle'),
	(95,00000001,'108*58(牛仔)','outshellStyle'),
	(96,00000001,'60/2*32/2','outshellStyle'),
	(97,00000001,'124*60(牛仔)','outshellStyle'),
	(98,00000001,'60/2*32','outshellStyle'),
	(99,00000001,'132*76(牛仔)','outshellStyle'),
	(100,00000001,'棉100%','outshellMaterial'),
	(101,00000001,'棉60%;涤40%','outshellMaterial'),
	(102,00000001,'棉35%;涤65%','outshellMaterial'),
	(103,00000001,'涤100%','outshellMaterial'),
	(104,00000001,'尼龙100%','outshellMaterial'),
	(105,00000001,'棉+导电丝100%','outshellMaterial'),
	(106,00000001,'棉60%;涤+导电丝40%','outshellMaterial'),
	(107,00000001,'普洗','outshellHandle'),
	(108,00000001,'漂洗','outshellHandle'),
	(109,00000001,'酵洗','outshellHandle'),
	(110,00000001,'酵漂洗','outshellHandle'),
	(111,00000001,'普洗压烫','outshellHandle'),
	(112,00000001,'酵洗压烫','outshellHandle'),
	(113,00000001,'免烫','outshellHandle'),
	(114,00000001,'40*40/110*70','liningStyle'),
	(115,00000001,'45*45/110*76','liningStyle'),
	(116,00000001,'棉100%','liningMaterial'),
	(117,00000001,'棉60%;涤40%','liningMaterial'),
	(118,00000001,'棉35%;涤65%','liningMaterial'),
	(119,00000001,'涤100%','liningMaterial'),
	(120,00000001,'尼龙100%','liningMaterial'),
	(121,00000001,'棉+导电丝100%','liningMaterial'),
	(122,00000001,'棉60%;涤+导电丝40%','liningMaterial'),
	(123,00000001,'普洗','liningHandle'),
	(124,00000001,'漂洗','liningHandle'),
	(125,00000001,'酵洗','liningHandle'),
	(126,00000001,'酵漂洗','liningHandle'),
	(127,00000001,'普洗压烫','liningHandle'),
	(128,00000001,'酵洗压烫','liningHandle'),
	(129,00000001,'免烫','liningHandle'),
	(130,00000001,'上衣挂吊牌','packagingReq'),
	(131,00000001,'衣裤挂吊牌','packagingReq'),
	(132,00000001,'无吊牌','packagingReq'),
	(133,00000001,'1人1包','packagingReq'),
	(134,00000001,'1套1包','packagingReq'),
	(135,00000001,'1件1包','packagingReq'),
	(136,00000001,'1条1包','packagingReq'),
	(137,00000001,'衣裤分包','packagingReq'),
	(138,00000001,'对折包装','packagingReq'),
	(139,00000001,'挂装','packagingReq'),
	(140,00000001,'圣华盾塑袋','packagingReq'),
	(141,00000001,'白袋','packagingReq'),
	(142,00000001,'客供','packagingReq'),
	(143,00000001,'塑袋','packagingReq'),
	(144,00000001,'黏贴人名帖','packagingReq'),
	(145,00000001,'黏贴尺码贴','packagingReq'),
	(146,00000001,'常规尺码带','packingReq'),
	(147,00000001,'圣华盾平箱','packingReq'),
	(148,00000001,'定制箱','packingReq'),
	(149,00000001,'白箱','packingReq'),
	(150,00000001,'立体箱','packingReq'),
	(151,00000001,'分地区','packingReq'),
	(152,00000001,'分单位','packingReq'),
	(153,00000001,'分部门','packingReq'),
	(154,00000001,'分性别','packingReq'),
	(155,00000001,'分尺码','packingReq'),
	(156,00000001,'编区域代码','packingReq'),
	(157,00000001,'黏贴装箱单','packingReq'),
	(158,00000001,'按区域代码编号首箱放置装箱明细','packingReq'),
	(159,00000001,'常规尺码带','sizebeltReq'),
	(160,00000001,'特殊尺码带','sizebeltReq'),
	(161,00000001,'常规洗唛','sizebeltReq'),
	(162,00000001,'特殊洗唛','sizebeltReq'),
	(163,00000001,'衣裤全部标注人名','sizebeltReq'),
	(164,00000001,'上衣特体标注人名','sizebeltReq'),
	(165,00000001,'裤子全部标注人名','sizebeltReq'),
	(166,00000001,'衣裤无人名','sizebeltReq'),
	(167,00000001,'加新雪丽洗唛','sizebeltReq'),
	(168,00000001,'加新雪丽吊牌','sizebeltReq'),
	(169,00000001,'加视觉丽吊牌','sizebeltReq'),
	(170,00000001,'见附表','sizebeltReq'),
	(171,00000001,'绣标','companylogoReq'),
	(172,00000001,'印标','companylogoReq'),
	(173,00000001,'贴标','companylogoReq'),
	(174,00000001,'活动标','companylogoReq'),
	(175,00000001,'见附表','companylogoReq'),
	(176,00000001,'发货回执','productionParts'),
	(177,00000001,'常规面料：GB18401--2010；A类；B类；C类。','checkReport'),
	(178,00000001,'防静电服：GB 12014--2009；A级；B级','checkReport'),
	(179,00000001,'按合同要求','checkReport'),
	(180,00000001,'生产中','productStatus'),
	(181,00000001,'后道','productStatus'),
	(182,00000001,'包装','productStatus'),
	(183,00000001,'返工','productStatus'),
	(184,00000001,'终检','productStatus'),
	(185,00000001,'新增订单','orderType'),
	(186,00000001,'返修','orderType'),
	(187,00000001,'补单','orderType');

/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table maintain_icon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maintain_icon`;

CREATE TABLE `maintain_icon` (
  `id` bigint(20) NOT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `icon_left` int(11) DEFAULT NULL,
  `sprite_src` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `icon_top` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `maintain_icon` WRITE;
/*!40000 ALTER TABLE `maintain_icon` DISABLE KEYS */;

INSERT INTO `maintain_icon` (`id`, `css_class`, `description`, `height`, `identity`, `img_src`, `icon_left`, `sprite_src`, `style`, `icon_top`, `type`, `width`)
VALUES
	(1,'icon-adjust',NULL,NULL,'icon-adjust',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(2,'icon-anchor',NULL,NULL,'icon-anchor',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(3,'icon-archive',NULL,NULL,'icon-archive',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(4,'icon-asterisk',NULL,NULL,'icon-asterisk',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(5,'icon-ban-circle',NULL,NULL,'icon-ban-circle',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(6,'icon-bar-chart',NULL,NULL,'icon-bar-chart',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(7,'icon-barcode',NULL,NULL,'icon-barcode',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(8,'icon-beaker',NULL,NULL,'icon-beaker',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(9,'icon-beer',NULL,NULL,'icon-beer',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(10,'icon-bell',NULL,NULL,'icon-bell',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(11,'icon-bell-alt',NULL,NULL,'icon-bell-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(12,'icon-bolt',NULL,NULL,'icon-bolt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(13,'icon-book',NULL,NULL,'icon-book',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(14,'icon-bookmark',NULL,NULL,'icon-bookmark',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(15,'icon-bookmark-empty',NULL,NULL,'icon-bookmark-empty',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(16,'icon-briefcase',NULL,NULL,'icon-briefcase',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(17,'icon-bug',NULL,NULL,'icon-bug',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(18,'icon-building',NULL,NULL,'icon-building',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(19,'icon-bullhorn',NULL,NULL,'icon-bullhorn',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(20,'icon-bullseye',NULL,NULL,'icon-bullseye',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(21,'icon-calendar',NULL,NULL,'icon-calendar',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(22,'icon-calendar-empty',NULL,NULL,'icon-calendar-empty',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(23,'icon-camera',NULL,NULL,'icon-camera',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(24,'icon-camera-retro',NULL,NULL,'icon-camera-retro',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(25,'icon-certificate',NULL,NULL,'icon-certificate',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(26,'icon-check',NULL,NULL,'icon-check',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(27,'icon-check-empty',NULL,NULL,'icon-check-empty',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(28,'icon-check-minus',NULL,NULL,'icon-check-minus',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(29,'icon-check-sign',NULL,NULL,'icon-check-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(30,'icon-circle',NULL,NULL,'icon-circle',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(31,'icon-circle-blank',NULL,NULL,'icon-circle-blank',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(32,'icon-cloud',NULL,NULL,'icon-cloud',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(33,'icon-cloud-download',NULL,NULL,'icon-cloud-download',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(34,'icon-cloud-upload',NULL,NULL,'icon-cloud-upload',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(35,'icon-code',NULL,NULL,'icon-code',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(36,'icon-code-fork',NULL,NULL,'icon-code-fork',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(37,'icon-coffee',NULL,NULL,'icon-coffee',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(38,'icon-cog',NULL,NULL,'icon-cog',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(39,'icon-cogs',NULL,NULL,'icon-cogs',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(40,'icon-collapse',NULL,NULL,'icon-collapse',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(41,'icon-collapse-alt',NULL,NULL,'icon-collapse-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(42,'icon-collapse-top',NULL,NULL,'icon-collapse-top',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(43,'icon-comment',NULL,NULL,'icon-comment',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(44,'icon-comment-alt',NULL,NULL,'icon-comment-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(45,'icon-comments',NULL,NULL,'icon-comments',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(46,'icon-comments-alt',NULL,NULL,'icon-comments-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(47,'icon-compass',NULL,NULL,'icon-compass',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(48,'icon-credit-card',NULL,NULL,'icon-credit-card',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(49,'icon-crop',NULL,NULL,'icon-crop',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(50,'icon-dashboard',NULL,NULL,'icon-dashboard',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(51,'icon-desktop',NULL,NULL,'icon-desktop',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(52,'icon-download',NULL,NULL,'icon-download',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(53,'icon-download-alt',NULL,NULL,'icon-download-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(54,'icon-edit',NULL,NULL,'icon-edit',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(55,'icon-edit-sign',NULL,NULL,'icon-edit-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(56,'icon-ellipsis-horizontal',NULL,NULL,'icon-ellipsis-horizontal',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(57,'icon-ellipsis-vertical',NULL,NULL,'icon-ellipsis-vertical',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(58,'icon-envelope',NULL,NULL,'icon-envelope',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(59,'icon-envelope-alt',NULL,NULL,'icon-envelope-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(60,'icon-eraser',NULL,NULL,'icon-eraser',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(61,'icon-exchange',NULL,NULL,'icon-exchange',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(62,'icon-exclamation',NULL,NULL,'icon-exclamation',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(63,'icon-exclamation-sign',NULL,NULL,'icon-exclamation-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(64,'icon-expand',NULL,NULL,'icon-expand',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(65,'icon-expand-alt',NULL,NULL,'icon-expand-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(66,'icon-external-link',NULL,NULL,'icon-external-link',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(67,'icon-external-link-sign',NULL,NULL,'icon-external-link-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(68,'icon-eye-close',NULL,NULL,'icon-eye-close',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(69,'icon-eye-open',NULL,NULL,'icon-eye-open',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(70,'icon-facetime-video',NULL,NULL,'icon-facetime-video',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(71,'icon-female',NULL,NULL,'icon-female',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(72,'icon-fighter-jet',NULL,NULL,'icon-fighter-jet',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(73,'icon-film',NULL,NULL,'icon-film',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(74,'icon-filter',NULL,NULL,'icon-filter',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(75,'icon-fire',NULL,NULL,'icon-fire',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(76,'icon-fire-extinguisher',NULL,NULL,'icon-fire-extinguisher',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(77,'icon-flag',NULL,NULL,'icon-flag',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(78,'icon-flag-alt',NULL,NULL,'icon-flag-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(79,'icon-flag-checkered',NULL,NULL,'icon-flag-checkered',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(80,'icon-folder-close',NULL,NULL,'icon-folder-close',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(81,'icon-folder-close-alt',NULL,NULL,'icon-folder-close-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(82,'icon-folder-open',NULL,NULL,'icon-folder-open',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(83,'icon-folder-open-alt',NULL,NULL,'icon-folder-open-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(84,'icon-food',NULL,NULL,'icon-food',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(85,'icon-frown',NULL,NULL,'icon-frown',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(86,'icon-gamepad',NULL,NULL,'icon-gamepad',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(87,'icon-gift',NULL,NULL,'icon-gift',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(88,'icon-glass',NULL,NULL,'icon-glass',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(89,'icon-globe',NULL,NULL,'icon-globe',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(90,'icon-group',NULL,NULL,'icon-group',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(91,'icon-hdd',NULL,NULL,'icon-hdd',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(92,'icon-headphones',NULL,NULL,'icon-headphones',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(93,'icon-heart',NULL,NULL,'icon-heart',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(94,'icon-heart-empty',NULL,NULL,'icon-heart-empty',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(95,'icon-home',NULL,NULL,'icon-home',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(96,'icon-inbox',NULL,NULL,'icon-inbox',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(97,'icon-info',NULL,NULL,'icon-info',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(98,'icon-info-sign',NULL,NULL,'icon-info-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(99,'icon-key',NULL,NULL,'icon-key',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(100,'icon-keyboard',NULL,NULL,'icon-keyboard',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(101,'icon-laptop',NULL,NULL,'icon-laptop',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(102,'icon-leaf',NULL,NULL,'icon-leaf',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(103,'icon-legal',NULL,NULL,'icon-legal',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(104,'icon-lemon',NULL,NULL,'icon-lemon',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(105,'icon-level-down',NULL,NULL,'icon-level-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(106,'icon-level-up',NULL,NULL,'icon-level-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(107,'icon-lightbulb',NULL,NULL,'icon-lightbulb',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(108,'icon-location-arrow',NULL,NULL,'icon-location-arrow',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(109,'icon-lock',NULL,NULL,'icon-lock',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(110,'icon-magic',NULL,NULL,'icon-magic',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(111,'icon-magnet',NULL,NULL,'icon-magnet',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(112,'icon-mail-forward',NULL,NULL,'icon-mail-forward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(113,'icon-mail-reply',NULL,NULL,'icon-mail-reply',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(114,'icon-mail-reply-all',NULL,NULL,'icon-mail-reply-all',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(115,'icon-male',NULL,NULL,'icon-male',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(116,'icon-map-marker',NULL,NULL,'icon-map-marker',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(117,'icon-meh',NULL,NULL,'icon-meh',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(118,'icon-microphone',NULL,NULL,'icon-microphone',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(119,'icon-microphone-off',NULL,NULL,'icon-microphone-off',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(120,'icon-minus',NULL,NULL,'icon-minus',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(121,'icon-minus-sign',NULL,NULL,'icon-minus-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(122,'icon-minus-sign-alt',NULL,NULL,'icon-minus-sign-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(123,'icon-mobile-phone',NULL,NULL,'icon-mobile-phone',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(124,'icon-money',NULL,NULL,'icon-money',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(125,'icon-moon',NULL,NULL,'icon-moon',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(126,'icon-move',NULL,NULL,'icon-move',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(127,'icon-music',NULL,NULL,'icon-music',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(128,'icon-off',NULL,NULL,'icon-off',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(129,'icon-ok',NULL,NULL,'icon-ok',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(130,'icon-ok-circle',NULL,NULL,'icon-ok-circle',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(131,'icon-ok-sign',NULL,NULL,'icon-ok-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(132,'icon-pencil',NULL,NULL,'icon-pencil',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(133,'icon-phone',NULL,NULL,'icon-phone',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(134,'icon-phone-sign',NULL,NULL,'icon-phone-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(135,'icon-picture',NULL,NULL,'icon-picture',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(136,'icon-plane',NULL,NULL,'icon-plane',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(137,'icon-plus',NULL,NULL,'icon-plus',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(138,'icon-plus-sign',NULL,NULL,'icon-plus-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(139,'icon-plus-sign-alt',NULL,NULL,'icon-plus-sign-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(140,'icon-power-off',NULL,NULL,'icon-power-off',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(141,'icon-print',NULL,NULL,'icon-print',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(142,'icon-pushpin',NULL,NULL,'icon-pushpin',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(143,'icon-puzzle-piece',NULL,NULL,'icon-puzzle-piece',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(144,'icon-qrcode',NULL,NULL,'icon-qrcode',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(145,'icon-question',NULL,NULL,'icon-question',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(146,'icon-question-sign',NULL,NULL,'icon-question-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(147,'icon-quote-left',NULL,NULL,'icon-quote-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(148,'icon-quote-right',NULL,NULL,'icon-quote-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(149,'icon-random',NULL,NULL,'icon-random',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(150,'icon-refresh',NULL,NULL,'icon-refresh',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(151,'icon-remove',NULL,NULL,'icon-remove',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(152,'icon-remove-circle',NULL,NULL,'icon-remove-circle',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(153,'icon-remove-sign',NULL,NULL,'icon-remove-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(154,'icon-reorder',NULL,NULL,'icon-reorder',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(155,'icon-reply',NULL,NULL,'icon-reply',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(156,'icon-reply-all',NULL,NULL,'icon-reply-all',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(157,'icon-resize-horizontal',NULL,NULL,'icon-resize-horizontal',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(158,'icon-resize-vertical',NULL,NULL,'icon-resize-vertical',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(159,'icon-retweet',NULL,NULL,'icon-retweet',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(160,'icon-road',NULL,NULL,'icon-road',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(161,'icon-rocket',NULL,NULL,'icon-rocket',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(162,'icon-rss',NULL,NULL,'icon-rss',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(163,'icon-rss-sign',NULL,NULL,'icon-rss-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(164,'icon-screenshot',NULL,NULL,'icon-screenshot',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(165,'icon-search',NULL,NULL,'icon-search',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(166,'icon-share',NULL,NULL,'icon-share',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(167,'icon-share-alt',NULL,NULL,'icon-share-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(168,'icon-share-sign',NULL,NULL,'icon-share-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(169,'icon-shield',NULL,NULL,'icon-shield',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(170,'icon-shopping-cart',NULL,NULL,'icon-shopping-cart',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(171,'icon-sign-blank',NULL,NULL,'icon-sign-blank',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(172,'icon-signal',NULL,NULL,'icon-signal',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(173,'icon-signin',NULL,NULL,'icon-signin',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(174,'icon-signout',NULL,NULL,'icon-signout',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(175,'icon-sitemap',NULL,NULL,'icon-sitemap',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(176,'icon-smile',NULL,NULL,'icon-smile',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(177,'icon-sort',NULL,NULL,'icon-sort',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(178,'icon-sort-by-alphabet',NULL,NULL,'icon-sort-by-alphabet',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(179,'icon-sort-by-alphabet-alt',NULL,NULL,'icon-sort-by-alphabet-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(180,'icon-sort-by-attributes',NULL,NULL,'icon-sort-by-attributes',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(181,'icon-sort-by-attributes-alt',NULL,NULL,'icon-sort-by-attributes-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(182,'icon-sort-by-order',NULL,NULL,'icon-sort-by-order',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(183,'icon-sort-by-order-alt',NULL,NULL,'icon-sort-by-order-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(184,'icon-sort-down',NULL,NULL,'icon-sort-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(185,'icon-sort-up',NULL,NULL,'icon-sort-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(186,'icon-spinner',NULL,NULL,'icon-spinner',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(187,'icon-star',NULL,NULL,'icon-star',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(188,'icon-star-empty',NULL,NULL,'icon-star-empty',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(189,'icon-star-half',NULL,NULL,'icon-star-half',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(190,'icon-star-half-empty',NULL,NULL,'icon-star-half-empty',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(191,'icon-star-half-full',NULL,NULL,'icon-star-half-full',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(192,'icon-subscript',NULL,NULL,'icon-subscript',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(193,'icon-suitcase',NULL,NULL,'icon-suitcase',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(194,'icon-sun',NULL,NULL,'icon-sun',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(195,'icon-superscript',NULL,NULL,'icon-superscript',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(196,'icon-tablet',NULL,NULL,'icon-tablet',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(197,'icon-tag',NULL,NULL,'icon-tag',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(198,'icon-tags',NULL,NULL,'icon-tags',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(199,'icon-tasks',NULL,NULL,'icon-tasks',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(200,'icon-terminal',NULL,NULL,'icon-terminal',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(201,'icon-thumbs-down',NULL,NULL,'icon-thumbs-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(202,'icon-thumbs-down-alt',NULL,NULL,'icon-thumbs-down-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(203,'icon-thumbs-up',NULL,NULL,'icon-thumbs-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(204,'icon-thumbs-up-alt',NULL,NULL,'icon-thumbs-up-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(205,'icon-ticket',NULL,NULL,'icon-ticket',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(206,'icon-time',NULL,NULL,'icon-time',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(207,'icon-tint',NULL,NULL,'icon-tint',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(208,'icon-trash',NULL,NULL,'icon-trash',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(209,'icon-trophy',NULL,NULL,'icon-trophy',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(210,'icon-truck',NULL,NULL,'icon-truck',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(211,'icon-umbrella',NULL,NULL,'icon-umbrella',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(212,'icon-unchecked',NULL,NULL,'icon-unchecked',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(213,'icon-unlock',NULL,NULL,'icon-unlock',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(214,'icon-unlock-alt',NULL,NULL,'icon-unlock-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(215,'icon-upload',NULL,NULL,'icon-upload',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(216,'icon-upload-alt',NULL,NULL,'icon-upload-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(217,'icon-user',NULL,NULL,'icon-user',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(218,'icon-volume-down',NULL,NULL,'icon-volume-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(219,'icon-volume-off',NULL,NULL,'icon-volume-off',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(220,'icon-volume-up',NULL,NULL,'icon-volume-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(221,'icon-warning-sign',NULL,NULL,'icon-warning-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(222,'icon-wrench',NULL,NULL,'icon-wrench',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(223,'icon-zoom-in',NULL,NULL,'icon-zoom-in',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(224,'icon-zoom-out',NULL,NULL,'icon-zoom-out',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(225,'icon-bitcoin',NULL,NULL,'icon-bitcoin',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(226,'icon-btc',NULL,NULL,'icon-btc',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(227,'icon-cny',NULL,NULL,'icon-cny',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(228,'icon-dollar',NULL,NULL,'icon-dollar',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(229,'icon-eur',NULL,NULL,'icon-eur',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(230,'icon-euro',NULL,NULL,'icon-euro',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(231,'icon-gbp',NULL,NULL,'icon-gbp',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(232,'icon-inr',NULL,NULL,'icon-inr',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(233,'icon-jpy',NULL,NULL,'icon-jpy',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(234,'icon-krw',NULL,NULL,'icon-krw',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(235,'icon-renminbi',NULL,NULL,'icon-renminbi',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(236,'icon-rupee',NULL,NULL,'icon-rupee',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(237,'icon-usd',NULL,NULL,'icon-usd',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(238,'icon-won',NULL,NULL,'icon-won',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(239,'icon-yen',NULL,NULL,'icon-yen',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(240,'icon-align-center',NULL,NULL,'icon-align-center',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(241,'icon-align-justify',NULL,NULL,'icon-align-justify',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(242,'icon-align-left',NULL,NULL,'icon-align-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(243,'icon-align-right',NULL,NULL,'icon-align-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(244,'icon-bold',NULL,NULL,'icon-bold',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(245,'icon-columns',NULL,NULL,'icon-columns',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(246,'icon-copy',NULL,NULL,'icon-copy',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(247,'icon-cut',NULL,NULL,'icon-cut',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(249,'icon-file',NULL,NULL,'icon-file',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(250,'icon-file-alt',NULL,NULL,'icon-file-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(251,'icon-file-text',NULL,NULL,'icon-file-text',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(252,'icon-file-text-alt',NULL,NULL,'icon-file-text-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(253,'icon-font',NULL,NULL,'icon-font',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(254,'icon-indent-left',NULL,NULL,'icon-indent-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(255,'icon-indent-right',NULL,NULL,'icon-indent-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(256,'icon-italic',NULL,NULL,'icon-italic',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(257,'icon-link',NULL,NULL,'icon-link',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(258,'icon-list',NULL,NULL,'icon-list',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(259,'icon-list-alt',NULL,NULL,'icon-list-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(260,'icon-list-ol',NULL,NULL,'icon-list-ol',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(261,'icon-list-ul',NULL,NULL,'icon-list-ul',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(262,'icon-paper-clip',NULL,NULL,'icon-paper-clip',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(263,'icon-paperclip',NULL,NULL,'icon-paperclip',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(264,'icon-paste',NULL,NULL,'icon-paste',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(265,'icon-repeat',NULL,NULL,'icon-repeat',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(266,'icon-rotate-left',NULL,NULL,'icon-rotate-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(267,'icon-rotate-right',NULL,NULL,'icon-rotate-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(268,'icon-save',NULL,NULL,'icon-save',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(269,'icon-strikethrough',NULL,NULL,'icon-strikethrough',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(270,'icon-table',NULL,NULL,'icon-table',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(271,'icon-text-height',NULL,NULL,'icon-text-height',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(272,'icon-text-width',NULL,NULL,'icon-text-width',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(273,'icon-th',NULL,NULL,'icon-th',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(274,'icon-th-large',NULL,NULL,'icon-th-large',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(275,'icon-th-list',NULL,NULL,'icon-th-list',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(276,'icon-underline',NULL,NULL,'icon-underline',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(277,'icon-undo',NULL,NULL,'icon-undo',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(278,'icon-unlink',NULL,NULL,'icon-unlink',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(279,'icon-angle-down',NULL,NULL,'icon-angle-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(280,'icon-angle-left',NULL,NULL,'icon-angle-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(281,'icon-angle-right',NULL,NULL,'icon-angle-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(282,'icon-angle-up',NULL,NULL,'icon-angle-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(283,'icon-arrow-down',NULL,NULL,'icon-arrow-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(284,'icon-arrow-left',NULL,NULL,'icon-arrow-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(285,'icon-arrow-right',NULL,NULL,'icon-arrow-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(286,'icon-arrow-up',NULL,NULL,'icon-arrow-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(287,'icon-caret-down',NULL,NULL,'icon-caret-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(288,'icon-caret-left',NULL,NULL,'icon-caret-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(289,'icon-caret-right',NULL,NULL,'icon-caret-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(290,'icon-caret-up',NULL,NULL,'icon-caret-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(291,'icon-chevron-down',NULL,NULL,'icon-chevron-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(292,'icon-chevron-left',NULL,NULL,'icon-chevron-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(293,'icon-chevron-right',NULL,NULL,'icon-chevron-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(294,'icon-chevron-sign-down',NULL,NULL,'icon-chevron-sign-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(295,'icon-chevron-sign-left',NULL,NULL,'icon-chevron-sign-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(296,'icon-chevron-sign-right',NULL,NULL,'icon-chevron-sign-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(297,'icon-chevron-sign-up',NULL,NULL,'icon-chevron-sign-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(298,'icon-chevron-up',NULL,NULL,'icon-chevron-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(299,'icon-circle-arrow-down',NULL,NULL,'icon-circle-arrow-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(300,'icon-circle-arrow-left',NULL,NULL,'icon-circle-arrow-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(301,'icon-circle-arrow-right',NULL,NULL,'icon-circle-arrow-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(302,'icon-circle-arrow-up',NULL,NULL,'icon-circle-arrow-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(303,'icon-double-angle-down',NULL,NULL,'icon-double-angle-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(304,'icon-double-angle-left',NULL,NULL,'icon-double-angle-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(305,'icon-double-angle-right',NULL,NULL,'icon-double-angle-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(306,'icon-double-angle-up',NULL,NULL,'icon-double-angle-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(307,'icon-hand-down',NULL,NULL,'icon-hand-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(308,'icon-hand-left',NULL,NULL,'icon-hand-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(309,'icon-hand-right',NULL,NULL,'icon-hand-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(310,'icon-hand-up',NULL,NULL,'icon-hand-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(311,'icon-long-arrow-down',NULL,NULL,'icon-long-arrow-down',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(312,'icon-long-arrow-left',NULL,NULL,'icon-long-arrow-left',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(313,'icon-long-arrow-right',NULL,NULL,'icon-long-arrow-right',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(314,'icon-long-arrow-up',NULL,NULL,'icon-long-arrow-up',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(315,'icon-backward',NULL,NULL,'icon-backward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(316,'icon-eject',NULL,NULL,'icon-eject',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(317,'icon-fast-backward',NULL,NULL,'icon-fast-backward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(318,'icon-fast-forward',NULL,NULL,'icon-fast-forward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(319,'icon-forward',NULL,NULL,'icon-forward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(320,'icon-fullscreen',NULL,NULL,'icon-fullscreen',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(321,'icon-pause',NULL,NULL,'icon-pause',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(322,'icon-play',NULL,NULL,'icon-play',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(323,'icon-play-circle',NULL,NULL,'icon-play-circle',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(324,'icon-play-sign',NULL,NULL,'icon-play-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(325,'icon-resize-full',NULL,NULL,'icon-resize-full',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(326,'icon-resize-small',NULL,NULL,'icon-resize-small',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(327,'icon-step-backward',NULL,NULL,'icon-step-backward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(328,'icon-step-forward',NULL,NULL,'icon-step-forward',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(329,'icon-stop',NULL,NULL,'icon-stop',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(330,'icon-youtube-play',NULL,NULL,'icon-youtube-play',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(331,'icon-adn',NULL,NULL,'icon-adn',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(332,'icon-android',NULL,NULL,'icon-android',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(333,'icon-apple',NULL,NULL,'icon-apple',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(334,'icon-bitbucket',NULL,NULL,'icon-bitbucket',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(335,'icon-bitbucket-sign',NULL,NULL,'icon-bitbucket-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(338,'icon-css3',NULL,NULL,'icon-css3',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(339,'icon-dribble',NULL,NULL,'icon-dribble',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(340,'icon-dropbox',NULL,NULL,'icon-dropbox',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(341,'icon-facebook',NULL,NULL,'icon-facebook',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(342,'icon-facebook-sign',NULL,NULL,'icon-facebook-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(343,'icon-flickr',NULL,NULL,'icon-flickr',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(344,'icon-foursquare',NULL,NULL,'icon-foursquare',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(345,'icon-github',NULL,NULL,'icon-github',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(346,'icon-github-alt',NULL,NULL,'icon-github-alt',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(347,'icon-github-sign',NULL,NULL,'icon-github-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(348,'icon-gittip',NULL,NULL,'icon-gittip',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(349,'icon-google-plus',NULL,NULL,'icon-google-plus',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(350,'icon-google-plus-sign',NULL,NULL,'icon-google-plus-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(351,'icon-html5',NULL,NULL,'icon-html5',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(352,'icon-instagram',NULL,NULL,'icon-instagram',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(353,'icon-linkedin',NULL,NULL,'icon-linkedin',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(354,'icon-linkedin-sign',NULL,NULL,'icon-linkedin-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(355,'icon-linux',NULL,NULL,'icon-linux',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(356,'icon-maxcdn',NULL,NULL,'icon-maxcdn',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(357,'icon-pinterest',NULL,NULL,'icon-pinterest',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(358,'icon-pinterest-sign',NULL,NULL,'icon-pinterest-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(359,'icon-renren',NULL,NULL,'icon-renren',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(360,'icon-skype',NULL,NULL,'icon-skype',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(361,'icon-stackexchange',NULL,NULL,'icon-stackexchange',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(362,'icon-trello',NULL,NULL,'icon-trello',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(363,'icon-tumblr',NULL,NULL,'icon-tumblr',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(364,'icon-tumblr-sign',NULL,NULL,'icon-tumblr-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(365,'icon-twitter',NULL,NULL,'icon-twitter',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(366,'icon-twitter-sign',NULL,NULL,'icon-twitter-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(367,'icon-vk',NULL,NULL,'icon-vk',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(368,'icon-weibo',NULL,NULL,'icon-weibo',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(369,'icon-windows',NULL,NULL,'icon-windows',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(370,'icon-xing',NULL,NULL,'icon-xing',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(371,'icon-xing-sign',NULL,NULL,'icon-xing-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(372,'icon-youtube',NULL,NULL,'icon-youtube',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(374,'icon-youtube-sign',NULL,NULL,'icon-youtube-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(375,'icon-ambulance',NULL,NULL,'icon-ambulance',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(376,'icon-h-sign',NULL,NULL,'icon-h-sign',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(377,'icon-hospital',NULL,NULL,'icon-hospital',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(378,'icon-medkit',NULL,NULL,'icon-medkit',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(380,'icon-stethoscope',NULL,NULL,'icon-stethoscope',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(381,'icon-user-md',NULL,NULL,'icon-user-md',NULL,NULL,NULL,NULL,NULL,'css_class',NULL),
	(1001,NULL,NULL,16,'ztree_root_close','static/comp/zTree/css/zTreeStyle/img/diy/1_close.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1002,NULL,NULL,16,'ztree_root_open','static/comp/zTree/css/zTreeStyle/img/diy/1_open.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1003,NULL,NULL,16,'ztree_edit','static/comp/zTree/css/zTreeStyle/img/diy/2.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1004,NULL,NULL,16,'ztree_star','static/comp/zTree/css/zTreeStyle/img/diy/3.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1005,NULL,NULL,16,'ztree_calendar','static/comp/zTree/css/zTreeStyle/img/diy/4.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1006,NULL,NULL,16,'ztree_heart','static/comp/zTree/css/zTreeStyle/img/diy/5.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1007,NULL,NULL,16,'ztree_save','static/comp/zTree/css/zTreeStyle/img/diy/6.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1008,NULL,NULL,16,'ztree_msg','static/comp/zTree/css/zTreeStyle/img/diy/7.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1009,NULL,NULL,16,'ztree_report','static/comp/zTree/css/zTreeStyle/img/diy/8.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1010,NULL,NULL,16,'ztree_setting','static/comp/zTree/css/zTreeStyle/img/diy/9.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1011,NULL,NULL,16,'ztree_file','static/comp/zTree/css/zTreeStyle/img/diy/file.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1012,NULL,NULL,16,'ztree_folder','static/comp/zTree/css/zTreeStyle/img/diy/folder.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1013,NULL,NULL,16,'ztree_branch','static/comp/zTree/css/zTreeStyle/img/diy/branch.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1014,NULL,NULL,16,'ztree_leaf','static/comp/zTree/css/zTreeStyle/img/diy/leaf.png',NULL,NULL,NULL,NULL,'upload_file',16),
	(1500,NULL,NULL,16,'ztree_folder_open',NULL,110,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,0,'css_sprite',16),
	(1501,NULL,NULL,16,'ztree_folder_close',NULL,110,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,17,'css_sprite',16),
	(1502,NULL,NULL,16,'ztree_file2',NULL,110,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,32,'css_sprite',16),
	(1503,NULL,NULL,16,'ztree_edit2',NULL,110,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,48,'css_sprite',16),
	(1504,NULL,NULL,16,'ztree_delete',NULL,110,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,64,'css_sprite',16),
	(1505,NULL,NULL,16,'ztree_arrow',NULL,110,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,80,'css_sprite',16),
	(1506,NULL,NULL,13,'ztree_plus',NULL,79,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,75,'css_sprite',13),
	(1507,NULL,NULL,13,'ztree_minus',NULL,98,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,75,'css_sprite',13),
	(1508,NULL,NULL,16,'ztree_add',NULL,144,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,0,'css_sprite',16),
	(1509,NULL,NULL,16,'ztree_cicle_arrow_left1',NULL,144,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,15,'css_sprite',16),
	(1510,NULL,NULL,16,'ztree_cicle_arrow_right1',NULL,144,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,32,'css_sprite',16),
	(1511,NULL,NULL,16,'ztree_cicle_arrow_left2',NULL,144,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,48,'css_sprite',16),
	(1512,NULL,NULL,16,'ztree_cicle_arrow_right2',NULL,144,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,64,'css_sprite',16),
	(1513,NULL,NULL,16,'ztree_cicle_arrow',NULL,127,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,48,'css_sprite',16),
	(1514,NULL,NULL,16,'ztree_star_light',NULL,127,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,64,'css_sprite',16),
	(1515,NULL,NULL,16,'ztree_star_dark',NULL,127,'static/comp/zTree/css/zTreeStyle/img/zTreeStandard.png',NULL,80,'css_sprite',16);

/*!40000 ALTER TABLE `maintain_icon` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table maintain_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maintain_map`;

CREATE TABLE `maintain_map` (
  `id` bigint(20) NOT NULL,
  `map_key` varchar(255) DEFAULT NULL,
  `map_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table maintain_notification_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maintain_notification_data`;

CREATE TABLE `maintain_notification_data` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table maintain_notification_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `maintain_notification_template`;

CREATE TABLE `maintain_notification_template` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table organize_progress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organize_progress`;

CREATE TABLE `organize_progress` (
  `id` bigint(20) NOT NULL,
  `accessory_organize_actual_date` datetime DEFAULT NULL,
  `accessory_organize_plan_date` datetime DEFAULT NULL,
  `data_plan_finish_date` datetime DEFAULT NULL,
  `fabric_organize_actual_date` datetime DEFAULT NULL,
  `fabric_organize_plan_date` datetime DEFAULT NULL,
  `standerd_sample_confirm_date` datetime DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4cky06knwy7pwai9tvl4k9q1p` (`po_id`),
  CONSTRAINT `FK_4cky06knwy7pwai9tvl4k9q1p` FOREIGN KEY (`po_id`) REFERENCES `production_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table personal_calendar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_calendar`;

CREATE TABLE `personal_calendar` (
  `id` bigint(20) NOT NULL,
  `background_color` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table personal_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_message`;

CREATE TABLE `personal_message` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `receiver_state` varchar(255) DEFAULT NULL,
  `receiver_state_change_date` datetime DEFAULT NULL,
  `is_replied` bit(1) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `sender_state` varchar(255) DEFAULT NULL,
  `sender_state_change_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table personal_message_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_message_content`;

CREATE TABLE `personal_message_content` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `message_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qfjwxoa6coastm6o8xncm2b3c` (`message_id`),
  CONSTRAINT `FK_qfjwxoa6coastm6o8xncm2b3c` FOREIGN KEY (`message_id`) REFERENCES `personal_message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table product_progress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_progress`;

CREATE TABLE `product_progress` (
  `id` bigint(20) NOT NULL,
  `actual_warehouse_date` datetime DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `plan_warehouse_date` datetime DEFAULT NULL,
  `product_status` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2xgxsu20a510tg30nn1tm3wua` (`po_id`),
  CONSTRAINT `FK_2xgxsu20a510tg30nn1tm3wua` FOREIGN KEY (`po_id`) REFERENCES `production_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table production
# ------------------------------------------------------------

DROP TABLE IF EXISTS `production`;

CREATE TABLE `production` (
  `id` bigint(20) NOT NULL,
  `amount_female` int(11) DEFAULT NULL,
  `amount_male` int(11) DEFAULT NULL,
  `archive_staff` varchar(255) DEFAULT NULL,
  `available_female` int(11) DEFAULT NULL,
  `available_male` int(11) DEFAULT NULL,
  `bagging` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `handle_method` varchar(255) DEFAULT NULL,
  `lining_main_color` varchar(255) DEFAULT NULL,
  `lining_set_color` varchar(255) DEFAULT NULL,
  `material_reserve` varchar(255) DEFAULT NULL,
  `material_special_req` varchar(255) DEFAULT NULL,
  `measure_sample_version` varchar(255) DEFAULT NULL,
  `measure_staff` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `need_female` int(11) DEFAULT NULL,
  `need_male` int(11) DEFAULT NULL,
  `order_total` int(11) DEFAULT NULL,
  `other_req` varchar(255) DEFAULT NULL,
  `outshell_main_color` varchar(255) DEFAULT NULL,
  `outshell_set_color` varchar(255) DEFAULT NULL,
  `packing_req` varchar(255) DEFAULT NULL,
  `people_number_female` int(11) DEFAULT NULL,
  `people_number_male` int(11) DEFAULT NULL,
  `production_total` int(11) DEFAULT NULL,
  `sample_amount` int(11) DEFAULT NULL,
  `sample_provider` varchar(255) DEFAULT NULL,
  `sample_revision_desc` varchar(255) DEFAULT NULL,
  `sample_style` varchar(255) DEFAULT NULL,
  `sample_style_number` varchar(255) DEFAULT NULL,
  `size_standards_male` varchar(255) DEFAULT NULL,
  `size_standards_female` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `style_number_female` varchar(255) DEFAULT NULL,
  `style_number_male` varchar(255) DEFAULT NULL,
  `total_people` int(11) DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g8qiymef4pct19rx89rsllec9` (`po_id`),
  CONSTRAINT `FK_g8qiymef4pct19rx89rsllec9` FOREIGN KEY (`po_id`) REFERENCES `production_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table production_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `production_order`;

CREATE TABLE `production_order` (
  `id` bigint(20) NOT NULL,
  `assistant` varchar(255) DEFAULT NULL,
  `check_report` varchar(255) DEFAULT NULL,
  `companylogo_req` varchar(255) DEFAULT NULL,
  `contract_delivery_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `factory_director` varchar(255) DEFAULT NULL,
  `fill_date` datetime DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_principal` varchar(255) DEFAULT NULL,
  `packaging_req` varchar(255) DEFAULT NULL,
  `packing_req` varchar(255) DEFAULT NULL,
  `plan_manager` varchar(255) DEFAULT NULL,
  `production_parts` varchar(255) DEFAULT NULL,
  `regional_Manager` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sales_director` varchar(255) DEFAULT NULL,
  `sales_director_assistant` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `sizebelt_req` varchar(255) DEFAULT NULL,
  `supply_principal` varchar(255) DEFAULT NULL,
  `technique_director` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `orderId` varchar(255) DEFAULT NULL,
  `op_id` bigint(20) DEFAULT NULL,
  `pp_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ek9yj3k2e9j712x6geoi2r9s7` (`op_id`),
  KEY `FK_tjkmsnt8plurypu7vjbhraaw0` (`pp_id`),
  CONSTRAINT `FK_ek9yj3k2e9j712x6geoi2r9s7` FOREIGN KEY (`op_id`) REFERENCES `organize_progress` (`id`),
  CONSTRAINT `FK_tjkmsnt8plurypu7vjbhraaw0` FOREIGN KEY (`pp_id`) REFERENCES `product_progress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table purchase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `id` bigint(20) NOT NULL,
  `actual_consume` varchar(255) DEFAULT NULL,
  `actual_discharge_spec` varchar(255) DEFAULT NULL,
  `actual_loss` varchar(255) DEFAULT NULL,
  `actual_purchase_amount` varchar(255) DEFAULT NULL,
  `actual_use` varchar(255) DEFAULT NULL,
  `actual_width` varchar(255) DEFAULT NULL,
  `alert` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `category_num` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `composition` varchar(255) DEFAULT NULL,
  `confirm_use` varchar(255) DEFAULT NULL,
  `consume` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `discharge_spec` varchar(255) DEFAULT NULL,
  `entry_amount` varchar(255) DEFAULT NULL,
  `exceed_use` varchar(255) DEFAULT NULL,
  `loss` varchar(255) DEFAULT NULL,
  `material_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_settlement` varchar(255) DEFAULT NULL,
  `plan_entry_amount` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `purchase_amount` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `return_use` varchar(255) DEFAULT NULL,
  `send_use` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `shrinkage` varchar(255) DEFAULT NULL,
  `specDesc` varchar(255) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `warehouse_amount` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q5ggih0kd3jrhhaqypkhtrm7n` (`po_id`),
  CONSTRAINT `FK_q5ggih0kd3jrhhaqypkhtrm7n` FOREIGN KEY (`po_id`) REFERENCES `purchase_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table purchase_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order` (
  `id` bigint(20) NOT NULL,
  `contract_delivery_date` datetime DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `discharge_personk` varchar(255) DEFAULT NULL,
  `order_amount` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tabulate_date` datetime DEFAULT NULL,
  `tabulator` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_category`;

CREATE TABLE `showcase_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_child
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_child`;

CREATE TABLE `showcase_child` (
  `id` bigint(20) NOT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6b2glj1t21w6xx0nyop2wobvl` (`parent_id`),
  CONSTRAINT `FK_6b2glj1t21w6xx0nyop2wobvl` FOREIGN KEY (`parent_id`) REFERENCES `showcase_parent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_editor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_editor`;

CREATE TABLE `showcase_editor` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_excel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_excel_data`;

CREATE TABLE `showcase_excel_data` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_moveable
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_moveable`;

CREATE TABLE `showcase_moveable` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_parent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_parent`;

CREATE TABLE `showcase_parent` (
  `id` bigint(20) NOT NULL,
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_product`;

CREATE TABLE `showcase_product` (
  `id` bigint(20) NOT NULL,
  `beginDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jo8ffwyjkl4xu8w4pbl10pdb7` (`category_id`),
  CONSTRAINT `FK_jo8ffwyjkl4xu8w4pbl10pdb7` FOREIGN KEY (`category_id`) REFERENCES `showcase_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_sample
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_sample`;

CREATE TABLE `showcase_sample` (
  `id` bigint(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_status_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_status_audit`;

CREATE TABLE `showcase_status_audit` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_status_show
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_status_show`;

CREATE TABLE `showcase_status_show` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_tree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_tree`;

CREATE TABLE `showcase_tree` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table showcase_upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `showcase_upload`;

CREATE TABLE `showcase_upload` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_auth`;

CREATE TABLE `sys_auth` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `role_ids` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_auth` WRITE;
/*!40000 ALTER TABLE `sys_auth` DISABLE KEYS */;

INSERT INTO `sys_auth` (`id`, `group_id`, `job_id`, `organization_id`, `role_ids`, `type`, `user_id`)
VALUES
	(1,0,0,0,'1','user',1),
	(650531930260480,0,650499713827840,1,'611604069303296,','organization_job',0),
	(650573657375744,0,611604430734336,1,'611604069303296,','organization_job',0),
	(661357809501184,0,611600405038080,610196910720000,'611597709263872,','organization_job',0),
	(661359601337344,0,574004205929472,610196910720000,'611598861239296,','organization_job',0),
	(661360171156480,0,574003983205376,574001245766656,'610339469345792,','organization_job',0),
	(661361533797376,0,650498450588672,650483149669376,'650516410942464,','organization_job',0),
	(661361931568128,0,574004703200256,610196910720000,'610326429647872,','organization_job',0),
	(661362229232640,0,574004499547136,610196910720000,'610316363777024,','organization_job',0),
	(661362565301248,0,574006799598592,574007349412864,'650522975781888,','organization_job',0),
	(661362957059072,0,650554187596800,574002254021632,'650555729576960,','organization_job',0),
	(661363310330880,0,650498876408832,574002062279680,'650520721753088,','organization_job',0),
	(661363640730624,0,650499978183680,574001722229760,'650517907407872,','organization_job',0),
	(661363981239296,0,574003353928704,574001245766656,'611591709983744,','organization_job',0);

/*!40000 ALTER TABLE `sys_auth` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_group`;

CREATE TABLE `sys_group` (
  `id` bigint(20) NOT NULL,
  `default_group` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_group_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_group_relation`;

CREATE TABLE `sys_group_relation` (
  `id` bigint(20) NOT NULL,
  `end_user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `start_user_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;

INSERT INTO `sys_job` (`id`, `icon`, `name`, `parent_id`, `parent_ids`, `is_show`, `weight`)
VALUES
	(1,'ztree_root_open','圣华盾',0,'0/',00000001,1),
	(574003353928704,'ztree_leaf','计划部经理',1,'0/1/',00000001,1),
	(574003983205376,'ztree_leaf','责任助理',1,'0/1/',00000001,2),
	(574004205929472,'ztree_leaf','片区经理',1,'0/1/',00000001,3),
	(574004499547136,'ztree_leaf','销售总监助理',1,'0/1/',00000001,4),
	(574004703200256,'ztree_leaf','销售总监',1,'0/1/',00000001,5),
	(574005501854720,'ztree_leaf','供应部负责人',1,'0/1/',00000001,6),
	(574006799598592,'ztree_leaf','技术总监',1,'0/1/',00000001,7),
	(611600405038080,'ztree_leaf','订单负责人',1,'0/1/',00000001,8),
	(611604430734336,'ztree_leaf','普通',1,'0/1/',00000001,9),
	(650498450588672,'ztree_leaf','量体部负责人',1,'0/1/',00000001,10),
	(650498876408832,'ztree_leaf','生产部负责人',1,'0/1/',00000001,11),
	(650499713827840,'ztree_leaf','厂长',1,'0/1/',00000001,12),
	(650499978183680,'ztree_leaf','仓库负责人',1,'0/1/',00000001,13),
	(650554187596800,'ztree_leaf','质检部负责人',1,'0/1/',00000001,14);

/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_organization
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_organization`;

CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_organization` WRITE;
/*!40000 ALTER TABLE `sys_organization` DISABLE KEYS */;

INSERT INTO `sys_organization` (`id`, `icon`, `name`, `parent_id`, `parent_ids`, `is_show`, `type`, `weight`)
VALUES
	(1,'ztree_root_open','圣华盾',0,'0/',00000001,'branch_office',1),
	(574001245766656,'ztree_leaf','计划部',1,'0/1/',00000001,'branch_office',1),
	(574001722229760,'ztree_leaf','仓库部',1,'0/1/',00000001,'branch_office',2),
	(574002062279680,'ztree_leaf','生产部',1,'0/1/',00000001,'branch_office',3),
	(574002254021632,'ztree_leaf','质检部',1,'0/1/',00000001,'branch_office',4),
	(574007349412864,'ztree_leaf','技术部',1,'0/1/',00000001,'branch_office',5),
	(610196910720000,'ztree_leaf','销售部',1,'0/1/',00000001,'branch_office',6),
	(650483149669376,'ztree_leaf','量体部',1,'0/1/',00000001,'branch_office',7),
	(650558059496448,'ztree_leaf','供应部',1,'0/1/',00000001,'branch_office',8);

/*!40000 ALTER TABLE `sys_organization` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;

INSERT INTO `sys_permission` (`id`, `description`, `name`, `permission`, `is_show`)
VALUES
	(1,'所有数据操作的权限','所有','*',00000001),
	(2,'新增数据操作的权限','新增','create',00000001),
	(3,'修改数据操作的权限','修改','update',00000001),
	(4,'删除数据操作的权限','删除','delete',00000001),
	(5,'查看数据操作的权限','查看','view',00000001),
	(6,'审核数据操作的权限','审核','audit',00000001),
	(610109328983040,'链接单提交权限','提交','submit',00000001),
	(611590531367936,'链接单确认权限','确认','confirm',00000001),
	(611595976049664,'授权签名','授权签名','authorized',00000001),
	(611699949863936,'驳回','驳回','reject',00000001),
	(642158027670528,'计划部填写权限','计划部填写权限','plan',00000001),
	(642159036990464,'生产部填写权限','生产部填写权限','produce',00000001),
	(642159901705216,'技术部填写权限','技术部填写权限','tech',00000001),
	(642161125360640,'仓库部填写权限','仓库部填写权限','warehouse',00000001),
	(642162745738240,'质检部填写权限','质检部填写权限','check',00000001),
	(648012002886656,'量体部填写权限','量体部填写权限','measure',00000001),
	(648013490766848,'销售部填写权限','销售部填写权限','sale',00000001),
	(648014172292096,'供应部填写权限','供应部填写权限','supply',00000001);

/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;

INSERT INTO `sys_resource` (`id`, `icon`, `identity`, `name`, `parent_id`, `parent_ids`, `is_show`, `url`, `weight`)
VALUES
	(1,NULL,'','资源',0,'0/',00000001,'',1),
	(2,'ztree_folder','showcase','示例管理',1,'0/1/',00000000,'',1),
	(3,NULL,'sample','示例列表',2,'0/1/2/',00000001,'/showcase/sample',1),
	(4,NULL,'deleted','逻辑删除列表',2,'0/1/2/',00000001,'/showcase/deleted',2),
	(5,NULL,'move','可移动列表',2,'0/1/2/',00000001,'/showcase/move',3),
	(6,NULL,'upload','文件上传列表',2,'0/1/2/',00000001,'/showcase/upload',4),
	(7,NULL,'tree','树列表',2,'0/1/2/',00000001,'/showcase/tree',5),
	(8,NULL,'editor','编辑器列表',2,'0/1/2/',00000001,'/showcase/editor',6),
	(9,NULL,'parentchild','父子表（小数据量）',2,'0/1/2/',00000001,'/showcase/parentchild/parent',7),
	(10,NULL,'','父子表（大数据量）管理',2,'0/1/2/',00000001,'',8),
	(11,NULL,'productCategory','类别列表',10,'0/1/2/10/',00000001,'/showcase/product/category',1),
	(12,NULL,'product','产品列表',10,'0/1/2/10/',00000001,'/showcase/product/product',2),
	(13,NULL,'','状态管理',2,'0/1/2/',00000001,'',9),
	(14,NULL,'statusAudit','审核状态列表',13,'0/1/2/13/',00000001,'/showcase/status/audit',1),
	(15,NULL,'statusShow','显示状态列表',13,'0/1/2/13/',00000001,'/showcase/status/show',2),
	(16,NULL,'sys','系统管理',1,'0/1/',00000001,'',2),
	(17,NULL,'','用户管理',16,'0/1/16/',00000001,'',1),
	(18,NULL,'user','用户列表',17,'0/1/16/17/',00000001,'/admin/sys/user/main',1),
	(19,NULL,'userOnline','在线用户列表',17,'0/1/16/17/',00000001,'/admin/sys/user/online',2),
	(20,NULL,'userStatusHistory','状态变更历史列表',17,'0/1/16/17/',00000001,'/admin/sys/user/statusHistory',3),
	(21,NULL,'userLastOnline','用户最后在线历史列表',17,'0/1/16/17/',00000001,'/admin/sys/user/lastOnline',4),
	(22,NULL,'','组织机构管理',16,'0/1/16/',00000001,'',2),
	(23,NULL,'organization','组织机构列表',22,'0/1/16/22/',00000001,'/admin/sys/organization/organization',1),
	(24,NULL,'job','工作职务列表',22,'0/1/16/22/',00000001,'/admin/sys/organization/job',2),
	(25,NULL,'resource','资源列表',16,'0/1/16/',00000001,'/admin/sys/resource',4),
	(26,NULL,'','权限管理',16,'0/1/16/',00000001,'',5),
	(27,NULL,'permission','权限列表',26,'0/1/16/26/',00000001,'/admin/sys/permission/permission',1),
	(28,NULL,'role','授权权限给角色',26,'0/1/16/26/',00000001,'/admin/sys/permission/role',2),
	(29,NULL,'group','分组列表',16,'0/1/16/',00000001,'/admin/sys/group',3),
	(30,NULL,'auth','授权角色给实体',26,'0/1/16/26/',00000001,'/admin/sys/auth',3),
	(31,'ztree_folder','','个人中心',1,'0/1/',00000000,'',4),
	(32,'ztree_file','','我的消息',31,'0/1/31/',00000000,'/admin/personal/message',1),
	(33,'ztree_folder','maintain','开发维护',1,'0/1/',00000000,'',5),
	(34,NULL,'icon','图标管理',33,'0/1/33/',00000001,'/admin/maintain/icon',2),
	(35,NULL,'keyvalue','键值对',33,'0/1/33/',00000001,'/admin/maintain/keyvalue',3),
	(37,'ztree_file','staticResource','静态资源版本控制',33,'0/1/33/',00000000,'/admin/maintain/staticResource',4),
	(38,'ztree_file','onlineEditor','在线编辑',33,'0/1/33/',00000000,'/admin/maintain/editor',5),
	(39,'ztree_folder','monitor','系统监控',1,'0/1/',00000000,'',6),
	(40,NULL,'userOnline','在线用户列表',39,'0/1/39/',00000001,'/admin/sys/user/online',1),
	(41,NULL,'db','数据库监控',39,'0/1/39/',00000001,'/admin/monitor/druid/index.html',2),
	(42,NULL,'hibernate','hibernate监控',39,'0/1/39/',00000001,'/admin/monitor/hibernate',3),
	(43,NULL,'ql','执行SQL/JPA QL',39,'0/1/39/',00000001,'/admin/monitor/db/sql',4),
	(44,NULL,'ehcache','ehcache监控',39,'0/1/39/',00000001,'/admin/monitor/ehcache',5),
	(45,NULL,'jvm','jvm监控',39,'0/1/39/',00000001,'/admin/monitor/jvm',6),
	(46,NULL,'excel','Excel导入/导出',2,'0/1/2/',00000001,'/showcase/excel',10),
	(47,'ztree_file','','我的通知',31,'0/1/31/',00000000,'/admin/personal/notification',2),
	(48,'ztree_file','notificationTemplate','通知模板',33,'0/1/33/',00000000,'/admin/maintain/notification/template',1),
	(532696890803200,'icon-list-ul','','流程管理',1,'0/1/',00000001,'',7),
	(597121942324224,'ztree_file','productionOrder','链接单列表',532696890803200,'0/1/532696890803200/',00000001,'/productionOrder/tasks',2),
	(642072129995776,'ztree_file','purchaseOrder','采购单列表',532696890803200,'0/1/532696890803200/',00000001,'/purchaseOrder',1),
	(647783168558080,'ztree_file','organizeProgress','订单组织计划表',532696890803200,'0/1/532696890803200/',00000001,'/organizeProgress',3),
	(649274321388544,'ztree_file','productProgress','生产进度表',532696890803200,'0/1/532696890803200/',00000001,'/productProgress',4),
	(651235530179584,'ztree_file','','任务列表',31,'0/1/31/',00000001,'/productionOrder/tasks',3),
	(663197678601216,'ztree_file','summary','汇总表',532696890803200,'0/1/532696890803200/',00000001,'/summary',5);

/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `is_show` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id`, `description`, `name`, `role`, `is_show`)
VALUES
	(1,'拥有所有权限','超级管理员','admin',00000001),
	(610316363777024,'销售总监助理','销售总监助理','salesDirectorAssitant',00000001),
	(610326429647872,'销售总监','销售总监','salesDirector',00000001),
	(610339469345792,'责任助理','责任助理','assistant',00000001),
	(611591709983744,'计划部经理','计划部经理','planManager',00000001),
	(611597709263872,'订单负责人','订单负责人','orderManager',00000001),
	(611598861239296,'片区经理','片区经理','regionalManager',00000001),
	(611604069303296,'普通角色','普通查看角色','normal',00000001),
	(650516410942464,'量体负责人','量体负责人','measure',00000001),
	(650517907407872,'仓库负责人','仓库负责人','warehouse',00000001),
	(650520721753088,'生产部负责人','生产部负责人','produce',00000001),
	(650522975781888,'技术总监','技术总监','tech',00000001),
	(650524349596672,'供应部负责人','供应部负责人','supply',00000001),
	(650555729576960,'质检部负责人','质检部负责人','check',00000001);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_resource_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_resource_permission`;

CREATE TABLE `sys_role_resource_permission` (
  `id` bigint(20) NOT NULL,
  `permission_ids` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_70sbceg3l10iispi0s8fufbjm` (`role_id`),
  CONSTRAINT `FK_70sbceg3l10iispi0s8fufbjm` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role_resource_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_resource_permission` DISABLE KEYS */;

INSERT INTO `sys_role_resource_permission` (`id`, `permission_ids`, `resource_id`, `role_id`)
VALUES
	(1,'1',2,1),
	(2,'1',16,1),
	(3,'1',33,1),
	(4,'1',39,1),
	(610316363777025,'5,6,611699949863936,',597121942324224,610316363777024),
	(610326429647873,'5,6,611699949863936,',597121942324224,610326429647872),
	(610339469345793,'2,610109328983040,3,4,5,',597121942324224,610339469345792),
	(611597709263873,'5,611595976049664,',597121942324224,611597709263872),
	(611598861239297,'5,611595976049664,',597121942324224,611598861239296),
	(611604069319680,'5,',597121942324224,611604069303296),
	(642576337191936,'611590531367936,3,5,',597121942324224,611591709983744),
	(642598980125696,'2,3,4,5,642158027670528,',642072129995776,611591709983744),
	(650506126984192,'5,',649274321388544,610316363777024),
	(650506497983488,'5,',649274321388544,610326429647872),
	(650507345511424,'5,648013490766848,3,',647783168558080,610316363777024),
	(650507777557504,'5,648013490766848,3,',647783168558080,610326429647872),
	(650508620153856,'5,',642072129995776,610316363777024),
	(650510325154816,'5,',642072129995776,610326429647872),
	(650511751234560,'5,',647783168558080,611591709983744),
	(650511751234561,'5,642158027670528,3,',649274321388544,611591709983744),
	(650514608227328,'5,',642072129995776,611604069303296),
	(650514608227329,'5,',647783168558080,611604069303296),
	(650514608243712,'5,',649274321388544,611604069303296),
	(650516410942465,'648012002886656,3,5,',647783168558080,650516410942464),
	(650517907407873,'3,5,642161125360640,',642072129995776,650517907407872),
	(650517907407874,'642161125360640,5,3,',649274321388544,650517907407872),
	(650520721769472,'642159036990464,3,5,',642072129995776,650520721753088),
	(650520721769473,'642159036990464,3,5,',649274321388544,650520721753088),
	(650522975781889,'3,5,642159901705216,',642072129995776,650522975781888),
	(650524349613056,'3,648014172292096,5,',642072129995776,650524349596672),
	(650524349613057,'3,648014172292096,5,',647783168558080,650524349596672),
	(650555729576961,'642162745738240,3,5,',642072129995776,650555729576960),
	(650555729576962,'642162745738240,3,5,',649274321388544,650555729576960),
	(663198858429440,'1,',663197678601216,611591709983744),
	(663447892231168,'5,',663197678601216,611604069303296),
	(663448874370048,'5,',663197678601216,610326429647872),
	(663449121981440,'5,',663197678601216,610316363777024);

/*!40000 ALTER TABLE `sys_role_resource_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL,
  `admin` bit(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_phone_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id`, `admin`, `create_date`, `deleted`, `email`, `mobile_phone_number`, `password`, `salt`, `status`, `username`)
VALUES
	(1,00000001,'2014-03-11 20:42:02',00000000,'admin@123.com','13412345671','d7de3806cd9dc4759035224e209df822','t0ZoTUy07D','normal','admin'),
	(606095436628992,00000000,'2014-04-29 12:47:50',00000000,'123@163.com','13851754321','3f9474e26a4b2fb16061be89519abe29','1EC0SuGlqD','normal','责任助理'),
	(606095982609408,00000000,'2014-04-29 12:48:24',00000000,'1223@163.com','13851754322','325e7a5a942424d5483534b123eb35dd','aK1GBpiGOu','normal','厂长'),
	(610194511168512,00000000,'2014-05-02 10:16:27',00000000,'user3@163.com','13851654321','d9c289849870b5d318d8b53242651a99','YV19n9PHDy','normal','销售总监助理'),
	(610195070305280,00000000,'2014-05-02 10:18:13',00000000,'user5@163.com','13343541234','8d187221db981af258778fde4082734b','PXYKP6s6he','normal','销售总监'),
	(611606294594560,00000000,'2014-05-03 10:13:47',00000000,'user6@163.com','13851754324','02ba89e87a9bfff4ffed97b195075953','FOcHefWtH9','normal','订单负责人'),
	(611606747235328,00000000,'2014-05-03 10:14:15',00000000,'user7@163.com','13851754329','94f04717dcbf79dd9766af2e77753c17','oyumoH890E','normal','片区经理'),
	(611699122488320,00000000,'2014-05-03 11:48:13',00000000,'user8@163.c0m','13651453421','feb4bcc0169ef09c7a84de8e4c95e4b2','kSe2cklsnX','normal','计划部经理'),
	(642586212533248,00000000,'2014-05-25 07:28:11',00000000,'plan@163.com','13512341234','a25ec29be6cbf14bfd1da011d3738fea','O0K1Lgp6Aa','normal','仓库负责人'),
	(650576218358784,00000000,'2014-05-30 22:56:02',00000000,'sasf@163.com','13867543215','0dca7da5e3560a2235f9a84ea5bdf23f','CG8pTgWQWl','normal','生产部负责人'),
	(650577024418816,00000000,'2014-05-30 22:56:52',00000000,'ddd333@163.com','13876543456','64c859a4c0b014c686f02eb7fb653b57','649SDJoGnV','normal','质检部负责人'),
	(650577597236224,00000000,'2014-05-30 22:57:27',00000000,'sss@163.c0m','13800001111','6353bb1c83df01eaf2d8612197499eda','mVjoFv0P7S','normal','技术总监'),
	(650578173805568,00000000,'2014-05-30 22:58:02',00000000,'dddd@163.com','13744445555','99660b977eb56b2aa408e22d80047e54','Ri0mrm7T83','normal','量体部负责人'),
	(650579085132800,00000000,'2014-05-30 22:58:57',00000000,'ddd134@163.com','13855551111','d1c5a49a6f24c95a701d1930513effcb','gRx5FlIn7A','normal','供应部负责人'),
	(650580219986944,00000000,'2014-05-30 23:00:07',00000000,'d2dd@163.com','13800001122','16431709837bfc4524296cdb31bcfd6b','WPratBaCYu','normal','普通');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_last_online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_last_online`;

CREATE TABLE `sys_user_last_online` (
  `id` bigint(20) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  `last_login_timestamp` datetime DEFAULT NULL,
  `last_stop_timestamp` datetime DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `system_host` varchar(255) DEFAULT NULL,
  `total_online_time` bigint(20) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_user_online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
  `id` varchar(255) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  `last_access_time` datetime DEFAULT NULL,
  `start_timestsamp` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `system_host` varchar(255) DEFAULT NULL,
  `timeout` bigint(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `session` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_user_organization_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_organization_job`;

CREATE TABLE `sys_user_organization_job` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1oelcuow0yd17latwuq1tan1p` (`user_id`),
  CONSTRAINT `FK_1oelcuow0yd17latwuq1tan1p` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_user_organization_job` WRITE;
/*!40000 ALTER TABLE `sys_user_organization_job` DISABLE KEYS */;

INSERT INTO `sys_user_organization_job` (`id`, `job_id`, `organization_id`, `user_id`)
VALUES
	(610322237473792,574004499547136,610196910720000,610194511168512),
	(610327754343424,574004703200256,610196910720000,610195070305280),
	(610351502001152,574003983205376,574001245766656,606095436628992),
	(611608784929792,611600405038080,574001245766656,611606294594560),
	(642581527462912,574003353928704,574001245766656,611699122488320),
	(650532232594432,650499713827840,1,606095982609408),
	(650570596959232,574004205929472,610196910720000,611606747235328),
	(650574912013312,650499978183680,574001722229760,642586212533248),
	(650576218358785,650498876408832,574002062279680,650576218358784),
	(650577024418817,650554187596800,574002254021632,650577024418816),
	(650577597236225,574006799598592,574007349412864,650577597236224),
	(650578173805569,650498450588672,650483149669376,650578173805568),
	(650579085132801,574005501854720,650558059496448,650579085132800),
	(650580219986945,611604430734336,1,650580219986944);

/*!40000 ALTER TABLE `sys_user_organization_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_status_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_status_history`;

CREATE TABLE `sys_user_status_history` (
  `id` bigint(20) NOT NULL,
  `op_date` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `op_user_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hd275bd1jnsulkhtq8ar4v3w3` (`op_user_id`),
  KEY `FK_eh9tv5poea7pcxmp6bkd4ia9l` (`user_id`),
  CONSTRAINT `FK_eh9tv5poea7pcxmp6bkd4ia9l` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK_hd275bd1jnsulkhtq8ar4v3w3` FOREIGN KEY (`op_user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `po_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ifpql4m98flbb5q50gyghyrnl` (`po_id`),
  CONSTRAINT `FK_ifpql4m98flbb5q50gyghyrnl` FOREIGN KEY (`po_id`) REFERENCES `production_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table wf_hist_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_hist_order`;

CREATE TABLE `wf_hist_order` (
  `id` varchar(100) NOT NULL COMMENT '主键ID',
  `process_Id` varchar(100) NOT NULL COMMENT '流程定义ID',
  `order_State` tinyint(1) NOT NULL COMMENT '状态',
  `creator` varchar(100) DEFAULT NULL COMMENT '发起人',
  `create_Time` varchar(50) NOT NULL COMMENT '发起时间',
  `end_Time` varchar(50) DEFAULT NULL COMMENT '完成时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '期望完成时间',
  `priority` tinyint(1) DEFAULT NULL COMMENT '优先级',
  `parent_Id` varchar(100) DEFAULT NULL COMMENT '父流程ID',
  `order_No` varchar(100) DEFAULT NULL COMMENT '流程实例编号',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  PRIMARY KEY (`id`),
  KEY `IDX_HIST_ORDER_PROCESSID` (`process_Id`),
  KEY `IDX_HIST_ORDER_NO` (`order_No`),
  KEY `FK_HIST_ORDER_PARENTID` (`parent_Id`),
  CONSTRAINT `FK_HIST_ORDER_PARENTID` FOREIGN KEY (`parent_Id`) REFERENCES `wf_hist_order` (`id`),
  CONSTRAINT `FK_HIST_ORDER_PROCESSID` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史流程实例表';



# Dump of table wf_hist_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_hist_task`;

CREATE TABLE `wf_hist_task` (
  `id` varchar(100) NOT NULL COMMENT '主键ID',
  `order_Id` varchar(100) NOT NULL COMMENT '流程实例ID',
  `task_Name` varchar(100) NOT NULL COMMENT '任务名称',
  `display_Name` varchar(200) NOT NULL COMMENT '任务显示名称',
  `task_Type` tinyint(1) NOT NULL COMMENT '任务类型',
  `perform_Type` tinyint(1) DEFAULT NULL COMMENT '参与类型',
  `task_State` tinyint(1) NOT NULL COMMENT '任务状态',
  `operator` varchar(100) DEFAULT NULL COMMENT '任务处理人',
  `create_Time` varchar(50) NOT NULL COMMENT '任务创建时间',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '任务完成时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '任务期望完成时间',
  `action_Url` varchar(200) DEFAULT NULL COMMENT '任务处理url',
  `parent_Task_Id` varchar(100) DEFAULT NULL COMMENT '父任务ID',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  PRIMARY KEY (`id`),
  KEY `IDX_HIST_TASK_ORDER` (`order_Id`),
  KEY `IDX_HIST_TASK_TASKNAME` (`task_Name`),
  KEY `IDX_HIST_TASK_PARENTTASK` (`parent_Task_Id`),
  CONSTRAINT `FK_HIST_TASK_ORDERID` FOREIGN KEY (`order_Id`) REFERENCES `wf_hist_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史任务表';



# Dump of table wf_hist_task_actor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_hist_task_actor`;

CREATE TABLE `wf_hist_task_actor` (
  `task_Id` varchar(100) NOT NULL COMMENT '任务ID',
  `actor_Id` varchar(100) NOT NULL COMMENT '参与者ID',
  KEY `IDX_HIST_TASKACTOR_TASK` (`task_Id`),
  CONSTRAINT `FK_HIST_TASKACTOR` FOREIGN KEY (`task_Id`) REFERENCES `wf_hist_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史任务参与者表';



# Dump of table wf_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_order`;

CREATE TABLE `wf_order` (
  `id` varchar(100) NOT NULL COMMENT '主键ID',
  `parent_Id` varchar(100) DEFAULT NULL COMMENT '父流程ID',
  `process_Id` varchar(100) NOT NULL COMMENT '流程定义ID',
  `creator` varchar(100) DEFAULT NULL COMMENT '发起人',
  `create_Time` varchar(50) NOT NULL COMMENT '发起时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '期望完成时间',
  `last_Update_Time` varchar(50) DEFAULT NULL COMMENT '上次更新时间',
  `last_Updator` varchar(100) DEFAULT NULL COMMENT '上次更新人',
  `priority` tinyint(1) DEFAULT NULL COMMENT '优先级',
  `parent_Node_Name` varchar(100) DEFAULT NULL COMMENT '父流程依赖的节点名称',
  `order_No` varchar(100) DEFAULT NULL COMMENT '流程实例编号',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  `version` tinyint(1) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `IDX_ORDER_PROCESSID` (`process_Id`),
  KEY `IDX_ORDER_NO` (`order_No`),
  KEY `FK_ORDER_PARENTID` (`parent_Id`),
  CONSTRAINT `FK_ORDER_PARENTID` FOREIGN KEY (`parent_Id`) REFERENCES `wf_order` (`id`),
  CONSTRAINT `FK_ORDER_PROCESSID` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例表';



# Dump of table wf_process
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_process`;

CREATE TABLE `wf_process` (
  `id` varchar(100) NOT NULL COMMENT '主键ID',
  `name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `display_Name` varchar(200) DEFAULT NULL COMMENT '流程显示名称',
  `type` tinyint(1) DEFAULT NULL COMMENT '流程类型',
  `instance_Url` varchar(200) DEFAULT NULL COMMENT '实例url',
  `state` tinyint(1) DEFAULT NULL COMMENT '流程是否可用',
  `content` longblob COMMENT '流程模型定义',
  `version` tinyint(1) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `IDX_PROCESS_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义表';

LOCK TABLES `wf_process` WRITE;
/*!40000 ALTER TABLE `wf_process` DISABLE KEYS */;

INSERT INTO `wf_process` (`id`, `name`, `display_Name`, `type`, `instance_Url`, `state`, `content`, `version`)
VALUES
	('5bb9b4e696c240aea2637fa81f45c2c0','productionOrderFlow','生产链接单流程',NULL,'/productionOrder',1,X'3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D2247424B22207374616E64616C6F6E653D226E6F223F3E0A3C70726F6365737320646973706C61794E616D653D22C9FAB2FAC1B4BDD3B5A5C1F7B3CC2220696E7374616E636555726C3D222F70726F64756374696F6E4F7264657222206E616D653D2270726F64756374696F6E4F72646572466C6F77223E0A202020203C737461727420646973706C61794E616D653D22BFAACABC22206C61796F75743D2236302C3135322C2D312C2D3122206E616D653D227374617274223E0A20202020202020203C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3122206F66667365743D22302C302220746F3D227375626D6974222F3E0A202020203C2F73746172743E0A202020203C656E6420646973706C61794E616D653D22BDE1CAF822206C61796F75743D223535332C3135322C2D312C2D3122206E616D653D22656E64222F3E0A202020203C7461736B20646973706C61794E616D653D22CCE1BDBB2220666F726D3D227461736B312E6A737022206C61796F75743D223137372C3135302C2D312C2D3122206E616D653D227375626D69742220706572666F726D547970653D22414E59223E0A20202020202020203C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3222206F66667365743D22302C302220746F3D226175646974222F3E0A202020203C2F7461736B3E0A202020203C7461736B2061737369676E65653D2261756469742E6F70657261746F722220646973706C61794E616D653D22C9F3C5FA2220666F726D3D227461736B322E6A737022206C61796F75743D223336332C3135302C2D312C2D3122206E616D653D2261756469742220706572666F726D547970653D22414E59223E0A20202020202020203C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3322206F66667365743D22302C302220746F3D22636F6E6669726D222F3E0A202020203C2F7461736B3E0A202020203C7461736B2061737369676E65653D22636F6E6669726D2E6F70657261746F722220646973706C61794E616D653D22C8B7C8CF2220666F726D3D227461736B332E6A737022206C61796F75743D223336332C3135302C2D312C2D3122206E616D653D22636F6E6669726D2220706572666F726D547970653D22414E59223E0A20202020202020203C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3422206F66667365743D22302C302220746F3D22656E64222F3E0A202020203C2F7461736B3E0A3C2F70726F636573733E',0);

/*!40000 ALTER TABLE `wf_process` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wf_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_task`;

CREATE TABLE `wf_task` (
  `id` varchar(100) NOT NULL COMMENT '主键ID',
  `order_Id` varchar(100) NOT NULL COMMENT '流程实例ID',
  `task_Name` varchar(100) NOT NULL COMMENT '任务名称',
  `display_Name` varchar(200) NOT NULL COMMENT '任务显示名称',
  `task_Type` tinyint(1) NOT NULL COMMENT '任务类型',
  `perform_Type` tinyint(1) DEFAULT NULL COMMENT '参与类型',
  `operator` varchar(100) DEFAULT NULL COMMENT '任务处理人',
  `create_Time` varchar(50) DEFAULT NULL COMMENT '任务创建时间',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '任务完成时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '任务期望完成时间',
  `action_Url` varchar(200) DEFAULT NULL COMMENT '任务处理的url',
  `parent_Task_Id` varchar(100) DEFAULT NULL COMMENT '父任务ID',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  `version` tinyint(1) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `IDX_TASK_ORDER` (`order_Id`),
  KEY `IDX_TASK_TASKNAME` (`task_Name`),
  KEY `IDX_TASK_PARENTTASK` (`parent_Task_Id`),
  CONSTRAINT `FK_TASK_ORDERID` FOREIGN KEY (`order_Id`) REFERENCES `wf_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';



# Dump of table wf_task_actor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wf_task_actor`;

CREATE TABLE `wf_task_actor` (
  `task_Id` varchar(100) NOT NULL COMMENT '任务ID',
  `actor_Id` varchar(100) NOT NULL COMMENT '参与者ID',
  KEY `IDX_TASKACTOR_TASK` (`task_Id`),
  CONSTRAINT `FK_TASK_ACTOR_TASKID` FOREIGN KEY (`task_Id`) REFERENCES `wf_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参与者表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
