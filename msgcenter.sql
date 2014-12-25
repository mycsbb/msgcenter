/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : msgcenter

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2014-12-24 10:38:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `zhname` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', '3', '张三', '18884000234');

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
INSERT INTO `department` VALUES ('4', '2', '协调处', '10602');
INSERT INTO `department` VALUES ('20', '2', '技术指导处', '10606');
INSERT INTO `department` VALUES ('21', '2', '督查二处', '10605');
INSERT INTO `department` VALUES ('22', '2', '督查一处', '10604');
INSERT INTO `department` VALUES ('24', '2', '复核处', '10607');
INSERT INTO `department` VALUES ('25', '2', '法规处', '10608');
INSERT INTO `department` VALUES ('26', '2', '涉外处', '10609');
INSERT INTO `department` VALUES ('27', '2', '线索中心', '10603');
INSERT INTO `department` VALUES ('28', '27', '线索一处', '1060301');
INSERT INTO `department` VALUES ('29', '27', '线索二处', '1060302');
INSERT INTO `department` VALUES ('30', '27', '线索三处', '1060303');
INSERT INTO `department` VALUES ('31', '2', '其它', '10620');

-- ----------------------------
-- Table structure for `level`
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `position` varchar(255) default NULL,
  `rank` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES ('1', '局长', '1');
