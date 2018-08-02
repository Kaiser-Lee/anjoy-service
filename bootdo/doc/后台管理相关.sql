/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - agent_purchase
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `blog_content` */
use jgh_mall

DROP TABLE IF EXISTS `blog_content`;

CREATE TABLE `blog_content` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `slug` varchar(255) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `modified` bigint(20) DEFAULT NULL COMMENT '最近修改人id',
  `content` text COMMENT '内容',
  `type` varchar(16) DEFAULT NULL COMMENT '类型',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `categories` varchar(200) DEFAULT NULL COMMENT '分类',
  `hits` int(5) DEFAULT NULL,
  `comments_num` int(5) DEFAULT '0' COMMENT '评论数量',
  `allow_comment` int(1) DEFAULT '0' COMMENT '开启评论',
  `allow_ping` int(1) DEFAULT '0' COMMENT '允许ping',
  `allow_feed` int(1) DEFAULT '0' COMMENT '允许反馈',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `gtm_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gtm_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='文章内容';

/*Data for the table `blog_content` */

insert  into `blog_content`(`cid`,`title`,`slug`,`created`,`modified`,`content`,`type`,`tags`,`categories`,`hits`,`comments_num`,`allow_comment`,`allow_ping`,`allow_feed`,`status`,`author`,`gtm_create`,`gtm_modified`) values (75,'基于 Springboot 和 Mybatis 的后台管理系统 BootDo',NULL,NULL,NULL,'<h3 style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif;\">项目介绍</h3><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 30px; list-style-position: initial; list-style-image: initial; color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\"><li><p>面向学习型的开源框架，简洁高效，减少过渡封装，展现技术本质</p></li><li><p>Springboot作为基础框架，使用mybatis作为持久层框架</p></li><li><p>使用官方推荐的thymeleaf做为模板引擎，shiro作为安全框架,主流技术，“一网打尽”</p></li><li><p>基于注解的sql写法，零XML，极简配置，一键前后台代码生成</p></li></ul><p style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\"><span style=\"font-weight: bolder;\">演示地址</span>&nbsp;<a href=\"http://47.93.239.129/\" style=\"outline: 0px; color: rgb(68, 102, 187);\">http://47.93.239.129</a></p><h3 style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif;\">功能简介</h3><p style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\">1. 用户管理<br>2. 角色管理<br>3. 部门管理<br>4. 菜单管理<br>5. 系统日志<br>6. 代码生成<br>7. 内容管理</p><h3 style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif;\">所用框架</h3><p style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\"><span style=\"font-weight: bolder;\">前端</span><br>1. Bootstrap<br>2. jQuery<br>3. bootstrap-table<br>4. layer<br>5. jsTree&nbsp;<br>6. summernote<br>7. jquery-validate<br>8. jquery-treegrid</p><p style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\"><span style=\"font-weight: bolder;\">后端</span><br>1. SpringBoot&nbsp;<br>2. MyBatis<br>3. Thymeleaf<br>4. Shiro<br>5. druid</p><p style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\"><span style=\"font-weight: bolder;\">项目截图</span></p><p style=\"color: rgb(17, 17, 17); font-family: &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, &quot;Noto Sans CJK SC&quot;, Sathu, EucrosiaUPC, sans-serif; font-size: 16px;\"><img height=\"400\" src=\"https://static.oschina.net/uploads/space/2017/0912/182421_5LaN_3244087.png\" width=\"650\" style=\"border-width: initial; border-style: none; outline: 0px; width: 882px; max-width: -webkit-fit-content; height: auto;\"></p>','article',NULL,NULL,NULL,NULL,0,0,1,1,'bootdo','2017-09-22 14:44:44','2017-09-22 14:44:44');

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

/*Data for the table `oa_notify` */

insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (41,'3','十九大召开了','十九大召开了，竟然没邀请我','','1',1,NULL,NULL,'2017-10-10 17:21:11','',NULL);
insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (42,'3','苹果发布新手机了','有全面屏的iphoneX','','1',1,NULL,NULL,'2017-10-10 18:51:14','',NULL);
insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (43,'3','十九大要消灭贫困人口','我还只有两三年的活头了','','1',1,NULL,NULL,'2017-10-11 09:56:35','',NULL);
insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (44,'3','骑士又输了','捉急','','1',1,NULL,NULL,'2017-10-26 13:59:34','',NULL);
insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (45,'3','火箭5连败','没有保罗不行呀','','1',1,NULL,NULL,'2017-12-30 12:10:20','',NULL);

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint(20) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`is_read`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (18,41,1,1,'2017-10-26');
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (19,42,1,1,'2017-10-26');
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (20,43,136,0,NULL);
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (21,43,133,0,NULL);
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (22,43,130,0,NULL);
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (23,43,1,1,'2017-10-26');
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (24,44,1,1,'2017-12-29');
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (25,45,1,1,'2018-06-04');
insert  into `oa_notify_record`(`id`,`notify_id`,`user_id`,`is_read`,`read_date`) values (26,45,135,0,NULL);

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门管理';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`name`,`order_num`,`del_flag`) values (6,0,'研发部',1,1);
insert  into `sys_dept`(`dept_id`,`parent_id`,`name`,`order_num`,`del_flag`) values (16,0,'运维部',2,1);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'正常','0','del_flag','删除标记','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (3,'显示','1','show_hide','显示/隐藏','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (4,'隐藏','0','show_hide','显示/隐藏','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (5,'是','1','yes_no','是/否','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (6,'否','0','yes_no','是/否','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (7,'红色','red','color','颜色值','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (8,'绿色','green','color','颜色值','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (9,'蓝色','blue','color','颜色值','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (10,'黄色','yellow','color','颜色值','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (11,'橙色','orange','color','颜色值','50',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (12,'默认主题','default','theme','主题方案','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (13,'天蓝主题','cerulean','theme','主题方案','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (14,'橙色主题','readable','theme','主题方案','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (15,'红色主题','united','theme','主题方案','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (16,'Flat主题','flat','theme','主题方案','60',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (17,'国家','1','sys_area_type','区域类型','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (18,'省份、直辖市','2','sys_area_type','区域类型','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (19,'地市','3','sys_area_type','区域类型','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (20,'区县','4','sys_area_type','区域类型','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (21,'公司','1','sys_office_type','机构类型','60',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (22,'部门','2','sys_office_type','机构类型','70',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (23,'小组','3','sys_office_type','机构类型','80',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (24,'其它','4','sys_office_type','机构类型','90',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (25,'综合部','1','sys_office_common','快捷通用部门','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (26,'开发部','2','sys_office_common','快捷通用部门','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (27,'人力部','3','sys_office_common','快捷通用部门','50',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (28,'一级','1','sys_office_grade','机构等级','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (29,'二级','2','sys_office_grade','机构等级','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (30,'三级','3','sys_office_grade','机构等级','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (31,'四级','4','sys_office_grade','机构等级','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (32,'所有数据','1','sys_data_scope','数据范围','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (33,'所在公司及以下数据','2','sys_data_scope','数据范围','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (34,'所在公司数据','3','sys_data_scope','数据范围','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (35,'所在部门及以下数据','4','sys_data_scope','数据范围','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (36,'所在部门数据','5','sys_data_scope','数据范围','50',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (37,'仅本人数据','8','sys_data_scope','数据范围','90',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (38,'按明细设置','9','sys_data_scope','数据范围','100',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (39,'系统管理','1','sys_user_type','用户类型','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (40,'部门经理','2','sys_user_type','用户类型','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (41,'普通用户','3','sys_user_type','用户类型','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (42,'基础主题','basic','cms_theme','站点主题','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (43,'蓝色主题','blue','cms_theme','站点主题','20',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (44,'红色主题','red','cms_theme','站点主题','30',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (45,'文章模型','article','cms_module','栏目模型','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (46,'图片模型','picture','cms_module','栏目模型','20',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (47,'下载模型','download','cms_module','栏目模型','30',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (48,'链接模型','link','cms_module','栏目模型','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (49,'专题模型','special','cms_module','栏目模型','50',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (50,'默认展现方式','0','cms_show_modes','展现方式','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (51,'首栏目内容列表','1','cms_show_modes','展现方式','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (52,'栏目第一条内容','2','cms_show_modes','展现方式','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (53,'发布','0','cms_del_flag','内容状态','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (54,'删除','1','cms_del_flag','内容状态','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (55,'审核','2','cms_del_flag','内容状态','15',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (56,'首页焦点图','1','cms_posid','推荐位','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (57,'栏目页文章推荐','2','cms_posid','推荐位','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (58,'咨询','1','cms_guestbook','留言板分类','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (59,'建议','2','cms_guestbook','留言板分类','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (60,'投诉','3','cms_guestbook','留言板分类','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (61,'其它','4','cms_guestbook','留言板分类','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (62,'公休','1','oa_leave_type','请假类型','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (63,'病假','2','oa_leave_type','请假类型','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (64,'事假','3','oa_leave_type','请假类型','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (65,'调休','4','oa_leave_type','请假类型','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (66,'婚假','5','oa_leave_type','请假类型','60',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (67,'接入日志','1','sys_log_type','日志类型','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (68,'异常日志','2','sys_log_type','日志类型','40',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (69,'请假流程','leave','act_type','流程类型','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (70,'审批测试流程','test_audit','act_type','流程类型','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (71,'分类1','1','act_category','流程分类','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (72,'分类2','2','act_category','流程分类','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (73,'增删改查','crud','gen_category','代码生成分类','10',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (74,'增删改查（包含从表）','crud_many','gen_category','代码生成分类','20',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (75,'树结构','tree','gen_category','代码生成分类','30',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (76,'=','=','gen_query_type','查询方式','10',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (77,'!=','!=','gen_query_type','查询方式','20',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (78,'&gt;','&gt;','gen_query_type','查询方式','30',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (79,'&lt;','&lt;','gen_query_type','查询方式','40',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (80,'Between','between','gen_query_type','查询方式','50',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (81,'Like','like','gen_query_type','查询方式','60',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (82,'Left Like','left_like','gen_query_type','查询方式','70',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (83,'Right Like','right_like','gen_query_type','查询方式','80',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (84,'文本框','input','gen_show_type','字段生成方案','10',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (85,'文本域','textarea','gen_show_type','字段生成方案','20',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (86,'下拉框','select','gen_show_type','字段生成方案','30',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (87,'复选框','checkbox','gen_show_type','字段生成方案','40',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (88,'单选框','radiobox','gen_show_type','字段生成方案','50',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (89,'日期选择','dateselect','gen_show_type','字段生成方案','60',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (90,'人员选择','userselect','gen_show_type','字段生成方案','70',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (91,'部门选择','officeselect','gen_show_type','字段生成方案','80',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (92,'区域选择','areaselect','gen_show_type','字段生成方案','90',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (93,'String','String','gen_java_type','Java类型','10',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (94,'Long','Long','gen_java_type','Java类型','20',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (95,'仅持久层','dao','gen_category','代码生成分类','40',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (96,'男','1','sex','性别','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (97,'女','2','sex','性别','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (98,'Integer','Integer','gen_java_type','Java类型','30',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (99,'Double','Double','gen_java_type','Java类型','40',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (100,'Date','java.util.Date','gen_java_type','Java类型','50',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (104,'Custom','Custom','gen_java_type','Java类型','90',0,1,NULL,1,NULL,NULL,'1');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (105,'会议通告','1','oa_notify_type','通知通告类型','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (106,'奖惩通告','2','oa_notify_type','通知通告类型','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (107,'活动通告','3','oa_notify_type','通知通告类型','30',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (108,'草稿','0','oa_notify_status','通知通告状态','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (109,'发布','1','oa_notify_status','通知通告状态','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (110,'未读','0','oa_notify_read','通知通告状态','10',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (111,'已读','1','oa_notify_read','通知通告状态','20',0,1,NULL,1,NULL,NULL,'0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (112,'草稿','0','oa_notify_status','通知通告状态','10',0,1,NULL,1,NULL,'','0');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (113,'删除','0','del_flag','删除标记',NULL,NULL,NULL,NULL,NULL,NULL,'','');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (118,'关于','about','blog_type','博客类型',NULL,NULL,NULL,NULL,NULL,NULL,'全url是:/blog/open/page/about','');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (119,'交流','communication','blog_type','博客类型',NULL,NULL,NULL,NULL,NULL,NULL,'','');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (120,'文章','article','blog_type','博客类型',NULL,NULL,NULL,NULL,NULL,NULL,'','');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (121,'编码','code','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'','');
insert  into `sys_dict`(`id`,`name`,`value`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (122,'绘画','painting','hobby','爱好',NULL,NULL,NULL,NULL,NULL,NULL,'','');

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='文件上传';

 
/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (609,1,'admin','登录',10,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 20:59:03');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (610,1,'admin','请求访问主页',31,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 20:59:03');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (611,1,'admin','删除菜单',17,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2018-06-04 21:03:28');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (612,1,'admin','删除菜单',9,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2018-06-04 21:03:40');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (613,1,'admin','删除菜单',10,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2018-06-04 21:03:45');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (614,1,'admin','删除菜单',11,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2018-06-04 21:03:53');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (615,1,'admin','删除菜单',9,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2018-06-04 21:04:02');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (616,1,'admin','删除菜单',8,'com.bootdo.system.controller.MenuController.remove()',NULL,'127.0.0.1','2018-06-04 21:04:08');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (617,1,'admin','请求访问主页',21,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:04:21');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (618,1,'admin','删除用户',10,'com.bootdo.system.controller.UserController.remove()',NULL,'127.0.0.1','2018-06-04 21:17:01');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (619,1,'admin','批量删除用户',12,'com.bootdo.system.controller.UserController.batchRemove()',NULL,'127.0.0.1','2018-06-04 21:17:40');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (620,1,'admin','批量删除用户',10,'com.bootdo.system.controller.UserController.batchRemove()',NULL,'127.0.0.1','2018-06-04 21:17:59');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (621,1,'admin','编辑角色',4,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:21:36');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (622,1,'admin','编辑角色',3,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:21:49');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (623,1,'admin','编辑角色',3,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:22:03');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (624,1,'admin','更新角色',23,'com.bootdo.system.controller.RoleController.update()',NULL,'127.0.0.1','2018-06-04 21:23:31');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (625,1,'admin','编辑角色',8,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:26:42');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (626,1,'admin','编辑角色',3,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:26:48');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (627,1,'admin','编辑角色',3,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:27:31');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (628,1,'admin','更新角色',15,'com.bootdo.system.controller.RoleController.update()',NULL,'127.0.0.1','2018-06-04 21:28:37');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (629,1,'admin','编辑角色',2,'com.bootdo.system.controller.RoleController.edit()',NULL,'127.0.0.1','2018-06-04 21:28:46');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (630,1,'admin','更新角色',21,'com.bootdo.system.controller.RoleController.update()',NULL,'127.0.0.1','2018-06-04 21:28:56');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (631,1,'admin','请求访问主页',15,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:32:49');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (632,1,'admin','error',NULL,'http://localhost/system/sysDept/save','org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'deptDO\' on field \'delFlag\': rejected value [正常]; codes [typeMismatch.deptDO.delFlag,typeMismatch.delFlag,typeMismatch.java.lang.Integer,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [deptDO.delFlag,delFlag]; arguments []; default message [delFlag]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Integer\' for property \'delFlag\'; nested exception is java.lang.NumberFormatException: For input string: \"正常\"]',NULL,'2018-06-04 21:33:56');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (633,1,'admin','编辑用户',16,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2018-06-04 21:40:11');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (634,-1,'获取用户信息为空','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:40:42');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (635,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:40:47');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (636,-1,'获取用户信息为空','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:40:59');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (637,-1,'获取用户信息为空','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:41:03');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (638,-1,'获取用户信息为空','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:41:10');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (639,-1,'获取用户信息为空','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:41:17');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (640,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:41:23');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (641,1,'admin','请求访问主页',5,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:41:23');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (642,1,'admin','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:42:01');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (643,1,'admin','请求访问主页',7,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:42:01');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (644,1,'admin','提交更改用户密码',7,'com.bootdo.system.controller.UserController.resetPwd()',NULL,'127.0.0.1','2018-06-04 21:42:22');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (645,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:42:41');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (646,1,'admin','请求访问主页',6,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:42:41');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (647,1,'admin','请求更改用户密码',0,'com.bootdo.system.controller.UserController.resetPwd()',NULL,'127.0.0.1','2018-06-04 21:42:51');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (648,1,'admin','admin提交更改用户密码',9,'com.bootdo.system.controller.UserController.adminResetPwd()',NULL,'127.0.0.1','2018-06-04 21:43:03');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (649,2,'test','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:43:47');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (650,2,'test','请求访问主页',7,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:43:47');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (651,2,'test','编辑用户',11,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2018-06-04 21:44:06');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (652,2,'test','更新用户',1,'com.bootdo.system.controller.UserController.update()',NULL,'127.0.0.1','2018-06-04 21:44:11');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (653,-1,'获取用户信息为空','登录',1,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:44:23');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (654,1,'admin','登录',1,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:44:29');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (655,1,'admin','请求访问主页',6,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:44:29');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (656,1,'admin','编辑用户',11,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2018-06-04 21:44:35');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (657,1,'admin','更新用户',19,'com.bootdo.system.controller.UserController.update()',NULL,'127.0.0.1','2018-06-04 21:44:37');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (658,2,'test','登录',4,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:44:48');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (659,2,'test','请求访问主页',8,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:44:48');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (660,2,'test','编辑用户',8,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2018-06-04 21:44:59');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (661,2,'test','更新用户',0,'com.bootdo.system.controller.UserController.update()',NULL,'127.0.0.1','2018-06-04 21:45:05');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (662,2,'test','添加用户',2,'com.bootdo.system.controller.UserController.add()',NULL,'127.0.0.1','2018-06-04 21:47:35');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (663,2,'test','保存用户',1,'com.bootdo.system.controller.UserController.save()',NULL,'127.0.0.1','2018-06-04 21:49:58');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (664,-1,'获取用户信息为空','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:50:10');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (665,-1,'获取用户信息为空','登录',2,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:50:11');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (666,1,'admin','登录',3,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:50:25');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (667,1,'admin','请求访问主页',7,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:50:25');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (668,1,'admin','添加用户',4,'com.bootdo.system.controller.UserController.add()',NULL,'127.0.0.1','2018-06-04 21:50:32');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (669,1,'admin','保存用户',14,'com.bootdo.system.controller.UserController.save()',NULL,'127.0.0.1','2018-06-04 21:51:04');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (670,1,'admin','error',NULL,'http://localhost/sys/user/edit/138','java.lang.NullPointerException',NULL,'2018-06-04 21:51:10');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (671,1,'admin','error',NULL,'http://localhost/sys/user/edit/138','java.lang.NullPointerException',NULL,'2018-06-04 21:51:16');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (672,1,'admin','error',NULL,'http://localhost/sys/user/edit/138','java.lang.NullPointerException',NULL,'2018-06-04 21:55:39');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (673,1,'admin','编辑用户',11,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2018-06-04 21:56:21');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (674,1,'admin','更新用户',8,'com.bootdo.system.controller.UserController.update()',NULL,'127.0.0.1','2018-06-04 21:56:26');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (675,138,'bus_admin','登录',5,'com.bootdo.system.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2018-06-04 21:56:40');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (676,138,'bus_admin','请求访问主页',7,'com.bootdo.system.controller.LoginController.index()',NULL,'127.0.0.1','2018-06-04 21:56:41');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (677,138,'bus_admin','添加用户',1,'com.bootdo.system.controller.UserController.add()',NULL,'127.0.0.1','2018-06-04 21:58:13');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`gmt_create`) values (678,138,'bus_admin','编辑用户',10,'com.bootdo.system.controller.UserController.edit()',NULL,'127.0.0.1','2018-06-04 21:58:24');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (1,0,'基础管理','','',0,'fa fa-bars',0,'2017-08-09 22:49:47',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (2,3,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',2,'2017-08-09 22:55:15',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (3,0,'系统管理',NULL,NULL,0,'fa fa-desktop',1,'2017-08-09 23:06:55','2017-08-14 14:13:43');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (6,3,'用户管理','sys/user/','sys:user:user',1,'fa fa-user',0,'2017-08-10 14:12:11',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (7,3,'角色管理','sys/role','sys:role:role',1,'fa fa-paw',1,'2017-08-10 14:13:19',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (12,6,'新增','','sys:user:add',2,'',0,'2017-08-14 10:51:35',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (13,6,'编辑','','sys:user:edit',2,'',0,'2017-08-14 10:52:06',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (14,6,'删除',NULL,'sys:user:remove',2,NULL,0,'2017-08-14 10:52:24',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (15,7,'新增','','sys:role:add',2,'',0,'2017-08-14 10:56:37',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (20,2,'新增','','sys:menu:add',2,'',0,'2017-08-14 10:59:32',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (21,2,'编辑','','sys:menu:edit',2,'',0,'2017-08-14 10:59:56',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (22,2,'删除','','sys:menu:remove',2,'',0,'2017-08-14 11:00:26',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (24,6,'批量删除','','sys:user:batchRemove',2,'',0,'2017-08-14 17:27:18',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (25,6,'停用',NULL,'sys:user:disable',2,NULL,0,'2017-08-14 17:27:43',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (26,6,'重置密码','','sys:user:resetPwd',2,'',0,'2017-08-14 17:28:34',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (27,91,'系统日志','common/log','common:log',1,'fa fa-warning',0,'2017-08-14 22:11:53',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (28,27,'刷新',NULL,'sys:log:list',2,NULL,0,'2017-08-14 22:30:22',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (29,27,'删除',NULL,'sys:log:remove',2,NULL,0,'2017-08-14 22:30:43',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (30,27,'清空',NULL,'sys:log:clear',2,NULL,0,'2017-08-14 22:31:02',NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (48,77,'代码生成','common/generator','common:generator',1,'fa fa-code',3,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (49,0,'博客管理','','',0,'fa fa-rss',6,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (50,49,'文章列表','blog/bContent','blog:bContent:bContent',1,'fa fa-file-image-o',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (51,50,'新增','','blog:bContent:add',2,'',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (55,7,'编辑','','sys:role:edit',2,'',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (56,7,'删除','','sys:role:remove',2,NULL,NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (57,91,'运行监控','/druid/index.html','',1,'fa fa-caret-square-o-right',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (58,50,'编辑','','blog:bContent:edit',2,NULL,NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (59,50,'删除','','blog:bContent:remove',2,NULL,NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (60,50,'批量删除','','blog:bContent:batchRemove',2,NULL,NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (61,2,'批量删除','','sys:menu:batchRemove',2,NULL,NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (62,7,'批量删除','','sys:role:batchRemove',2,NULL,NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (68,49,'发布文章','/blog/bContent/add','blog:bContent:add',1,'fa fa-edit',0,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (71,1,'文件管理','/common/sysFile','common:sysFile:sysFile',1,'fa fa-folder-open',2,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (72,77,'计划任务','common/job','common:taskScheduleJob',1,'fa fa-hourglass-1',4,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (73,3,'部门管理','/system/sysDept','system:sysDept:sysDept',1,'fa fa-users',3,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (74,73,'增加','/system/sysDept/add','system:sysDept:add',2,NULL,1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (75,73,'刪除','system/sysDept/remove','system:sysDept:remove',2,NULL,2,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (76,73,'编辑','/system/sysDept/edit','system:sysDept:edit',2,NULL,3,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (77,0,'系统工具','','',0,'fa fa-gear',4,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (78,1,'数据字典','/common/dict','common:dict:dict',1,'fa fa-book',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (79,78,'增加','/common/dict/add','common:dict:add',2,NULL,2,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (80,78,'编辑','/common/dict/edit','common:dict:edit',2,NULL,2,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (81,78,'删除','/common/dict/remove','common:dict:remove',2,'',3,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (83,78,'批量删除','/common/dict/batchRemove','common:dict:batchRemove',2,'',4,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (84,0,'办公管理','','',0,'fa fa-laptop',5,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (85,84,'通知公告','oa/notify','oa:notify:notify',1,'fa fa-pencil-square',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (86,85,'新增','oa/notify/add','oa:notify:add',2,'fa fa-plus',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (87,85,'编辑','oa/notify/edit','oa:notify:edit',2,'fa fa-pencil-square-o',2,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (88,85,'删除','oa/notify/remove','oa:notify:remove',2,'fa fa-minus',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (89,85,'批量删除','oa/notify/batchRemove','oa:notify:batchRemove',2,'',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (90,84,'我的通知','oa/notify/selfNotify','',1,'fa fa-envelope-square',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (91,0,'系统监控','','',0,'fa fa-video-camera',5,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (92,91,'在线用户','sys/online','',1,'fa fa-user',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (97,0,'图表管理','','',0,'fa fa-bar-chart',7,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (98,97,'百度chart','/chart/graph_echarts.html','',1,'fa fa-area-chart',NULL,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (104,77,'swagger','/swagger-ui.html','',1,'',NULL,NULL,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_sign`,`remark`,`user_id_create`,`gmt_create`,`gmt_modified`) values (1,'超级用户角色','admin','拥有最高权限',2,'2017-08-12 00:43:52','2017-08-12 19:14:59');
insert  into `sys_role`(`role_id`,`role_name`,`role_sign`,`remark`,`user_id_create`,`gmt_create`,`gmt_modified`) values (59,'管理员',NULL,'基本管理员权限',NULL,NULL,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3389 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3115,1,103);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3116,1,98);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3117,1,101);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3118,1,99);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3119,1,95);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3120,1,92);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3121,1,57);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3122,1,30);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3123,1,29);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3124,1,28);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3125,1,90);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3126,1,89);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3127,1,88);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3128,1,87);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3129,1,86);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3130,1,72);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3131,1,48);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3132,1,68);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3133,1,60);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3134,1,59);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3135,1,58);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3136,1,51);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3137,1,76);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3138,1,75);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3139,1,74);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3140,1,62);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3141,1,56);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3142,1,55);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3143,1,15);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3144,1,26);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3145,1,25);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3146,1,24);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3147,1,14);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3148,1,13);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3149,1,12);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3150,1,61);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3151,1,22);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3152,1,21);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3153,1,20);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3154,1,83);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3155,1,81);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3156,1,80);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3157,1,79);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3158,1,71);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3159,1,102);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3160,1,97);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3161,1,96);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3162,1,94);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3163,1,93);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3164,1,27);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3165,1,91);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3166,1,85);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3167,1,84);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3168,1,50);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3169,1,49);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3170,1,73);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3171,1,7);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3172,1,6);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3173,1,2);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3174,1,3);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3175,1,78);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3176,1,1);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3177,1,104);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3178,1,77);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3351,59,98);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3352,59,92);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3353,59,57);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3354,59,30);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3355,59,29);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3356,59,28);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3357,59,90);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3358,59,89);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3359,59,88);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3360,59,87);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3361,59,86);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3362,59,68);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3363,59,60);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3364,59,59);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3365,59,58);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3366,59,51);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3367,59,76);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3368,59,75);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3369,59,74);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3370,59,26);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3371,59,25);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3372,59,24);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3373,59,14);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3374,59,13);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3375,59,12);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3376,59,71);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3377,59,97);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3378,59,27);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3379,59,91);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3380,59,85);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3381,59,84);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3382,59,50);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3383,59,49);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3384,59,73);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3385,59,6);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3386,59,-1);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3387,59,3);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (3388,59,1);

