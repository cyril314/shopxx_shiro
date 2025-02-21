/*
SQLyog v10.2 
MySQL - 5.7.9 : Database - shopxx_shiro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `path` text NOT NULL COMMENT '树路径',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区';

/*Data for the table `area` */

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `name` varchar(255) DEFAULT NULL COMMENT '考试名称',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `paper` bigint(20) NOT NULL COMMENT '使用试卷',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `FK9E1BC1FE7CB131F2` (`paper`),
  KEY `FK9E1BC1FEDD8D16A5` (`id`),
  CONSTRAINT `FK9E1BC1FE7CB131F2` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK9E1BC1FEDD8D16A5` FOREIGN KEY (`id`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试管理';

/*Data for the table `exam` */

/*Table structure for table `exam_answer_sheet` */

DROP TABLE IF EXISTS `exam_answer_sheet`;

CREATE TABLE `exam_answer_sheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `exam` bigint(20) NOT NULL COMMENT '考试ID',
  `member` bigint(20) NOT NULL COMMENT '答题人ID',
  PRIMARY KEY (`id`),
  KEY `FK41D0747DDDBCC1A9` (`exam`),
  KEY `FK41D0747D7C62EDF8` (`member`),
  KEY `FK41D0747D6713B191` (`id`),
  CONSTRAINT `FK41D0747D6713B191` FOREIGN KEY (`id`) REFERENCES `exam_answer_sheet` (`id`),
  CONSTRAINT `FK41D0747D7C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FK41D0747DDDBCC1A9` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答题卡';

/*Data for the table `exam_answer_sheet` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `amount` decimal(27,12) NOT NULL COMMENT '消费金额',
  `balance` decimal(27,12) NOT NULL COMMENT '余额',
  `point` bigint(20) NOT NULL COMMENT '积分',
  `is_enabled` bit(1) NOT NULL COMMENT '是否启用',
  `is_locked` bit(1) NOT NULL COMMENT '是否锁定',
  `member_rank` bigint(20) NOT NULL COMMENT '会员等级',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `gender` int(1) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '生日',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `area` bigint(20) DEFAULT NULL COMMENT '地区',
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `attribute_value0` text COMMENT '会员注册项值0',
  `attribute_value1` text COMMENT '会员注册项值1',
  `attribute_value2` text COMMENT '会员注册项值2',
  `attribute_value3` text COMMENT '会员注册项值3',
  `attribute_value4` text COMMENT '会员注册项值4',
  `attribute_value5` text COMMENT '会员注册项值5',
  `attribute_value6` text COMMENT '会员注册项值6',
  `attribute_value7` text COMMENT '会员注册项值7',
  `attribute_value8` text COMMENT '会员注册项值8',
  `attribute_value9` text COMMENT '会员注册项值9',
  `login_failure_count` int(11) NOT NULL COMMENT '连续登录失败次数',
  `locked_date` datetime DEFAULT NULL COMMENT '锁定日期',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录日期',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `number` varchar(20) DEFAULT NULL COMMENT '员工工号',
  `register_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `safe_key_expire` datetime DEFAULT NULL COMMENT '安全密钥过期',
  `safe_key_value` varchar(50) DEFAULT NULL COMMENT '安全密钥值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK92D398B939A0DADE` (`area`),
  KEY `FK92D398B937884F5B` (`member_rank`),
  CONSTRAINT `FK92D398B937884F5B` FOREIGN KEY (`member_rank`) REFERENCES `member_rank` (`id`),
  CONSTRAINT `FK92D398B939A0DADE` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

/*Data for the table `member` */

/*Table structure for table `member_attribute` */

DROP TABLE IF EXISTS `member_attribute`;

CREATE TABLE `member_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `property_index` int(11) DEFAULT NULL COMMENT '属性序号',
  `is_enabled` bit(1) NOT NULL COMMENT '是否启用',
  `is_required` bit(1) NOT NULL COMMENT '是否必填',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户属性';

/*Data for the table `member_attribute` */

/*Table structure for table `member_attribute_option` */

DROP TABLE IF EXISTS `member_attribute_option`;

CREATE TABLE `member_attribute_option` (
  `member_attribute` bigint(20) NOT NULL COMMENT '用户属性ID',
  `options` varchar(255) DEFAULT NULL COMMENT '答题卡ID',
  KEY `FKC3DC263E8A8815` (`member_attribute`),
  CONSTRAINT `FKC3DC263E8A8815` FOREIGN KEY (`member_attribute`) REFERENCES `member_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户属性选项';

/*Data for the table `member_attribute_option` */

/*Table structure for table `member_question` */

