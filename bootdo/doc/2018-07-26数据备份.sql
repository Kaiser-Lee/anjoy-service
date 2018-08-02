-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.20-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 jgh_mall 的数据库结构
DROP DATABASE IF EXISTS `jgh_mall`;
CREATE DATABASE IF NOT EXISTS `jgh_mall` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jgh_mall`;

-- 导出  表 jgh_mall.jgs_mall_account 结构
DROP TABLE IF EXISTS `jgs_mall_account`;
CREATE TABLE IF NOT EXISTS `jgs_mall_account` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '账户余额（保留两位小数 = 收入-支出-冻结>=0）',
  `status` bigint(64) DEFAULT NULL COMMENT '状态 1:正常，2冻结（冻结后不可以转账、消费和提现）',
  `regType` bigint(64) DEFAULT NULL COMMENT '注册类型（1：用户，2：商户）',
  `token` bigint(64) DEFAULT NULL COMMENT '验证码',
  `income` decimal(10,2) DEFAULT NULL COMMENT '收入',
  `outcome` decimal(10,2) DEFAULT NULL COMMENT '支出',
  `freezAmount` decimal(10,2) DEFAULT NULL COMMENT '冻结金额',
  `hasBindCard` bigint(64) DEFAULT NULL COMMENT '是否绑卡（0：否，1：是）',
  `pay_password` varchar(8) DEFAULT NULL COMMENT '支付密码（字母加数字8位）',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城账户表';

-- 正在导出表  jgh_mall.jgs_mall_account 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_account` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_account_detail 结构
DROP TABLE IF EXISTS `jgs_mall_account_detail`;
CREATE TABLE IF NOT EXISTS `jgs_mall_account_detail` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account_id` bigint(64) DEFAULT NULL COMMENT '账户id',
  `type` bigint(64) DEFAULT NULL COMMENT '类型 1：收入，2：支出',
  `dealcode` varchar(15) DEFAULT NULL COMMENT '交易流水号 ',
  `dealname` varchar(50) DEFAULT NULL COMMENT '交易名称',
  `dealAmount` decimal(10,2) DEFAULT NULL COMMENT '交易金额',
  `dealTime` decimal(10,2) DEFAULT NULL COMMENT '交易时间',
  `dealTarget` varchar(50) DEFAULT NULL COMMENT '交易对象',
  `deal_id` bigint(64) DEFAULT NULL COMMENT '交易id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城账户明细表';

-- 正在导出表  jgh_mall.jgs_mall_account_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_account_detail` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_address 结构
DROP TABLE IF EXISTS `jgs_mall_address`;
CREATE TABLE IF NOT EXISTS `jgs_mall_address` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `phone` varchar(11) DEFAULT NULL COMMENT '收货人电话',
  `name` varchar(10) DEFAULT NULL COMMENT '收货人姓名',
  `province` varchar(10) DEFAULT NULL COMMENT '省',
  `city` varchar(10) DEFAULT NULL COMMENT '市',
  `area` varchar(10) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `isDefault` bigint(64) DEFAULT NULL COMMENT '是否默认',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- 正在导出表  jgh_mall.jgs_mall_address 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_address` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_article 结构
DROP TABLE IF EXISTS `jgs_mall_article`;
CREATE TABLE IF NOT EXISTS `jgs_mall_article` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baseinfo_id` bigint(64) DEFAULT NULL COMMENT '商户id',
  `category_id` bigint(64) DEFAULT NULL COMMENT '分类id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `coverImg` varchar(100) DEFAULT NULL COMMENT '封面图',
  `articleAbstract` varchar(100) DEFAULT NULL COMMENT '文章摘要',
  `content` text COMMENT '文章内容',
  `status` bigint(64) DEFAULT NULL COMMENT '状态 0未发布不显示，1已发布',
  `create_sys_user_id` bigint(64) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';

-- 正在导出表  jgh_mall.jgs_mall_article 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_article` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_authinfo 结构
DROP TABLE IF EXISTS `jgs_mall_authinfo`;
CREATE TABLE IF NOT EXISTS `jgs_mall_authinfo` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baseinfo_id` bigint(64) DEFAULT NULL COMMENT '商户基本信息id',
  `contact_name` varchar(10) DEFAULT NULL COMMENT '法人姓名',
  `contact_phone` varchar(11) DEFAULT NULL COMMENT '法人电话',
  `cardid` varchar(18) DEFAULT NULL COMMENT '法人身份证号',
  `cardImgSrc` varchar(200) DEFAULT NULL COMMENT '身份证照片',
  `backCardImgSrc` varchar(200) DEFAULT NULL COMMENT '身份证背面照片',
  `business_license` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_license_scan` varchar(200) DEFAULT NULL COMMENT '营业执照照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户认证信息表';

-- 正在导出表  jgh_mall.jgs_mall_authinfo 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_authinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_authinfo` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_bankcard 结构
DROP TABLE IF EXISTS `jgs_mall_bankcard`;
CREATE TABLE IF NOT EXISTS `jgs_mall_bankcard` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `bank_name` varchar(20) DEFAULT NULL COMMENT '银行名称',
  `bank_subname` varchar(30) DEFAULT NULL COMMENT '支行名称',
  `account_num` varchar(20) DEFAULT NULL COMMENT '账户号',
  `bind_phone` varchar(11) DEFAULT NULL COMMENT '绑定电话号',
  `isDefault` bigint(64) DEFAULT NULL COMMENT '设置为默认',
  `status` bigint(64) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绑定银行卡表';

-- 正在导出表  jgh_mall.jgs_mall_bankcard 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_bankcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_bankcard` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_baseinfo 结构
DROP TABLE IF EXISTS `jgs_mall_baseinfo`;
CREATE TABLE IF NOT EXISTS `jgs_mall_baseinfo` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fullname` varchar(20) DEFAULT NULL COMMENT '商户全称',
  `shortname` varchar(20) DEFAULT NULL COMMENT '商户简称',
  `logo` varchar(200) DEFAULT NULL COMMENT '商户logo',
  `sys_userid` bigint(64) DEFAULT NULL COMMENT '系统用户',
  `telephone` varchar(11) DEFAULT NULL COMMENT '电话',
  `province` varchar(10) DEFAULT NULL COMMENT '省',
  `city` varchar(10) DEFAULT NULL COMMENT '市',
  `area` varchar(10) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `industry` bigint(64) DEFAULT NULL COMMENT '行业类型id',
  `inviter` bigint(64) DEFAULT NULL COMMENT '邀请人',
  `regType` bigint(64) DEFAULT NULL COMMENT '注册方式',
  `status` bigint(64) DEFAULT NULL COMMENT '状态',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商户基本信息表';

-- 正在导出表  jgh_mall.jgs_mall_baseinfo 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_baseinfo` DISABLE KEYS */;
REPLACE INTO `jgs_mall_baseinfo` (`id`, `fullname`, `shortname`, `logo`, `sys_userid`, `telephone`, `province`, `city`, `area`, `address`, `industry`, `inviter`, `regType`, `status`, `createTime`) VALUES
	(1, '李宁', '李宁', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 11:01:09');
/*!40000 ALTER TABLE `jgs_mall_baseinfo` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_cart 结构
DROP TABLE IF EXISTS `jgs_mall_cart`;
CREATE TABLE IF NOT EXISTS `jgs_mall_cart` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(64) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `session_id` varchar(100) DEFAULT NULL COMMENT 'SESSIONID',
  `product_id` bigint(64) DEFAULT NULL COMMENT '产品id',
  `goods_name` varchar(150) DEFAULT NULL COMMENT '产品名',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `goods_img_url` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- 正在导出表  jgh_mall.jgs_mall_cart 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_cart` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_category 结构
DROP TABLE IF EXISTS `jgs_mall_category`;
CREATE TABLE IF NOT EXISTS `jgs_mall_category` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT '分类名',
  `parentid` bigint(64) DEFAULT NULL COMMENT '父类id',
  `sort` bigint(64) DEFAULT NULL COMMENT '排序',
  `isShow` bigint(64) DEFAULT NULL COMMENT '是否显示',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '图片',
  `level` varchar(2) DEFAULT NULL COMMENT '级别（L1,L2）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- 正在导出表  jgh_mall.jgs_mall_category 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_category` DISABLE KEYS */;
REPLACE INTO `jgs_mall_category` (`id`, `name`, `parentid`, `sort`, `isShow`, `imgUrl`, `level`) VALUES
	(11, '鞋子', 0, 1, 1, '/jgh_img/categoryImg/eed87a65-c70f-4dff-91bc-f899dc7e3721.png', 'L1'),
	(12, '安踏', 11, 1, 1, '/jgh_img/categoryImg/8c2e948c-54e6-44ec-8a0d-3e2507f15e59.png', 'L2');
