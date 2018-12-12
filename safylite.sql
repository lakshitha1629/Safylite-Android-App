/*
Navicat MySQL Data Transfer

Source Server         : newcon
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : safylite

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-10-25 09:30:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `attendance`
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `subject_ID` int(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `student_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for `download`
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `teacher_id` int(100) DEFAULT NULL,
  `student_id` int(100) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `ExamId` int(100) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Academic_Year` varchar(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `teacher_id` int(100) DEFAULT NULL,
  `subject_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`ExamId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('5', 'Papper class 1', null, '0000-00-00', '1', null);
INSERT INTO `exam` VALUES ('6', 'papper class', null, '0000-00-00', '1', '2');

-- ----------------------------
-- Table structure for `hall`
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall` (
  `hallid` int(100) NOT NULL AUTO_INCREMENT,
  `hallname` varchar(100) DEFAULT NULL,
  `capacity` int(5) DEFAULT NULL,
  `subject_id` int(100) DEFAULT NULL,
  `institute_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hallid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES ('1', 'n', '100', '1', 'Wisdom');

-- ----------------------------
-- Table structure for `instituition`
-- ----------------------------
DROP TABLE IF EXISTS `instituition`;
CREATE TABLE `instituition` (
  `instituition_name` varchar(11) NOT NULL DEFAULT '0',
  `longitude` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`instituition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of instituition
-- ----------------------------
INSERT INTO `instituition` VALUES ('Wisdom', 'la', 'lat');
INSERT INTO `instituition` VALUES ('Wisdomss', '', '');

-- ----------------------------
-- Table structure for `marks`
-- ----------------------------
DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `student_id` int(100) DEFAULT NULL,
  `exam_id` int(100) DEFAULT NULL,
  `mark` double(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of marks
-- ----------------------------

-- ----------------------------
-- Table structure for `parent`
-- ----------------------------
DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `parent_id` int(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `mobile_sms` int(11) DEFAULT NULL,
  `mobile_call` int(11) DEFAULT NULL,
  `nic` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parent
-- ----------------------------

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `student_id` int(100) DEFAULT NULL,
  `subject_id` int(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `discount` double(10,0) DEFAULT NULL,
  `amount` double(10,0) DEFAULT NULL,
  `payment_id` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for `payment_info`
-- ----------------------------
DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info` (
  `student_id` int(100) DEFAULT NULL,
  `subject_id` int(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_id` int(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_info
-- ----------------------------

-- ----------------------------
-- Table structure for `rate`
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate` (
  `student_id` int(100) DEFAULT NULL,
  `teacher_id` int(100) DEFAULT NULL,
  `rate` varchar(10) DEFAULT NULL,
  `rate_type` int(5) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate
-- ----------------------------
INSERT INTO `rate` VALUES ('0', '0', '', '70', 'comm                                       ');
INSERT INTO `rate` VALUES ('0', '1', '4,2,3,5', '70', 'comm                                       ');
INSERT INTO `rate` VALUES ('4', '4', '4,2,3,5', '70', 'comm                                       ');
INSERT INTO `rate` VALUES ('1', '1', '5,3,4,3', '75', 'Good Teacher                                         \n                                              ');
INSERT INTO `rate` VALUES ('1', '1', '1,1,1,1', '20', '           \n                                                    ');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(0) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `school` varchar(0) DEFAULT NULL,
  `barcode` char(0) DEFAULT NULL,
  `grade` varchar(0) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `parent_nic` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'Ajith', 'Kurma', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `student_exam`
-- ----------------------------
DROP TABLE IF EXISTS `student_exam`;
CREATE TABLE `student_exam` (
  `examid` int(100) DEFAULT NULL,
  `studentid` int(100) DEFAULT NULL,
  `marks` double(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_exam
-- ----------------------------
INSERT INTO `student_exam` VALUES ('60', '1', '60');
INSERT INTO `student_exam` VALUES ('60', '1', '60');
INSERT INTO `student_exam` VALUES ('90', '1', '90');
INSERT INTO `student_exam` VALUES ('5', '1', '90');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_ID` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `subject_type` varchar(50) DEFAULT NULL,
  `teacher_ID` int(100) DEFAULT NULL,
  `fees` double(5,0) DEFAULT NULL,
  `dates` varchar(10) DEFAULT NULL,
  `times` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`subject_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', 'Chemistry', 'OL', '1', '1000', 'Wednesday', '02:30:00');
INSERT INTO `subject` VALUES ('2', 'Combined Maths', 'AL', '0', '2000', 'Saturday', '08:00:SS');
INSERT INTO `subject` VALUES ('3', 'Combined Maths', 'AL', '0', '2000', 'Saturday', '08:00:SS');
INSERT INTO `subject` VALUES ('4', 'Combined Maths', 'AL', '1', '2000', 'Saturday', '08:00:SS');
INSERT INTO `subject` VALUES ('5', 'Maths', 'OL', '1', '1000', 'Sunday', '11:00:00');
INSERT INTO `subject` VALUES ('6', null, null, null, null, null, null);
INSERT INTO `subject` VALUES ('7', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(100) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `straddress` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `highestQualification` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'Ajith', '', '', '', 'MSC');
INSERT INTO `teacher` VALUES ('2', 'k', '', '', '', '');
INSERT INTO `teacher` VALUES ('3', 'first', 'last', 'df', 'kuru', 'Bsc');
INSERT INTO `teacher` VALUES ('4', 'Nihal', 'Edirisinghe', 'sfdf', 'Kurunegaka', 'MSc');

-- ----------------------------
-- Table structure for `teacher_exam`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_exam`;
CREATE TABLE `teacher_exam` (
  `teacher_id` int(100) DEFAULT NULL,
  `examid` int(100) DEFAULT NULL,
  `preparedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher_exam
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_material`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_material`;
CREATE TABLE `teacher_material` (
  `teacher_id` int(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher_material
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_mobile`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_mobile`;
CREATE TABLE `teacher_mobile` (
  `teacher_id` int(100) NOT NULL,
  `mobile1` varchar(100) DEFAULT NULL,
  `mobile2` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher_mobile
-- ----------------------------
INSERT INTO `teacher_mobile` VALUES ('1', '', '');
INSERT INTO `teacher_mobile` VALUES ('2', '', '');
INSERT INTO `teacher_mobile` VALUES ('3', '071', '073');
INSERT INTO `teacher_mobile` VALUES ('4', '078', '90');

-- ----------------------------
-- Table structure for `teacher_payment`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_payment`;
CREATE TABLE `teacher_payment` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `amount` double(10,0) DEFAULT NULL,
  `incentive` double(10,0) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `teacher_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_paymentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_paymentinfo`;
CREATE TABLE `teacher_paymentinfo` (
  `payment_id` int(100) NOT NULL,
  `subject_id` int(100) DEFAULT NULL,
  `teacher_id` int(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher_paymentinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_subject`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_subject`;
CREATE TABLE `teacher_subject` (
  `teacherid` int(100) DEFAULT NULL,
  `subjectid` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teacher_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `upload`
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `teacher_id` int(100) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of upload
-- ----------------------------

-- ----------------------------
-- Table structure for `user_account`
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `user_id` int(100) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_type` varchar(5) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `activated` varchar(5) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES ('1', 'admin', '0', 'KNyip7M7dBOtO84dWMJt1nnHmfFhZG1pbg==', '1', null, null, null, null);
INSERT INTO `user_account` VALUES ('5', 'pp', null, 'BRcmuPraRpcdl7QQAvp/ZlgzmDNiZGQ5ZTY5NWEz', null, 'bdd9e695a3', '1', '2018-10-21 20:01:24', null);
INSERT INTO `user_account` VALUES ('5', 'praneeth', null, 'XgeWbFatiV+eepPau6BFkeZ65M0wZWM1MTA4YmE4', null, '0ec5108ba8', '1', '2018-10-21 20:03:54', null);
