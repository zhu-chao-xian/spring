/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50614
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50614
 File Encoding         : 65001

 Date: 31/03/2020 17:53:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `goods_brand`;
CREATE TABLE `goods_brand`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_safeguard
-- ----------------------------
DROP TABLE IF EXISTS `goods_safeguard`;
CREATE TABLE `goods_safeguard`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `safeguard_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保障名称',
  `price` decimal(9, 2) NOT NULL COMMENT '保障价格',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '增值保障' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编号,唯一',
  `sku_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称(冗余spu_name)',
  `price` decimal(9, 2) NOT NULL COMMENT '售价',
  `stock` int(11) NOT NULL COMMENT '库存',
  `shop_id` bigint(20) NOT NULL COMMENT '商铺id,为0表示自营',
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_sku_safeguard
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_safeguard`;
CREATE TABLE `goods_sku_safeguard`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `safeguard_id` bigint(20) NOT NULL COMMENT 'safeguard_id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku增值保障' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_sku_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_spec_value`;
CREATE TABLE `goods_sku_spec_value`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `spec_value_id` bigint(20) NOT NULL COMMENT '规格值id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku规格值' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `goods_spec`;
CREATE TABLE `goods_spec`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spec_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格编号',
  `spec_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '规格表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_spec_value`;
CREATE TABLE `goods_spec_value`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spec_id` bigint(20) NOT NULL COMMENT '规格id',
  `spec_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格值',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '规格值表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_spu
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu`;
CREATE TABLE `goods_spu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spu_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号，唯一',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `low_price` decimal(9, 2) NOT NULL COMMENT '最低售价',
  `category_id` bigint(20) NOT NULL COMMENT '分类id',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_spu_no`(`spu_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods_spu_spec
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_spec`;
CREATE TABLE `goods_spu_spec`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) NOT NULL COMMENT 'spu_id',
  `spec_id` bigint(20) NOT NULL COMMENT 'spec_id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu规格表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for member_certification
-- ----------------------------
DROP TABLE IF EXISTS `member_certification`;
CREATE TABLE `member_certification`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `clan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名族',
  `birth_date` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出生日期',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `card_id` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `id_issuing_authority` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证签发机关',
  `id_card_validity_period` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证有效期限',
  `face_comparison_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人脸比对分数',
  `face_picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人脸图片',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for member_info
-- ----------------------------
DROP TABLE IF EXISTS `member_info`;
CREATE TABLE `member_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `iPhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `e_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar_url` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像url',
  `register_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `address_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '默认收获地址id',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for member_shopping_address
-- ----------------------------
DROP TABLE IF EXISTS `member_shopping_address`;
CREATE TABLE `member_shopping_address`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detailed_address` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `contact_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `adress_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址手机号',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shop_info
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `gmt_update` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