INSERT INTO `level` VALUES ('2', '巡视员', '2');
INSERT INTO `level` VALUES ('3', '副局长', '3');
INSERT INTO `level` VALUES ('4', '副巡视员', '4');
INSERT INTO `level` VALUES ('5', '处长', '11');
INSERT INTO `level` VALUES ('6', '调研员', '12');
INSERT INTO `level` VALUES ('7', '副处长', '13');
INSERT INTO `level` VALUES ('8', '副调研员', '14');
INSERT INTO `level` VALUES ('9', '主任科员', '21');
INSERT INTO `level` VALUES ('10', '副主任科员', '22');
INSERT INTO `level` VALUES ('11', '科员', '23');
INSERT INTO `level` VALUES ('12', '文秘', '24');
INSERT INTO `level` VALUES ('100', '其他', '100');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) NOT NULL,
  `receiver` varchar(2000) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '3', '15005059526', 'hello', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('3', '3', '18010151140', 'hello..', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('4', '3', '18010151140', '66666', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('5', '3', '18010151140', '88888', '2014-11-25 10:12:51');
INSERT INTO `message` VALUES ('6', '3', '18010151140', '99999', '2014-11-25 10:12:56');
INSERT INTO `message` VALUES ('7', '3', '18010151140', 'chen', '2014-11-25 10:13:00');
INSERT INTO `message` VALUES ('8', '3', '18010151140', '467677', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('9', '3', '18010151140', '6888', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('10', '3', '18010151140', '78989', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('11', '3', '18010151140', 'vhfjvhfgbg', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('12', '3', '18010151140,13910392825', 'hello', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('13', '3', '18010151140', 'chen', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('14', '3', '18010151140', 'chml;', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('15', '3', '18010151140', 'hello', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('16', '3', '18010151140,13910392825', 'vjfivfjvgtgt', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('17', '3', '18010151140', 'chen', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('18', '3', '18010151140', 'chen...', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('19', '3', '18010151140', 'chen...///', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('20', '3', '18010151140', 'chfvi...', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('21', '3', '18010151140', 'chen....', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('22', '3', '18010151140', 'chenm,.', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('23', '3', '18010151140', 'komllll....', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('27', '3', '18010151140', '香港', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('28', '3', '18010151140', '欢迎你，，', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('29', '3', '18010151140', '对于我这种已参加工作的学习者，只有学习方式、进度、时间和地点等方面与目前工作不相冲突才适合，而中央电大的开放教育就是这样一种能满足我的学习方式。我于2011年秋季报名参加了电大开放教育会计专业专科的学历教育，三年的电大学习，使我获益良多。 学校严格的管理，严明的纪律，良好的校风，为我们营造了优良的学习氛围。在学校的严格要求和辅导老师的悉心指导下，我刻苦学习，遵守校规，依时上课，按时完成课外作业;通过了全部课程考试，完成毕业论文，修完学分。经过电大学习，使我增长了知识，增强了工作能力，提高了思想文化素质。', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('30', '3', '18010151140', 'chen', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('31', '3', '1234,1234,18010151140,1234,1234,1234,1234', '财务会计是一门实务操作性很强的应用性科学，经济管理离不开会计，经济越发展会计工作就显得越重要。经过了三年的电大学习，大大提高了我的政治思想觉悟和科学文化素质。在学期间，我们学习了《邓小平理论和三个代表重要思想》等政治理论课程，加深了对党的政治路线和思想路线有了更深刻理解，为我们今后工作指明了方向。在辅导老师的悉心指导下，我系统地学习了《基础会计学》、《中级财务会计》、《会计电算化》、《成本会计》、《管理会计》等十多门专业课程，使我的专业基础更加扎实，对今后工作有极大的帮助作用 回望过去的日子，不禁让我感慨万千：这一段时光不但充实了自我，而且也让我结交了许多良师益友;这段岁月不仅仅只是难忘，而是让我刻苦铭心。业余学习条件虽然艰苦，但它为我们提供了边学习边实践的机会。在学习中，我注意做到理论联系实际，经常运用学到的理论知识研究分析工作中遇到的问题和矛盾，寻求解决矛盾的方法。毕业后，我将一如既往地做好本职工作，把所学知识运用于工作实践中去，为建设社会多作贡献。', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('32', '3', '19000', 'hello..', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('33', '3', '18010151140,15005059526,13910392825', 'jklkmkn', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('34', '3', '18010151140', '11.20', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('35', '3', '18010151140', '10000', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('36', '3', '18010151140', '3400', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('37', '3', '18010151140,18010151140', '1000', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('38', '3', '18010151140', '4500', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('39', '3', '18010151140,1234', 'chchhjkl2020', '2014-11-25 10:13:25');
INSERT INTO `message` VALUES ('40', '3', '18010151140', '11.25..', '2014-11-25 10:32:17');
INSERT INTO `message` VALUES ('41', '3', '18010151140,15005059526,13910392825,18010151140', 'hello', '2014-11-26 09:54:49');
INSERT INTO `message` VALUES ('42', '3', '18010151140,18010151140', '1126..', '2014-11-26 14:26:18');
INSERT INTO `message` VALUES ('43', '3', '18010151140,18010151140', '13940', '2014-11-26 14:28:42');
INSERT INTO `message` VALUES ('44', '3', '18010151140,18010151140', '7e83784', '2014-11-26 16:40:41');
INSERT INTO `message` VALUES ('45', '3', '18010151140', 'helllll.............', '2014-11-28 14:49:24');
INSERT INTO `message` VALUES ('46', '3', '18010151140', '18898', '2014-11-28 18:48:46');
INSERT INTO `message` VALUES ('47', '3', '18010151140', 'chenn', '2014-11-28 19:11:53');
INSERT INTO `message` VALUES ('48', '3', '18010151140', '1222', '2014-12-22 10:51:14');
INSERT INTO `message` VALUES ('49', '3', '18010151140,1234', '233', '2014-12-22 10:52:12');
INSERT INTO `message` VALUES ('50', '3', '18010151140', '111', '2014-12-22 10:56:42');
INSERT INTO `message` VALUES ('51', '3', '18010151140,1234567,1234', 'cdcdvfv', '2014-12-22 11:00:43');
INSERT INTO `message` VALUES ('52', '3', '18010151140,1234567,1234', '你好品', '2014-12-22 11:00:54');
INSERT INTO `message` VALUES ('53', '42', '18010151140', 'bhml', '2014-12-22 17:50:09');
INSERT INTO `message` VALUES ('54', '42', '18010151140', 'fhvjgb', '2014-12-22 17:51:31');
INSERT INTO `message` VALUES ('55', '3', '18010151140,18811110000', 'hello', '2014-12-24 10:18:53');

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
INSERT INTO `user` VALUES ('3', '20', '100', 'chen', '202cb962ac59075b964b07152d234b70', '陈水宝', '18010151140', '0');
INSERT INTO `user` VALUES ('4', '2', '1', 'ouyangjs', '51a88d6de194796c99efb656ef193779', '欧阳健生', '13911353812', '1');
INSERT INTO `user` VALUES ('5', '2', '3', 'yejw', '51a88d6de194796c99efb656ef193779', '叶锦伟', '13911785680', '1');
INSERT INTO `user` VALUES ('6', '2', '3', 'zhangxx', '51a88d6de194796c99efb656ef193779', '张晓轩', '13910785972', '1');
INSERT INTO `user` VALUES ('7', '24', '5', 'zhangjm', '51a88d6de194796c99efb656ef193779', '张今铭', '13910593946', '1');
INSERT INTO `user` VALUES ('8', '24', '8', 'heliu', '51a88d6de194796c99efb656ef193779', '何柳', '13701162795', '1');
INSERT INTO `user` VALUES ('9', '24', '8', 'zhanglie', '51a88d6de194796c99efb656ef193779', '张列', '13811796522', '1');
INSERT INTO `user` VALUES ('10', '24', '9', 'zhangtao1', '51a88d6de194796c99efb656ef193779', '张涛', '13581823676', '1');
INSERT INTO `user` VALUES ('11', '3', '7', 'peishch', '51a88d6de194796c99efb656ef193779', '斐胜春', '18601189108', '1');
INSERT INTO `user` VALUES ('12', '3', '7', 'kongqy', '51a88d6de194796c99efb656ef193779', '孔庆岩', '13520089542', '1');
INSERT INTO `user` VALUES ('13', '3', '7', 'lisong', '51a88d6de194796c99efb656ef193779', '李松', '15010963772', '1');
INSERT INTO `user` VALUES ('14', '3', '9', 'sunlei1', '51a88d6de194796c99efb656ef193779', '孙雷', '13691516066', '1');
INSERT INTO `user` VALUES ('15', '3', '9', 'wuxin', '51a88d6de194796c99efb656ef193779', '武欣', '13701199075', '1');
INSERT INTO `user` VALUES ('16', '4', '5', 'hankch', '51a88d6de194796c99efb656ef193779', '韩开创', '13910291051', '1');
INSERT INTO `user` VALUES ('17', '4', '9', 'chengdan', '51a88d6de194796c99efb656ef193779', '成丹', '13810122327', '1');
INSERT INTO `user` VALUES ('18', '4', '9', 'chenxue', '51a88d6de194796c99efb656ef193779', '陈雪', '13811297228', '1');
INSERT INTO `user` VALUES ('19', '22', '5', 'wanglu', '51a88d6de194796c99efb656ef193779', '王鲁', '13601038905', '1');
INSERT INTO `user` VALUES ('20', '22', '8', 'liangyue', '51a88d6de194796c99efb656ef193779', '梁跃', '13581780662', '1');
INSERT INTO `user` VALUES ('21', '22', '8', 'chenqm', '51a88d6de194796c99efb656ef193779', '陈秋梅', '13810109280', '1');
INSERT INTO `user` VALUES ('22', '21', '5', 'wuqian', '51a88d6de194796c99efb656ef193779', '吴茜', '13801281496', '1');
INSERT INTO `user` VALUES ('23', '21', '8', 'sun_lei', '51a88d6de194796c99efb656ef193779', '孙磊', '13681254543', '1');
INSERT INTO `user` VALUES ('24', '21', '8', 'cuiqian', '51a88d6de194796c99efb656ef193779', '崔倩', '18601189121', '1');
INSERT INTO `user` VALUES ('25', '20', '5', 'shiwm', '51a88d6de194796c99efb656ef193779', '史文明', '13501234679', '1');
INSERT INTO `user` VALUES ('26', '20', '100', 'wangxiaoxin', '51a88d6de194796c99efb656ef193779', '王晓新', '13910392825', '1');
INSERT INTO `user` VALUES ('27', '20', '100', 'chenming1', '51a88d6de194796c99efb656ef193779', '陈明', '15005059526', '1');
INSERT INTO `user` VALUES ('28', '20', '100', 'xuyh', '51a88d6de194796c99efb656ef193779', '许玉欢', '18033066570', '1');
INSERT INTO `user` VALUES ('29', '25', '7', 'zhangjb', '51a88d6de194796c99efb656ef193779', '张杰斌', '13810577067', '1');
INSERT INTO `user` VALUES ('30', '26', '5', 'pengjing', '51a88d6de194796c99efb656ef193779', '彭晶', '13910535162', '1');
INSERT INTO `user` VALUES ('31', '26', '8', 'li_na', '51a88d6de194796c99efb656ef193779', '李娜', '15010959426', '1');
INSERT INTO `user` VALUES ('32', '26', '100', 'wangjiac', '51a88d6de194796c99efb656ef193779', '王嘉诚', '13611265567', '1');
INSERT INTO `user` VALUES ('33', '26', '100', 'songrh', '51a88d6de194796c99efb656ef193779', '宋若菡', '15011419892', '1');
INSERT INTO `user` VALUES ('34', '25', '9', 'xuchm', '51a88d6de194796c99efb656ef193779', '许春茂', '13810260202', '1');
INSERT INTO `user` VALUES ('37', '28', '5', 'sunling', '51a88d6de194796c99efb656ef193779', '孙凌', '13601189081', '1');
INSERT INTO `user` VALUES ('38', '28', '8', 'yang_xiao', '51a88d6de194796c99efb656ef193779', '杨潇', '18601189018', '1');
INSERT INTO `user` VALUES ('39', '28', '8', 'zhaohang', '51a88d6de194796c99efb656ef193779', '赵航', '15810052188', '1');
INSERT INTO `user` VALUES ('40', '29', '6', 'chenjie', '40482657f8e444fb928da14dabc13c97', '王捷', '13910568632', '1');
INSERT INTO `user` VALUES ('41', '29', '8', 'wangdun', '51a88d6de194796c99efb656ef193779', '王敦', '13910261707', '1');
INSERT INTO `user` VALUES ('42', '30', '7', 'yaoml', '51a88d6de194796c99efb656ef193779', '姚明利', '13520289545', '1');
INSERT INTO `user` VALUES ('43', '30', '8', 'liujing1', '51a88d6de194796c99efb656ef193779', '刘静', '13522716970', '1');
INSERT INTO `user` VALUES ('44', '2', '4', 'wangxx', '51a88d6de194796c99efb656ef193779', '王修祥', '13501100966', '1');