/*!40000 ALTER TABLE `jgs_mall_category` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_goods 结构
DROP TABLE IF EXISTS `jgs_mall_goods`;
CREATE TABLE IF NOT EXISTS `jgs_mall_goods` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` bigint(64) DEFAULT NULL COMMENT '分类id',
  `baseinfo_Id` bigint(64) DEFAULT NULL COMMENT '商户基本信息id',
  `name` varchar(100) NOT NULL COMMENT '商品名',
  `brief` varchar(255) DEFAULT NULL COMMENT '商品简述',
  `marketPrice` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `sort` bigint(64) DEFAULT NULL COMMENT '排序',
  `isOnSale` bigint(64) DEFAULT NULL COMMENT '是否在售（0否，1是）',
  `isTop` bigint(64) DEFAULT NULL COMMENT '是否置顶（0否，1是）',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否删除（0否，1是）',
  `isNew` bigint(64) DEFAULT NULL COMMENT '是否新品（0否，1是）',
  `create_sys_user_id` bigint(64) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_sys_user_id` bigint(64) DEFAULT NULL COMMENT '更新人id',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- 正在导出表  jgh_mall.jgs_mall_goods 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_goods` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_goods_article 结构
DROP TABLE IF EXISTS `jgs_mall_goods_article`;
CREATE TABLE IF NOT EXISTS `jgs_mall_goods_article` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(64) DEFAULT NULL COMMENT '商品id',
  `article_id` bigint(64) DEFAULT NULL COMMENT '文章id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章商品关系表';

-- 正在导出表  jgh_mall.jgs_mall_goods_article 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_goods_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_goods_article` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_goods_detail 结构
DROP TABLE IF EXISTS `jgs_mall_goods_detail`;
CREATE TABLE IF NOT EXISTS `jgs_mall_goods_detail` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(64) DEFAULT NULL COMMENT '商品id',
  `sort` bigint(64) DEFAULT NULL COMMENT '排序',
  `type` bigint(64) DEFAULT NULL COMMENT '类型',
  `valueType` bigint(64) DEFAULT NULL COMMENT '值类型',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `status` bigint(64) DEFAULT NULL COMMENT '状态 0无效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情';

-- 正在导出表  jgh_mall.jgs_mall_goods_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_goods_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_goods_detail` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_industry 结构
DROP TABLE IF EXISTS `jgs_mall_industry`;
CREATE TABLE IF NOT EXISTS `jgs_mall_industry` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typeName` varchar(10) DEFAULT NULL COMMENT '类型名称',
  `typeLevel` bigint(64) DEFAULT NULL COMMENT '类型等级',
  `belongType` bigint(64) DEFAULT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户类型表-行业';

-- 正在导出表  jgh_mall.jgs_mall_industry 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_industry` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_order 结构
DROP TABLE IF EXISTS `jgs_mall_order`;
CREATE TABLE IF NOT EXISTS `jgs_mall_order` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baseinfo_id` bigint(64) DEFAULT NULL COMMENT '商户id',
  `order_no` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
  `order_status` bigint(64) DEFAULT NULL COMMENT '订单状态',
  `pay_status` bigint(64) DEFAULT NULL COMMENT '支付状态',
  `pay_type` bigint(64) DEFAULT NULL COMMENT '支付方式',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `consignee_name` varchar(50) DEFAULT NULL COMMENT '收货人',
  `consignee_country` varchar(50) DEFAULT NULL COMMENT '国家',
  `consignee_province` varchar(50) DEFAULT NULL COMMENT '省',
  `consignee_city` varchar(50) DEFAULT NULL COMMENT '城市',
  `consignee_district` varchar(50) DEFAULT NULL COMMENT '区县',
  `consignee_address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `consignee_mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `postscript` varchar(1000) DEFAULT NULL COMMENT '买家附言',
  `shipping_no` varchar(20) DEFAULT NULL COMMENT '运单号',
  `shipping_fee` decimal(10,2) DEFAULT NULL COMMENT '运费',
  `shipping_status` bigint(64) DEFAULT NULL COMMENT '运单状态',
  `shipping_name` varchar(100) DEFAULT NULL COMMENT '快递名',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `actual_price` decimal(10,2) DEFAULT NULL COMMENT '实际金额',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `trade_id` bigint(64) DEFAULT NULL COMMENT '交易id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_unique` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单';

-- 正在导出表  jgh_mall.jgs_mall_order 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_order` DISABLE KEYS */;
REPLACE INTO `jgs_mall_order` (`id`, `baseinfo_id`, `order_no`, `user_id`, `order_status`, `pay_status`, `pay_type`, `pay_time`, `consignee_name`, `consignee_country`, `consignee_province`, `consignee_city`, `consignee_district`, `consignee_address`, `consignee_mobile`, `postscript`, `shipping_no`, `shipping_fee`, `shipping_status`, `shipping_name`, `order_price`, `actual_price`, `confirm_time`, `trade_id`) VALUES
	(1, 1, '133456655462', 1, 1, 1, 2, '2018-06-28 11:11:55', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1000.00, 1020.00, NULL, 1);
/*!40000 ALTER TABLE `jgs_mall_order` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_order_detail 结构
DROP TABLE IF EXISTS `jgs_mall_order_detail`;
CREATE TABLE IF NOT EXISTS `jgs_mall_order_detail` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(64) DEFAULT NULL COMMENT '订单id',
  `product_id` varchar(30) DEFAULT NULL COMMENT '产品id',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价格',
  `tradePrice` decimal(10,2) DEFAULT NULL COMMENT '交易价格',
  `amount` int(11) DEFAULT NULL COMMENT '商品数量',
  `goods_specifition` varchar(500) DEFAULT NULL COMMENT '商品规格',
  `goods_pic_url` varchar(100) DEFAULT NULL COMMENT '产品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情';

-- 正在导出表  jgh_mall.jgs_mall_order_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_order_detail` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_product 结构
DROP TABLE IF EXISTS `jgs_mall_product`;
CREATE TABLE IF NOT EXISTS `jgs_mall_product` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` bigint(64) DEFAULT NULL COMMENT '商品id',
  `name` varchar(500) DEFAULT NULL COMMENT '规格',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `amount` int(11) DEFAULT NULL COMMENT '库存量',
  `status` bigint(64) DEFAULT NULL COMMENT '状态 0无效，1有效',
  `create_sys_user_id` bigint(64) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货品';

-- 正在导出表  jgh_mall.jgs_mall_product 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_product` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_trade 结构
DROP TABLE IF EXISTS `jgs_mall_trade`;
CREATE TABLE IF NOT EXISTS `jgs_mall_trade` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tradeNo` bigint(64) DEFAULT NULL COMMENT '交易流水号',
  `tradePrice` decimal(10,2) DEFAULT NULL COMMENT '交易价格',
  `tradeTime` datetime DEFAULT NULL COMMENT '交易时间',
  `tradeInfo` varchar(500) DEFAULT NULL COMMENT '交易信息',
  `tradeType` bigint(64) DEFAULT NULL COMMENT '交易类型',
  `tradeMemo` varchar(1000) DEFAULT NULL COMMENT '备注',
  `tradeStatus` bigint(64) DEFAULT NULL COMMENT '交易状态',
  `pay_id` bigint(64) DEFAULT NULL COMMENT '支付id',
  `pay_name` varchar(50) DEFAULT NULL COMMENT '支付人姓名',
  `pay_avatar` varchar(200) DEFAULT NULL COMMENT '支付人头像',
  `pay_type` bigint(64) DEFAULT NULL COMMENT '支付类型',
  `target_id` bigint(64) DEFAULT NULL COMMENT '目标id',
  `target_name` varchar(100) DEFAULT NULL COMMENT '目标名称',
  `target_type` bigint(64) DEFAULT NULL COMMENT '目标类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_no_unique` (`tradeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易记录';

-- 正在导出表  jgh_mall.jgs_mall_trade 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `jgs_mall_trade` ENABLE KEYS */;

