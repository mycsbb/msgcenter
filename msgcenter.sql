/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : msgcenter

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2014-10-23 17:56:52
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
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'chen1', '15005059526', 'hello', '2014-10-23 15:37:20');
INSERT INTO `message` VALUES ('3', '180010', '18010151140', 'hello..', '2014-10-23 15:13:06');
INSERT INTO `message` VALUES ('4', '18010151140', '18010151140', '66666', '2014-10-22 17:34:17');
INSERT INTO `message` VALUES ('5', 'chen1', '18010151140', '88888', '2014-10-22 17:46:56');
INSERT INTO `message` VALUES ('6', 'chen1', '18010151140', '99999', '2014-10-22 17:47:49');
INSERT INTO `message` VALUES ('7', 'chen1', '18010151140', 'chen', '2014-10-23 15:40:54');
INSERT INTO `message` VALUES ('8', 'chen1', '18010151140', '467677', '2014-10-23 15:50:09');
INSERT INTO `message` VALUES ('9', 'chen1', '18010151140', '6888', '2014-10-23 15:53:50');
INSERT INTO `message` VALUES ('10', 'chen1', '18010151140', '78989', '2014-10-23 15:55:33');
INSERT INTO `message` VALUES ('11', 'chen1', '18010151140', 'vhfjvhfgbg', '2014-10-23 15:57:55');

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
INSERT INTO `user` VALUES ('1', '2', '1', 'ouyang', '123', '欧阳健生', '1234');
INSERT INTO `user` VALUES ('2', '2', '2', 'honglei', '123', '洪磊', '1234');
INSERT INTO `user` VALUES ('3', '7', '100', 'chen1', '12', '陈水宝', '18010151140');
INSERT INTO `user` VALUES ('4', '7', '100', 'chen2', '123', '陈明', '15005059526');
INSERT INTO `user` VALUES ('5', '4', '4', 'sunling', '123', '孙凌', '1234');
INSERT INTO `user` VALUES ('6', '3', '6', 'peishengchun', '123', '斐胜春', '1234');
INSERT INTO `user` VALUES ('7', '5', '4', 'wanglu', '123', '王鲁', '1234');
INSERT INTO `user` VALUES ('8', '6', '4', 'wuqian', '123', '吴茜', '1234');
