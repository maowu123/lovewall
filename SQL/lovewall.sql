/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : lovewall

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-05 16:38:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `biaobai1`
-- ----------------------------
DROP TABLE IF EXISTS `biaobai1`;
CREATE TABLE `biaobai1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `lovename` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL COMMENT '性别',
  `department` varchar(50) DEFAULT NULL COMMENT '学院',
  `grade` varchar(50) DEFAULT NULL COMMENT '年级',
  `issuedate` datetime DEFAULT NULL,
  `comtimes` int(10) DEFAULT NULL,
  `liketimes` int(10) DEFAULT NULL,
  `knowtime` varchar(25) DEFAULT NULL COMMENT '认识时间',
  `content` varchar(15000) DEFAULT NULL COMMENT '内容',
  `contentwithouthtml` varchar(255) DEFAULT NULL COMMENT '文本内容',
  `imgUrl` varchar(500) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biaobai1
-- ----------------------------

-- ----------------------------
-- Table structure for `biaobai2`
-- ----------------------------
DROP TABLE IF EXISTS `biaobai2`;
CREATE TABLE `biaobai2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL COMMENT '性别',
  `issuedate` datetime DEFAULT NULL,
  `comtimes` int(10) DEFAULT NULL,
  `liketimes` int(10) DEFAULT NULL,
  `contact` varchar(25) DEFAULT NULL COMMENT '联系方式',
  `content` varchar(15000) DEFAULT NULL COMMENT '内容',
  `contentwithouthtml` varchar(255) DEFAULT NULL COMMENT '文本内容',
  `imgUrl` varchar(500) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biaobai2
-- ----------------------------

-- ----------------------------
-- Table structure for `biaobai3`
-- ----------------------------
DROP TABLE IF EXISTS `biaobai3`;
CREATE TABLE `biaobai3` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `roommateName` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL COMMENT '性别',
  `department` varchar(50) DEFAULT NULL COMMENT '学院',
  `grade` varchar(50) DEFAULT NULL COMMENT '年级',
  `issuedate` datetime DEFAULT NULL,
  `comtimes` int(10) DEFAULT NULL,
  `liketimes` int(10) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `content` varchar(15000) DEFAULT NULL COMMENT '内容',
  `contentwithouthtml` varchar(255) DEFAULT NULL COMMENT '文本内容',
  `imgUrl` varchar(500) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biaobai3
-- ----------------------------

-- ----------------------------
-- Table structure for `biaobai4`
-- ----------------------------
DROP TABLE IF EXISTS `biaobai4`;
CREATE TABLE `biaobai4` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL COMMENT '性别',
  `department` varchar(50) DEFAULT NULL COMMENT '学院',
  `grade` varchar(50) DEFAULT NULL COMMENT '年级',
  `issuedate` datetime DEFAULT NULL,
  `comtimes` int(10) DEFAULT NULL,
  `liketimes` int(10) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL COMMENT '联系方式',
  `characterInfo` varchar(1000) DEFAULT NULL COMMENT '性格',
  `preference` varchar(1000) DEFAULT NULL COMMENT '爱好',
  `address` varchar(255) DEFAULT NULL COMMENT '故乡',
  `favoredType` varchar(1000) DEFAULT NULL COMMENT '喜欢的类型',
  `photo` varchar(255) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biaobai4
-- ----------------------------

-- ----------------------------
-- Table structure for `biaobai5`
-- ----------------------------
DROP TABLE IF EXISTS `biaobai5`;
CREATE TABLE `biaobai5` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `comtimes` int(20) DEFAULT NULL COMMENT '评论数量',
  `liketimes` int(20) DEFAULT NULL COMMENT '点赞',
  `bobject` varchar(255) DEFAULT NULL COMMENT '表白对象',
  `title` varchar(255) NOT NULL,
  `content` varchar(15000) DEFAULT NULL,
  `contentwithouthtml` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `issuedate` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biaobai5
-- ----------------------------

-- ----------------------------
-- Table structure for `t_biaobai`
-- ----------------------------
DROP TABLE IF EXISTS `t_biaobai`;
CREATE TABLE `t_biaobai` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message_id` int(10) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `readed` int(2) DEFAULT NULL,
  `from_uid` int(10) DEFAULT NULL,
  `to_uid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_uid` (`from_uid`),
  KEY `to_uid` (`to_uid`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `t_biaobai_ibfk_1` FOREIGN KEY (`from_uid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_biaobai_ibfk_2` FOREIGN KEY (`to_uid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_biaobai_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `t_message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_biaobai
-- ----------------------------

-- ----------------------------
-- Table structure for `t_famous`
-- ----------------------------
DROP TABLE IF EXISTS `t_famous`;
CREATE TABLE `t_famous` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hisname` varchar(254) DEFAULT NULL,
  `times` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_famous
-- ----------------------------

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `content` text,
  `message_id` int(10) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `readed` int(2) DEFAULT NULL,
  `from_uid` varchar(25) DEFAULT NULL,
  `to_uid` varchar(25) DEFAULT NULL,
  `reply_id` int(10) DEFAULT NULL,
  `kind` int(2) DEFAULT NULL,
  `cansee` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_uid` (`from_uid`),
  KEY `to_uid` (`to_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `type` int(5) unsigned NOT NULL DEFAULT '1' COMMENT '权限（0为管理员，1为普通用户）',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `headphoto` varchar(200) DEFAULT NULL COMMENT '头像',
  `telephone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ号',
  `school` varchar(40) DEFAULT NULL COMMENT '所在学校',
  `college` varchar(40) DEFAULT NULL COMMENT '所在学院',
  `grade` varchar(20) DEFAULT NULL COMMENT '所在年级',
  `birthday` date DEFAULT NULL COMMENT '出生日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20163493', '20163493', '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('20163486', '20163486', '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('20163518', '20163518', '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('stdadmin', 'stdadmin', '0', null, null, null, null, null, null, null, null, null);
