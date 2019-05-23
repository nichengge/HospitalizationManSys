/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : 127.0.0.1:3306
Source Database       : proj_hospitalizationmansys_ssm

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-05-23 13:27:15
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
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES ('0000000256', '101', '10101', '0');
INSERT INTO `bed` VALUES ('0000000257', '102', '10201', '0');
INSERT INTO `bed` VALUES ('0000000258', '102', '10202', '0');
INSERT INTO `bed` VALUES ('0000000259', '103', '10301', '1');
INSERT INTO `bed` VALUES ('0000000260', '103', '10302', '0');
INSERT INTO `bed` VALUES ('0000000261', '103', '10303', '0');
INSERT INTO `bed` VALUES ('0000000262', '103', '10304', '0');
INSERT INTO `bed` VALUES ('0000000263', '104', '10401', '0');
INSERT INTO `bed` VALUES ('0000000264', '105', '10501', '0');
INSERT INTO `bed` VALUES ('0000000265', '106', '10601', '0');
INSERT INTO `bed` VALUES ('0000000266', '106', '10602', '0');
INSERT INTO `bed` VALUES ('0000000267', '107', '10701', '0');
INSERT INTO `bed` VALUES ('0000000268', '107', '10702', '0');
INSERT INTO `bed` VALUES ('0000000269', '107', '10703', '0');
INSERT INTO `bed` VALUES ('0000000270', '107', '10704', '0');
INSERT INTO `bed` VALUES ('0000000271', '108', '10801', '0');
INSERT INTO `bed` VALUES ('0000000272', '201', '20101', '0');
INSERT INTO `bed` VALUES ('0000000273', '201', '20102', '0');
INSERT INTO `bed` VALUES ('0000000274', '201', '20103', '0');
INSERT INTO `bed` VALUES ('0000000275', '201', '20104', '0');
INSERT INTO `bed` VALUES ('0000000276', '202', '20201', '0');
INSERT INTO `bed` VALUES ('0000000277', '202', '20202', '0');
INSERT INTO `bed` VALUES ('0000000278', '203', '20301', '0');
INSERT INTO `bed` VALUES ('0000000279', '204', '20401', '0');
INSERT INTO `bed` VALUES ('0000000280', '301', '30101', '0');
INSERT INTO `bed` VALUES ('0000000281', '301', '30102', '0');
INSERT INTO `bed` VALUES ('0000000282', '301', '30103', '0');
INSERT INTO `bed` VALUES ('0000000283', '301', '30104', '0');
INSERT INTO `bed` VALUES ('0000000284', '302', '30201', '0');
INSERT INTO `bed` VALUES ('0000000285', '302', '30202', '1');
INSERT INTO `bed` VALUES ('0000000286', '303', '30301', '0');
INSERT INTO `bed` VALUES ('0000000287', '304', '30401', '0');
INSERT INTO `bed` VALUES ('0000000288', '401', '40101', '0');
INSERT INTO `bed` VALUES ('0000000289', '402', '40201', '1');
INSERT INTO `bed` VALUES ('0000000290', '402', '40202', '0');
INSERT INTO `bed` VALUES ('0000000291', '403', '40301', '0');
INSERT INTO `bed` VALUES ('0000000292', '501', '50101', '0');
INSERT INTO `bed` VALUES ('0000000293', '502', '50201', '0');
INSERT INTO `bed` VALUES ('0000000294', '503', '50301', '0');
INSERT INTO `bed` VALUES ('0000000295', '503', '50302', '0');
INSERT INTO `bed` VALUES ('0000000296', '503', '50303', '0');
INSERT INTO `bed` VALUES ('0000000297', '503', '50304', '0');
INSERT INTO `bed` VALUES ('0000000298', '504', '50401', '0');
INSERT INTO `bed` VALUES ('0000000299', '504', '50402', '0');
INSERT INTO `bed` VALUES ('0000000300', '505', '50501', '0');
INSERT INTO `bed` VALUES ('0000000301', '601', '60101', '1');
INSERT INTO `bed` VALUES ('0000000302', '506', '50601', '0');
INSERT INTO `bed` VALUES ('0000000303', '506', '50602', '0');
INSERT INTO `bed` VALUES ('0000000304', '506', '50603', '0');
INSERT INTO `bed` VALUES ('0000000305', '506', '50604', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` float DEFAULT '0',
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('24', '1', 'VIP(1人)', '380', '2019-04-25 00:00:00');
INSERT INTO `category` VALUES ('25', '2', '高等(2人)', '250', '2019-04-25 00:00:00');
INSERT INTO `category` VALUES ('26', '3', '初级(4人)', '180', '2019-04-25 00:00:00');
INSERT INTO `category` VALUES ('27', '4', '重症监护室(ICU_1人)', '3000', '2019-04-25 00:00:00');

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
INSERT INTO `cost` VALUES ('1556176659883', '1555922984939', '100', '现金', 'service', '2019-04-25 15:17:39');
INSERT INTO `cost` VALUES ('1557287858426', '1557287431528', '1000', '现金', 'admin', '2019-05-08 11:57:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('000026', '1', '1', '李华佗', '4', '2015-02-05', '0');
INSERT INTO `doctor` VALUES ('000027', '1', '1', '张仲景', '4', '2015-06-01', '0');
INSERT INTO `doctor` VALUES ('000028', '2', '1', '杨珊珊', '1', '2018-02-01', '0');
INSERT INTO `doctor` VALUES ('000029', '2', '2', '肖文程', '2', '2017-06-24', '0');
INSERT INTO `doctor` VALUES ('000030', '1', '3', '华正坤', '3', '2014-01-31', '0');
INSERT INTO `doctor` VALUES ('000031', '1', '2', '王涛', '1', '2019-04-22', '0');
INSERT INTO `doctor` VALUES ('000032', '2', '3', '石晓英', '4', '2014-10-10', '0');
INSERT INTO `doctor` VALUES ('000033', '2', '4', '李飞飞', '1', '2019-01-01', '1');
INSERT INTO `doctor` VALUES ('000034', '1', '4', '巴桑纳吉', '2', '2018-10-03', '0');
INSERT INTO `doctor` VALUES ('000035', '2', '5', '旦增卓玛', '1', '2016-06-01', '0');
INSERT INTO `doctor` VALUES ('000036', '2', '5', '欧阳御程', '3', '2014-06-12', '0');
INSERT INTO `doctor` VALUES ('000037', '2', '6', '赵采薇', '1', '2019-04-22', '0');
INSERT INTO `doctor` VALUES ('000038', '1', '7', '刘玉峰', '2', '2018-05-09', '0');
INSERT INTO `doctor` VALUES ('000039', '1', '10', '邢枭龙', '4', '2017-07-10', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
INSERT INTO `drug` VALUES ('0000000010', 'Z1234', '强力枇杷露', '扬子江制药', '47.64', '30', '2022', '4', '内部采购', '300', '2019-05-23', '2019-04-03', '2022-04-27');
INSERT INTO `drug` VALUES ('0000000011', 'Z1234', '强力枇杷露', '东北制药', '23.11', '1', '2021', '3', '外部采购', '11', '2019-05-23', '2019-03-01', '2021-01-26');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grantdrug
-- ----------------------------
INSERT INTO `grantdrug` VALUES ('0000000031', 'Z0008', '马来酸依那普利胶囊', '18', '2', '王大拿', '1555922984939', 'admin', '超级管理员', '2019-04-25 13:56:48');
INSERT INTO `grantdrug` VALUES ('0000000032', 'Z0001', '乌鸡白凤丸', '47.64', '1', '王大拿', '1555922984939', 'admin', '超级管理员', '2019-04-25 15:07:12');
INSERT INTO `grantdrug` VALUES ('0000000033', 'Z0009', '肝复乐片', '74.44', '4', '王梓桐', '1556262004947', 'admin', '超级管理员', '2019-04-29 23:37:25');
INSERT INTO `grantdrug` VALUES ('0000000034', 'Z0008', '马来酸依那普利胶囊', '18', '1', '王大拿', '1557287431528', 'admin', '超级管理员', '2019-05-08 11:58:27');
INSERT INTO `grantdrug` VALUES ('0000000035', 'Z0006', '吡贝地尔缓释片', '76.5', '5', '王大拿', '1557287431528', 'admin', '超级管理员', '2019-05-08 11:58:52');
INSERT INTO `grantdrug` VALUES ('0000000036', 'Z1234', '强力枇杷露', '47.64', '3', '丁子彧', '1556762747114', 'admin', '超级管理员', '2019-05-23 13:17:10');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime(3) NOT NULL,
  `type` varchar(10) NOT NULL,
  `detial` varchar(10240) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paracode
-- ----------------------------
INSERT INTO `paracode` VALUES ('000083', '005', '0', '患者');
INSERT INTO `paracode` VALUES ('000084', '005', '1', '护士');
INSERT INTO `paracode` VALUES ('000085', '005', '2', '医生');
INSERT INTO `paracode` VALUES ('000086', '005', '3', '服务前台');
INSERT INTO `paracode` VALUES ('000087', '005', '4', '系统管理员');
INSERT INTO `paracode` VALUES ('000088', '005', '5', '超级管理员');
INSERT INTO `paracode` VALUES ('000089', '001', '1', '呼吸内科');
INSERT INTO `paracode` VALUES ('000090', '001', '2', '消化内科');
INSERT INTO `paracode` VALUES ('000091', '001', '3', '泌尿内科');
INSERT INTO `paracode` VALUES ('000092', '001', '4', '心内科');
INSERT INTO `paracode` VALUES ('000093', '001', '5', '血液科');
INSERT INTO `paracode` VALUES ('000094', '001', '6', '小儿科');
INSERT INTO `paracode` VALUES ('000095', '001', '7', '内分泌科');
INSERT INTO `paracode` VALUES ('000096', '001', '8', '神经内科');
INSERT INTO `paracode` VALUES ('000097', '001', '9', '感染科');
INSERT INTO `paracode` VALUES ('000098', '001', '10', '骨科');
INSERT INTO `paracode` VALUES ('000099', '001', '11', '神经外科');
INSERT INTO `paracode` VALUES ('000100', '001', '12', '肝胆外科');
INSERT INTO `paracode` VALUES ('000101', '001', '13', '烧伤科');
INSERT INTO `paracode` VALUES ('000102', '001', '14', '妇科');
INSERT INTO `paracode` VALUES ('000103', '001', '15', '产科');
INSERT INTO `paracode` VALUES ('000104', '002', '1', '住院医师');
INSERT INTO `paracode` VALUES ('000105', '002', '2', '主治医师');
INSERT INTO `paracode` VALUES ('000106', '002', '3', '副主任医师');
INSERT INTO `paracode` VALUES ('000107', '002', '4', '主任医师');
INSERT INTO `paracode` VALUES ('000108', '003', '1', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000109', '003', '2', '高等(2人)');
INSERT INTO `paracode` VALUES ('000110', '003', '3', '初级(4人)');
INSERT INTO `paracode` VALUES ('000111', '003', '4', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000112', '004', '101', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000113', '004', '102', '高等(2人)');
INSERT INTO `paracode` VALUES ('000114', '004', '103', '初级(4人)');
INSERT INTO `paracode` VALUES ('000115', '004', '104', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000116', '004', '105', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000117', '004', '106', '高等(2人)');
INSERT INTO `paracode` VALUES ('000118', '004', '107', '初级(4人)');
INSERT INTO `paracode` VALUES ('000119', '004', '108', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000120', '004', '201', '初级(4人)');
INSERT INTO `paracode` VALUES ('000121', '004', '202', '高等(2人)');
INSERT INTO `paracode` VALUES ('000122', '004', '203', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000123', '004', '204', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000124', '004', '301', '初级(4人)');
INSERT INTO `paracode` VALUES ('000125', '004', '302', '高等(2人)');
INSERT INTO `paracode` VALUES ('000126', '004', '303', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000127', '004', '304', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000128', '004', '401', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000129', '004', '402', '高等(2人)');
INSERT INTO `paracode` VALUES ('000130', '004', '403', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000131', '004', '501', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000132', '004', '502', '重症监护室(ICU_1人)');
INSERT INTO `paracode` VALUES ('000133', '004', '503', '初级(4人)');
INSERT INTO `paracode` VALUES ('000134', '004', '504', '高等(2人)');
INSERT INTO `paracode` VALUES ('000135', '004', '505', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000136', '004', '601', 'VIP(1人)');
INSERT INTO `paracode` VALUES ('000137', '004', '506', '初级(4人)');

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `parameter_id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(12) NOT NULL,
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('000001', '001', '科室');
INSERT INTO `parameter` VALUES ('000002', '002', '职称');
INSERT INTO `parameter` VALUES ('000003', '003', '病房类型');
INSERT INTO `parameter` VALUES ('000004', '004', '病房');
INSERT INTO `parameter` VALUES ('000005', '005', '角色');

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
  `workUnit` varchar(200) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('00000000044', '1555922984939', '王大拿', '1', '2', '1977-02-01', '1', '372323197702011234', '大拿研究院', '1', '28', '2019-04-22 16:49:44', '内蒙古自治区巴彦淖尔市', '87876654', '王小拿', '87876654', '1', '4', '108', '10801', '0', '1', '1', '2019-05-08 11:14:37');
INSERT INTO `patient` VALUES ('00000000045', '1555923323591', '张褴褛', '1', '4', '1998-08-01', '3', '231123199808011232', '拉萨市第一中学', '0', '32', '2019-04-22 16:55:23', '拉萨', '6765432', '张筚路', '6765432', '1', '2', '302', '30201', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000046', '1556262004947', '王梓桐', '2', '6', '2011-01-04', '6', '371312201101042323', '', '0', '37', '2019-04-26 15:00:04', '山东青岛', '12345678901', '张大仙', '13312431212', '1', '1', '601', '60101', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000047', '1556762747114', '丁子彧', '2', '1', '1997-02-05', '1', '372502197702051212', '中国海洋大学', '0', '27', '2019-05-02 10:05:47', '山东聊城', '', '丁凡', '13798234312', '1', '3', '103', '10301', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000048', '1557287431528', '王大拿', '1', '1', '2018-01-03', '4', '372323197702011234', '', '0', '34', '2019-05-08 11:50:31', '呼伦贝厄', '', '王晓娜', '17865432121', '1', '2', '402', '40201', '0', '0', '0', null);
INSERT INTO `patient` VALUES ('00000000049', '1558535901290', 'MD5测试', '2', '2', '2019-05-21', '2', '372312201905211234', '', '0', '31', '2019-05-22 22:38:21', '黄岛', '', 'MD4', '13123231234', '1', '2', '202', '20201', '0', '1', '1', '2019-05-23 13:01:35');

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `signId` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `measureTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` varchar(20) DEFAULT NULL,
  `temperature` float DEFAULT '0',
  `bloodPressure` varchar(7) DEFAULT '0/0',
  `pulse` int(3) DEFAULT '0',
  `remarks` varchar(100) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `breathing` int(3) DEFAULT '0',
  `bloodSugar` float DEFAULT '0',
  `vein` float DEFAULT '0',
  PRIMARY KEY (`signId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('00000000001', '1555922984939', '2019-04-27 21:21:04', 'admin', '36.7', '80/120', '98', '没毛病', '超级管理员', '2019-04-23 22:37:06', null, '6.4', '0');
INSERT INTO `sign` VALUES ('00000000002', '1555922984939', '2019-04-27 21:21:09', 'admin', '37.6', '85/110', '110', '发烧', '超级管理员', '2019-04-23 22:37:38', null, '7.2', '0');
INSERT INTO `sign` VALUES ('00000000003', '1555922984939', '2019-04-27 21:21:12', 'admin', '36', '90/130', '120', '高血压', '超级管理员', '2019-04-23 22:38:12', null, '6.8', '0');
INSERT INTO `sign` VALUES ('00000000004', '1555923323591', '2019-04-27 21:21:22', 'admin', '39.7', '110/150', '180', '快凉了', '超级管理员', '2019-04-23 22:41:02', null, '7.1', '0');
INSERT INTO `sign` VALUES ('00000000023', '1555922984939', '2019-04-29 23:53:28', '372323197702011234', '22', '90/130', '77', null, '王大拿', '2019-04-25 11:56:38', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000026', '1555922984939', '2019-04-27 21:17:56', 'admin', '36', '80/120', '78', null, '超级管理员', '2019-04-27 21:20:44', null, '6.7', '0');
INSERT INTO `sign` VALUES ('00000000027', '1556262004947', '2019-04-30 11:31:15', 'admin', '37', '90/120', '120', null, '超级管理员', '2019-04-30 11:36:08', null, '6.7', '0');
INSERT INTO `sign` VALUES ('00000000028', '1556262004947', '2019-04-30 11:40:45', 'admin', '39', '90/125', '120', '校验测试', '超级管理员', '2019-04-30 11:41:20', null, '6.6', '0');
INSERT INTO `sign` VALUES ('00000000029', '1555923323591', '2019-05-05 11:31:46', 'superman', '36.8', '90/128', '87', '超级权限用户测试', '超级权限用户', '2019-05-05 11:32:20', null, '7.7', '0');
INSERT INTO `sign` VALUES ('00000000030', '1556262004947', '2019-05-07 11:44:23', 'superman', '37.8', '75/115', '77', '持续低烧', '超级权限用户', '2019-05-07 11:44:49', null, '6.7', '0');
INSERT INTO `sign` VALUES ('00000000031', '1555922984939', '2019-05-07 11:48:32', 'superman', '36.8', '85/135', '77', '准备出院', '超级权限用户', '2019-05-07 11:49:19', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000032', '1555922984939', '2019-05-08 10:43:00', 'doctor', '39', '80/117', '140', '再次高烧', '医生', '2019-05-08 10:43:42', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000033', '1557287431528', '2019-05-08 11:51:21', 'admin', '36.8', '89/130', '110', null, '超级管理员', '2019-05-08 11:51:41', null, '7.4', '0');
INSERT INTO `sign` VALUES ('00000000034', '1557287431528', '2019-05-08 11:59:11', 'admin', '36', '90/145', '77', null, '超级管理员', '2019-05-08 11:59:36', null, '6.2', '0');
INSERT INTO `sign` VALUES ('00000000035', '1557287431528', '2019-05-08 11:59:38', 'admin', '37.5', '80/117', '78', null, '超级管理员', '2019-05-08 12:00:15', null, '6.2', '0');
INSERT INTO `sign` VALUES ('00000000036', '1557287431528', '2019-05-08 12:00:16', 'admin', '0', '90/130', '0', null, '超级管理员', '2019-05-08 12:00:36', null, '0', '0');
INSERT INTO `sign` VALUES ('00000000037', '1557287431528', '2019-05-08 12:10:27', 'admin', '36.5', '70/130', '69', '正常', '超级管理员', '2019-05-08 12:11:10', null, '6.3', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('0000000009', 'Z0001', '乌鸡白凤丸', '47.64', '97');
INSERT INTO `stock` VALUES ('0000000010', 'Z0003', '鸦胆子油软胶囊 ', '109', '278');
INSERT INTO `stock` VALUES ('0000000011', 'Z0004', '慈丹胶囊 ', '45.9', '85');
INSERT INTO `stock` VALUES ('0000000012', 'Z0005', '石杉碱甲片', '24.8', '198');
INSERT INTO `stock` VALUES ('0000000013', 'Z0006', '吡贝地尔缓释片', '76.5', '45');
INSERT INTO `stock` VALUES ('0000000014', 'Z0007', '盐酸维拉帕米缓释片 ', '36.1', '39');
INSERT INTO `stock` VALUES ('0000000015', 'Z0008', '马来酸依那普利胶囊 ', '18', '91');
INSERT INTO `stock` VALUES ('0000000016', 'Z0009', '肝复乐片', '74.44', '196');
INSERT INTO `stock` VALUES ('0000000017', 'Z1234', '强力枇杷露', '47.64', '309');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(25) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_describe` int(2) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('231123199808011232', '张褴褛', 'E10ADC3949BA59ABBE56E057F20F883E', null, '0', '2019-04-22 00:00:00');
INSERT INTO `user` VALUES ('371312201101042323', '王梓桐', 'E10ADC3949BA59ABBE56E057F20F883E', null, '0', '2019-04-26 00:00:00');
INSERT INTO `user` VALUES ('372312201905211234', 'MD5测试患者', 'E10ADC3949BA59ABBE56E057F20F883E', '', '0', '2019-05-22 22:47:23');
INSERT INTO `user` VALUES ('372323197702011234', '王大拿', 'E10ADC3949BA59ABBE56E057F20F883E', null, '0', '2019-04-22 16:52:01');
INSERT INTO `user` VALUES ('372502197702051212', '丁子彧', 'E10ADC3949BA59ABBE56E057F20F883E', null, '0', '2019-05-02 00:00:00');
INSERT INTO `user` VALUES ('admin', '超级管理员', '21232F297A57A5A743894A0E4A801FC3', null, '5', '2019-04-22 13:39:53');
INSERT INTO `user` VALUES ('doctor', '医生', 'F9F16D97C90D8C6F2CAB37BB6D1F1992', null, '2', '2019-04-22 13:38:11');
INSERT INTO `user` VALUES ('manager', '系统管理员', '1D0258C2440A8D19E716292B231E3190', null, '4', '2019-04-22 13:39:32');
INSERT INTO `user` VALUES ('nurse', '护士', '0701AA317DA5A004FBF6111545678A6C', null, '1', '2019-04-22 13:37:52');
INSERT INTO `user` VALUES ('service', '服务前台', 'AAABF0D39951F3E6C3E8A7911DF524C2', null, '3', '2019-04-22 13:39:19');

-- ----------------------------
-- Table structure for ward
-- ----------------------------
DROP TABLE IF EXISTS `ward`;
CREATE TABLE `ward` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `wardNo` int(11) NOT NULL,
  `departmentNo` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `space` int(3) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `createTime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ward
-- ----------------------------
INSERT INTO `ward` VALUES ('0000000071', '101', '1', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000072', '102', '1', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000073', '103', '1', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000074', '104', '1', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000075', '105', '1', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000076', '106', '1', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000077', '107', '1', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000078', '108', '1', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000079', '201', '2', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000080', '202', '2', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000081', '203', '2', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000082', '204', '2', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000083', '301', '3', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000084', '302', '3', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000085', '303', '3', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000086', '304', '3', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000087', '401', '4', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000088', '402', '4', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000089', '403', '4', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000090', '501', '5', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000091', '502', '5', '4', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000092', '503', '5', '3', '4', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000093', '504', '5', '2', '2', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000094', '505', '5', '1', '1', '0', '2019-04-22');
INSERT INTO `ward` VALUES ('0000000095', '601', '6', '1', '1', '1', '2019-04-26');
INSERT INTO `ward` VALUES ('0000000096', '506', '5', '3', '4', '0', '2019-05-23');

-- ----------------------------
-- Table structure for wardupdate
-- ----------------------------
DROP TABLE IF EXISTS `wardupdate`;
CREATE TABLE `wardupdate` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `patientId` varchar(20) DEFAULT NULL,
  `roomType` int(11) DEFAULT NULL,
  `updateTime` date DEFAULT NULL COMMENT '住院日期,与patient表的admissionTime字段保持一致',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='床位费用计算表';

-- ----------------------------
-- Records of wardupdate
-- ----------------------------
INSERT INTO `wardupdate` VALUES ('0000000047', '1555922984939', '3', '2019-04-22');
INSERT INTO `wardupdate` VALUES ('0000000048', '1555923323591', '1', '2019-04-22');
INSERT INTO `wardupdate` VALUES ('0000000049', '1555922984939', '4', '2019-04-25');
INSERT INTO `wardupdate` VALUES ('0000000050', '1555922984939', '1', '2019-04-25');
INSERT INTO `wardupdate` VALUES ('0000000051', '1555922984939', '4', '2019-04-25');
INSERT INTO `wardupdate` VALUES ('0000000052', '1555923323591', '2', '2019-04-25');
INSERT INTO `wardupdate` VALUES ('0000000053', '1555922984939', '1', '2019-04-25');
INSERT INTO `wardupdate` VALUES ('0000000054', '1555922984939', '4', '2019-04-25');
INSERT INTO `wardupdate` VALUES ('0000000055', '1556262004947', '1', '2019-04-26');
INSERT INTO `wardupdate` VALUES ('0000000056', '1556762747114', '3', '2019-05-02');
INSERT INTO `wardupdate` VALUES ('0000000057', '1557287431528', '2', '2019-05-08');
INSERT INTO `wardupdate` VALUES ('0000000058', '1558535901290', '2', '2019-05-22');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdrawal
-- ----------------------------
INSERT INTO `withdrawal` VALUES ('0000000015', '1493657709971', '赵薇', '1', '王飞', 'admin', 'Z0001', '2018-12-25', '过期');
INSERT INTO `withdrawal` VALUES ('0000000016', '1555922984939', '王大拿', '1', '超级管理员', 'admin', 'Z0001', '2019-04-25', '测试');
INSERT INTO `withdrawal` VALUES ('0000000017', '1556762747114', '丁子彧', '1', '超级管理员', 'admin', 'Z1234', '2019-05-23', '多发');

-- ----------------------------
-- Procedure structure for AutoDeleteLogs
-- ----------------------------
DROP PROCEDURE IF EXISTS `AutoDeleteLogs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AutoDeleteLogs`()
BEGIN
		DELETE FROM log WHERE DATE(create_time) <= DATE(DATE_SUB(NOW(),INTERVAL 3 DAY)) AND (type = 'DEBUG' OR type = 'INFO');
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for currval
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
-- Function structure for nextval
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

-- ----------------------------
-- Event structure for event_AutoDeleteLogs
-- ----------------------------
DROP EVENT IF EXISTS `event_AutoDeleteLogs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_AutoDeleteLogs` ON SCHEDULE EVERY 1 DAY STARTS '2019-04-25 00:00:00' ON COMPLETION PRESERVE ENABLE DO CALL AutoDeleteLogs()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_trigger_on_paracode`;
DELIMITER ;;
CREATE TRIGGER `insert_trigger_on_paracode` AFTER INSERT ON `paracode` FOR EACH ROW BEGIN
IF (new.code = '003') THEN
insert into category(type,name) values(new.parameter_values,new.parameter_name);
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_trigger_on_paracode`;
DELIMITER ;;
CREATE TRIGGER `update_trigger_on_paracode` AFTER UPDATE ON `paracode` FOR EACH ROW BEGIN
IF (new.code = '003') THEN
update category set type=new.parameter_values,name=new.parameter_name where type=new.parameter_values;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delete_trigger_on_paracode`;
DELIMITER ;;
CREATE TRIGGER `delete_trigger_on_paracode` AFTER DELETE ON `paracode` FOR EACH ROW BEGIN
IF (old.code = '003') THEN
delete from category where type=old.parameter_values;
END IF;
END
;;
DELIMITER ;