DROP TABLE IF EXISTS `member_question`;

CREATE TABLE `member_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `flag` bit(1) DEFAULT NULL COMMENT '是否做对',
  `member` bigint(20) NOT NULL COMMENT '答题人',
  `question` bigint(20) NOT NULL COMMENT '做错的题目',
  PRIMARY KEY (`id`),
  KEY `FKC1C7D1E69FC019D0` (`question`),
  KEY `FKC1C7D1E67C62EDF8` (`member`),
  KEY `FKC1C7D1E640557FD1` (`id`),
  CONSTRAINT `FKC1C7D1E640557FD1` FOREIGN KEY (`id`) REFERENCES `member_question` (`id`),
  CONSTRAINT `FKC1C7D1E67C62EDF8` FOREIGN KEY (`member`) REFERENCES `member` (`id`),
  CONSTRAINT `FKC1C7D1E69FC019D0` FOREIGN KEY (`question`) REFERENCES `product_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答题表';

/*Data for the table `member_question` */

/*Table structure for table `member_rank` */

DROP TABLE IF EXISTS `member_rank`;

CREATE TABLE `member_rank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `amount` decimal(21,6) DEFAULT NULL COMMENT '消费金额',
  `scale` double NOT NULL COMMENT '优惠比例',
  `is_default` bit(1) NOT NULL COMMENT '是否默认',
  `is_special` bit(1) NOT NULL COMMENT '是否特殊',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `amount` (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员等级';

/*Data for the table `member_rank` */

/*Table structure for table `member_sheet_item` */

DROP TABLE IF EXISTS `member_sheet_item`;

CREATE TABLE `member_sheet_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime NOT NULL COMMENT '修改日期',
  `answer_sheet` bigint(20) NOT NULL COMMENT '用户答题卡',
  `my_option` bigint(20) NOT NULL COMMENT '用户属性选项',
  PRIMARY KEY (`id`),
  KEY `FK486440921E1AD9E1` (`my_option`),
  KEY `FK4864409243D06BA2` (`id`),
  KEY `FK4864409227745E14` (`answer_sheet`),
  CONSTRAINT `FK486440921E1AD9E1` FOREIGN KEY (`my_option`) REFERENCES `product_question_option` (`id`),
  CONSTRAINT `FK4864409227745E14` FOREIGN KEY (`answer_sheet`) REFERENCES `exam_answer_sheet` (`id`),
  CONSTRAINT `FK4864409243D06BA2` FOREIGN KEY (`id`) REFERENCES `member_sheet_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member_sheet_item` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `is_draft` bit(1) DEFAULT NULL,
  `title` text,
  `content` text,
  `sender` bigint(20) DEFAULT NULL,
  `sender_read` bit(1) DEFAULT NULL,
  `sender_delete` bit(1) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `receiver_read` bit(1) DEFAULT NULL,
  `receiver_delete` bit(1) DEFAULT NULL,
  `for_message` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `oplog` */

DROP TABLE IF EXISTS `oplog`;

CREATE TABLE `oplog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `info` text COMMENT '日志信息',
  `operation` varchar(255) NOT NULL COMMENT '操作名称',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作员',
  `parameter` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `oplog` */

/*Table structure for table `paper` */

DROP TABLE IF EXISTS `paper`;

CREATE TABLE `paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime NOT NULL COMMENT '修改日期',
  `name` varchar(255) DEFAULT NULL COMMENT '试卷名',
  `method` int(11) DEFAULT NULL COMMENT '出卷类型',
  `cost_time` int(11) DEFAULT NULL COMMENT '时长',
  `pass_mark` int(11) DEFAULT NULL COMMENT '及格分',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `product_category` bigint(20) DEFAULT NULL COMMENT '组卷范围',
  PRIMARY KEY (`id`),
  KEY `FK25ED438DD7629117` (`product_category`),
  CONSTRAINT `FK25ED438DD7629117` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `paper` */

/*Table structure for table `paper_distribution` */

DROP TABLE IF EXISTS `paper_distribution`;

