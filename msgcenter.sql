/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : msgcenter

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2014-10-29 18:00:08
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
  `receiver` varchar(2000) NOT NULL,
  `content` varchar(3000) NOT NULL,
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
INSERT INTO `message` VALUES ('12', 'chen1', '18010151140,13910392825', 'hello', '2014-10-24 15:22:02');
INSERT INTO `message` VALUES ('13', 'chen1', '18010151140', 'chen', '2014-10-27 11:58:36');
INSERT INTO `message` VALUES ('14', 'chen1', '18010151140', 'chml;', '2014-10-27 11:59:42');
INSERT INTO `message` VALUES ('15', 'chen1', '18010151140', 'hello', '2014-10-27 16:06:20');
INSERT INTO `message` VALUES ('16', 'chen1', '18010151140,13910392825', 'vjfivfjvgtgt', '2014-10-27 17:09:32');
INSERT INTO `message` VALUES ('17', 'chen1', '18010151140', 'chen', '2014-10-27 17:18:52');
INSERT INTO `message` VALUES ('18', 'chen1', '18010151140', 'chen...', '2014-10-28 09:29:39');
INSERT INTO `message` VALUES ('19', 'chen1', '18010151140', 'chen...///', '2014-10-28 09:30:01');
INSERT INTO `message` VALUES ('20', 'chen1', '18010151140', 'chfvi...', '2014-10-28 09:31:48');
INSERT INTO `message` VALUES ('21', 'chen1', '18010151140', 'chen....', '2014-10-28 09:37:23');
INSERT INTO `message` VALUES ('22', 'chen1', '18010151140', 'chenm,.', '2014-10-28 09:38:23');
INSERT INTO `message` VALUES ('23', 'chen1', '18010151140', 'komllll....', '2014-10-28 09:38:40');
INSERT INTO `message` VALUES ('27', 'chen1', '18010151140', '香港', '2014-10-28 12:37:54');
INSERT INTO `message` VALUES ('28', 'chen1', '18010151140', '欢迎你，，', '2014-10-28 12:43:52');
INSERT INTO `message` VALUES ('29', 'chen1', '18010151140', '对于我这种已参加工作的学习者，只有学习方式、进度、时间和地点等方面与目前工作不相冲突才适合，而中央电大的开放教育就是这样一种能满足我的学习方式。我于2011年秋季报名参加了电大开放教育会计专业专科的学历教育，三年的电大学习，使我获益良多。 学校严格的管理，严明的纪律，良好的校风，为我们营造了优良的学习氛围。在学校的严格要求和辅导老师的悉心指导下，我刻苦学习，遵守校规，依时上课，按时完成课外作业;通过了全部课程考试，完成毕业论文，修完学分。经过电大学习，使我增长了知识，增强了工作能力，提高了思想文化素质。', '2014-10-28 12:48:02');
INSERT INTO `message` VALUES ('30', 'chen1', '18010151140', 'chen', '2014-10-28 15:41:04');
INSERT INTO `message` VALUES ('31', 'chen1', '1234,1234,18010151140,1234,1234,1234,1234', '财务会计是一门实务操作性很强的应用性科学，经济管理离不开会计，经济越发展会计工作就显得越重要。经过了三年的电大学习，大大提高了我的政治思想觉悟和科学文化素质。在学期间，我们学习了《邓小平理论和三个代表重要思想》等政治理论课程，加深了对党的政治路线和思想路线有了更深刻理解，为我们今后工作指明了方向。在辅导老师的悉心指导下，我系统地学习了《基础会计学》、《中级财务会计》、《会计电算化》、《成本会计》、《管理会计》等十多门专业课程，使我的专业基础更加扎实，对今后工作有极大的帮助作用 回望过去的日子，不禁让我感慨万千：这一段时光不但充实了自我，而且也让我结交了许多良师益友;这段岁月不仅仅只是难忘，而是让我刻苦铭心。业余学习条件虽然艰苦，但它为我们提供了边学习边实践的机会。在学习中，我注意做到理论联系实际，经常运用学到的理论知识研究分析工作中遇到的问题和矛盾，寻求解决矛盾的方法。毕业后，我将一如既往地做好本职工作，把所学知识运用于工作实践中去，为建设社会多作贡献。', '2014-10-28 16:44:49');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `departId` int(11) default NULL,
  `levelId` int(11) default NULL,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `zhname` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `role` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2', '1', 'ouyang', '123', '欧阳健生', '1234', '1');
INSERT INTO `user` VALUES ('2', '2', '2', 'honglei', '123', '洪磊', '1234', '1');
INSERT INTO `user` VALUES ('3', '7', '100', 'chen1', '123', '陈水宝', '18010151140', '0');
INSERT INTO `user` VALUES ('4', '7', '100', 'chen2', '123', '陈明', '15005059526', '1');
INSERT INTO `user` VALUES ('5', '4', '4', 'sunling', '123', '孙凌', '1234', '1');
INSERT INTO `user` VALUES ('6', '3', '6', 'peishengchun', '123', '斐胜春', '1234', '1');
INSERT INTO `user` VALUES ('7', '5', '4', 'wanglu', '123', '王鲁', '1234', '1');
INSERT INTO `user` VALUES ('8', '6', '4', 'wuqian', '123', '吴茜', '1234', '1');
INSERT INTO `user` VALUES ('9', '7', '4', 'xiaoxin', '123', '王晓新', '13910392825', '1');
