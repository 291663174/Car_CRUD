/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : car

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 12/08/2020 15:42:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `Car_owner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Car_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Car_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Production_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Production_date` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Useful_date` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Car_color` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Car_miles` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`Car_owner_name`) USING BTREE,
  UNIQUE INDEX `Car_owner_name`(`Car_owner_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('张三', '闽A-55555', '', '', '', '', '', '');
INSERT INTO `car` VALUES ('李四', '闽A-66666', '小型车辆', '国产', '', '', '灰色', '');

-- ----------------------------
-- Table structure for car_owner
-- ----------------------------
DROP TABLE IF EXISTS `car_owner`;
CREATE TABLE `car_owner`  (
  `Car_owner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Car_owner_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Car_owner_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Car_owner_name`) USING BTREE,
  UNIQUE INDEX `Car_owner_name`(`Car_owner_name`) USING BTREE,
  CONSTRAINT `Car_owner_name` FOREIGN KEY (`Car_owner_name`) REFERENCES `car` (`Car_owner_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car_owner
-- ----------------------------
INSERT INTO `car_owner` VALUES ('张三', '13909238498', '');
INSERT INTO `car_owner` VALUES ('李四', '13676228422', '');

SET FOREIGN_KEY_CHECKS = 1;