CREATE TABLE `paper_distribution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `count` int(11) DEFAULT NULL COMMENT '题目数量',
  `mark` int(11) DEFAULT NULL COMMENT '题型分值',
  `type` int(11) DEFAULT NULL COMMENT '试题类型',
  `paper` bigint(20) NOT NULL COMMENT '试卷ID',
  PRIMARY KEY (`id`),
  KEY `FK233809637CB131F2` (`paper`),
  KEY `FK2338096324DBC385` (`id`),
  CONSTRAINT `FK2338096324DBC385` FOREIGN KEY (`id`) REFERENCES `paper_distribution` (`id`),
  CONSTRAINT `FK233809637CB131F2` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分配';

/*Data for the table `paper_distribution` */

/*Table structure for table `paper_question` */

DROP TABLE IF EXISTS `paper_question`;

CREATE TABLE `paper_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime NOT NULL COMMENT '修改日期',
  `mark` int(11) DEFAULT NULL COMMENT '该题分值',
  `paper` bigint(20) NOT NULL COMMENT '试卷ID',
  `question` bigint(20) NOT NULL COMMENT '章节练习ID',
  PRIMARY KEY (`id`),
  KEY `FKB9A8D8587CB131F2` (`paper`),
  KEY `FKB9A8D8589FC019D0` (`question`),
  KEY `FKB9A8D8586CDA0787` (`id`),
  CONSTRAINT `FKB9A8D8586CDA0787` FOREIGN KEY (`id`) REFERENCES `paper_question` (`id`),
  CONSTRAINT `FKB9A8D8587CB131F2` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`),
  CONSTRAINT `FKB9A8D8589FC019D0` FOREIGN KEY (`question`) REFERENCES `product_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paper_question` */

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `orders` int(1) DEFAULT NULL COMMENT '排序',
  `grade` int(1) NOT NULL DEFAULT '1' COMMENT '层级',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `tree_path` varchar(255) NOT NULL COMMENT '树路径',
  `parent` bigint(20) DEFAULT '0' COMMENT '上级分类',
  PRIMARY KEY (`id`),
  KEY `FK1B7971ADFBDD5B73` (`parent`),
  CONSTRAINT `FK1B7971ADFBDD5B73` FOREIGN KEY (`parent`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='章节管理';

/*Data for the table `product_category` */

insert  into `product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`tree_path`,`parent`) values (1,'2015-07-13 00:00:00',NULL,1,1,'章节父类','',NULL);

/*Table structure for table `product_question` */

DROP TABLE IF EXISTS `product_question`;

CREATE TABLE `product_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `anisys` longtext COMMENT '解析',
  `stem` longtext NOT NULL COMMENT '题干',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `product_category` bigint(20) NOT NULL COMMENT '商品分类ID',
  PRIMARY KEY (`id`),
  KEY `FKD883E45D7629117` (`product_category`),
  CONSTRAINT `FKD883E45D7629117` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='章节练习';

/*Data for the table `product_question` */

insert  into `product_question`(`id`,`create_date`,`modify_date`,`anisys`,`stem`,`type`,`product_category`) values (1,'2015-07-13 00:00:00',NULL,NULL,'',NULL,1);

/*Table structure for table `product_question_option` */

DROP TABLE IF EXISTS `product_question_option`;

CREATE TABLE `product_question_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `is_correct` bit(1) DEFAULT NULL COMMENT '是否答案',
  `question` bigint(20) NOT NULL COMMENT '问题',
  PRIMARY KEY (`id`),
  KEY `FK96DB96949FC019D0` (`question`),
  KEY `FK96DB96947E4EE894` (`id`),
  CONSTRAINT `FK96DB96947E4EE894` FOREIGN KEY (`id`) REFERENCES `product_question_option` (`id`),
  CONSTRAINT `FK96DB96949FC019D0` FOREIGN KEY (`question`) REFERENCES `product_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选项';

/*Data for the table `product_question_option` */

/*Table structure for table `sys_admin` */

DROP TABLE IF EXISTS `sys_admin`;

CREATE TABLE `sys_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  `role_id` bigint(10) NOT NULL COMMENT '角色ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `email` varchar(50) NOT NULL COMMENT '邮件',
  `login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录日期',
  `login_failure_count` int(11) NOT NULL COMMENT '连续登录失败的次数',
  `locked_date` datetime DEFAULT NULL COMMENT '账号锁定日期',
  `is_locked` bit(1) NOT NULL COMMENT '账号是否锁定',
  `is_enabled` bit(1) NOT NULL COMMENT '账号是否启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_admin` */

