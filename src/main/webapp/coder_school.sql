/*
Navicat MySQL Data Transfer

Source Server         : 范德萨发的
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : coder_school

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-18 11:33:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(64) NOT NULL DEFAULT '',
  `admin_pwd` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------

-- ----------------------------
-- Table structure for follow_info
-- ----------------------------
DROP TABLE IF EXISTS `follow_info`;
CREATE TABLE `follow_info` (
  `follow_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) NOT NULL DEFAULT '0',
  `followee_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`follow_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow_info
-- ----------------------------

-- ----------------------------
-- Table structure for section_info
-- ----------------------------
DROP TABLE IF EXISTS `section_info`;
CREATE TABLE `section_info` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) NOT NULL DEFAULT '',
  `section_desc` varchar(600) NOT NULL DEFAULT '',
  `section_parent_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section_info
-- ----------------------------
INSERT INTO `section_info` VALUES ('1', '问与答', '问与答', '-1');
INSERT INTO `section_info` VALUES ('2', '技术分享', '技术分享', '-1');
INSERT INTO `section_info` VALUES ('3', '程序员', '程序员', '-1');
INSERT INTO `section_info` VALUES ('4', '分享创造', '分享创造', '-1');
INSERT INTO `section_info` VALUES ('5', '分享发现', '分享发现', '-1');
INSERT INTO `section_info` VALUES ('6', 'java', 'java', '-1');
INSERT INTO `section_info` VALUES ('7', 'htmlcss', 'htmlcss', '-1');
INSERT INTO `section_info` VALUES ('8', 'javascript', 'javascript', '-1');

-- ----------------------------
-- Table structure for taginfo
-- ----------------------------
DROP TABLE IF EXISTS `taginfo`;
CREATE TABLE `taginfo` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL DEFAULT '',
  `tag_desc` varchar(600) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taginfo
-- ----------------------------
INSERT INTO `taginfo` VALUES ('1', 'java', 'java');
INSERT INTO `taginfo` VALUES ('2', 'javascript', 'javascript');

-- ----------------------------
-- Table structure for tag_topic_info
-- ----------------------------
DROP TABLE IF EXISTS `tag_topic_info`;
CREATE TABLE `tag_topic_info` (
  `tag_topic_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_topic_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag_topic_info
-- ----------------------------
INSERT INTO `tag_topic_info` VALUES ('1', '796', '2');
INSERT INTO `tag_topic_info` VALUES ('2', '796', '1');

-- ----------------------------
-- Table structure for tag_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tag_user_info`;
CREATE TABLE `tag_user_info` (
  `tag_user_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_user_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for topic_comment_info
-- ----------------------------
DROP TABLE IF EXISTS `topic_comment_info`;
CREATE TABLE `topic_comment_info` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_content` longtext NOT NULL,
  `comment_markdown_content` longtext NOT NULL,
  `comment_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `topic_id` int(11) NOT NULL DEFAULT '-1',
  `reply_comment_id` int(11) NOT NULL DEFAULT '-1',
  `user_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_comment_info
-- ----------------------------
INSERT INTO `topic_comment_info` VALUES ('1', '<p>8888</p>\r\n', '8888', '2018-02-20 13:52:44', '2', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('2', '<p>yyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuiiiiiiiiiiiiiiiiiiiiiiooooooooooooo</p>\r\n', 'yyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuiiiiiiiiiiiiiiiiiiiiiiooooooooooooo', '2018-02-20 13:55:30', '2', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('3', '<p>cxzcxz</p>\r\n', 'cxzcxz', '2018-02-20 14:05:47', '4', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('4', '<p>sadsdadas</p>\r\n', 'sadsdadas', '2018-02-20 14:06:15', '4', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('5', '<p>dsffdsdf</p>\r\n', 'dsffdsdf', '2018-02-20 14:13:58', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('6', '<p>sda</p>\r\n', 'sda', '2018-02-20 14:14:52', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('7', '<p>dfs</p>\r\n', 'dfs', '2018-02-20 14:15:23', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('8', '<p>dfs</p>\r\n', 'dfs', '2018-02-20 14:16:48', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('9', '<p>dsadsa</p>\r\n', 'dsadsa', '2018-02-20 14:28:07', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('10', '<p>sddss</p>\r\n', 'sddss', '2018-02-20 14:32:33', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('11', '<p>lkjlkjjlk</p>\r\n', 'lkjlkjjlk', '2018-02-20 14:34:40', '4', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('12', 'jhgjhgjhgjh', '', '2018-02-20 14:34:52', '4', '11', '1');
INSERT INTO `topic_comment_info` VALUES ('13', 'fdsfdsfd\r\nfdsfsdf\r\nfsdfdsdf', '', '2018-02-20 14:35:54', '4', '11', '1');
INSERT INTO `topic_comment_info` VALUES ('14', '<p>nnnnnnnnnnn</p>\r\n', 'nnnnnnnnnnn', '2018-02-20 15:10:38', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('15', '<p>zzzzzzzzzzzzzzzz</p>\r\n', 'zzzzzzzzzzzzzzzz', '2018-02-20 15:14:41', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('16', '<p>dsada<br>dsadsa<br>222\r\n', 'dsada\r\ndsadsa\r\n222\r\n\r\n', '2018-02-20 15:15:18', '1', '15', '1');
INSERT INTO `topic_comment_info` VALUES ('17', '<p>sddddd</p>\r\n', 'sddddd', '2018-02-20 15:17:15', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('18', '<p>噢噢噢噢</p>\r\n', '噢噢噢噢', '2018-02-20 15:18:25', '1', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('19', '<p>对方水电费是</p>\r\n', '对方水电费是', '2018-02-20 15:19:40', '3', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('20', '<p>发的所发生的</p>\r\n', '发的所发生的', '2018-02-20 15:19:46', '3', '19', '1');
INSERT INTO `topic_comment_info` VALUES ('21', '<p>孤鸿寡鹄</p>\r\n', '孤鸿寡鹄', '2018-02-20 15:20:10', '3', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('22', '<p>九号公馆好吧</p>\r\n', '九号公馆好吧', '2018-02-20 15:20:20', '3', '21', '1');
INSERT INTO `topic_comment_info` VALUES ('23', '<p>有人讨厌他人</p>\r\n', '有人讨厌他人', '2018-02-20 15:20:41', '3', '19', '1');
INSERT INTO `topic_comment_info` VALUES ('24', '<p>编程序持续性</p>\r\n', '编程序持续性', '2018-02-20 15:23:04', '3', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('25', '<p>对方水电费是</p>\r\n', '对方水电费是', '2018-02-20 15:23:10', '3', '24', '1');
INSERT INTO `topic_comment_info` VALUES ('26', '<p>额外翁翁</p>\r\n', '额外翁翁', '2018-02-20 15:23:26', '3', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('27', '<p>对方水电费是缩短</p>\r\n', '对方水电费是缩短', '2018-02-20 15:23:32', '3', '26', '1');
INSERT INTO `topic_comment_info` VALUES ('28', '<p>大萨达撒</p>\r\n', '大萨达撒', '2018-02-20 15:23:40', '3', '24', '1');
INSERT INTO `topic_comment_info` VALUES ('29', '<p>我是第一条评论，评论主题的</p>\r\n', '我是第一条评论，评论主题的', '2018-02-20 20:34:22', '5', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('30', '<p>我是回复第一条评论，评论回复的</p>\r\n', '我是回复第一条评论，评论回复的', '2018-02-20 20:34:53', '5', '29', '1');
INSERT INTO `topic_comment_info` VALUES ('31', '<p>我是回复第一条评论，评论回复的2</p>\r\n', '我是回复第一条评论，评论回复的2', '2018-02-20 20:35:20', '5', '29', '1');
INSERT INTO `topic_comment_info` VALUES ('32', '<p>我是回复第一条评论的评论的，评论回复的</p>\r\n', '我是回复第一条评论的评论的，评论回复的', '2018-02-20 20:35:48', '5', '29', '1');
INSERT INTO `topic_comment_info` VALUES ('33', '<p>我是第一条评论，评论主题的</p>\r\n', '我是第一条评论，评论主题的', '2018-02-20 20:42:33', '7', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('34', '<p>我是第2条评论，评论评论的</p>\r\n', '我是第2条评论，评论评论的', '2018-02-20 20:42:51', '7', '33', '1');
INSERT INTO `topic_comment_info` VALUES ('35', '<p>我是第3条评论，评论2的</p>\r\n', '我是第3条评论，评论2的', '2018-02-20 20:43:14', '7', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('36', '<p>我是第4条评论，评论2的</p>\r\n', '我是第4条评论，评论2的', '2018-02-20 20:43:34', '7', '33', '1');
INSERT INTO `topic_comment_info` VALUES ('37', '<p>我是第5条评论，评论3的</p>\r\n', '我是第5条评论，评论3的', '2018-02-20 20:43:50', '7', '35', '1');
INSERT INTO `topic_comment_info` VALUES ('38', '<p>我是第6条评论，评论2的</p>\r\n', '我是第6条评论，评论2的', '2018-02-20 20:44:18', '7', '33', '1');
INSERT INTO `topic_comment_info` VALUES ('39', '<p>我是第6条评论，评论主题的</p>\r\n', '我是第6条评论，评论主题的', '2018-02-20 20:44:38', '7', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('40', '<p>hggfhgfhgf</p>\r\n', 'hggfhgfhgf', '2018-02-21 08:39:27', '9', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('41', '<p>fds</p>\r\n', 'fds', '2018-02-21 08:39:37', '9', '40', '1');
INSERT INTO `topic_comment_info` VALUES ('42', '<p>uuuuuuu</p>\r\n', 'uuuuuuu', '2018-02-21 08:39:47', '9', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('43', '<p>fsddfs</p>\r\n', 'fsddfs', '2018-02-21 08:39:54', '9', '40', '1');
INSERT INTO `topic_comment_info` VALUES ('44', '<p>fdsfd</p>\r\n', 'fdsfd', '2018-02-21 08:48:19', '8', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('45', '<p>dsfds</p>\r\n', 'dsfds', '2018-02-21 08:48:43', '8', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('46', '<p>dfs</p>\r\n', 'dfs', '2018-02-21 08:51:00', '8', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('47', '<p>hhhhhhhhhhhhh</p>\r\n', 'hhhhhhhhhhhhh', '2018-02-21 08:58:24', '2', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('48', '<p>999999999</p>\r\n', '999999999', '2018-02-21 08:58:38', '2', '1', '1');
INSERT INTO `topic_comment_info` VALUES ('49', '<p>0000000000000<br>66666666666666\r\n', '0000000000000\r\n66666666666666', '2018-02-21 08:58:53', '2', '1', '1');
INSERT INTO `topic_comment_info` VALUES ('50', '<p><img src=\"/upload\\fe1d3e5c-27b3-41bb-b303-7c780467ce85.jpg\" alt=\"image.png\">\r\n', '\r\n![image.png](/upload\\fe1d3e5c-27b3-41bb-b303-7c780467ce85.jpg)', '2018-02-21 08:59:29', '2', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('51', '<p><img src=\"/upload\\1d9cefa3-1fbf-446b-bb2c-b3098a45fe34.jpg\" alt=\"image.png\">\r\n', '\r\n![image.png](/upload\\1d9cefa3-1fbf-446b-bb2c-b3098a45fe34.jpg)', '2018-02-21 08:59:50', '2', '1', '1');
INSERT INTO `topic_comment_info` VALUES ('52', '<p>fdsfsd</p>\r\n', 'fdsfsd', '2018-02-21 09:02:49', '9', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('53', '<p>tttttttttt</p>\r\n', 'tttttttttt', '2018-02-21 09:02:55', '9', '42', '1');
INSERT INTO `topic_comment_info` VALUES ('54', '<p>dfsdffffffffff</p>\r\n', 'dfsdffffffffff', '2018-02-21 09:03:08', '9', '42', '1');
INSERT INTO `topic_comment_info` VALUES ('55', '<p>sfd</p>\r\n', 'sfd', '2018-02-21 09:30:59', '5', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('56', '<p>fdsfsd</p>\r\n', 'fdsfsd', '2018-02-21 09:31:19', '5', '29', '2');
INSERT INTO `topic_comment_info` VALUES ('57', '<p>对方身份的</p>\r\n', '对方身份的', '2018-02-21 10:42:28', '5', '55', '1');
INSERT INTO `topic_comment_info` VALUES ('58', '<p>范德萨范德萨</p>\r\n', '范德萨范德萨', '2018-02-21 10:42:38', '5', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('59', '<p>发的所发生的</p>\r\n', '发的所发生的', '2018-02-21 11:03:55', '9', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('60', '<p>反倒是电风扇</p>\r\n', '反倒是电风扇', '2018-02-21 11:04:17', '9', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('61', '<p>集合刚刚好</p>\r\n', '集合刚刚好', '2018-02-21 11:04:30', '9', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('62', '<p>认为热无若翁</p>\r\n', '认为热无若翁', '2018-02-21 11:07:10', '11', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('63', '<p>认为热无若翁</p>\r\n', '认为热无若翁', '2018-02-21 11:07:35', '11', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('64', '<p>gdgddf</p>\r\n', 'gdgddf', '2018-02-21 11:10:08', '11', '62', '2');
INSERT INTO `topic_comment_info` VALUES ('65', '<p>fssfd</p>\r\n', 'fssfd', '2018-02-21 11:10:29', '11', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('66', '<p>gfddgrte</p>\r\n', 'gfddgrte', '2018-02-21 11:11:06', '2', '1', '2');
INSERT INTO `topic_comment_info` VALUES ('67', '<p><a href=\"https://github.com/bbb\" title=\"@bbb\" class=\"at-link\">@bbb</a> 东方闪电</p>\r\n', '@bbb 东方闪电', '2018-02-21 11:21:24', '11', '62', '1');
INSERT INTO `topic_comment_info` VALUES ('68', '<p><a href=\"https://github.com/ttt\" title=\"@ttt\" class=\"at-link\">@ttt</a> 范德萨</p>\r\n', '@ttt 范德萨\r\n', '2018-02-21 11:22:16', '11', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('69', '<p>to:bbb 防晒霜的</p>\r\n', 'to:bbb 防晒霜的', '2018-02-21 11:24:12', '11', '62', '1');
INSERT INTO `topic_comment_info` VALUES ('70', '<p>股份等多个</p>\r\n', '股份等多个', '2018-02-21 11:29:27', '11', '62', '1');
INSERT INTO `topic_comment_info` VALUES ('71', '<p>to:aaa 发生的发生</p>\r\n', 'to:aaa 发生的发生', '2018-02-21 11:29:50', '11', '62', '1');
INSERT INTO `topic_comment_info` VALUES ('72', '<p>@对对对 发生的发生</p>\r\n', '@对对对 发生的发生', '2018-02-21 11:32:47', '10', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('73', '<p>萨达</p>\r\n', '萨达', '2018-02-21 11:32:57', '10', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('74', '<p><a href=\"https://github.com/ddd\" title=\"@ddd\" class=\"at-link\">@ddd</a> 电风扇</p>\r\n', '@ddd 电风扇', '2018-02-21 11:33:12', '10', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('75', '<p><a href=\"https://github.com/bbb\" title=\"@bbb\" class=\"at-link\">@bbb</a> 范德萨</p>\r\n', '@bbb 范德萨', '2018-02-21 11:33:31', '10', '73', '1');
INSERT INTO `topic_comment_info` VALUES ('76', '<h1 id=\"h1-eee-\"><a name=\"eee 范德萨\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>eee 范德萨</h1>', '#eee 范德萨', '2018-02-21 11:33:52', '10', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('77', '<p>发送到对方是</p>\r\n', '发送到对方是', '2018-02-21 11:37:20', '12', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('78', '<p>发送到第三方</p>\r\n', '发送到第三方', '2018-02-21 11:37:40', '12', '77', '2');
INSERT INTO `topic_comment_info` VALUES ('79', '<p>to:bbb 范德萨缩短发</p>\r\n', 'to:bbb 范德萨缩短发', '2018-02-21 11:37:56', '12', '77', '1');
INSERT INTO `topic_comment_info` VALUES ('80', '<p>繁琐大水电费</p>\r\n', '繁琐大水电费', '2018-02-21 11:38:09', '12', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('81', '<p>对方水电费</p>\r\n', '对方水电费', '2018-02-21 11:38:20', '12', '80', '1');
INSERT INTO `topic_comment_info` VALUES ('82', '<p>大大</p>\r\n', '大大', '2018-02-21 12:18:13', '12', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('83', '<p><a href=\"/user/aaa\" title=\"@aaa\" class=\"at-link\">@aaa</a> fdsdf</p>\r\n', '@aaa fdsdf', '2018-02-22 10:00:27', '5', '29', '1');
INSERT INTO `topic_comment_info` VALUES ('84', '<p>kljkjkjjk</p>\r\n', 'kljkjkjjk', '2018-02-22 10:57:08', '15', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('85', '<p>fgd</p>\r\n', 'fgd', '2018-02-22 10:57:15', '15', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('86', '<p>kljkjkjjk</p>\r\n', 'kljkjkjjk', '2018-02-22 10:57:29', '15', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('87', '<p><a href=\"/user/aaa\" title=\"@aaa\" class=\"at-link\">@aaa</a> dsadsa</p>\r\n', '@aaa dsadsa', '2018-02-22 10:57:59', '10', '73', '2');
INSERT INTO `topic_comment_info` VALUES ('88', '<p>dfssdf</p>\r\n', 'dfssdf', '2018-02-22 10:58:16', '10', '72', '2');
INSERT INTO `topic_comment_info` VALUES ('89', '<p><a href=\"/user/aaaretrefds\" title=\"@aaaretrefds\" class=\"at-link\">@aaaretrefds</a></p>\r\n', '@aaaretrefds', '2018-02-22 10:58:43', '3', '19', '2');
INSERT INTO `topic_comment_info` VALUES ('90', '<p>范德萨</p>\r\n', '范德萨', '2018-02-22 11:00:27', '17', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('91', '<p>东方闪电</p>\r\n', '东方闪电', '2018-02-22 11:00:33', '17', '90', '1');
INSERT INTO `topic_comment_info` VALUES ('92', '<p>第三方<a href=\"/user/aaa\" title=\"@aaa\" class=\"at-link\">@aaa</a></p>\r\n', '第三方@aaa', '2018-02-22 11:00:43', '17', '90', '1');
INSERT INTO `topic_comment_info` VALUES ('93', '<p>44444</p>\r\n', '44444', '2018-02-22 11:01:26', '15', '84', '2');
INSERT INTO `topic_comment_info` VALUES ('94', '<p><a href=\"/user/bbb\" title=\"@bbb\" class=\"at-link\">@bbb</a> fdsfsd</p>\r\n', '@bbb fdsfsd', '2018-02-22 11:01:37', '15', '84', '2');
INSERT INTO `topic_comment_info` VALUES ('95', '<p>fdsdf</p>', '', '2018-04-16 17:19:35', '796', '0', '1');
INSERT INTO `topic_comment_info` VALUES ('96', '<p>tttt</p>', '', '2018-04-16 17:22:40', '796', '0', '2');
INSERT INTO `topic_comment_info` VALUES ('97', '7777<a href=\"/user/home/2\"></a>', '', '2018-04-16 17:22:47', '796', '95', '2');
INSERT INTO `topic_comment_info` VALUES ('98', 'eew<a href=\"/user/home/2\"></a>', '', '2018-04-16 17:23:01', '796', '95', '2');
INSERT INTO `topic_comment_info` VALUES ('99', '<a href=\"/user/home/1\">@bbb</a>&nbsp;fdsfd', '', '2018-04-16 17:23:31', '796', '95', '1');

-- ----------------------------
-- Table structure for topic_info
-- ----------------------------
DROP TABLE IF EXISTS `topic_info`;
CREATE TABLE `topic_info` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_title` varchar(200) NOT NULL DEFAULT '',
  `topic_content` longtext NOT NULL,
  `topic_markdown_content` longtext NOT NULL,
  `topic_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `section_id` int(11) NOT NULL DEFAULT '-1',
  `user_id` int(11) NOT NULL DEFAULT '-1',
  `love_num` int(11) NOT NULL DEFAULT '0',
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `is_publish` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=797 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic_info
-- ----------------------------
INSERT INTO `topic_info` VALUES ('787', '同仁堂', '<p>同仁堂</p>\r\n', '同仁堂', '2018-04-11 13:07:57', '-1', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('788', '同仁堂', '<p>同仁堂</p>\r\n', '同仁堂', '2018-04-11 13:10:24', '-1', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('789', '电风扇', '<p>反倒是三大</p>\r\n', '反倒是三大', '2018-04-11 13:12:17', '2', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('790', '第三方', '<p>反倒是三大发</p>\r\n', '反倒是三大发', '2018-04-11 13:14:30', '-1', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('791', '家家户户', '<p>讲话稿高级</p>\r\n', '讲话稿高级', '2018-04-11 13:14:46', '2', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('792', '第三点', '<p>电风扇</p>\r\n', '电风扇', '2018-04-11 13:22:00', '1', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('793', '的士速递', '<p>是的范德萨发水电费</p>\r\n', '是的范德萨发水电费', '2018-04-11 13:22:29', '2', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('794', '电风扇电风扇', '<p>电风扇</p>\r\n', '电风扇', '2018-04-11 13:31:57', '2', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('795', '看见好看炬华科技', '<p>韩国法国</p>\r\n', '韩国法国', '2018-04-11 13:32:16', '1', '1', '0', '0', '0');
INSERT INTO `topic_info` VALUES ('796', '电风扇', '<p>反倒是</p>\r\n', '反倒是', '2018-04-16 12:56:34', '1', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) NOT NULL DEFAULT '',
  `user_pwd` varchar(64) NOT NULL DEFAULT '',
  `user_phone` varchar(20) NOT NULL DEFAULT '',
  `user_avatar` varchar(200) NOT NULL DEFAULT '',
  `user_score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'aaa', '96e79218965eb72c92a549dd5a330112', '', '9de90f24-1c37-4f6a-82ad-ca53109dc3d93.jpg', '2000');
INSERT INTO `userinfo` VALUES ('2', 'bbb', 'e10adc3949ba59abbe56e057f20f883e', '', 'caae5957-2707-4023-8494-cc024f10cf7f3.jpg', '2000');
INSERT INTO `userinfo` VALUES ('3', 'zhangsan', '202cb962ac59075b964b07152d234b70', '', '', '2000');
INSERT INTO `userinfo` VALUES ('4', 'zhangsan', '202cb962ac59075b964b07152d234b70', '', '', '2000');
INSERT INTO `userinfo` VALUES ('5', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '', '31566766-208c-4c7d-bd2f-9876b3a950f13.jpg', '2000');

-- ----------------------------
-- Table structure for user_opt_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_opt_logs`;
CREATE TABLE `user_opt_logs` (
  `user_opt_logs_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `opt_type_id` int(11) NOT NULL DEFAULT '0',
  `object_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_opt_logs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_opt_logs
-- ----------------------------

-- ----------------------------
-- Table structure for user_topic_love
-- ----------------------------
DROP TABLE IF EXISTS `user_topic_love`;
CREATE TABLE `user_topic_love` (
  `user_topic_love_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_topic_love_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_topic_love
-- ----------------------------