-- 导出  表 jgh_mall.jgs_mall_user 结构
DROP TABLE IF EXISTS `jgs_mall_user`;
CREATE TABLE IF NOT EXISTS `jgs_mall_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `openId` varchar(50) DEFAULT NULL COMMENT 'openid',
  `sex` bigint(64) DEFAULT NULL COMMENT '性别',
  `code` varchar(12) DEFAULT NULL COMMENT '用户编号',
  `status` bigint(64) DEFAULT NULL COMMENT '状态',
  `inviter` bigint(64) DEFAULT NULL COMMENT '邀请人',
  `inviteCode` varchar(10) DEFAULT NULL COMMENT '我的邀请码',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商城用户表';

-- 正在导出表  jgh_mall.jgs_mall_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `jgs_mall_user` DISABLE KEYS */;
REPLACE INTO `jgs_mall_user` (`id`, `nick`, `phone`, `openId`, `sex`, `code`, `status`, `inviter`, `inviteCode`, `avatar`, `createTime`) VALUES
	(1, '李宁', '18529593930', '2222222222', NULL, NULL, 1, NULL, NULL, NULL, '2018-06-28 11:39:07');
/*!40000 ALTER TABLE `jgs_mall_user` ENABLE KEYS */;

-- 导出  表 jgh_mall.oa_notify 结构
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE IF NOT EXISTS `oa_notify` (
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

-- 正在导出表  jgh_mall.oa_notify 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `oa_notify` DISABLE KEYS */;
REPLACE INTO `oa_notify` (`id`, `type`, `title`, `content`, `files`, `status`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES
	(41, '3', '十九大召开了', '十九大召开了，竟然没邀请我', '', '1', 1, NULL, NULL, '2017-10-10 17:21:11', '', NULL),
	(42, '3', '苹果发布新手机了', '有全面屏的iphoneX', '', '1', 1, NULL, NULL, '2017-10-10 18:51:14', '', NULL),
	(43, '3', '十九大要消灭贫困人口', '我还只有两三年的活头了', '', '1', 1, NULL, NULL, '2017-10-11 09:56:35', '', NULL),
	(44, '3', '骑士又输了', '捉急', '', '1', 1, NULL, NULL, '2017-10-26 13:59:34', '', NULL),
	(45, '3', '火箭5连败', '没有保罗不行呀', '', '1', 1, NULL, NULL, '2017-12-30 12:10:20', '', NULL);
/*!40000 ALTER TABLE `oa_notify` ENABLE KEYS */;

-- 导出  表 jgh_mall.oa_notify_record 结构
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE IF NOT EXISTS `oa_notify_record` (
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

-- 正在导出表  jgh_mall.oa_notify_record 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `oa_notify_record` DISABLE KEYS */;
REPLACE INTO `oa_notify_record` (`id`, `notify_id`, `user_id`, `is_read`, `read_date`) VALUES
	(18, 41, 1, 1, '2017-10-26'),
	(19, 42, 1, 1, '2017-10-26'),
	(20, 43, 136, 0, NULL),
	(21, 43, 133, 0, NULL),
	(22, 43, 130, 0, NULL),
	(23, 43, 1, 1, '2017-10-26'),
	(24, 44, 1, 1, '2017-12-29'),
	(25, 45, 1, 1, '2018-06-04'),
	(26, 45, 135, 0, NULL);
/*!40000 ALTER TABLE `oa_notify_record` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_dept 结构
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- 正在导出表  jgh_mall.sys_dept 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
REPLACE INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES
	(6, 0, '研发部', 1, 1),
	(16, 0, '运维部', 2, 1);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_dict 结构
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- 正在导出表  jgh_mall.sys_dict 的数据：~114 rows (大约)
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
REPLACE INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES
	(1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0'),
	(12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0'),
	(17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0'),
	(22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0'),
	(23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0'),
	(24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0'),
	(25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0'),
	(28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0'),
	(37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0'),
	(38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0'),
	(39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1'),
	(44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1'),
	(45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1'),
	(47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1'),
	(48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1'),
	(50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0'),
	(56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0'),
	(67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0'),
	(69, '请假流程', 'leave', 'act_type', '流程类型', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(70, '审批测试流程', 'test_audit', 'act_type', '流程类型', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(71, '分类1', '1', 'act_category', '流程分类', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(72, '分类2', '2', 'act_category', '流程分类', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1'),
	(74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1'),
	(75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1'),
	(76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1'),
	(77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1'),
	(78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1'),
	(79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1'),
	(80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1'),
	(81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1'),
	(82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1'),
	(83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1'),
	(84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1'),
	(85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1'),
	(86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1'),
	(87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1'),
	(88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1'),
	(89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1'),
	(90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1'),
	(91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1'),
	(92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1'),
	(93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1'),
	(94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1'),
	(95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1'),
	(96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1'),
	(99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1'),
	(100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1'),
	(104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1'),
	(105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0'),
	(108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0'),
	(111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0'),
	(112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0'),
	(113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(118, '关于', 'about', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '全url是:/blog/open/page/about', ''),
	(119, '交流', 'communication', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(120, '文章', 'article', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(122, '绘画', 'painting', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', ''),
	(123, '是', '1', 'mall_check_value', '正反判断', 1, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(124, '否', '0', 'mall_check_value', '正反判断', 2, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(125, 'L1', '1', 'mall_level', '商品分类级别', 1, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(126, 'L2', '2', 'mall_level', '商品分类级别', 2, NULL, NULL, NULL, NULL, NULL, '', NULL);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_file 结构
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- 正在导出表  jgh_mall.sys_file 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
REPLACE INTO `sys_file` (`id`, `type`, `url`, `create_date`) VALUES
	(1, 0, '/jgh_img/183ae216-fdc7-4df4-9a96-7c1fd4baf1e9.png', '2018-06-27 10:57:37'),
	(2, 0, '/jgh_img/a550da87-04a7-4a60-8000-477e1268a792.jpg', '2018-06-27 11:14:55');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_log 结构
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE IF NOT EXISTS `sys_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1403 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- 正在导出表  jgh_mall.sys_log 的数据：~746 rows (大约)
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
REPLACE INTO `sys_log` (`id`, `user_id`, `username`, `operation`, `time`, `method`, `params`, `ip`, `gmt_create`) VALUES
	(609, 1, 'admin', '登录', 10, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 20:59:03'),
	(610, 1, 'admin', '请求访问主页', 31, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 20:59:03'),
	(611, 1, 'admin', '删除菜单', 17, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-04 21:03:28'),
	(612, 1, 'admin', '删除菜单', 9, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-04 21:03:40'),
	(613, 1, 'admin', '删除菜单', 10, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-04 21:03:45'),
	(614, 1, 'admin', '删除菜单', 11, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-04 21:03:53'),
	(615, 1, 'admin', '删除菜单', 9, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-04 21:04:02'),
	(616, 1, 'admin', '删除菜单', 8, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-04 21:04:08'),
	(617, 1, 'admin', '请求访问主页', 21, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:04:21'),
	(618, 1, 'admin', '删除用户', 10, 'com.bootdo.system.controller.UserController.remove()', NULL, '127.0.0.1', '2018-06-04 21:17:01'),
	(619, 1, 'admin', '批量删除用户', 12, 'com.bootdo.system.controller.UserController.batchRemove()', NULL, '127.0.0.1', '2018-06-04 21:17:40'),
	(620, 1, 'admin', '批量删除用户', 10, 'com.bootdo.system.controller.UserController.batchRemove()', NULL, '127.0.0.1', '2018-06-04 21:17:59'),
	(621, 1, 'admin', '编辑角色', 4, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:21:36'),
	(622, 1, 'admin', '编辑角色', 3, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:21:49'),
	(623, 1, 'admin', '编辑角色', 3, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:22:03'),
	(624, 1, 'admin', '更新角色', 23, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-04 21:23:31'),
	(625, 1, 'admin', '编辑角色', 8, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:26:42'),
	(626, 1, 'admin', '编辑角色', 3, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:26:48'),
	(627, 1, 'admin', '编辑角色', 3, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:27:31'),
	(628, 1, 'admin', '更新角色', 15, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-04 21:28:37'),
	(629, 1, 'admin', '编辑角色', 2, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-04 21:28:46'),
	(630, 1, 'admin', '更新角色', 21, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-04 21:28:56'),
	(631, 1, 'admin', '请求访问主页', 15, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:32:49'),
	(632, 1, 'admin', 'error', NULL, 'http://localhost/system/sysDept/save', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'deptDO\' on field \'delFlag\': rejected value [正常]; codes [typeMismatch.deptDO.delFlag,typeMismatch.delFlag,typeMismatch.java.lang.Integer,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [deptDO.delFlag,delFlag]; arguments []; default message [delFlag]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Integer\' for property \'delFlag\'; nested exception is java.lang.NumberFormatException: For input string: "正常"]', NULL, '2018-06-04 21:33:56'),
	(633, 1, 'admin', '编辑用户', 16, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2018-06-04 21:40:11'),
	(634, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:40:42'),
	(635, -1, '获取用户信息为空', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:40:47'),
	(636, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:40:59'),
	(637, -1, '获取用户信息为空', '登录', 5, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:41:03'),
	(638, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:41:10'),
	(639, -1, '获取用户信息为空', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:41:17'),
	(640, 1, 'admin', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:41:23'),
	(641, 1, 'admin', '请求访问主页', 5, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:41:23'),
	(642, 1, 'admin', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:42:01'),
	(643, 1, 'admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:42:01'),
	(644, 1, 'admin', '提交更改用户密码', 7, 'com.bootdo.system.controller.UserController.resetPwd()', NULL, '127.0.0.1', '2018-06-04 21:42:22'),
	(645, 1, 'admin', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:42:41'),
	(646, 1, 'admin', '请求访问主页', 6, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:42:41'),
	(647, 1, 'admin', '请求更改用户密码', 0, 'com.bootdo.system.controller.UserController.resetPwd()', NULL, '127.0.0.1', '2018-06-04 21:42:51'),
	(648, 1, 'admin', 'admin提交更改用户密码', 9, 'com.bootdo.system.controller.UserController.adminResetPwd()', NULL, '127.0.0.1', '2018-06-04 21:43:03'),
	(649, 2, 'test', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:43:47'),
	(650, 2, 'test', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:43:47'),
	(651, 2, 'test', '编辑用户', 11, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2018-06-04 21:44:06'),
	(652, 2, 'test', '更新用户', 1, 'com.bootdo.system.controller.UserController.update()', NULL, '127.0.0.1', '2018-06-04 21:44:11'),
	(653, -1, '获取用户信息为空', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:44:23'),
	(654, 1, 'admin', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:44:29'),
	(655, 1, 'admin', '请求访问主页', 6, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:44:29'),
	(656, 1, 'admin', '编辑用户', 11, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2018-06-04 21:44:35'),
	(657, 1, 'admin', '更新用户', 19, 'com.bootdo.system.controller.UserController.update()', NULL, '127.0.0.1', '2018-06-04 21:44:37'),
	(658, 2, 'test', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:44:48'),
	(659, 2, 'test', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:44:48'),
	(660, 2, 'test', '编辑用户', 8, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2018-06-04 21:44:59'),
	(661, 2, 'test', '更新用户', 0, 'com.bootdo.system.controller.UserController.update()', NULL, '127.0.0.1', '2018-06-04 21:45:05'),
	(662, 2, 'test', '添加用户', 2, 'com.bootdo.system.controller.UserController.add()', NULL, '127.0.0.1', '2018-06-04 21:47:35'),
	(663, 2, 'test', '保存用户', 1, 'com.bootdo.system.controller.UserController.save()', NULL, '127.0.0.1', '2018-06-04 21:49:58'),
	(664, -1, '获取用户信息为空', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:50:10'),
	(665, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:50:11'),
	(666, 1, 'admin', '登录', 3, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:50:25'),
	(667, 1, 'admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:50:25'),
	(668, 1, 'admin', '添加用户', 4, 'com.bootdo.system.controller.UserController.add()', NULL, '127.0.0.1', '2018-06-04 21:50:32'),
	(669, 1, 'admin', '保存用户', 14, 'com.bootdo.system.controller.UserController.save()', NULL, '127.0.0.1', '2018-06-04 21:51:04'),
	(670, 1, 'admin', 'error', NULL, 'http://localhost/sys/user/edit/138', 'java.lang.NullPointerException', NULL, '2018-06-04 21:51:10'),
	(671, 1, 'admin', 'error', NULL, 'http://localhost/sys/user/edit/138', 'java.lang.NullPointerException', NULL, '2018-06-04 21:51:16'),
	(672, 1, 'admin', 'error', NULL, 'http://localhost/sys/user/edit/138', 'java.lang.NullPointerException', NULL, '2018-06-04 21:55:39'),
	(673, 1, 'admin', '编辑用户', 11, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2018-06-04 21:56:21'),
	(674, 1, 'admin', '更新用户', 8, 'com.bootdo.system.controller.UserController.update()', NULL, '127.0.0.1', '2018-06-04 21:56:26'),
	(675, 138, 'bus_admin', '登录', 5, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-04 21:56:40'),
	(676, 138, 'bus_admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-04 21:56:41'),
	(677, 138, 'bus_admin', '添加用户', 1, 'com.bootdo.system.controller.UserController.add()', NULL, '127.0.0.1', '2018-06-04 21:58:13'),
	(678, 138, 'bus_admin', '编辑用户', 10, 'com.bootdo.system.controller.UserController.edit()', NULL, '127.0.0.1', '2018-06-04 21:58:24'),
	(679, 1, 'admin', '登录', 43, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 10:25:53'),
	(680, 1, 'admin', '请求访问主页', 42, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 10:25:53'),
	(681, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 10:30:26'),
	(682, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 10:30:26'),
	(683, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 10:35:53'),
	(684, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 10:35:53'),
	(685, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 10:42:09'),
	(686, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 10:42:09'),
	(687, 1, 'admin', '登录', 7, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 11:32:24'),
	(688, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 11:32:25'),
	(689, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 11:34:44'),
	(690, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 11:34:44'),
	(691, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 12:49:21'),
	(692, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 12:49:21'),
	(693, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 14:16:25'),
	(694, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 14:16:25'),
	(695, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 14:21:30'),
	(696, 1, 'admin', '请求访问主页', 26, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 14:21:30'),
	(697, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 14:26:23'),
	(698, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 14:26:23'),
	(699, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 14:27:05'),
	(700, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 14:27:05'),
	(701, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 14:32:16'),
	(702, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 14:32:16'),
	(703, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 15:03:08'),
	(704, 1, 'admin', '请求访问主页', 37, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:03:08'),
	(705, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:03:12'),
	(706, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 15:04:42'),
	(707, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:04:42'),
	(708, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:14:01'),
	(709, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 15:14:32'),
	(710, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:14:33'),
	(711, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:16:14'),
	(712, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 15:18:10'),
	(713, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:18:10'),
	(714, 1, 'admin', '登录', 3, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 15:19:41'),
	(715, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:19:41'),
	(716, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 15:21:42'),
	(717, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 15:21:43'),
	(718, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 16:09:05'),
	(719, 1, 'admin', '请求访问主页', 32, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 16:09:05'),
	(720, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 16:11:10'),
	(721, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 16:11:10'),
	(722, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 16:11:25'),
	(723, NULL, NULL, 'error', NULL, 'http://localhost/;JSESSIONID=468836b6-7bc7-46e6-901b-ef6297563b5dlogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2018-06-22 16:59:50'),
	(724, NULL, NULL, 'error', NULL, 'http://localhost/;JSESSIONID=468836b6-7bc7-46e6-901b-ef6297563b5dlogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2018-06-22 16:59:51'),
	(725, NULL, NULL, 'error', NULL, 'http://localhost/;JSESSIONID=468836b6-7bc7-46e6-901b-ef6297563b5dlogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2018-06-22 17:00:01'),
	(726, NULL, NULL, 'error', NULL, 'http://localhost/;JSESSIONID=468836b6-7bc7-46e6-901b-ef6297563b5dlogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2018-06-22 17:00:05'),
	(727, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 17:00:19'),
	(728, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:00:19'),
	(729, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 17:00:31'),
	(730, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:00:31'),
	(731, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 17:20:04'),
	(732, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:20:04'),
	(733, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 17:21:51'),
	(734, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:21:51'),
	(735, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 17:24:34'),
	(736, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:24:34'),
	(737, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:32:00'),
	(738, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 17:45:34'),
	(739, 1, 'admin', '添加菜单', 8, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-22 18:00:44'),
	(740, 1, 'admin', '添加菜单', 10, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-22 18:00:47'),
	(741, 1, 'admin', '保存菜单', 6, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-22 18:06:13'),
	(742, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 18:06:18'),
	(743, 1, 'admin', '编辑角色', 3, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-22 18:06:30'),
	(744, 1, 'admin', '更新角色', 30, 'com.jghmall.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-22 18:06:34'),
	(745, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 18:06:49'),
	(746, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-22 18:12:13'),
	(747, 1, 'admin', '请求访问主页', 32, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 18:12:13'),
	(748, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 18:24:26'),
	(749, 1, 'admin', '请求访问主页', 24, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-22 18:24:45'),
	(750, 1, 'admin', '登录', 7, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 11:58:18'),
	(751, 1, 'admin', '请求访问主页', 34, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 11:58:18'),
	(752, 1, 'admin', '登录', 12, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 14:06:43'),
	(753, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 14:06:43'),
	(754, 1, 'admin', '登录', 11, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 14:49:13'),
	(755, 1, 'admin', '请求访问主页', 52, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 14:49:14'),
	(756, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 14:55:32'),
	(757, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 14:55:37'),
	(758, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 14:55:40'),
	(759, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 14:55:40'),
	(760, 1, 'admin', '登录', 7, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:23:10'),
	(761, 1, 'admin', '请求访问主页', 35, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 15:23:10'),
	(762, -1, '获取用户信息为空', '登录', 3, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:23:28'),
	(763, -1, '获取用户信息为空', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:23:33'),
	(764, -1, '获取用户信息为空', '登录', 3, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:23:40'),
	(765, -1, '获取用户信息为空', '登录', 12, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:23:52'),
	(766, 1, 'admin', '登录', 7, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:27:09'),
	(767, 1, 'admin', '请求访问主页', 42, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 15:27:09'),
	(768, 1, 'admin', '登录', 2, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 15:27:46'),
	(769, 1, 'admin', '请求访问主页', 32, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 15:27:46'),
	(770, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 16:09:45'),
	(771, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 16:09:45'),
	(772, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 16:11:37'),
	(773, 1, 'admin', '请求访问主页', 42, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 16:11:37'),
	(774, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 16:12:04'),
	(775, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 16:18:26'),
	(776, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 17:09:34'),
	(777, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 17:09:34'),
	(778, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 17:21:02'),
	(779, 1, 'admin', '登录', 3, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-25 18:00:54'),
	(780, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-25 18:00:54'),
	(781, 1, 'admin', '登录', 14, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-26 15:15:07'),
	(782, 1, 'admin', '请求访问主页', 67, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 15:15:07'),
	(783, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 15:20:08'),
	(784, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-26 15:28:07'),
	(785, 1, 'admin', '请求访问主页', 24, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 15:28:07'),
	(786, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-26 15:29:09'),
	(787, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 15:29:09'),
	(788, 1, 'admin', '登录', 7, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-26 15:30:29'),
	(789, 1, 'admin', '请求访问主页', 31, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 15:30:29'),
	(790, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-26 17:30:16'),
	(791, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 17:30:16'),
	(792, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-26 17:30:41'),
	(793, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 17:30:41'),
	(794, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 17:43:17'),
	(795, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-26 17:56:15'),
	(796, 1, 'admin', '登录', 12, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 08:59:20'),
	(797, 1, 'admin', '请求访问主页', 42, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 08:59:20'),
	(798, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 09:06:27'),
	(799, 1, 'admin', '登录', 3, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 09:47:41'),
	(800, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 09:47:42'),
	(801, 1, 'admin', '添加菜单', 1, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 09:51:38'),
	(802, 1, 'admin', '添加菜单', 1, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 09:52:07'),
	(803, 1, 'admin', '保存菜单', 10, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 09:53:10'),
	(804, 1, 'admin', '添加菜单', 13, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 09:54:31'),
	(805, 1, 'admin', '保存菜单', 9, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 09:55:49'),
	(806, 1, 'admin', '编辑角色', 9, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-27 09:55:58'),
	(807, 1, 'admin', '更新角色', 43, 'com.jghmall.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-27 09:56:03'),
	(808, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 09:56:06'),
	(809, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 09:56:44'),
	(810, 1, 'admin', '请求访问主页', 46, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 09:56:44'),
	(811, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 09:59:29'),
	(812, 1, 'admin', '添加菜单', 14, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:00:12'),
	(813, 1, 'admin', '保存菜单', 12, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 10:01:20'),
	(814, 1, 'admin', '添加菜单', 6, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:01:45'),
	(815, 1, 'admin', '保存菜单', 9, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 10:02:42'),
	(816, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:02:45'),
	(817, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:02:52'),
	(818, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:02:52'),
	(819, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:03:47'),
	(820, 1, 'admin', '请求访问主页', 47, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:03:47'),
	(821, 1, 'admin', '编辑角色', 16, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-27 10:04:19'),
	(822, 1, 'admin', '更新角色', 38, 'com.jghmall.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-27 10:04:27'),
	(823, 1, 'admin', '编辑菜单', 34, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 10:04:35'),
	(824, 1, 'admin', '更新菜单', 17, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-27 10:05:16'),
	(825, 1, 'admin', '请求访问主页', 30, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:05:18'),
	(826, 1, 'admin', '编辑角色', 4, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-27 10:05:24'),
	(827, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:05:29'),
	(828, 1, 'admin', '请求访问主页', 30, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:05:29'),
	(829, 1, 'admin', '编辑菜单', 14, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 10:05:47'),
	(830, 1, 'admin', '更新菜单', 12, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-27 10:06:09'),
	(831, 1, 'admin', '请求访问主页', 7, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:06:11'),
	(832, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:06:13'),
	(833, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:06:13'),
	(834, 1, 'admin', '请求访问主页', 24, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:07:25'),
	(835, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:07:32'),
	(836, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:07:32'),
	(837, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:08:09'),
	(838, 1, 'admin', '请求访问主页', 44, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:08:09'),
	(839, 1, 'admin', '编辑菜单', 18, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 10:08:17'),
	(840, 1, 'admin', '更新菜单', 17, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-27 10:08:31'),
	(841, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:08:32'),
	(842, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:08:33'),
	(843, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:08:35'),
	(844, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:08:35'),
	(845, 1, 'admin', '请求访问主页', 28, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:10:38'),
	(846, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:10:39'),
	(847, 1, 'admin', '登录', 6, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:11:25'),
	(848, 1, 'admin', '请求访问主页', 29, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:11:25'),
	(849, 1, 'admin', '编辑菜单', 23, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 10:14:06'),
	(850, 1, 'admin', '更新菜单', 26, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-27 10:14:11'),
	(851, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:14:53'),
	(852, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:14:56'),
	(853, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:14:56'),
	(854, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:15:09'),
	(855, 1, 'admin', '添加用户', 4, 'com.jghmall.system.controller.SysUserController.add()', NULL, '127.0.0.1', '2018-06-27 10:15:38'),
	(856, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:16:24'),
	(857, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:16:24'),
	(858, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:16:58'),
	(859, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:17:54'),
	(860, 1, 'admin', '添加菜单', 1, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:19:27'),
	(861, 1, 'admin', '添加菜单', 0, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:19:54'),
	(862, 1, 'admin', '添加菜单', 10, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:20:00'),
	(863, 1, 'admin', '添加菜单', 1, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:20:13'),
	(864, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:23:19'),
	(865, 1, 'admin', '添加菜单', 0, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:23:32'),
	(866, 1, 'admin', '添加菜单', 11, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 10:23:37'),
	(867, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 10:36:23'),
	(868, 1, 'admin', '请求访问主页', 37, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:36:24'),
	(869, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:36:45'),
	(870, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:36:48'),
	(871, 1, 'admin', '请求访问主页', 29, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:37:26'),
	(872, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:37:30'),
	(873, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:38:10'),
	(874, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:38:13'),
	(875, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:39:42'),
	(876, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:42:49'),
	(877, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:46:03'),
	(878, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:46:07'),
	(879, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:47:32'),
	(880, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:47:35'),
	(881, 1, 'admin', '请求访问主页', 24, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:48:16'),
	(882, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:48:20'),
	(883, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:51:37'),
	(884, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:51:40'),
	(885, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:52:54'),
	(886, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:52:57'),
	(887, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:54:40'),
	(888, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:54:43'),
	(889, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:56:20'),
	(890, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:56:23'),
	(891, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 10:57:27'),
	(892, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 10:57:31'),
	(893, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:13:23'),
	(894, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:14:22'),
	(895, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:14:25'),
	(896, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:14:48'),
	(897, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:14:51'),
	(898, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:32:22'),
	(899, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:32:26'),
	(900, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:33:00'),
	(901, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:33:03'),
	(902, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:33:26'),
	(903, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:33:29'),
	(904, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:34:09'),
	(905, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:34:12'),
	(906, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 11:35:26'),
	(907, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:35:26'),
	(908, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:35:30'),
	(909, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:36:36'),
	(910, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:36:39'),
	(911, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:39:34'),
	(912, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:39:37'),
	(913, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:40:10'),
	(914, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:40:15'),
	(915, 1, 'admin', '请求访问主页', 31, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:40:31'),
	(916, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:40:34'),
	(917, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:42:03'),
	(918, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:42:07'),
	(919, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:42:22'),
	(920, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:42:27'),
	(921, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:42:39'),
	(922, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:44:21'),
	(923, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:44:24'),
	(924, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:44:46'),
	(925, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:45:18'),
	(926, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 11:46:36'),
	(927, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:46:39'),
	(928, 1, 'admin', '添加角色', 0, 'com.jghmall.system.controller.RoleController.add()', NULL, '127.0.0.1', '2018-06-27 11:47:23'),
	(929, 1, 'admin', '编辑用户', 33, 'com.jghmall.system.controller.SysUserController.edit()', NULL, '127.0.0.1', '2018-06-27 11:47:28'),
	(930, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:50:54'),
	(931, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:51:58'),
	(932, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 11:53:48'),
	(933, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 12:01:31'),
	(934, 1, 'admin', '登录', 0, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 14:04:34'),
	(935, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:04:34'),
	(936, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:04:40'),
	(937, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:05:09'),
	(938, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:10:22'),
	(939, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:10:27'),
	(940, 1, 'admin', '登录', 11, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 14:11:49'),
	(941, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:11:49'),
	(942, 1, 'admin', '添加商品分类', 32932, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:12:25'),
	(943, 1, 'admin', '请求访问主页', 27, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:15:28'),
	(944, 1, 'admin', '添加商品分类', 40961, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:16:12'),
	(945, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:17:45'),
	(946, 1, 'admin', '添加商品分类', 3812, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:17:52'),
	(947, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:18:26'),
	(948, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:18:29'),
	(949, 1, 'admin', '请求访问主页', 29, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:19:05'),
	(950, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:19:07'),
	(951, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:23:21'),
	(952, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:23:23'),
	(953, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:24:16'),
	(954, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:25:31'),
	(955, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:25:35'),
	(956, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:26:03'),
	(957, 1, 'admin', '添加商品分类', 9, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:26:07'),
	(958, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:26:51'),
	(959, 1, 'admin', '添加商品分类', 9, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:26:57'),
	(960, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:27:26'),
	(961, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:27:30'),
	(962, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:28:06'),
	(963, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:28:09'),
	(964, 1, 'admin', '请求访问主页', 7, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:29:12'),
	(965, 1, 'admin', '添加商品分类', 27, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:29:14'),
	(966, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:29:36'),
	(967, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:29:38'),
	(968, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:30:18'),
	(969, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:30:39'),
	(970, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:31:18'),
	(971, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:32:16'),
	(972, 1, 'admin', '添加商品分类', 25, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:32:18'),
	(973, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:32:52'),
	(974, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:32:56'),
	(975, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:33:24'),
	(976, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:33:27'),
	(977, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:34:18'),
	(978, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:34:21'),
	(979, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:34:44'),
	(980, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:34:50'),
	(981, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:35:02'),
	(982, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:35:08'),
	(983, 1, 'admin', '请求访问主页', 7, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:35:25'),
	(984, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:35:28'),
	(985, 1, 'admin', '请求访问主页', 6, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:35:39'),
	(986, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:35:42'),
	(987, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:35:53'),
	(988, 1, 'admin', '添加商品分类', 16, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:35:56'),
	(989, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:36:17'),
	(990, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:36:20'),
	(991, 1, 'admin', '请求访问主页', 6, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:36:32'),
	(992, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:36:33'),
	(993, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:36:33'),
	(994, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:36:33'),
	(995, 1, 'admin', '添加商品分类', 1, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:36:36'),
	(996, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:37:19'),
	(997, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:37:22'),
	(998, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:37:37'),
	(999, 1, 'admin', '添加商品分类', 7, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:37:42'),
	(1000, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:39:06'),
	(1001, 1, 'admin', '添加商品分类', 7, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:39:08'),
	(1002, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:39:32'),
	(1003, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:39:34'),
	(1004, 1, 'admin', '登录', 4, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 14:39:37'),
	(1005, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:39:37'),
	(1006, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:40:15'),
	(1007, 1, 'admin', '添加商品分类', 8, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:40:19'),
	(1008, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:41:12'),
	(1009, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:43:36'),
	(1010, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:43:39'),
	(1011, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:48:23'),
	(1012, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:48:26'),
	(1013, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:48:53'),
	(1014, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:48:57'),
	(1015, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:49:30'),
	(1016, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:49:33'),
	(1017, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:50:25'),
	(1018, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:50:28'),
	(1019, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:52:04'),
	(1020, 1, 'admin', '添加商品分类', 15, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:52:08'),
	(1021, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:54:29'),
	(1022, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:54:32'),
	(1023, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:55:51'),
	(1024, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:55:54'),
	(1025, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:56:11'),
	(1026, 1, 'admin', '添加商品分类', 3, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:56:14'),
	(1027, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:56:33'),
	(1028, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:56:36'),
	(1029, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:57:24'),
	(1030, 1, 'admin', '添加商品分类', 15, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:57:26'),
	(1031, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:58:05'),
	(1032, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:58:09'),
	(1033, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:58:46'),
	(1034, 1, 'admin', '添加商品分类', 16, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:58:49'),
	(1035, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:59:03'),
	(1036, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:59:06'),
	(1037, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 14:59:36'),
	(1038, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 14:59:39'),
	(1039, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:01:06'),
	(1040, 1, 'admin', '添加商品分类', 2, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:01:09'),
	(1041, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:02:18'),
	(1042, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:02:21'),
	(1043, 1, 'admin', '添加菜单', 0, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 15:02:36'),
	(1044, 1, 'admin', '添加商品分类', 11, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:02:45'),
	(1045, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:04:20'),
	(1046, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:04:23'),
	(1047, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:06:42'),
	(1048, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:06:46'),
	(1049, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:08:20'),
	(1050, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:19:55'),
	(1051, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/add/0', 'org.springframework.web.util.NestedServletException: Handler dispatch failed; nested exception is java.lang.NoSuchMethodError: com.jghmall.common.service.DictService.getGoodsLevelList()Ljava/util/List;', NULL, '2018-06-27 15:19:58'),
	(1052, 1, 'admin', '登录', 16, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 15:20:00'),
	(1053, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:20:00'),
	(1054, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 15:24:37'),
	(1055, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:24:37'),
	(1056, 1, 'admin', '添加商品分类', 42, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:24:40'),
	(1057, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:26:50'),
	(1058, 1, 'admin', '添加商品分类', 22, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:26:55'),
	(1059, 1, 'admin', '请求访问主页', 30, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:28:09'),
	(1060, 1, 'admin', '添加商品分类', 27, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:28:12'),
	(1061, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:28:25'),
	(1062, 1, 'admin', '添加商品分类', 17, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:28:29'),
	(1063, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:28:34'),
	(1064, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:28:37'),
	(1065, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:29:15'),
	(1066, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:29:17'),
	(1067, 1, 'admin', '添加商品分类', 12, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:13'),
	(1068, 1, 'admin', '添加商品分类', 11, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:20'),
	(1069, 1, 'admin', '添加商品分类', 16, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:23'),
	(1070, 1, 'admin', '添加菜单', 1, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:32'),
	(1071, 1, 'admin', '添加菜单', 10, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:35'),
	(1072, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:48'),
	(1073, 1, 'admin', '添加商品分类', 10, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:31:59'),
	(1074, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:33:23'),
	(1075, 1, 'admin', '添加商品分类', 10, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:33:27'),
	(1076, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:36:16'),
	(1077, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:36:19'),
	(1078, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:37:17'),
	(1079, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:37:20'),
	(1080, 1, 'admin', '添加商品分类', 13, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:37:30'),
	(1081, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:39:55'),
	(1082, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:42:21'),
	(1083, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:42:23'),
	(1084, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:43:03'),
	(1085, 1, 'admin', '添加商品分类', 7, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:43:05'),
	(1086, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:43:13'),
	(1087, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:43:15'),
	(1088, 1, 'admin', '请求访问主页', 34, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:45:04'),
	(1089, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:45:07'),
	(1090, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:45:54'),
	(1091, 1, 'admin', '添加商品分类', 7, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:45:57'),
	(1092, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:46:55'),
	(1093, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:48:12'),
	(1094, 1, 'admin', '添加商品分类', 11, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:48:15'),
	(1095, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:48:48'),
	(1096, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:48:50'),
	(1097, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:49:12'),
	(1098, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:49:15'),
	(1099, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:49:42'),
	(1100, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:49:45'),
	(1101, 1, 'admin', '请求访问主页', 29, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:50:59'),
	(1102, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:51:01'),
	(1103, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:51:13'),
	(1104, 1, 'admin', '添加商品分类', 22, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:51:16'),
	(1105, 1, 'admin', '请求访问主页', 24, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:51:56'),
	(1106, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:51:59'),
	(1107, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:52:28'),
	(1108, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:52:30'),
	(1109, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:52:42'),
	(1110, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:52:46'),
	(1111, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:53:24'),
	(1112, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:53:27'),
	(1113, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:53:44'),
	(1114, 1, 'admin', '添加商品分类', 0, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:53:50'),
	(1115, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:55:53'),
	(1116, 1, 'admin', '添加商品分类', 21, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:55:59'),
	(1117, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 15:57:10'),
	(1118, 1, 'admin', '添加商品分类', 15, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:57:14'),
	(1119, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 15:58:23'),
	(1120, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:01:38'),
	(1121, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:01:42'),
	(1122, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:02:23'),
	(1123, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:02:26'),
	(1124, 1, 'admin', '请求访问主页', 31, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:03:46'),
	(1125, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:03:48'),
	(1126, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:04:48'),
	(1127, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:04:50'),
	(1128, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:05:20'),
	(1129, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:05:22'),
	(1130, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:07:09'),
	(1131, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:07:12'),
	(1132, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:08:47'),
	(1133, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:08:51'),
	(1134, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:11:46'),
	(1135, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:11:49'),
	(1136, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:12:38'),
	(1137, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:12:48'),
	(1138, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:12:50'),
	(1139, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:13:24'),
	(1140, 1, 'admin', '添加商品分类', 17, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:13:28'),
	(1141, 1, 'admin', '请求访问主页', 7, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:13:54'),
	(1142, 1, 'admin', '添加商品分类', 8, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:13:57'),
	(1143, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:15:36'),
	(1144, 1, 'admin', '添加商品分类', 10, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:16:33'),
	(1145, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:16:37'),
	(1146, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:16:39'),
	(1147, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/save', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'name\' cannot be null\r\n### The error may involve com.jghmall.goods.dao.MallCategoryDao.save-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into jgs_mall_category   (    `name`,     `parentid`,     `sort`,     `isShow`,     `imgUrl`,     `level`   )   values   (    ?,     ?,     ?,     ?,     ?,     ?   )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'name\' cannot be null\n; SQL []; Column \'name\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'name\' cannot be null', NULL, '2018-06-27 16:17:07'),
	(1148, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:17:44'),
	(1149, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:17:48'),
	(1150, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/save', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 2 errors\nField error in object \'mallCategoryDO\' on field \'parentid\': rejected value [根节点]; codes [typeMismatch.mallCategoryDO.parentid,typeMismatch.parentid,typeMismatch.java.lang.Long,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [mallCategoryDO.parentid,parentid]; arguments []; default message [parentid]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Long\' for property \'parentid\'; nested exception is java.lang.NumberFormatException: For input string: "根节点"]\nField error in object \'mallCategoryDO\' on field \'sort\': rejected value [呜呜呜]; codes [typeMismatch.mallCategoryDO.sort,typeMismatch.sort,typeMismatch.java.lang.Long,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [mallCategoryDO.sort,sort]; arguments []; default message [sort]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Long\' for property \'sort\'; nested exception is java.lang.NumberFormatException: For input string: "呜呜呜"]', NULL, '2018-06-27 16:17:58'),
	(1151, 1, 'admin', '请求访问主页', 28, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:21:03'),
	(1152, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:21:07'),
	(1153, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:22:36'),
	(1154, 1, 'admin', '添加商品分类', 17, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:22:39'),
	(1155, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:25:01'),
	(1156, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:26:36'),
	(1157, 1, 'admin', '添加商品分类', 13, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:26:39'),
	(1158, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:27:50'),
	(1159, 1, 'admin', '添加商品分类', 7, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:27:53'),
	(1160, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:29:32'),
	(1161, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:29:34'),
	(1162, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:31:07'),
	(1163, 1, 'admin', '请求访问主页', 7, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:31:07'),
	(1164, 1, 'admin', '添加商品分类', 10, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:31:11'),
	(1165, 1, 'admin', '请求访问主页', 34, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:32:03'),
	(1166, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:32:05'),
	(1167, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:32:39'),
	(1168, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:32:42'),
	(1169, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:33:21'),
	(1170, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:33:24'),
	(1171, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:34:22'),
	(1172, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:34:25'),
	(1173, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:35:23'),
	(1174, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:35:29'),
	(1175, 1, 'admin', '请求访问主页', 32, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:37:34'),
	(1176, 1, 'admin', '添加商品分类', 9, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 16:37:38'),
	(1177, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/save', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'mallCategoryDO\' on field \'sort\': rejected value [订单]; codes [typeMismatch.mallCategoryDO.sort,typeMismatch.sort,typeMismatch.java.lang.Long,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [mallCategoryDO.sort,sort]; arguments []; default message [sort]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.lang.Long\' for property \'sort\'; nested exception is java.lang.NumberFormatException: For input string: "订单"]', NULL, '2018-06-27 16:37:48'),
	(1178, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:41:41'),
	(1179, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 16:42:54'),
	(1180, 1, 'admin', '请求访问主页', 34, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:42:54'),
	(1181, 1, 'admin', '添加菜单', 8, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 16:43:54'),
	(1182, 1, 'admin', '保存菜单', 20, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 16:44:33'),
	(1183, 1, 'admin', '编辑菜单', 29, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 16:44:44'),
	(1184, 1, 'admin', '更新菜单', 15, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-27 16:45:06'),
	(1185, 1, 'admin', '编辑菜单', 15, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 16:45:15'),
	(1186, 1, 'admin', '编辑菜单', 11, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 16:45:18'),
	(1187, 1, 'admin', '更新菜单', 11, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-27 16:45:20'),
	(1188, 1, 'admin', '添加菜单', 8, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 16:45:49'),
	(1189, 1, 'admin', '保存菜单', 6, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 16:46:37'),
	(1190, 1, 'admin', '编辑角色', 24, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-27 16:47:20'),
	(1191, 1, 'admin', '更新角色', 33, 'com.jghmall.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-27 16:47:25'),
	(1192, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:47:26'),
	(1193, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 16:48:20'),
	(1194, 1, 'admin', '请求访问主页', 30, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:48:20'),
	(1195, 1, 'admin', '请求访问主页', 27, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:56:22'),
	(1196, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:56:39'),
	(1197, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:58:06'),
	(1198, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 16:59:18'),
	(1199, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/list', 'java.lang.NullPointerException', NULL, '2018-06-27 17:02:03'),
	(1200, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:04:23'),
	(1201, 1, 'admin', '登录', 12, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-27 17:12:37'),
	(1202, 1, 'admin', '请求访问主页', 48, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:12:38'),
	(1203, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/list', 'java.lang.NullPointerException', NULL, '2018-06-27 17:12:39'),
	(1204, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:13:06'),
	(1205, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/list', 'java.lang.NullPointerException', NULL, '2018-06-27 17:13:09'),
	(1206, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:14:42'),
	(1207, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:16:03'),
	(1208, 1, 'admin', '请求访问主页', 35, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:16:43'),
	(1209, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:17:36'),
	(1210, 1, 'admin', '请求访问主页', 26, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:18:07'),
	(1211, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:18:16'),
	(1212, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:20:53'),
	(1213, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:21:02'),
	(1214, 1, 'admin', '添加菜单', 14, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-27 17:21:17'),
	(1215, 1, 'admin', '保存菜单', 10, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-27 17:21:23'),
	(1216, 1, 'admin', '删除菜单', 30, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-27 17:21:31'),
	(1217, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:22:41'),
	(1218, 1, 'admin', '添加商品分类', 17, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:22:44'),
	(1219, 1, 'admin', '请求访问主页', 33, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:23:02'),
	(1220, 1, 'admin', '请求访问主页', 41, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:23:10'),
	(1221, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:23:13'),
	(1222, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:23:41'),
	(1223, 1, 'admin', '添加商品分类', 9, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:23:44'),
	(1224, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:25:17'),
	(1225, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:26:44'),
	(1226, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:27:31'),
	(1227, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:28:02'),
	(1228, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:28:29'),
	(1229, 1, 'admin', '添加商品分类', 8, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:28:32'),
	(1230, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:28:56'),
	(1231, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:30:30'),
	(1232, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:30:43'),
	(1233, 1, 'admin', '添加商品分类', 13, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:30:47'),
	(1234, 1, 'admin', '添加商品分类', 6, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:30:52'),
	(1235, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:32:58'),
	(1236, 1, 'admin', '添加商品分类', 13, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:33:02'),
	(1237, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:34:39'),
	(1238, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:35:11'),
	(1239, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:35:40'),
	(1240, 1, 'admin', '编辑菜单', 24, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-27 17:36:15'),
	(1241, 1, 'admin', '删除菜单', 29, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-06-27 17:36:23'),
	(1242, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:36:24'),
	(1243, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:36:28'),
	(1244, 1, 'admin', '请求访问主页', 28, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:37:31'),
	(1245, 1, 'admin', '编辑角色', 20, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-27 17:37:54'),
	(1246, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:38:00'),
	(1247, 1, 'admin', '添加商品分类', 5, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:38:24'),
	(1248, 1, 'admin', '添加商品分类', 13, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:38:30'),
	(1249, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:39:56'),
	(1250, 1, 'admin', '添加商品分类', 4, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-27 17:40:16'),
	(1251, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:41:22'),
	(1252, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:46:52'),
	(1253, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:47:27'),
	(1254, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:50:06'),
	(1255, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:52:36'),
	(1256, 1, 'admin', '请求访问主页', 27, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:55:16'),
	(1257, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:56:26'),
	(1258, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:57:53'),
	(1259, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 17:58:44'),
	(1260, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:00:43'),
	(1261, 1, 'admin', '请求访问主页', 24, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:01:35'),
	(1262, 1, 'admin', '请求访问主页', 30, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:02:05'),
	(1263, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:03:05'),
	(1264, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:04:19'),
	(1265, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:04:48'),
	(1266, 1, 'admin', '请求访问主页', 8, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-27 18:05:01'),
	(1267, 1, 'admin', '登录', 20, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 09:01:53'),
	(1268, 1, 'admin', '请求访问主页', 61, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:01:54'),
	(1269, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:07:36'),
	(1270, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:07:59'),
	(1271, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:08:24'),
	(1272, 1, 'admin', '请求访问主页', 46, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:09:03'),
	(1273, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 09:43:41'),
	(1274, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:43:41'),
	(1275, 1, 'admin', '添加商品分类', 36, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-28 09:43:44'),
	(1276, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:44:34'),
	(1277, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:45:06'),
	(1278, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:45:35'),
	(1279, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:46:14'),
	(1280, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:48:05'),
	(1281, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:51:01'),
	(1282, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:52:26'),
	(1283, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:53:40'),
	(1284, 1, 'admin', '添加商品分类', 21, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-28 09:53:48'),
	(1285, 1, 'admin', '添加商品分类', 10, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-28 09:53:51'),
	(1286, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:56:22'),
	(1287, 1, 'admin', '请求访问主页', 25, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:58:08'),
	(1288, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 09:58:47'),
	(1289, 1, 'admin', '添加商品分类', 14, 'com.jghmall.goods.controller.MallCategoryController.add()', NULL, '127.0.0.1', '2018-06-28 09:59:25'),
	(1290, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:00:12'),
	(1291, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:00:40'),
	(1292, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:02:14'),
	(1293, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:02:26'),
	(1294, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:02:45'),
	(1295, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/update', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?\r\n### SQL: update jgs_mall_category         where id = ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?', NULL, '2018-06-28 10:02:54'),
	(1296, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:03:21'),
	(1297, 1, 'admin', 'error', NULL, 'http://localhost/goods/mallCategory/update', 'org.springframework.jdbc.UncategorizedSQLException: \r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?\r\n### SQL: update jgs_mall_category         where id = ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'  \n		where id = ?\',expect SET, actual WHERE where : update jgs_mall_category \n		  \n		where id = ?', NULL, '2018-06-28 10:03:37'),
	(1298, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:03:56'),
	(1299, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:05:24'),
	(1300, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:05:42'),
	(1301, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:07:52'),
	(1302, 1, 'admin', '添加菜单', 0, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-28 10:22:39'),
	(1303, 1, 'admin', '保存菜单', 87, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-28 10:22:59'),
	(1304, 1, 'admin', '编辑菜单', 16, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-28 10:23:01'),
	(1305, 1, 'admin', '更新菜单', 13, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-28 10:23:22'),
	(1306, 1, 'admin', '添加菜单', 10, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-28 10:23:36'),
	(1307, 1, 'admin', '保存菜单', 9, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-28 10:24:26'),
	(1308, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:25:45'),
	(1309, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 10:25:56'),
	(1310, 1, 'admin', '请求访问主页', 10, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:25:56'),
	(1311, 1, 'admin', '编辑角色', 3, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-28 10:26:05'),
	(1312, 1, 'admin', '更新角色', 32, 'com.jghmall.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-28 10:26:11'),
	(1313, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:26:12'),
	(1314, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:26:55'),
	(1315, 1, 'admin', '请求访问主页', 9, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:27:01'),
	(1316, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:27:43'),
	(1317, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:27:44'),
	(1318, 1, 'admin', '登录', 13, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 10:29:03'),
	(1319, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:29:03'),
	(1320, 1, 'admin', '添加菜单', 16, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-28 10:29:21'),
	(1321, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:31:27'),
	(1322, 1, 'admin', '请求访问主页', 27, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:32:07'),
	(1323, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:32:42'),
	(1324, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:35:02'),
	(1325, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:35:30'),
	(1326, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:37:59'),
	(1327, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:39:30'),
	(1328, 1, 'admin', '请求访问主页', 16, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:40:12'),
	(1329, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:40:41'),
	(1330, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:40:42'),
	(1331, 1, 'admin', '请求访问主页', 13, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:41:25'),
	(1332, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:41:51'),
	(1333, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 10:58:25'),
	(1334, 1, 'admin', '编辑菜单', 29, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-28 11:04:55'),
	(1335, 1, 'admin', '更新菜单', 22, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-28 11:05:10'),
	(1336, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:05:18'),
	(1337, 1, 'admin', '登录', 13, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:05:48'),
	(1338, 1, 'admin', '请求访问主页', 44, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:05:48'),
	(1339, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:07:58'),
	(1340, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:07:58'),
	(1341, 1, 'admin', '编辑菜单', 17, 'com.jghmall.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2018-06-28 11:08:39'),
	(1342, 1, 'admin', '更新菜单', 15, 'com.jghmall.system.controller.MenuController.update()', NULL, '127.0.0.1', '2018-06-28 11:08:43'),
	(1343, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:09:16'),
	(1344, 1, 'admin', '请求访问主页', 41, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:09:16'),
	(1345, 1, 'admin', '请求访问主页', 30, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:14:08'),
	(1346, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:14:30'),
	(1347, 1, 'admin', '请求访问主页', 21, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:15:25'),
	(1348, 1, 'admin', '添加菜单', 10, 'com.jghmall.system.controller.MenuController.add()', NULL, '127.0.0.1', '2018-06-28 11:17:15'),
	(1349, 1, 'admin', '保存菜单', 16, 'com.jghmall.system.controller.MenuController.save()', NULL, '127.0.0.1', '2018-06-28 11:17:50'),
	(1350, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:17:57'),
	(1351, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:18:22'),
	(1352, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:18:22'),
	(1353, 1, 'admin', '编辑角色', 11, 'com.jghmall.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-06-28 11:18:36'),
	(1354, 1, 'admin', '更新角色', 36, 'com.jghmall.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-06-28 11:19:05'),
	(1355, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:19:06'),
	(1356, 1, 'admin', '请求访问主页', 19, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:19:13'),
	(1357, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:19:57'),
	(1358, 1, 'admin', '请求访问主页', 38, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:19:57'),
	(1359, 1, 'admin', '请求访问主页', 32, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:22:34'),
	(1360, 1, 'admin', '请求访问主页', 23, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:22:44'),
	(1361, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:23:39'),
	(1362, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:24:46'),
	(1363, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:26:50'),
	(1364, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:30:17'),
	(1365, 1, 'admin', '请求访问主页', 18, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:30:35'),
	(1366, 1, 'admin', '请求访问主页', 17, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:34:34'),
	(1367, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:34:48'),
	(1368, 1, 'admin', '请求访问主页', 12, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:35:04'),
	(1369, 1, 'admin', '请求访问主页', 15, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:41:43'),
	(1370, 1, 'admin', '请求访问主页', 14, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:42:15'),
	(1371, 1, 'admin', '登录', 8, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:43:16'),
	(1372, 1, 'admin', '请求访问主页', 29, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:43:16'),
	(1373, 1, 'admin', 'error', NULL, 'http://localhost/order/mallOrder/list', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.name\' in \'field list\'\r\n### The error may exist in file [D:\\eclipse-workspace\\jgh_mall\\target\\classes\\mybatis\\order\\MallOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select b.name as baseInfoName,`id`,`baseinfo_id`,`order_no`,`user_id`,`order_status`,`pay_status`,`pay_type`,`pay_time`,`consignee_name`,`consignee_country`,`consignee_province`,`consignee_city`,`consignee_district`,`consignee_address`,`consignee_mobile`,`postscript`,`shipping_no`,`shipping_fee`,`shipping_status`,`shipping_name`,`order_price`,`actual_price`,`confirm_time`,`trade_id` from jgs_mall_order a   left join jgs_mall_baseinfo b   on a.baseinfo_id = b.id                                      order by id desc             limit ?, ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.name\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.name\' in \'field list\'', NULL, '2018-06-28 11:43:18'),
	(1374, 1, 'admin', '请求访问主页', 11, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:44:03'),
	(1375, 1, 'admin', 'error', NULL, 'http://localhost/order/mallOrder/list', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.name\' in \'field list\'\r\n### The error may exist in file [D:\\eclipse-workspace\\jgh_mall\\target\\classes\\mybatis\\order\\MallOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select b.name as baseInfoName,`id`,`baseinfo_id`,`order_no`,`user_id`,`order_status`,`pay_status`,`pay_type`,`pay_time`,`consignee_name`,`consignee_country`,`consignee_province`,`consignee_city`,`consignee_district`,`consignee_address`,`consignee_mobile`,`postscript`,`shipping_no`,`shipping_fee`,`shipping_status`,`shipping_name`,`order_price`,`actual_price`,`confirm_time`,`trade_id` from jgs_mall_order a   left join jgs_mall_baseinfo b   on a.baseinfo_id = b.id                                      order by id desc             limit ?, ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.name\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.name\' in \'field list\'', NULL, '2018-06-28 11:44:05'),
	(1376, 1, 'admin', '请求访问主页', 26, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:44:08'),
	(1377, 1, 'admin', '登录', 10, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:46:48'),
	(1378, 1, 'admin', '请求访问主页', 36, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:46:48'),
	(1379, 1, 'admin', 'error', NULL, 'http://localhost/order/mallOrder/list', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in field list is ambiguous\r\n### The error may exist in file [D:\\eclipse-workspace\\jgh_mall\\target\\classes\\mybatis\\order\\MallOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select b.fullname as baseInfoName,`id`,`baseinfo_id`,`order_no`,`user_id`,`order_status`,`pay_status`,`pay_type`,`pay_time`,`consignee_name`,`consignee_country`,`consignee_province`,`consignee_city`,`consignee_district`,`consignee_address`,`consignee_mobile`,`postscript`,`shipping_no`,`shipping_fee`,`shipping_status`,`shipping_name`,`order_price`,`actual_price`,`confirm_time`,`trade_id` from jgs_mall_order a   left join jgs_mall_baseinfo b   on a.baseinfo_id = b.id                                      order by id desc             limit ?, ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in field list is ambiguous\n; SQL []; Column \'id\' in field list is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in field list is ambiguous', NULL, '2018-06-28 11:46:50'),
	(1380, 1, 'admin', '登录', 5, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:48:41'),
	(1381, 1, 'admin', '请求访问主页', 22, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:48:41'),
	(1382, 1, 'admin', '登录', 9, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-06-28 11:51:15'),
	(1383, 1, 'admin', '请求访问主页', 20, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:51:15'),
	(1384, 1, 'admin', '请求访问主页', 33, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-06-28 11:53:23'),
	(1385, 1, 'admin', '登录', 7, 'com.jghmall.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-07-26 15:11:20'),
	(1386, 1, 'admin', '请求访问主页', 48, 'com.jghmall.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-07-26 15:11:20'),
	(1387, 1, 'admin', '删除菜单', 26, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:11:38'),
	(1388, 1, 'admin', '删除菜单', 22, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:11:46'),
	(1389, 1, 'admin', '删除菜单', 22, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:11:51'),
	(1390, 1, 'admin', '删除菜单', 24, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:11:55'),
	(1391, 1, 'admin', '删除菜单', 21, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:12:00'),
	(1392, 1, 'admin', '删除菜单', 22, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:12:13'),
	(1393, 1, 'admin', '删除菜单', 23, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:12:20'),
	(1394, 1, 'admin', '删除菜单', 18, 'com.jghmall.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2018-07-26 15:12:23'),
	(1395, 1, 'admin', '登录', 12, 'com.base.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-07-26 15:59:03'),
	(1396, 1, 'admin', '请求访问主页', 37, 'com.base.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-07-26 15:59:03'),
	(1397, 1, 'admin', '添加角色', 1, 'com.base.system.controller.RoleController.add()', NULL, '127.0.0.1', '2018-07-26 15:59:34'),
	(1398, 1, 'admin', '编辑角色', 3, 'com.base.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2018-07-26 15:59:52'),
	(1399, 1, 'admin', '更新角色', 37, 'com.base.system.controller.RoleController.update()', NULL, '127.0.0.1', '2018-07-26 16:00:03'),
	(1400, 1, 'admin', '请求访问主页', 41, 'com.base.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-07-26 16:00:04'),
	(1401, 1, 'admin', '登录', 13, 'com.base.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2018-07-26 16:01:53'),
	(1402, 1, 'admin', '请求访问主页', 27, 'com.base.system.controller.LoginController.index()', NULL, '127.0.0.1', '2018-07-26 16:01:53');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- 正在导出表  jgh_mall.sys_menu 的数据：~57 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
REPLACE INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES
	(1, 0, '基础管理', '', '', 0, 'fa fa-bars', 0, '2017-08-09 22:49:47', NULL),
	(2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL),
	(3, 0, '系统管理', NULL, NULL, 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43'),
	(6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL),
	(7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL),
	(12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL),
	(13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL),
	(14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL),
	(15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL),
	(20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL),
	(21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL),
	(22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL),
	(24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL),
	(25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL),
	(26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL),
	(27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL),
	(28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL),
	(29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL),
	(30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL),
	(48, 77, '代码生成', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL),
	(49, 0, '博客管理', '', '', 0, 'fa fa-rss', 6, NULL, NULL),
	(50, 49, '文章列表', 'blog/bContent', 'blog:bContent:bContent', 1, 'fa fa-file-image-o', 1, NULL, NULL),
	(51, 50, '新增', '', 'blog:bContent:add', 2, '', NULL, NULL, NULL),
	(55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL),
	(56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL),
	(57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL),
	(58, 50, '编辑', '', 'blog:bContent:edit', 2, NULL, NULL, NULL, NULL),
	(59, 50, '删除', '', 'blog:bContent:remove', 2, NULL, NULL, NULL, NULL),
	(60, 50, '批量删除', '', 'blog:bContent:batchRemove', 2, NULL, NULL, NULL, NULL),
	(61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL),
	(62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL),
	(68, 49, '发布文章', '/blog/bContent/add', 'blog:bContent:add', 1, 'fa fa-edit', 0, NULL, NULL),
	(71, 1, '文件管理', '/common/sysFile', 'common:sysFile:sysFile', 1, 'fa fa-folder-open', 2, NULL, NULL),
	(72, 77, '计划任务', 'common/job', 'common:taskScheduleJob', 1, 'fa fa-hourglass-1', 4, NULL, NULL),
	(73, 3, '部门管理', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL),
	(74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL),
	(75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL),
	(76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL),
	(77, 0, '系统工具', '', '', 0, 'fa fa-gear', 4, NULL, NULL),
	(78, 1, '数据字典', '/common/dict', 'common:dict:dict', 1, 'fa fa-book', 1, NULL, NULL),
	(79, 78, '增加', '/common/dict/add', 'common:dict:add', 2, NULL, 2, NULL, NULL),
	(80, 78, '编辑', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL),
	(81, 78, '删除', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL),
	(83, 78, '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL),
	(84, 0, '办公管理', '', '', 0, 'fa fa-laptop', 5, NULL, NULL),
	(85, 84, '通知公告', 'oa/notify', 'oa:notify:notify', 1, 'fa fa-pencil-square', NULL, NULL, NULL),
	(86, 85, '新增', 'oa/notify/add', 'oa:notify:add', 2, 'fa fa-plus', 1, NULL, NULL),
	(87, 85, '编辑', 'oa/notify/edit', 'oa:notify:edit', 2, 'fa fa-pencil-square-o', 2, NULL, NULL),
	(88, 85, '删除', 'oa/notify/remove', 'oa:notify:remove', 2, 'fa fa-minus', NULL, NULL, NULL),
	(89, 85, '批量删除', 'oa/notify/batchRemove', 'oa:notify:batchRemove', 2, '', NULL, NULL, NULL),
	(90, 84, '我的通知', 'oa/notify/selfNotify', '', 1, 'fa fa-envelope-square', NULL, NULL, NULL),
	(91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL),
	(92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL),
	(97, 0, '图表管理', '', '', 0, 'fa fa-bar-chart', 7, NULL, NULL),
	(98, 97, '百度chart', '/chart/graph_echarts.html', '', 1, 'fa fa-area-chart', NULL, NULL, NULL),
	(104, 77, 'swagger', '/swagger-ui.html', '', 1, '', NULL, NULL, NULL),
	(105, 97, '系统图标', '/common/ext/icon', '', 1, 'fa fa-info-circle', 2, NULL, NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='角色';

-- 正在导出表  jgh_mall.sys_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
REPLACE INTO `sys_role` (`role_id`, `role_name`, `role_sign`, `remark`, `user_id_create`, `gmt_create`, `gmt_modified`) VALUES
	(1, '超级用户角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59'),
	(59, '管理员', NULL, '基本管理员权限', NULL, NULL, NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_role_menu 结构
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3775 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- 正在导出表  jgh_mall.sys_role_menu 的数据：~78 rows (大约)
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
REPLACE INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES
	(3351, 59, 98),
	(3352, 59, 92),
	(3353, 59, 57),
	(3354, 59, 30),
	(3355, 59, 29),
	(3356, 59, 28),
	(3357, 59, 90),
	(3358, 59, 89),
	(3359, 59, 88),
	(3360, 59, 87),
	(3361, 59, 86),
	(3362, 59, 68),
	(3363, 59, 60),
	(3364, 59, 59),
	(3365, 59, 58),
	(3366, 59, 51),
	(3367, 59, 76),
	(3368, 59, 75),
	(3369, 59, 74),
	(3370, 59, 26),
	(3371, 59, 25),
	(3372, 59, 24),
	(3373, 59, 14),
	(3374, 59, 13),
	(3375, 59, 12),
	(3376, 59, 71),
	(3377, 59, 97),
	(3378, 59, 27),
	(3379, 59, 91),
	(3380, 59, 85),
	(3381, 59, 84),
	(3382, 59, 50),
	(3383, 59, 49),
	(3384, 59, 73),
	(3385, 59, 6),
	(3386, 59, -1),
	(3387, 59, 3),
	(3388, 59, 1),
	(3735, 1, 76),
	(3736, 1, 75),
	(3737, 1, 74),
	(3738, 1, 62),
	(3739, 1, 56),
	(3740, 1, 55),
	(3741, 1, 15),
	(3742, 1, 26),
	(3743, 1, 25),
	(3744, 1, 24),
	(3745, 1, 14),
	(3746, 1, 13),
	(3747, 1, 12),
	(3748, 1, 61),
	(3749, 1, 22),
	(3750, 1, 21),
	(3751, 1, 20),
	(3752, 1, 83),
	(3753, 1, 81),
	(3754, 1, 80),
	(3755, 1, 79),
	(3756, 1, 73),
	(3757, 1, 7),
	(3758, 1, 6),
	(3759, 1, 2),
	(3760, 1, 3),
	(3761, 1, 78),
	(3762, 1, 91),
	(3763, 1, 30),
	(3764, 1, 29),
	(3765, 1, 28),
	(3766, 1, 92),
	(3767, 1, 57),
	(3768, 1, 27),
	(3769, 1, 77),
	(3770, 1, 104),
	(3771, 1, 72),
	(3772, 1, 48),
	(3773, 1, -1),
	(3774, 1, 1);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_task 结构
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE IF NOT EXISTS `sys_task` (
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

-- 正在导出表  jgh_mall.sys_task 的数据：1 rows
/*!40000 ALTER TABLE `sys_task` DISABLE KEYS */;
REPLACE INTO `sys_task` (`id`, `cron_expression`, `method_name`, `is_concurrent`, `description`, `update_by`, `bean_class`, `create_date`, `job_status`, `job_group`, `update_date`, `create_by`, `spring_bean`, `job_name`) VALUES
	(2, '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', NULL, '', 'welcomJob');
/*!40000 ALTER TABLE `sys_task` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
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

-- 正在导出表  jgh_mall.sys_user 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
REPLACE INTO `sys_user` (`user_id`, `username`, `name`, `password`, `dept_id`, `email`, `mobile`, `status`, `user_id_create`, `gmt_create`, `gmt_modified`, `sex`, `birth`, `pic_id`, `live_address`, `hobby`, `province`, `city`, `district`) VALUES
	(1, 'admin', '超级管理员', 'd1e2292b8991e896b272a37e1c9be3ad', 6, 'admin@example.com', '17699999999', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 138, 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区'),
	(2, 'test', '临时用户', '25bb7c42604b0e7aba7bcae50e7762a9', 6, 'test@bootdo.com', NULL, 1, 1, '2017-08-14 13:43:05', '2017-08-14 21:15:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(138, 'bus_admin', '运维管理员', '62d3b2bb1369479e37079a77c23ef1ab', 16, 'bus_admin@163.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_user_plus 结构
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE IF NOT EXISTS `sys_user_plus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  jgh_mall.sys_user_plus 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_user_plus` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_plus` ENABLE KEYS */;

-- 导出  表 jgh_mall.sys_user_role 结构
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- 正在导出表  jgh_mall.sys_user_role 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
REPLACE INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES
	(110, 1, 1),
	(135, 2, 59),
	(138, 138, 59);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
