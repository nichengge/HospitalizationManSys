/*
Navicat MySQL Data Transfer

Source Server         : Conn_Localhost_Mysql
Source Server Version : 50722
Source Host           : 127.0.0.1:3306
Source Database       : proj.hospitalizationmansys.ssm

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-25 16:14:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed` (
  `bedId` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ward` int(11) DEFAULT NULL,
  `bedNo` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`bedId`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES ('0000000093', '1', '1', '0');
INSERT INTO `bed` VALUES ('0000000094', '1', '2', '0');
INSERT INTO `bed` VALUES ('0000000095', '1', '3', '0');
INSERT INTO `bed` VALUES ('0000000096', '1', '4', '0');
INSERT INTO `bed` VALUES ('0000000097', '2', '5', '0');
INSERT INTO `bed` VALUES ('0000000098', '2', '6', '0');
INSERT INTO `bed` VALUES ('0000000099', '2', '7', '0');
INSERT INTO `bed` VALUES ('0000000100', '2', '8', '0');
INSERT INTO `bed` VALUES ('0000000101', '3', '9', '0');
INSERT INTO `bed` VALUES ('0000000102', '3', '10', '1');
INSERT INTO `bed` VALUES ('0000000103', '3', '11', '0');
INSERT INTO `bed` VALUES ('0000000104', '3', '12', '0');
INSERT INTO `bed` VALUES ('0000000105', '4', '13', '0');
INSERT INTO `bed` VALUES ('0000000106', '4', '14', '0');
INSERT INTO `bed` VALUES ('0000000107', '4', '15', '1');
INSERT INTO `bed` VALUES ('0000000108', '4', '16', '0');
INSERT INTO `bed` VALUES ('0000000109', '5', '17', '0');
INSERT INTO `bed` VALUES ('0000000110', '5', '18', '0');
INSERT INTO `bed` VALUES ('0000000111', '5', '19', '0');
INSERT INTO `bed` VALUES ('0000000112', '5', '20', '0');
INSERT INTO `bed` VALUES ('0000000113', '6', '21', '0');
INSERT INTO `bed` VALUES ('0000000114', '6', '22', '1');
INSERT INTO `bed` VALUES ('0000000115', '6', '23', '0');
INSERT INTO `bed` VALUES ('0000000116', '6', '24', '0');
INSERT INTO `bed` VALUES ('0000000117', '7', '25', '0');
INSERT INTO `bed` VALUES ('0000000118', '7', '26', '1');
INSERT INTO `bed` VALUES ('0000000119', '7', '27', '0');
INSERT INTO `bed` VALUES ('0000000120', '7', '28', '0');
INSERT INTO `bed` VALUES ('0000000121', '8', '29', '0');
INSERT INTO `bed` VALUES ('0000000122', '8', '30', '0');
INSERT INTO `bed` VALUES ('0000000123', '8', '31', '0');
INSERT INTO `bed` VALUES ('0000000124', '8', '32', '0');
INSERT INTO `bed` VALUES ('0000000125', '9', '33', '0');
INSERT INTO `bed` VALUES ('0000000126', '9', '34', '0');
INSERT INTO `bed` VALUES ('0000000127', '9', '35', '0');
INSERT INTO `bed` VALUES ('0000000128', '9', '36', '0');
INSERT INTO `bed` VALUES ('0000000129', '10', '37', '0');
INSERT INTO `bed` VALUES ('0000000130', '10', '38', '0');
INSERT INTO `bed` VALUES ('0000000131', '10', '39', '0');
INSERT INTO `bed` VALUES ('0000000132', '10', '40', '0');
INSERT INTO `bed` VALUES ('0000000133', '11', '41', '0');
INSERT INTO `bed` VALUES ('0000000134', '11', '42', '0');
INSERT INTO `bed` VALUES ('0000000135', '11', '43', '0');
INSERT INTO `bed` VALUES ('0000000136', '11', '44', '0');
INSERT INTO `bed` VALUES ('0000000137', '12', '45', '0');
INSERT INTO `bed` VALUES ('0000000138', '12', '46', '0');
INSERT INTO `bed` VALUES ('0000000139', '12', '47', '0');
INSERT INTO `bed` VALUES ('0000000140', '12', '48', '0');
INSERT INTO `bed` VALUES ('0000000141', '13', '49', '0');
INSERT INTO `bed` VALUES ('0000000142', '13', '50', '1');
INSERT INTO `bed` VALUES ('0000000143', '13', '51', '0');
INSERT INTO `bed` VALUES ('0000000144', '13', '52', '0');
INSERT INTO `bed` VALUES ('0000000145', '14', '53', '0');
INSERT INTO `bed` VALUES ('0000000146', '14', '54', '0');
INSERT INTO `bed` VALUES ('0000000147', '14', '55', '0');
INSERT INTO `bed` VALUES ('0000000148', '14', '56', '0');
INSERT INTO `bed` VALUES ('0000000149', '15', '57', '0');
INSERT INTO `bed` VALUES ('0000000150', '15', '58', '0');
INSERT INTO `bed` VALUES ('0000000151', '15', '59', '0');
INSERT INTO `bed` VALUES ('0000000152', '15', '60', '0');
INSERT INTO `bed` VALUES ('0000000153', '16', '61', '0');
INSERT INTO `bed` VALUES ('0000000154', '16', '62', '0');
INSERT INTO `bed` VALUES ('0000000155', '16', '63', '0');
INSERT INTO `bed` VALUES ('0000000156', '16', '64', '0');
INSERT INTO `bed` VALUES ('0000000157', '17', '65', '0');
INSERT INTO `bed` VALUES ('0000000158', '17', '66', '0');
INSERT INTO `bed` VALUES ('0000000159', '17', '67', '0');
INSERT INTO `bed` VALUES ('0000000160', '17', '68', '0');
INSERT INTO `bed` VALUES ('0000000161', '18', '69', '0');
INSERT INTO `bed` VALUES ('0000000162', '18', '70', '0');
INSERT INTO `bed` VALUES ('0000000163', '18', '71', '0');
INSERT INTO `bed` VALUES ('0000000164', '18', '72', '0');
INSERT INTO `bed` VALUES ('0000000165', '19', '73', '1');
INSERT INTO `bed` VALUES ('0000000166', '19', '74', '0');
INSERT INTO `bed` VALUES ('0000000167', '19', '75', '1');
INSERT INTO `bed` VALUES ('0000000168', '19', '76', '0');
INSERT INTO `bed` VALUES ('0000000169', '20', '77', '0');
INSERT INTO `bed` VALUES ('0000000170', '20', '78', '0');
INSERT INTO `bed` VALUES ('0000000171', '20', '79', '0');
INSERT INTO `bed` VALUES ('0000000172', '20', '80', '0');
INSERT INTO `bed` VALUES ('0000000173', '21', '81', '0');
INSERT INTO `bed` VALUES ('0000000174', '21', '82', '0');
INSERT INTO `bed` VALUES ('0000000175', '21', '83', '1');
INSERT INTO `bed` VALUES ('0000000176', '21', '84', '0');
INSERT INTO `bed` VALUES ('0000000177', '22', '85', '0');
INSERT INTO `bed` VALUES ('0000000178', '22', '86', '0');
INSERT INTO `bed` VALUES ('0000000179', '22', '87', '0');
INSERT INTO `bed` VALUES ('0000000180', '22', '88', '0');
INSERT INTO `bed` VALUES ('0000000181', '25', '97', '0');
INSERT INTO `bed` VALUES ('0000000182', '25', '98', '0');
INSERT INTO `bed` VALUES ('0000000183', '25', '99', '0');
INSERT INTO `bed` VALUES ('0000000184', '25', '100', '0');
INSERT INTO `bed` VALUES ('0000000185', '26', '101', '0');
INSERT INTO `bed` VALUES ('0000000186', '26', '102', '0');
INSERT INTO `bed` VALUES ('0000000187', '26', '103', '0');
INSERT INTO `bed` VALUES ('0000000188', '26', '104', '0');
INSERT INTO `bed` VALUES ('0000000189', '27', '105', '0');
INSERT INTO `bed` VALUES ('0000000190', '27', '106', '0');
INSERT INTO `bed` VALUES ('0000000191', '27', '107', '0');
INSERT INTO `bed` VALUES ('0000000192', '27', '108', '0');
INSERT INTO `bed` VALUES ('0000000193', '28', '109', '1');
INSERT INTO `bed` VALUES ('0000000194', '28', '110', '0');
INSERT INTO `bed` VALUES ('0000000195', '28', '111', '0');
INSERT INTO `bed` VALUES ('0000000196', '28', '112', '0');
INSERT INTO `bed` VALUES ('0000000197', '29', '113', '0');
INSERT INTO `bed` VALUES ('0000000198', '29', '114', '0');
INSERT INTO `bed` VALUES ('0000000199', '29', '115', '0');
INSERT INTO `bed` VALUES ('0000000200', '29', '116', '0');
INSERT INTO `bed` VALUES ('0000000201', '98', '389', '0');
INSERT INTO `bed` VALUES ('0000000202', '98', '390', '0');
INSERT INTO `bed` VALUES ('0000000203', '98', '391', '0');
INSERT INTO `bed` VALUES ('0000000204', '98', '392', '0');
INSERT INTO `bed` VALUES ('0000000205', '34', '133', '0');
INSERT INTO `bed` VALUES ('0000000206', '34', '134', '0');
INSERT INTO `bed` VALUES ('0000000207', '34', '135', '0');
INSERT INTO `bed` VALUES ('0000000208', '34', '136', '0');
INSERT INTO `bed` VALUES ('0000000209', '101', '401', '0');
INSERT INTO `bed` VALUES ('0000000210', '101', '402', '0');
INSERT INTO `bed` VALUES ('0000000211', '101', '403', '0');
INSERT INTO `bed` VALUES ('0000000212', '101', '404', '0');
INSERT INTO `bed` VALUES ('0000000213', '1011', '4041', '0');
INSERT INTO `bed` VALUES ('0000000214', '1011', '4042', '0');
INSERT INTO `bed` VALUES ('0000000215', '1011', '4043', '0');
INSERT INTO `bed` VALUES ('0000000216', '1011', '4044', '0');
INSERT INTO `bed` VALUES ('0000000217', '222', '885', '0');
INSERT INTO `bed` VALUES ('0000000218', '222', '886', '0');
INSERT INTO `bed` VALUES ('0000000219', '222', '887', '0');
INSERT INTO `bed` VALUES ('0000000220', '222', '888', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` float NOT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1', '高等病房', '68', '2018-12-20');
INSERT INTO `category` VALUES ('2', '2', '中等病房', '50', '2018-12-20');
INSERT INTO `category` VALUES ('3', '3', '一般病房', '35', '2018-12-20');
INSERT INTO `category` VALUES ('4', '4', '重症监护室', '120', '2018-12-20');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `Id` varchar(20) NOT NULL,
  `patientId` varchar(20) DEFAULT NULL,
  `account` float DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `costTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('1493658382002', '1493657841009', '3500', '银联卡', '0002', '2018-03-02 01:06:22');
INSERT INTO `cost` VALUES ('1493658392062', '1493657491487', '2000', '现金', '0002', '2018-12-02 01:06:32');
INSERT INTO `cost` VALUES ('1493658404366', '1493657709971', '4500', '现金', '0002', '2018-12-10 01:06:44');
INSERT INTO `cost` VALUES ('1493658413928', '1493657841009', '1000', '现金', '0002', '2018-12-05 01:06:53');
INSERT INTO `cost` VALUES ('1493658475369', '1493658129245', '1250', '现金', '0002', '2018-04-13 01:07:55');
INSERT INTO `cost` VALUES ('1493658487372', '1493658233820', '3212', '现金', '0002', '2018-05-30 01:08:07');
INSERT INTO `cost` VALUES ('1493658506924', '1493657939549', '2000', '现金', '0002', '2018-06-25 01:08:26');
INSERT INTO `cost` VALUES ('1493658514734', '1493658034658', '3450', '现金', '0002', '2018-06-27 01:08:34');
INSERT INTO `cost` VALUES ('1493658527044', '1493657606100', '1236', '银联卡', '0002', '2018-01-17 01:08:47');
INSERT INTO `cost` VALUES ('1493714191086', '1493714136980', '2000', '现金', '0002', '2018-11-28 16:36:31');
INSERT INTO `cost` VALUES ('1494692218124', '1494692190087', '4000', '银联卡', '0002', '2018-12-30 00:16:58');
INSERT INTO `cost` VALUES ('1494724317497', '1493657709971', '2009', '现金', '0002', '2018-01-03 09:11:57');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctorId` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gender` int(11) NOT NULL,
  `doctor_department` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `doctor_title` int(11) NOT NULL,
  `working_time` date DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('000007', '2', '1', '张晓涵', '1', '2017-12-25', '0');
INSERT INTO `doctor` VALUES ('000008', '2', '1', '王驲', '2', '2017-04-05', '0');
INSERT INTO `doctor` VALUES ('000009', '1', '2', '李时珍', '3', '2018-06-06', '0');
INSERT INTO `doctor` VALUES ('000010', '1', '1', '华佗', '1', '2018-10-24', '0');
INSERT INTO `doctor` VALUES ('000011', '1', '5', '张仲景', '4', '2010-09-05', '0');
INSERT INTO `doctor` VALUES ('000012', '1', '3', '扁鹊', '4', '2012-12-11', '0');
INSERT INTO `doctor` VALUES ('000013', '1', '4', '朱天宏', '2', '2018-12-11', '0');
INSERT INTO `doctor` VALUES ('000014', '1', '1', '伍子胥', '1', '2014-12-20', '0');
INSERT INTO `doctor` VALUES ('000015', '1', '3', '赵匡胤', '3', '2018-05-26', '0');
INSERT INTO `doctor` VALUES ('000016', '2', '3', '李艳', '3', '2018-12-01', '0');
INSERT INTO `doctor` VALUES ('000017', '1', '5', '张超', '4', '2017-07-20', '0');
INSERT INTO `doctor` VALUES ('000018', '1', '2', '李子健', '2', '2017-12-04', '0');
INSERT INTO `doctor` VALUES ('000019', '1', '5', '张三元', '1', '2013-09-22', '0');
INSERT INTO `doctor` VALUES ('000020', '1', '4', '李四丹', '2', '2016-09-25', '0');
INSERT INTO `doctor` VALUES ('000022', '1', '1', '王五快', '1', '2018-06-01', '0');
INSERT INTO `doctor` VALUES ('000023', '1', '1', '赵六乐', '1', '2016-11-02', '1');
INSERT INTO `doctor` VALUES ('000024', '1', '1', '王元元', '1', '2019-01-01', '0');

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `drugId` varchar(20) DEFAULT NULL,
  `drugname` varchar(20) DEFAULT NULL,
  `manufaturer` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `validityDay` int(11) DEFAULT NULL,
  `validityYear` int(11) DEFAULT NULL,
  `validityMouth` int(11) DEFAULT NULL,
  `supply` varchar(30) DEFAULT NULL,
  `addNum` int(11) DEFAULT NULL,
  `createTime` date DEFAULT NULL,
  `productionTime` date DEFAULT NULL,
  `validityTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES ('0000000001', 'Z0001', '乌鸡白凤丸', '深圳市天安堂深圳力昌大药房', '47.64', '0', '0', '6', '江中集团', '100', '2018-12-25', '2018-12-01', '2019-02-01');
INSERT INTO `drug` VALUES ('0000000002', 'Z0002', '鸦胆子油软胶囊 ', '江苏万高药业有限公司', '36.72', '0', '0', '3', '东北制药', '200', '2018-12-25', '2018-12-01', '2019-03-28');
INSERT INTO `drug` VALUES ('0000000003', 'Z0003', '来曲唑片', '江苏恒瑞医药股份有限公司 ', '109', '0', '1', '0', '葵花药业', '80', '2018-12-25', '2018-12-01', '2019-03-21');
INSERT INTO `drug` VALUES ('0000000004', 'Z0004', '慈丹胶囊 ', '北京勃然制药有限公司 ', '45.9', '0', '0', '4', '拜耳医药', '100', '2018-12-25', '2018-12-01', '2019-08-08');
INSERT INTO `drug` VALUES ('0000000005', 'Z0005', '石杉碱甲片', '河南太龙药业股份有限公司', '24.8', '0', '0', '5', '联邦制药', '200', '2018-12-25', '2018-12-01', '2019-09-28');
INSERT INTO `drug` VALUES ('0000000006', 'Z0006', '吡贝地尔缓释片', 'LES LABORATOIRES SERVIER INDUSTRIE', '76.5', '0', '0', '1', '哈药集团', '50', '2018-12-25', '2018-12-01', '2019-05-02');
INSERT INTO `drug` VALUES ('0000000007', 'Z0007', '盐酸维拉帕米缓释片 ', '德国基诺药厂', '36.1', '0', '0', '2', '新华医药', '50', '2018-12-25', '2018-12-01', '2019-06-28');
INSERT INTO `drug` VALUES ('0000000008', 'Z0008', '马来酸依那普利胶囊 ', '佛山手心制药有限公司', '18', '0', '0', '7', '中美史克', '100', '2018-12-25', '2018-12-01', '2019-10-17');
INSERT INTO `drug` VALUES ('0000000009', 'Z0009', '肝复乐片', '康哲(湖南)制药有限公司', '74.44', '2', '0', '4', '扬子江制药', '200', '2018-12-25', '2018-12-01', '2019-08-31');

-- ----------------------------
-- Table structure for grantdrug
-- ----------------------------
DROP TABLE IF EXISTS `grantdrug`;
CREATE TABLE `grantdrug` (
  `Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `drugId` varchar(30) DEFAULT NULL,
  `drugName` varchar(30) DEFAULT NULL,
  `drugPrice` float DEFAULT NULL,
  `drugCount` int(11) DEFAULT NULL,
  `patientName` varchar(30) DEFAULT NULL,
  `patientId` varchar(30) DEFAULT NULL,
  `grantUserId` varchar(20) DEFAULT NULL,
  `grantUserName` varchar(30) DEFAULT NULL,
  `grantTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grantdrug
-- ----------------------------
INSERT INTO `grantdrug` VALUES ('0000000027', 'Z0007', '盐酸维拉帕米缓释片', '36.1', '11', '王薪传', '1493714136980', 'admin', '王飞', '2018-12-25 11:28:27');
INSERT INTO `grantdrug` VALUES ('0000000028', 'Z0004', '慈丹胶囊', '45.9', '9', '赵敏', '1493657841009', 'admin', '王飞', '2018-12-25 11:28:55');
INSERT INTO `grantdrug` VALUES ('0000000029', 'Z0008', '马来酸依那普利胶囊', '18', '6', '王芳奎', '1494692190087', 'admin', '王飞', '2018-12-25 11:31:55');
INSERT INTO `grantdrug` VALUES ('0000000030', 'Z0001', '乌鸡白凤丸', '47.64', '12', '赵薇', '1493657709971', 'admin', '王飞', '2018-12-25 11:33:47');

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation` (
  `nationNum` int(11) NOT NULL,
  `nationName` varchar(30) NOT NULL,
  PRIMARY KEY (`nationNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES ('1', '汉族');
INSERT INTO `nation` VALUES ('2', '蒙古族');
INSERT INTO `nation` VALUES ('3', '回族');
INSERT INTO `nation` VALUES ('4', '藏族');
INSERT INTO `nation` VALUES ('5', '维吾尔族');
INSERT INTO `nation` VALUES ('6', '苗族');
INSERT INTO `nation` VALUES ('7', '彝族');
INSERT INTO `nation` VALUES ('8', '壮族');
INSERT INTO `nation` VALUES ('9', '布依族');
INSERT INTO `nation` VALUES ('10', '朝鲜族');
INSERT INTO `nation` VALUES ('11', '满族');
INSERT INTO `nation` VALUES ('12', '侗族');
INSERT INTO `nation` VALUES ('13', '瑶族');
INSERT INTO `nation` VALUES ('14', '白族');
INSERT INTO `nation` VALUES ('15', '土家族');
INSERT INTO `nation` VALUES ('16', '哈尼族');
INSERT INTO `nation` VALUES ('17', '哈萨克族');
INSERT INTO `nation` VALUES ('18', '傣族');
INSERT INTO `nation` VALUES ('19', '黎族');
INSERT INTO `nation` VALUES ('20', '傈僳族');
INSERT INTO `nation` VALUES ('21', '佤族');
INSERT INTO `nation` VALUES ('22', '畲族');
INSERT INTO `nation` VALUES ('23', '高山族');
INSERT INTO `nation` VALUES ('24', '拉祜族');
INSERT INTO `nation` VALUES ('25', '水族');
INSERT INTO `nation` VALUES ('26', '东乡族');
INSERT INTO `nation` VALUES ('27', '纳西族');
INSERT INTO `nation` VALUES ('28', '景颇族');
INSERT INTO `nation` VALUES ('29', '柯尔克孜族');
INSERT INTO `nation` VALUES ('30', '土族');
INSERT INTO `nation` VALUES ('31', '达斡尔族');
INSERT INTO `nation` VALUES ('32', '仫佬族');
INSERT INTO `nation` VALUES ('33', '羌族');
INSERT INTO `nation` VALUES ('34', '布朗族');
INSERT INTO `nation` VALUES ('35', '撒拉族');
INSERT INTO `nation` VALUES ('36', '毛难族');
INSERT INTO `nation` VALUES ('37', '仡佬族');
INSERT INTO `nation` VALUES ('38', '锡伯族');
INSERT INTO `nation` VALUES ('39', '阿昌族');
INSERT INTO `nation` VALUES ('40', '普米族');
INSERT INTO `nation` VALUES ('41', '塔吉克族');
INSERT INTO `nation` VALUES ('42', '怒族');
INSERT INTO `nation` VALUES ('43', '乌孜别克族');
INSERT INTO `nation` VALUES ('44', '俄罗斯族');
INSERT INTO `nation` VALUES ('45', '鄂温克族');
INSERT INTO `nation` VALUES ('46', '崩龙族');
INSERT INTO `nation` VALUES ('47', '保安族');
INSERT INTO `nation` VALUES ('48', '裕固族');
INSERT INTO `nation` VALUES ('49', '京族');
INSERT INTO `nation` VALUES ('50', '塔塔尔族');
INSERT INTO `nation` VALUES ('51', '独龙族');
INSERT INTO `nation` VALUES ('52', '鄂伦春族');
INSERT INTO `nation` VALUES ('53', '赫哲族');
INSERT INTO `nation` VALUES ('54', '门巴族');
INSERT INTO `nation` VALUES ('55', '珞巴族');
INSERT INTO `nation` VALUES ('56', '基诺族');

-- ----------------------------
-- Table structure for paracode
-- ----------------------------
DROP TABLE IF EXISTS `paracode`;
CREATE TABLE `paracode` (
  `code_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `parameter_values` int(11) NOT NULL,
  `parameter_name` varchar(20) NOT NULL,
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paracode
-- ----------------------------
INSERT INTO `paracode` VALUES ('000001', '001', '1', '内科');
INSERT INTO `paracode` VALUES ('000002', '001', '2', '儿科');
INSERT INTO `paracode` VALUES ('000003', '001', '3', '妇科');
INSERT INTO `paracode` VALUES ('000004', '001', '4', '产科');
INSERT INTO `paracode` VALUES ('000005', '001', '5', '骨科');
INSERT INTO `paracode` VALUES ('000007', '002', '1', '主治医师');
INSERT INTO `paracode` VALUES ('000008', '002', '2', '副主任医师');
INSERT INTO `paracode` VALUES ('000009', '002', '3', '主任医师');
INSERT INTO `paracode` VALUES ('000010', '002', '4', '住院医师');
INSERT INTO `paracode` VALUES ('000011', '001', '6', '牙科');

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `parameter_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(12) NOT NULL,
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('000001', '001', '科室');
INSERT INTO `parameter` VALUES ('000002', '002', '职称');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `patientName` varchar(20) NOT NULL,
  `gender` int(11) NOT NULL,
  `nation` int(11) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `certificateNo` varchar(18) DEFAULT NULL,
  `workUnit` varchar(20) DEFAULT NULL,
  `maritalStatus` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `admissionTime` datetime DEFAULT NULL,
  `homeAddress` varchar(255) DEFAULT NULL,
  `homePhone` varchar(11) DEFAULT NULL,
  `contacts` varchar(20) DEFAULT NULL,
  `contactsPhone` varchar(11) DEFAULT NULL,
  `admissionStatus` int(11) DEFAULT NULL,
  `roomType` int(11) DEFAULT NULL,
  `roomNo` int(11) DEFAULT NULL,
  `bedNo` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `settlementState` int(1) NOT NULL DEFAULT '0',
  `leaveState` int(1) DEFAULT '0',
  `leaveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('00000000018', '1493657491487', '张炳泉', '1', '1', '1992-02-02', '6', '371321199202028976', '武装部', '1', '7', '2018-01-02 00:51:31', '\r\n\r\n山东省青岛市', '13578906543', '李天秀', '15789761234', '1', '3', '28', '111', '0', '1', '1', '2018-04-02 01:52:41');
INSERT INTO `patient` VALUES ('00000000019', '1493657606100', '李红涛', '1', '2', '1983-05-02', '5', '374521198305021232', '水电局', '1', '11', '2018-02-01 00:53:26', '山东省青岛市', '13567541232', '李天翔', '15987651234', '2', '2', '20', '79', '0', '1', '1', '2018-05-02 16:37:56');
INSERT INTO `patient` VALUES ('00000000020', '1493657709971', '赵薇', '2', '1', '1990-06-06', '4', '261331199006068765', '银行', '0', '14', '2018-03-07 00:55:09', '山东省青岛市', '13578986545', '肖旭', '15987670987', '1', '2', '16', '63', '0', '0', '0', '2018-05-02 13:07:55');
INSERT INTO `patient` VALUES ('00000000021', '1493657841009', '赵敏', '2', '1', '1970-05-04', '1', '635521197005041987', '学校', '1', '8', '2018-04-02 00:57:21', '山东省青岛市', '15987651234', '赵小兵', '15987651234', '3', '4', '4', '15', '0', '1', '0', null);
INSERT INTO `patient` VALUES ('00000000022', '1493657939549', '赵恒', '1', '1', '2012-05-02', '2', '231134201205029876', '政府', '0', '9', '2018-05-02 00:58:59', '山东省青岛市', '15908971234', '钱自傲', '15987651232', '1', '3', '7', '26', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000023', '1493658034658', '赵一鸣', '2', '1', '1984-05-02', '3', '376623198405021298', '银行', '1', '16', '2018-06-02 01:00:34', '\r\n\r\n山东省青岛市', '13567654356', '孙治', '18987656754', '1', '2', '10', '39', '0', '1', '1', '2018-12-20 23:36:43');
INSERT INTO `patient` VALUES ('00000000024', '1493658129245', '赵长乐', '2', '1', '1990-06-02', '6', '371885199006028765', '律师事务所', '1', '7', '2018-07-02 01:02:09', '山东省青岛市', '15765456789', '张鸿阳', '15987651234', '1', '3', '28', '109', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000025', '1493658233820', '赵喆', '1', '1', '1974-05-02', '5', '372512197405028901', '物业', '1', '19', '2018-08-02 01:03:53', '\r\n\r\n山东省青岛市', '15767548976', '张晓英', '18932564321', '1', '3', '21', '83', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000026', '1493705763118', '王梓萌', '2', '1', '2017-05-09', '2', '371321199702112323', '无业', '0', '9', '2018-09-02 14:16:03', '山东省青岛市', '212121212', '张天明', '12312321321', '2', '2', '6', '22', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000027', '1493714136980', '王薪传', '1', '1', '2017-05-02', '1', '372502196711233456', '自由职业', '0', '10', '2018-10-02 16:35:36', '山东省青岛市', '13523457654', '擦拭发', '13523456789', '1', '3', '3', '10', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000028', '1494692190087', '王芳奎', '1', '1', '1993-05-14', '5', '371414199305142123', '自由职业', '1', '11', '2018-11-14 00:16:30', '山东省青岛市', '13521324512', '王天', '13987651232', '2', '1', '19', '75', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000029', '1544606254526', '李冬梅', '1', '1', '1996-11-12', '3', '371123199611123344', '经商', '1', '12', '2018-12-12 17:17:34', '山东省青岛市', '2431456', '李刚', '2311234', '3', '4', '13', '50', '0', '0', '0', null);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `signId` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `measureTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` varchar(20) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `bloodPressure` float DEFAULT NULL,
  `pulse` int(11) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `breathing` int(11) DEFAULT NULL,
  `bloodSugar` float DEFAULT NULL,
  `vein` float DEFAULT NULL,
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('00000000025', '1493657841009', '2018-12-25 11:22:06', 'admin', '37', '2200', '70', '一切正常', '王飞', '2018-12-25 11:22:34', '67', '110', '0');
INSERT INTO `sign` VALUES ('00000000026', '1493705763118', '2018-12-25 11:22:36', 'admin', '39', '2100', '120', '持续高烧，建议进一步观察', '王飞', '2018-12-25 11:23:29', '90', '110', '300');
INSERT INTO `sign` VALUES ('00000000027', '1544606254526', '2018-12-25 11:23:31', 'admin', '36.9', '2300', '67', '一切正常，可择机出院', '王飞', '2018-12-25 11:24:05', '55', '110', '0');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `drugId` varchar(15) DEFAULT NULL,
  `drugName` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('0000000009', 'Z0001', '乌鸡白凤丸', '47.64', '97');
INSERT INTO `stock` VALUES ('0000000010', 'Z0003', '鸦胆子油软胶囊 ', '109', '278');
INSERT INTO `stock` VALUES ('0000000011', 'Z0004', '慈丹胶囊 ', '45.9', '85');
INSERT INTO `stock` VALUES ('0000000012', 'Z0005', '石杉碱甲片', '24.8', '198');
INSERT INTO `stock` VALUES ('0000000013', 'Z0006', '吡贝地尔缓释片', '76.5', '50');
INSERT INTO `stock` VALUES ('0000000014', 'Z0007', '盐酸维拉帕米缓释片 ', '36.1', '39');
INSERT INTO `stock` VALUES ('0000000015', 'Z0008', '马来酸依那普利胶囊 ', '18', '94');
INSERT INTO `stock` VALUES ('0000000016', 'Z0009', '肝复乐片', '74.44', '200');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(10) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_describe` int(2) NOT NULL DEFAULT '0',
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '王飞', 'admin', '13111111111', '4', '2018-12-12');
INSERT INTO `user` VALUES ('doctor', '医生1', 'doctor', '17866661111', '1', '2018-12-12');
INSERT INTO `user` VALUES ('manager', '管理员1', 'manager', '17866661111', '3', '2018-12-12');
INSERT INTO `user` VALUES ('patient', '患者1', 'patient', '13700000000', '0', '2018-12-12');
INSERT INTO `user` VALUES ('services', '服务1', 'services', '13212121212', '2', '2018-12-12');

-- ----------------------------
-- Table structure for ward
-- ----------------------------
DROP TABLE IF EXISTS `ward`;
CREATE TABLE `ward` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `wardNo` int(11) NOT NULL,
  `departmentNo` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `createTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ward
-- ----------------------------
INSERT INTO `ward` VALUES ('0000000024', '1', '1', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000025', '2', '1', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000026', '3', '1', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000027', '4', '1', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000028', '5', '2', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000029', '6', '2', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000030', '7', '2', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000031', '8', '2', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000032', '9', '3', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000033', '10', '3', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000034', '11', '3', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000035', '12', '2', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000036', '13', '3', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000037', '14', '3', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000038', '15', '4', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000039', '16', '4', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000040', '17', '4', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000041', '18', '4', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000042', '19', '5', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000043', '20', '5', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000044', '21', '5', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000045', '22', '5', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000046', '25', '5', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000047', '26', '6', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000048', '27', '6', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000049', '28', '6', '3', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000050', '29', '6', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000051', '30', '1', '4', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000052', '31', '1', '2', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000053', '32', '1', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000054', '33', '1', '1', '0', '2018-12-25');
INSERT INTO `ward` VALUES ('0000000055', '34', '5', '4', '0', '2018-12-25');

-- ----------------------------
-- Table structure for wardupdate
-- ----------------------------
DROP TABLE IF EXISTS `wardupdate`;
CREATE TABLE `wardupdate` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `roomType` int(11) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wardupdate
-- ----------------------------
INSERT INTO `wardupdate` VALUES ('0000000011', '1493657491487', '1', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000012', '1493657606100', '4', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000013', '1493657709971', '2', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000014', '1493657841009', '4', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000015', '1493657939549', '3', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000016', '1493658034658', '2', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000017', '1493658129245', '3', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000018', '1493658233820', '3', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000019', '1493657491487', '1', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000020', '1493657491487', '3', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000021', '1493657491487', '3', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000022', '1493657606100', '2', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000023', '1493705763118', '2', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000024', '1493714136980', '3', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000025', '1493657709971', '2', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000026', '1493657709971', '2', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000027', '1494692190087', '1', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000028', '1544606254526', '4', '2018-12-26');
INSERT INTO `wardupdate` VALUES ('0000000029', '1545322357217', '1', '2018-12-26');

-- ----------------------------
-- Table structure for withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `withdrawal`;
CREATE TABLE `withdrawal` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `patientName` varchar(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `drugsId` varchar(20) DEFAULT NULL,
  `entiyTime` date DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdrawal
-- ----------------------------
INSERT INTO `withdrawal` VALUES ('0000000015', '1493657709971', '赵薇', '1', '王飞', 'admin', 'Z0001', '2018-12-25', '过期');


-- ----------------------------
-- Function structure for `currval`
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(doctor_id VARCHAR(6)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN  
  
DECLARE VALUE INTEGER;  
  
SET VALUE = 10001;  
  
SELECT current_value INTO VALUE FROM doctor WHERE NAME = doctor_id;  
  
RETURN VALUE;  
  
END
;;
DELIMITER ;


-- ----------------------------
-- Function structure for `nextval`
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(doctor_id VARCHAR(6)) RETURNS int(11)
    DETERMINISTIC
BEGIN  
  
UPDATE doctor SET current_value = current_value + increment WHERE Name = doctor_id;  
  
RETURN currval(seq_name);  
  
END
;;
DELIMITER ;
