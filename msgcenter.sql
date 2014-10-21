/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : msgcenter

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2014-10-20 23:48:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `name` varchar(255) default NULL,
  `rank` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '0', '中国证监会', '1');
INSERT INTO `department` VALUES ('2', '1', '稽查局', '106');
INSERT INTO `department` VALUES ('3', '2', '综合处', '10601');
INSERT INTO `department` VALUES ('4', '2', '立案处', '10602');
INSERT INTO `department` VALUES ('5', '2', '督查一处', '10603');
INSERT INTO `department` VALUES ('6', '2', '督查二处', '10604');
INSERT INTO `department` VALUES ('7', '2', '技术指导处', '10609');

-- ----------------------------
-- Table structure for `level`
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id` int(11) NOT NULL auto_increment,
  `position` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES ('1', '局长');
INSERT INTO `level` VALUES ('2', '巡视员');
INSERT INTO `level` VALUES ('3', '副局长');
INSERT INTO `level` VALUES ('4', '处长');
INSERT INTO `level` VALUES ('5', '调研员');
INSERT INTO `level` VALUES ('6', '副处长');
INSERT INTO `level` VALUES ('7', '副调研员');
INSERT INTO `level` VALUES ('8', '主任科员');
INSERT INTO `level` VALUES ('9', '副主任科员');
INSERT INTO `level` VALUES ('10', '科员');
INSERT INTO `level` VALUES ('100', '无职务');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `departId` int(11) default NULL,
  `levelId` int(11) default NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `zhname` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2', '1', 'ouyang', '123', '欧阳健生', '123');
INSERT INTO `user` VALUES ('2', '2', '2', 'honglei', '123', '洪磊', '1234');
INSERT INTO `user` VALUES ('3', '7', '100', 'chen1', '123', '陈水宝', '18010151140');
INSERT INTO `user` VALUES ('4', '7', '100', 'chen2', '123', '陈某某', '18010156352');