/*Table structure for table `sys_task` */

DROP TABLE IF EXISTS `sys_task`;

CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sys_task` */

insert  into `sys_task`(`id`,`cron_expression`,`method_name`,`is_concurrent`,`description`,`update_by`,`bean_class`,`create_date`,`job_status`,`job_group`,`update_date`,`create_by`,`spring_bean`,`job_name`) values (2,'0/10 * * * * ?','run1','1','','4028ea815a3d2a8c015a3d2f8d2a0002','com.bootdo.common.task.WelcomeJob','2017-05-19 18:30:56','0','group1','2017-05-19 18:31:07',NULL,'','welcomJob');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`name`,`password`,`dept_id`,`email`,`mobile`,`status`,`user_id_create`,`gmt_create`,`gmt_modified`,`sex`,`birth`,`pic_id`,`live_address`,`hobby`,`province`,`city`,`district`) values (1,'admin','超级管理员','d1e2292b8991e896b272a37e1c9be3ad',6,'admin@example.com','17699999999',1,1,'2017-08-15 21:40:39','2017-08-15 21:41:00',96,'2017-12-14 00:00:00',138,'ccc','122;121;','北京市','北京市市辖区','东城区');
insert  into `sys_user`(`user_id`,`username`,`name`,`password`,`dept_id`,`email`,`mobile`,`status`,`user_id_create`,`gmt_create`,`gmt_modified`,`sex`,`birth`,`pic_id`,`live_address`,`hobby`,`province`,`city`,`district`) values (2,'test','临时用户','25bb7c42604b0e7aba7bcae50e7762a9',6,'test@bootdo.com',NULL,1,1,'2017-08-14 13:43:05','2017-08-14 21:15:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `sys_user`(`user_id`,`username`,`name`,`password`,`dept_id`,`email`,`mobile`,`status`,`user_id_create`,`gmt_create`,`gmt_modified`,`sex`,`birth`,`pic_id`,`live_address`,`hobby`,`province`,`city`,`district`) values (138,'bus_admin','运维管理员','62d3b2bb1369479e37079a77c23ef1ab',16,'bus_admin@163.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user_plus` */

DROP TABLE IF EXISTS `sys_user_plus`;

CREATE TABLE `sys_user_plus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_plus` */

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (110,1,1);
insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (135,2,59);
insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (138,138,59);