insert  into `sys_admin`(`id`,`create_date`,`modify_date`,`username`,`password`,`department`,`role_id`,`name`,`email`,`login_ip`,`login_date`,`login_failure_count`,`locked_date`,`is_locked`,`is_enabled`) values (1,'2015-07-13 00:03:36','2015-11-25 11:14:34','admin','21232f297a57a5a743894a0e4a801fc3','技术部',1,'管理员','admin@shopxx.net',NULL,'2015-11-25 11:14:34',0,'2015-11-24 10:44:05','\0','');

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改日期',
  `name` varchar(30) DEFAULT NULL COMMENT '资源名称',
  `value` varchar(30) DEFAULT NULL COMMENT '资源标识',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `i_sys` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为系统内置资源',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='资源';

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`create_time`,`modify_time`,`name`,`value`,`description`,`sort`,`i_sys`) values (1,'2015-07-13 00:00:00',NULL,'管理员','admin:admin',NULL,999,''),(2,'2015-07-13 00:00:00',NULL,'角色管理','admin:role',NULL,NULL,''),(3,'2015-07-13 00:00:00',NULL,'系统设置','admin:setting',NULL,NULL,''),(4,'2015-07-13 00:00:00',NULL,'地区管理','admin:area',NULL,NULL,''),(5,'2015-07-13 00:00:00',NULL,'日志管理','admin:log',NULL,NULL,''),(6,'2015-07-13 00:00:00',NULL,'消息管理','admin:message',NULL,NULL,''),(7,'2015-07-13 00:00:00',NULL,'会员管理','admin:member',NULL,NULL,''),(8,'2015-07-13 00:00:00',NULL,'会员等级','admin:memberRank',NULL,NULL,''),(9,'2015-07-13 00:00:00',NULL,'试卷管理','admin:paper',NULL,NULL,''),(10,'2015-07-13 00:00:00',NULL,'考试管理','admin:exam',NULL,NULL,''),(11,'2015-07-13 00:00:00',NULL,'章节管理','admin:product_category',NULL,NULL,''),(12,'2015-07-13 00:00:00',NULL,'练习管理','admin:category_paper',NULL,NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '角色名',
  `value` varchar(30) DEFAULT NULL COMMENT '角色标识',
  `description` text COMMENT '描述',
  `i_sys` bit(1) NOT NULL COMMENT '是否为系统内置资源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`create_date`,`modify_date`,`name`,`value`,`description`,`i_sys`) values (1,'2015-07-13 00:02:44','2015-07-13 00:02:44','超级管理员','ROLE_ADMIN','拥有管理后台最高权限','');

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_resource` */

insert  into `sys_role_resource`(`role_id`,`resource_id`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12);

/*Table structure for table `sys_setting` */

DROP TABLE IF EXISTS `sys_setting`;

CREATE TABLE `sys_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(20) DEFAULT NULL,
  `code` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

/*Data for the table `sys_setting` */

insert  into `sys_setting`(`id`,`key`,`code`) values (1,'seo','{\"title\":\"商城\",\"keywords\":\"购物商城\",\"description\":\"购物商城\",\"other_tags\":\"购物商城\",\"site_map\":\"\"}'),(2,'siteName','商城'),(3,'siteUrl','http://localhost:8080/shop'),(4,'logo','/static/img/logo.gif'),(5,'address','XXXX广场'),(6,'phone','400-888-88888'),(7,'zipCode','3200000'),(8,'email','service@xx.net'),(9,'certtext','xxxxxxx'),(10,'isSiteEnabled','true'),(11,'siteCloseMessage','&lt;dl&gt;&lt;dt&gt;网站维护中，暂时无法访问！&lt;/dt&gt;&lt;dd&gt;本网站正在进行系统维护和技术升级，网站暂时无法访问，敬请谅解！&lt;/dd&gt;&lt;/dl&gt;'),(12,'largeProductImageWid','800'),(13,'largeProductImageHei','800'),(14,'mediumProductImageWi','300'),(15,'mediumProductImageHe','300'),(16,'thumbnailProductImag','170'),(17,'thumbnailProductImag','170'),(18,'defaultLargeProductI','/static/img/default_large.jpg'),(19,'defaultMediumProduct','/default_medium.jpg'),(20,'defaultThumbnailProd','/default_thumbnail.jpg'),(21,'watermarkAlpha','50'),(22,'watermarkImage','/watermark.png'),(23,'watermarkPosition','bottomRight'),(24,'priceScale','2'),(25,'priceRoundType','roundHalfUp'),(26,'isShowMarketPrice','true'),(27,'defaultMarketPriceSc','1.2'),(28,'isRegisterEnabled','true'),(29,'isDuplicateEmail','false'),(30,'disabledUsername','admin,管理员'),(31,'usernameMinLength','2'),(32,'usernameMaxLength','20'),(33,'passwordMinLength','4'),(34,'passwordMaxLength','20'),(35,'registerPoint','0'),(36,'registerAgreement',NULL),(37,'isEmailLogin','true'),(38,'captchaTypes','memberLogin,memberRegister,adminLogin,review,consultation,findPassword,resetPassword,other'),(39,'accountLockTypes','member,admin'),(40,'accountLockCount','5'),(41,'accountLockTime','10'),(42,'safeKeyExpiryTime','1440'),(43,'uploadMaxSize','10'),(44,'uploadImageExtension','jpg,jpeg,bmp,gif,png'),(45,'uploadFlashExtension','swf,flv'),(46,'uploadMediaExtension','swf,flv,mp3,wav,avi,rm,rmvb'),(47,'uploadFileExtension','zip,rar,7z,doc,docx,xls,xlsx,ppt,pptx'),(48,'imageUploadPath','/upload/image/${.now?string(\'yyyyMM\')}/'),(49,'flashUploadPath','/upload/flash/${.now?string(\'yyyyMM\')}/'),(50,'mediaUploadPath','/upload/media/${.now?string(\'yyyyMM\')}/'),(51,'fileUploadPath','/upload/file/${.now?string(\'yyyyMM\')}/'),(52,'smtpFromMail','test@shop.net'),(53,'smtpHost','smtp.shop.net'),(54,'smtpPort','25'),(55,'smtpUsername','test'),(56,'smtpPassword','test'),(57,'currencySign','￥'),(58,'currencyUnit','元'),(59,'stockAlertCount','5'),(60,'stockAllocationTime','order'),(61,'defaultPointScale','1'),(62,'isDevelopmentEnabled','false'),(63,'isReviewEnabled','true'),(64,'isReviewEnabled','true'),(65,'isReviewCheck','true'),(66,'reviewAuthority','purchased'),(67,'isConsultationEnable','true'),(68,'isConsultationCheck','true'),(69,'consultationAuthorit','member'),(70,'isInvoiceEnabled','true'),(71,'isTaxPriceEnabled','true'),(72,'taxRate','0.06'),(73,'cookiePath','/'),(74,'cookieDomain',NULL),(75,'kuaidi100Key',NULL),(76,'isCnzzEnabled','false'),(77,'cnzzSiteId',NULL),(78,'cnzzPassword',NULL),(79,'merchantRoleId','2'),(80,'clientManagerMemberL','6'),(81,'accountingManagerMem','7'),(82,'tellerMemberLevelId','8'),(83,'merchantMemberLevelI','9'),(84,'firstApprovalMemberL','10'),(85,'independentApprovalM','11'),(86,'finalApprovalMemberL','12'),(87,'superviseMemberLevel','13'),(88,'smsUsername',NULL),(89,'smsPassword',NULL),(90,'activeCodeSms','您的验证码是：${code}。请不要把验证码泄露给其他人。'),(91,'notifyAccountingMana','您有新的预约：客户：号码${obj.phone},时间${obj.appointDate?string(\'yyyyMMdd\')}预约服务${obj.reason.reason},预约金额${obj.amount},请及时与客户联系确认'),(92,'notifyClientManagerS','您有新的预约，客户：${apply.name},电话：${apply.phone},预约时间：${apply.applyTime?string(\'yyyyMMdd\')},预约产品：${apply.assets.title},请及时处理。'),(93,'cancelClientSms','尊敬的客户您好：非常抱歉通知您，由于${obj.confirmContent},您的预约申请被取消。'),(94,'retrieveSms','您的新密码是：${code}。请注意保管。'),(95,'confirmClientSms','尊敬的客户您好：您的${obj.reason.reason}申请已确认。'),(96,'notifyClientApply','尊敬的客户您好：您的${obj.reason.reason}申请已提交。'),(97,'notifyMerchantOrder','尊敬的店主您好：您有新的订单，请注意查收。'),(98,'loanFinalAudit','尊敬的客户：祝贺您!您申请的贷款已成功获批，审批信息如下：审批金额：${apply.money}，审批期限：${apply.timeLimit}年。九江银行南昌分行将在1个工作日内就签约、放款事项与您联系。'),(99,'loanAccessSms','尊敬的客户：您好!感谢你选择九江银行南昌分行，您的贷款申请已被受理，欢迎您对我们的服务进行监督，如有不满意的地方您可进行投诉！'),(100,'reportUserId','6008,1083'),(101,'complaintNotifyPhone','15070047090,18688939849'),(102,'complaintNotifySms','客户${complaint.apply.name}，号码:${complaint.apply.phone}投诉：${complaint.reason}'),(103,'superviseExecuteSms','尊敬的客户：祝贺您!您申请的贷款已成功放款，审批金额：${apply.money}，审批期限：${apply.timeLimit}年。'),(104,'maxAuditMoney','100'),(105,'applyNofityClientSms','尊敬的客户：您的预约申请已成功提交！感谢您选择九江银行。您预约的客户经理：${apply.clientManager.name}，电话:${apply.clientManager.mobile}');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
