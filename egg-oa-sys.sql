/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 127.0.0.1:3306
 Source Schema         : egg-oa-sys

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 23/11/2021 15:00:39
*/
CREATE DATABASE IF NOT EXISTS `egg-oa-sys`;

USE `egg-oa-sys`;



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL COMMENT '父Id',
  `deptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '部门状态（1正常 0停用）',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 0, '总部', 1, '1', '0', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (2, 1, '技术部', 1, '1', '0', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (3, 1, '测试部', 2, '1', '0', '2021-07-14 18:21:27', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (4, 2, '技术一部', 1, '1', '0', '2021-07-14 18:21:41', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (5, 3, '测试一部', 1, '1', '0', '2021-07-14 18:21:49', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (6, 2, '技术二部', 2, '1', '0', '2021-07-14 18:22:00', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for dict_datas
-- ----------------------------
DROP TABLE IF EXISTS `dict_datas`;
CREATE TABLE `dict_datas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictSort` int(11) NOT NULL COMMENT '字典排序',
  `dictLabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `dictValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典键值',
  `dictType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `cssClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `listClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `isDefault` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '是否默认（Y是 N否）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_datas
-- ----------------------------
INSERT INTO `dict_datas` VALUES (1, 1, '正常', '1', 'sys_show_hide', NULL, NULL, 'Y', '1', '正常', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (2, 2, '停用', '0', 'sys_show_hide', NULL, NULL, 'Y', '1', '停用', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (3, 1, '正常', '1', 'sys_normal_disable', NULL, NULL, 'Y', '1', '正常', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (4, 2, '停用', '0', 'sys_normal_disable', NULL, NULL, 'Y', '1', '停用', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (5, 2, '男', '1', 'sys_user_sex', NULL, NULL, 'Y', '1', '男', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (6, 1, '女', '0', 'sys_user_sex', NULL, NULL, 'Y', '1', '女', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (7, 1, '消息', '1', 'sys_notice_type', NULL, NULL, 'Y', '1', '消息', '2021-11-23 14:48:36', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (8, 2, '公告', '2', 'sys_notice_type', NULL, NULL, 'Y', '1', '公告', '2021-11-23 14:48:46', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (9, 1, 'GET', 'GET', 'sys_method_type', NULL, NULL, 'Y', '1', 'GET', '2021-11-23 14:49:32', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (10, 2, 'POST', 'POST', 'sys_method_type', NULL, NULL, 'Y', '1', 'POST', '2021-11-23 14:49:41', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (11, 3, 'PUT', 'PUT', 'sys_method_type', NULL, NULL, 'Y', '1', 'PUT', '2021-11-23 14:49:50', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (12, 4, 'DELETE', 'DELETE', 'sys_method_type', NULL, NULL, 'Y', '1', 'DELETE', '2021-11-23 14:50:00', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for dict_types
-- ----------------------------
DROP TABLE IF EXISTS `dict_types`;
CREATE TABLE `dict_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `dictType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 2停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_types
-- ----------------------------
INSERT INTO `dict_types` VALUES (1, '显示状态', 'sys_show_hide', '1', '显示状态', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (2, '状态数据', 'sys_normal_disable', '1', '状态数据', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (3, '性别', 'sys_user_sex', '1', '性别', '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (4, '消息类型', 'sys_notice_type', '1', '消息类型', '2021-11-23 14:47:52', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (5, '请求方式', 'sys_method_type', '1', '请求方式', '2021-11-23 14:48:11', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `status` int(11) NULL DEFAULT NULL COMMENT 'http状态码',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (6, 'POST', '/api/v1/admin/system/dictData', '127.0.0.1', '{\"dictType\":\"sys_method_type\",\"dictLabel\":\"POST\",\"dictValue\":\"POST\",\"dictSort\":2,\"status\":\"1\",\"remark\":\"POST\",\"createdAt\":\"2021-11-23T06:49:41.165Z\",\"createdBy\":\"admin\"}', 200, '2021-11-23 14:49:41', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (7, 'POST', '/api/v1/admin/system/dictData', '127.0.0.1', '{\"dictType\":\"sys_method_type\",\"dictLabel\":\"PUT\",\"dictValue\":\"PUT\",\"dictSort\":3,\"status\":\"1\",\"remark\":\"PUT\",\"createdAt\":\"2021-11-23T06:49:50.968Z\",\"createdBy\":\"admin\"}', 200, '2021-11-23 14:49:50', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (8, 'POST', '/api/v1/admin/system/dictData', '127.0.0.1', '{\"dictType\":\"sys_method_type\",\"dictLabel\":\"DELETE\",\"dictValue\":\"DELETE\",\"dictSort\":4,\"status\":\"1\",\"remark\":\"DELETE\",\"createdAt\":\"2021-11-23T06:50:00.930Z\",\"createdBy\":\"admin\"}', 200, '2021-11-23 14:50:00', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (9, 'POST', '/api/v1/admin/system/notice', '127.0.0.1', '{\"noticeTitle\":\"公告\",\"noticeType\":\"2\",\"status\":\"1\",\"noticeContent\":\"这是公告\",\"createdAt\":\"2021-11-23T06:50:21.039Z\",\"createdBy\":\"admin\"}', 200, '2021-11-23 14:50:21', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (10, 'DELETE', '/api/v1/admin/system/logs/1', '127.0.0.1', '{}', 200, '2021-11-23 14:50:40', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (11, 'DELETE', '/api/v1/admin/system/logs/2', '127.0.0.1', '{}', 200, '2021-11-23 14:50:47', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (12, 'DELETE', '/api/v1/admin/system/logs/3', '127.0.0.1', '{}', 200, '2021-11-23 14:51:01', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (13, 'DELETE', '/api/v1/admin/system/logs/4,5', '127.0.0.1', '{}', 200, '2021-11-23 14:52:39', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (14, 'POST', '/api/v1/admin/system/user', '127.0.0.1', '{\"deptId\":3,\"nickName\":\"富士达\",\"userName\":\"sdfff\",\"password\":\"$2a$10$BBngMRpYaiG9hNnGbw/Obu4uDUEhB053ecKShrSo93f4T.AKwA1ri\",\"sex\":\"1\",\"roleIds\":[2],\"mobile\":\"13444556620\",\"status\":\"1\",\"email\":\"1670345555@qq.com\"}', 200, '2021-11-23 14:58:49', 'admin', NULL, NULL);
INSERT INTO `logs` VALUES (15, 'PUT', '/api/v1/admin/system/role/2', '127.0.0.1', '{\"id\":2,\"roleName\":\"测试\",\"roleKey\":\"ces\",\"roleSort\":2,\"status\":\"1\",\"menuIds\":[2,3,9,10,11,14,4,16,17,18,19,20,5,21,22,23,24,6,25,26,27,28,7,29,30,31,32,8,33,34,35,36],\"remark\":\"测试\",\"updatedAt\":\"2021-11-23T06:59:43.751Z\",\"updatedBy\":\"admin\"}', 200, '2021-11-23 14:59:43', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL COMMENT '父Id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `isFrame` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否为外链（1是 0否）',
  `menuType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'M' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单显示状态（1显示 0隐藏）',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `keepAlive` int(11) NULL DEFAULT 0 COMMENT '是否缓存',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '图标',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 0, '首页', '/layout/home', 'Home', 'Home', '1', 'C', '1', 1, '1', '', 1, 'nav-home', '0', NULL, '2021-07-08 14:52:13', 'admin', '2021-07-13 16:49:36', 'admin');
INSERT INTO `menus` VALUES (2, 0, '系统管理', '/system', 'System', 'Layout', '1', 'M', '1', 20, '1', '', 0, 'nav-system', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (3, 2, '用户中心', 'user', 'User', 'User', '1', 'C', '1', 1, '1', '', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', '2021-07-13 10:04:45', 'admin');
INSERT INTO `menus` VALUES (4, 2, '角色管理', 'role', 'Role', 'Role', '1', 'C', '1', 2, '1', '', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (5, 2, '菜单管理', 'menu', 'Menu', 'Menu', '1', 'C', '1', 3, '1', '', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (6, 2, '部门管理', 'dept', 'Dept', 'Dept', '1', 'C', '1', 4, '1', '', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (7, 2, '字典管理', 'dict', 'Dict', 'Dict', '1', 'C', '1', 6, '1', '', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (8, 2, '数据字典', 'dictData/:id', 'DictData', 'DictData', '1', 'C', '0', 7, '1', '', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (9, 3, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:user:list', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (10, 3, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:user:add', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (11, 3, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:user:update', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (12, 3, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:user:delete', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (13, 3, '重置密码', NULL, NULL, NULL, '0', 'F', '1', 5, '1', 'system:user:resetPwd', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (14, 3, '修改头像', NULL, NULL, NULL, '0', 'F', '1', 6, '1', 'system:user:updateUserImg', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (15, 3, '修改密码', NULL, NULL, NULL, '0', 'F', '1', 7, '1', 'system:user:updateUserPwd', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (16, 4, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:role:list', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (17, 4, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:role:add', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (18, 4, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:role:update', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (19, 4, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:role:delete', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (20, 4, '修改角色状态', NULL, NULL, NULL, '0', 'F', '1', 5, '1', 'system:role:changeRoleStatus', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (21, 5, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:menu:list', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (22, 5, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:menu:add', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (23, 5, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:menu:update', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (24, 5, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:menu:delete', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (25, 6, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:department:list', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (26, 6, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:department:add', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (27, 6, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:department:update', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (28, 6, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:department:delete', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (29, 7, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:dictType:list', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (30, 7, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:dictType:add', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (31, 7, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:dictType:update', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (32, 7, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:dictType:delete', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (33, 8, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:dictData:list', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (34, 8, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:dictData:add', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (35, 8, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:dictData:update', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (36, 8, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:dictData:delete', 0, '', '0', NULL, '2021-07-08 14:52:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (38, 2, '消息公告', 'notice', 'Notice', 'Notice', '0', 'C', '1', 10, '1', NULL, 1, '', '0', NULL, '2021-11-23 11:33:55', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (39, 38, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:notice:list', 1, '', '0', NULL, '2021-11-23 11:44:43', 'admin', '2021-11-23 11:45:11', 'admin');
INSERT INTO `menus` VALUES (40, 38, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:notice:add', 1, '', '0', NULL, '2021-11-23 11:45:05', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (41, 38, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:notice:update', 1, '', '0', NULL, '2021-11-23 11:45:26', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (42, 38, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:notice:delete	', 1, '', '0', NULL, '2021-11-23 11:45:42', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (43, 2, '系统日志', 'logs', 'Logs', 'Logs', '0', 'C', '1', 14, '1', 'system:notice:list', 1, '', '0', NULL, '2021-11-23 11:50:05', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (44, 43, '查询', NULL, NULL, NULL, '0', 'F', '1', 1, '1', 'system:logs:list', 1, '', '0', NULL, '2021-11-23 11:50:26', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (45, 43, '新增', NULL, NULL, NULL, '0', 'F', '1', 2, '1', 'system:logs:add', 1, '', '0', NULL, '2021-11-23 11:50:43', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (46, 43, '修改', NULL, NULL, NULL, '0', 'F', '1', 3, '1', 'system:logs:update	', 1, '', '0', NULL, '2021-11-23 11:50:59', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (47, 43, '删除', NULL, NULL, NULL, '0', 'F', '1', 4, '1', 'system:logs:delete', 1, '', '0', NULL, '2021-11-23 11:51:16', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (48, 43, '清空数据', NULL, NULL, NULL, '0', 'F', '1', 5, '1', 'system:logs:deleteAllLogs', 1, '', '0', NULL, '2021-11-23 11:51:33', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (49, 43, '导出', NULL, NULL, NULL, '0', 'F', '1', 10, '1', 'system:logs:export', 1, '', '0', NULL, '2021-11-23 11:51:54', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `noticeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '公告类型（1通知 2公告）',
  `noticeContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '公告状态（1正常 0停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (1, '公告', '2', '这是公告', '1', NULL, '2021-11-23 14:50:21', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色roleId',
  `menuId` int(11) NOT NULL COMMENT '菜单menuId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 384 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (385, 1, 1);
INSERT INTO `role_menus` VALUES (386, 1, 2);
INSERT INTO `role_menus` VALUES (387, 1, 3);
INSERT INTO `role_menus` VALUES (388, 1, 4);
INSERT INTO `role_menus` VALUES (389, 1, 5);
INSERT INTO `role_menus` VALUES (390, 1, 6);
INSERT INTO `role_menus` VALUES (391, 1, 7);
INSERT INTO `role_menus` VALUES (392, 1, 8);
INSERT INTO `role_menus` VALUES (393, 1, 9);
INSERT INTO `role_menus` VALUES (394, 1, 10);
INSERT INTO `role_menus` VALUES (395, 1, 11);
INSERT INTO `role_menus` VALUES (396, 1, 12);
INSERT INTO `role_menus` VALUES (397, 1, 13);
INSERT INTO `role_menus` VALUES (398, 1, 14);
INSERT INTO `role_menus` VALUES (399, 1, 15);
INSERT INTO `role_menus` VALUES (400, 1, 16);
INSERT INTO `role_menus` VALUES (401, 1, 17);
INSERT INTO `role_menus` VALUES (402, 1, 18);
INSERT INTO `role_menus` VALUES (403, 1, 19);
INSERT INTO `role_menus` VALUES (404, 1, 20);
INSERT INTO `role_menus` VALUES (405, 1, 21);
INSERT INTO `role_menus` VALUES (406, 1, 22);
INSERT INTO `role_menus` VALUES (407, 1, 23);
INSERT INTO `role_menus` VALUES (408, 1, 24);
INSERT INTO `role_menus` VALUES (409, 1, 25);
INSERT INTO `role_menus` VALUES (410, 1, 26);
INSERT INTO `role_menus` VALUES (411, 1, 27);
INSERT INTO `role_menus` VALUES (412, 1, 28);
INSERT INTO `role_menus` VALUES (413, 1, 29);
INSERT INTO `role_menus` VALUES (414, 1, 30);
INSERT INTO `role_menus` VALUES (415, 1, 31);
INSERT INTO `role_menus` VALUES (416, 1, 32);
INSERT INTO `role_menus` VALUES (417, 1, 33);
INSERT INTO `role_menus` VALUES (418, 1, 34);
INSERT INTO `role_menus` VALUES (419, 1, 35);
INSERT INTO `role_menus` VALUES (420, 1, 36);
INSERT INTO `role_menus` VALUES (421, 1, 38);
INSERT INTO `role_menus` VALUES (422, 1, 39);
INSERT INTO `role_menus` VALUES (423, 1, 40);
INSERT INTO `role_menus` VALUES (424, 1, 41);
INSERT INTO `role_menus` VALUES (425, 1, 42);
INSERT INTO `role_menus` VALUES (426, 1, 43);
INSERT INTO `role_menus` VALUES (427, 1, 44);
INSERT INTO `role_menus` VALUES (428, 1, 45);
INSERT INTO `role_menus` VALUES (429, 1, 46);
INSERT INTO `role_menus` VALUES (430, 1, 47);
INSERT INTO `role_menus` VALUES (431, 1, 48);
INSERT INTO `role_menus` VALUES (432, 1, 49);
INSERT INTO `role_menus` VALUES (433, 2, 2);
INSERT INTO `role_menus` VALUES (434, 2, 3);
INSERT INTO `role_menus` VALUES (435, 2, 9);
INSERT INTO `role_menus` VALUES (436, 2, 10);
INSERT INTO `role_menus` VALUES (437, 2, 11);
INSERT INTO `role_menus` VALUES (438, 2, 14);
INSERT INTO `role_menus` VALUES (439, 2, 4);
INSERT INTO `role_menus` VALUES (440, 2, 16);
INSERT INTO `role_menus` VALUES (441, 2, 17);
INSERT INTO `role_menus` VALUES (442, 2, 18);
INSERT INTO `role_menus` VALUES (443, 2, 19);
INSERT INTO `role_menus` VALUES (444, 2, 20);
INSERT INTO `role_menus` VALUES (445, 2, 5);
INSERT INTO `role_menus` VALUES (446, 2, 21);
INSERT INTO `role_menus` VALUES (447, 2, 22);
INSERT INTO `role_menus` VALUES (448, 2, 23);
INSERT INTO `role_menus` VALUES (449, 2, 24);
INSERT INTO `role_menus` VALUES (450, 2, 6);
INSERT INTO `role_menus` VALUES (451, 2, 25);
INSERT INTO `role_menus` VALUES (452, 2, 26);
INSERT INTO `role_menus` VALUES (453, 2, 27);
INSERT INTO `role_menus` VALUES (454, 2, 28);
INSERT INTO `role_menus` VALUES (455, 2, 7);
INSERT INTO `role_menus` VALUES (456, 2, 29);
INSERT INTO `role_menus` VALUES (457, 2, 30);
INSERT INTO `role_menus` VALUES (458, 2, 31);
INSERT INTO `role_menus` VALUES (459, 2, 32);
INSERT INTO `role_menus` VALUES (460, 2, 8);
INSERT INTO `role_menus` VALUES (461, 2, 33);
INSERT INTO `role_menus` VALUES (462, 2, 34);
INSERT INTO `role_menus` VALUES (463, 2, 35);
INSERT INTO `role_menus` VALUES (464, 2, 36);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `roleKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `roleSort` int(11) NOT NULL COMMENT '显示顺序',
  `dataScope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：本部门及以下数据权限 2：本部门数据权限 3：仅本人权限）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '角色状态（1正常 0停用）',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 'admin', 1, '1', '1', '0', NULL, '2021-07-08 14:52:13', 'admin', '2021-11-23 14:59:27', 'admin');
INSERT INTO `roles` VALUES (2, '测试', 'ces', 2, '1', '1', '0', '测试', '2021-07-12 14:46:04', 'admin', '2021-11-23 14:59:43', 'admin');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-departments.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-dict-data.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-dict-type.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-logs.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-menus.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-notices.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-role-menu.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-roles.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-create-user-role.js');
INSERT INTO `sequelizemeta` VALUES ('20210608025759-init-users.js');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (2, 2, 1);
INSERT INTO `user_roles` VALUES (3, 3, 1);
INSERT INTO `user_roles` VALUES (4, 4, 1);
INSERT INTO `user_roles` VALUES (5, 5, 1);
INSERT INTO `user_roles` VALUES (6, 10, 1);
INSERT INTO `user_roles` VALUES (7, 15, 1);
INSERT INTO `user_roles` VALUES (8, 19, 1);
INSERT INTO `user_roles` VALUES (9, 20, 1);
INSERT INTO `user_roles` VALUES (10, 21, 1);
INSERT INTO `user_roles` VALUES (11, 22, 1);
INSERT INTO `user_roles` VALUES (20, 1, 1);
INSERT INTO `user_roles` VALUES (21, 23, 2);
INSERT INTO `user_roles` VALUES (22, 24, 2);
INSERT INTO `user_roles` VALUES (23, 25, 1);
INSERT INTO `user_roles` VALUES (24, 26, 1);
INSERT INTO `user_roles` VALUES (25, 28, 1);
INSERT INTO `user_roles` VALUES (28, 30, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptId` int(11) NOT NULL COMMENT '部门deptId',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '性别（0代表女 1代表男）',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '帐号状态（1正常 0停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'admin', 'admin123', '1', '$2a$10$h9F9wNK9FBW3LQpjH/mGHurD88WNfYUVYwSRe0wnoYT8tJVAjK0Sm', '/uploads/1/CHP_1634630176570_16f194d7b8580d2950c33ab2c9e549d2.jpg', '789sd@qq.com', '13711031522', '0', '1', '', '2021-07-08 14:52:13', 'admin', '2021-07-09 15:14:59', 'admin');
INSERT INTO `users` VALUES (2, 1, 'test', 'test', '1', '$2a$10$7WZrqgx9U11UFnFPuRChJOvA5m65.I..eL.v8WrGeeml1BlkqhHxm', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 14:52:39', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (3, 1, 'test1', 'test', '1', '$2a$10$0KQwEw7S9M/sTrk/NWVhTOEudmYt5MyoXDdy9j2FLXRbw/IJIrT7W', NULL, NULL, '13444556620', '0', '1', NULL, '2021-07-08 14:55:28', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (4, 1, 'test11', 'test', '1', '$2a$10$iAZsm036g5WJU4ZZC/1SSuLKd1ikV80B.kQaDvLWYXOafRXniCdB2', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 14:55:45', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (5, 2, 'yunji', 'test', '1', '$2a$10$XdsjZPKEgAPWBzuAX/.6FuhXsP/PzyNQcsMpG8jHvjD90kVRaWbp2', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 14:57:20', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (10, 1, 'yunji1', 'test', '1', '$2a$10$AII0fKQ9eqyvTxwLwEXMZ.fHzqiMhjT9NISuPONMmTzBzZ/jyZj.K', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 14:58:51', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (15, 1, 'yunjissdsd', 'test', '1', '$2a$10$gpIIX1zTme3jZ76lmSn/Z.AXUE1Fi6XxnbmyvzqM9fRAGzUosc2Ty', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 15:13:38', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (19, 1, 'yunjiggggggg', 'test', '1', '$2a$10$zhGC14Iho3VDjjdP.Jno5uOsPJ.FsFIhR5R7yB4sg3Q79PnW8a/pm', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 15:19:36', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (20, 1, 'testfd', 'test', '1', '$2a$10$CKoU7pCd9KQfszP3BDdPeO2G6f6.A06e2/G8.N7cebVeON0Onk8Om', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 15:20:02', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (21, 2, 'test34', 'test11', '1', '$2a$10$xgDtclT3sjvCmORV7QJ.t./PT531dR08DPRFS17Ihm1a3nJ6Lq7My', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 15:20:17', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (22, 2, 'admindsfs', 'test', '1', '$2a$10$XQrYh2Yd9HkGBanVKidZJuMlFzDIVc3fxeudMuQvkoxqtUwmCaeYu', NULL, NULL, NULL, '0', '1', NULL, '2021-07-08 15:20:36', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (23, 1, 'cai', 'cai', '1', '$2a$10$y3QoXgel4d3vBMryPrSWdue2Wr/WvGxClTe1LActZ1HQ.Q7YdmGLa', NULL, NULL, NULL, '0', '1', NULL, '2021-07-13 10:18:06', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (24, 2, 'ZB01001', 'test11', '0', '$2a$10$eNJGAE3hTtkKTzVW96y8VuSFDoVynp1EOpXa12.g4bW0CLDVYabiC', NULL, NULL, '13444556620', '0', '1', NULL, '2021-10-19 15:56:52', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (25, 1, 'caitt', 'cddd', '0', '$2a$10$CXHRrXHi22HkukSigtGjU.y3Np/mjLSbQGHdFZtTJ73wxUshr4O1i', NULL, NULL, NULL, '0', '1', NULL, '2021-11-22 19:42:11', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (26, 1, 'cai5tt', 'cddd', '0', '$2a$10$iCEwvhgHtWDISzfOJdL32Og.sVsGP1Nyz/M/4V.SPOiElx8VfF2om', NULL, NULL, NULL, '0', '1', NULL, '2021-11-23 09:10:30', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (28, 1, 'cai25tt', 'cddd', '0', '$2a$10$XGlPyRxsJZ/CmjgrT8EMb.lhkkUDwQE1VXVevfMdKK6ZxWqs097Xe', NULL, NULL, NULL, '0', '1', NULL, '2021-11-23 09:20:43', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (30, 3, 'sdfff', '富士达', '1', '$2a$10$BBngMRpYaiG9hNnGbw/Obu4uDUEhB053ecKShrSo93f4T.AKwA1ri', NULL, '1670345555@qq.com', '13444556620', '0', '1', NULL, '2021-11-23 14:58:49', 'admin', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- 1. 货物信息表
-- ----------------------------
DROP TABLE IF EXISTS `logistics_cargo`;
CREATE TABLE `logistics_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargoNo` varchar(32) NOT NULL COMMENT '货物编号',
  `cargoName` varchar(100) NOT NULL COMMENT '货物名称',
  `cargoType` varchar(50) NOT NULL COMMENT '货物类型',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '重量(kg)',
  `volume` decimal(10,2) DEFAULT NULL COMMENT '体积(m³)',
  `specialRequirements` varchar(255) DEFAULT NULL COMMENT '特殊要求',
  `status` varchar(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `isDelete` varchar(1) DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdAt` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cargo_no` (`cargoNo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='货物信息表';

-- ----------------------------
-- 2. 运输路线表
-- ----------------------------
DROP TABLE IF EXISTS `logistics_route`;
CREATE TABLE `logistics_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `routeCode` varchar(32) NOT NULL COMMENT '路线编号',
  `startLocation` varchar(100) NOT NULL COMMENT '起始地',
  `endLocation` varchar(100) NOT NULL COMMENT '目的地',
  `transportType` varchar(20) NOT NULL COMMENT '运输方式',
  `estimatedTime` int(11) NOT NULL COMMENT '预计运输时间(小时)',
  `basePrice` decimal(10,2) NOT NULL COMMENT '基础运费',
  `status` varchar(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `isDelete` varchar(1) DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdAt` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_route_code` (`routeCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='运输路线表';

-- ----------------------------
-- 3. 物流订单表
-- ----------------------------
DROP TABLE IF EXISTS `logistics_order`;
CREATE TABLE `logistics_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(32) NOT NULL COMMENT '订单编号',
  `cargoId` int(11) NOT NULL COMMENT '货物ID',
  `routeId` int(11) NOT NULL COMMENT '路线ID',
  `senderName` varchar(50) NOT NULL COMMENT '发件人姓名',
  `senderPhone` varchar(20) NOT NULL COMMENT '发件人电话',
  `senderAddress` varchar(255) NOT NULL COMMENT '发件地址',
  `receiverName` varchar(50) NOT NULL COMMENT '收件人姓名',
  `receiverPhone` varchar(20) NOT NULL COMMENT '收件人电话',
  `receiverAddress` varchar(255) NOT NULL COMMENT '收件地址',
  `shippingFee` decimal(10,2) NOT NULL COMMENT '运费',
  `status` varchar(20) NOT NULL COMMENT '订单状态',
  `expectedArrivalTime` datetime DEFAULT NULL COMMENT '预计到达时间',
  `actualArrivalTime` datetime DEFAULT NULL COMMENT '实际到达时间',
  `isDelete` varchar(1) DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdAt` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`orderNo`),
  KEY `idx_cargo_id` (`cargoId`),
  KEY `idx_route_id` (`routeId`),
  CONSTRAINT `fk_order_cargo` FOREIGN KEY (`cargoId`) REFERENCES `logistics_cargo` (`id`),
  CONSTRAINT `fk_order_route` FOREIGN KEY (`routeId`) REFERENCES `logistics_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='物流订单表';

-- ----------------------------
-- 4. 订单追踪表
-- ----------------------------
DROP TABLE IF EXISTS `logistics_tracking`;
CREATE TABLE `logistics_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(32) NOT NULL COMMENT '订单编号',
  `location` varchar(100) NOT NULL COMMENT '当前位置',
  `status` varchar(20) NOT NULL COMMENT '追踪状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `trackingTime` datetime NOT NULL COMMENT '追踪时间',
  `createdAt` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `idx_order_no` (`orderNo`),
  CONSTRAINT `fk_tracking_order` FOREIGN KEY (`orderNo`) REFERENCES `logistics_order` (`orderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='订单追踪表';

-- ----------------------------
-- 5. 客户评价表
-- ----------------------------
DROP TABLE IF EXISTS `logistics_feedback`;
CREATE TABLE `logistics_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(32) NOT NULL COMMENT '订单编号',
  `satisfactionScore` tinyint(4) NOT NULL COMMENT '满意度评分(1-5)',
  `deliveryScore` tinyint(4) NOT NULL COMMENT '配送评分(1-5)',
  `serviceScore` tinyint(4) NOT NULL COMMENT '服务评分(1-5)',
  `feedbackContent` text COMMENT '反馈内容',
  `status` varchar(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `createdAt` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `idx_order_no` (`orderNo`),
  CONSTRAINT `fk_feedback_order` FOREIGN KEY (`orderNo`) REFERENCES `logistics_order` (`orderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='客户评价表';

-- 先清空表（如果需要）
TRUNCATE TABLE `logistics_feedback`;

-- 插入测试数据到 logistics_feedback 表
INSERT INTO `logistics_feedback` 
(`id`, `orderNo`, `satisfactionScore`, `deliveryScore`, `serviceScore`, `feedbackContent`, `status`, `createdAt`, `createdBy`) 
VALUES
(1, 'ORD202403160001', 5, 5, 4, '服务很好，物流很快，就是态度可以再好一点', '1', NOW(), 'customer1'),
(2, 'ORD202403160002', 4, 3, 5, '整体还不错，配送有点慢', '1', NOW(), 'customer2'),
(3, 'ORD202403160003', 5, 5, 5, '非常满意，各方面都很好', '1', NOW(), 'customer3'),
(4, 'ORD202403160004', 2, 1, 3, '配送太慢了，态度还可以', '1', NOW(), 'customer4'),
(5, 'ORD202403160005', 4, 4, 4, '一般般吧，还可以接受', '1', NOW(), 'customer5'),
(6, 'ORD202403160006', 3, 3, 3, '一般般', '1', NOW(), 'customer6'),
(7, 'ORD202403160007', 5, 4, 5, '服务态度很好', '1', NOW(), 'customer7'),
(8, 'ORD202403160008', 1, 2, 2, '太差了，配送很慢', '0', NOW(), 'customer8'),
(9, 'ORD202403160009', 4, 5, 4, '还不错，挺快的', '1', NOW(), 'customer9'),
(10, 'ORD202403160010', 5, 5, 5, '完美！', '1', NOW(), 'customer10');

-- ----------------------------
-- 6. 统计报表表
-- ----------------------------
DROP TABLE IF EXISTS `logistics_statistics`;
CREATE TABLE `logistics_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statsDate` date NOT NULL COMMENT '统计日期',
  `newOrderCount` int(11) NOT NULL DEFAULT '0' COMMENT '新订单数量',
  `completedOrderCount` int(11) NOT NULL DEFAULT '0' COMMENT '已完成订单数量',
  `totalAmount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `avgSatisfaction` decimal(3,2) NOT NULL DEFAULT '0.00' COMMENT '平均满意度',
  `createdAt` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedAt` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_stats_date` (`statsDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='物流统计报表';

-- ----------------------------
-- 添加物流相关的字典类型
-- ----------------------------
INSERT INTO `dict_types` (`dictName`, `dictType`, `status`, `remark`, `createdAt`, `createdBy`) VALUES 
('货物类型', 'logistics_cargo_type', '1', '货物类型', NOW(), 'admin'),
('运输方式', 'logistics_transport_type', '1', '运输方式', NOW(), 'admin'),
('订单状态', 'logistics_order_status', '1', '物流订单状态', NOW(), 'admin');

-- ----------------------------
-- 添加物流相关的字典数据
-- ----------------------------
INSERT INTO `dict_datas` (`dictSort`, `dictLabel`, `dictValue`, `dictType`, `status`, `remark`, `createdAt`, `createdBy`) VALUES
(1, '日用品', '1', 'logistics_cargo_type', '1', '日用品', NOW(), 'admin'),
(2, '食品', '2', 'logistics_cargo_type', '1', '食品', NOW(), 'admin'),
(3, '电子产品', '3', 'logistics_cargo_type', '1', '电子产品', NOW(), 'admin'),
(4, '医疗设备', '4', 'logistics_cargo_type', '1', '医疗设备', NOW(), 'admin'),
(5, '家具', '5', 'logistics_cargo_type', '1', '家具', NOW(), 'admin'),

(1, '海运', '1', 'logistics_transport_type', '1', '海运', NOW(), 'admin'),
(2, '空运', '2', 'logistics_transport_type', '1', '空运', NOW(), 'admin'),
(3, '快递', '3', 'logistics_transport_type', '1', '快递', NOW(), 'admin'),
(4, '铁路运输', '4', 'logistics_transport_type', '1', '铁路运输', NOW(), 'admin'),

(1, '待处理', '1', 'logistics_order_status', '1', '待处理', NOW(), 'admin'),
(2, '运输中', '2', 'logistics_order_status', '1', '运输中', NOW(), 'admin'),
(3, '已送达', '3', 'logistics_order_status', '1', '已送达', NOW(), 'admin'),
(4, '已取消', '4', 'logistics_order_status', '1', '已取消', NOW(), 'admin');

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouseName` varchar(50) NOT NULL COMMENT '仓库名称',
  `address` varchar(200) NOT NULL COMMENT '仓库地址',
  `capacity` int(11) NOT NULL DEFAULT '0' COMMENT '仓库容量',
  `usedCapacity` int(11) NOT NULL DEFAULT '0' COMMENT '已用容量',
  `manager` varchar(20) DEFAULT NULL COMMENT '仓库管理员',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态（0停用 1正常）',
  `remark` text COMMENT '备注',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库管理';

-- ----------------------------
-- 入库管理表
-- ----------------------------
DROP TABLE IF EXISTS `inbounds`;
CREATE TABLE `inbounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inboundNo` varchar(32) NOT NULL COMMENT '入库单号',
  `warehouseName` varchar(50) NOT NULL COMMENT '仓库名称',
  `cargoName` varchar(100) NOT NULL COMMENT '货物名称',
  `cargoType` varchar(50) DEFAULT NULL COMMENT '货物类型',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `unit` varchar(10) DEFAULT '件' COMMENT '单位',
  `supplier` varchar(100) DEFAULT NULL COMMENT '供应商',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态（1已入库 0待入库）',
  `inboundTime` datetime DEFAULT NULL COMMENT '入库时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_inbound_no` (`inboundNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库管理';

-- ----------------------------
-- Records of inbounds
-- ----------------------------
INSERT INTO `inbounds` VALUES
(1, 'IN20240320001', '深圳一号仓', '笔记本电脑', '电子产品', 120, '台', '深圳拓达电子', '1', '2024-03-20 10:30:00', '首批到货', '2024-03-20 10:30:00', 'admin', NULL, NULL),
(2, 'IN20240320002', '深圳一号仓', '医用口罩', '医疗设备', 5000, '盒', '华南医疗', '1', '2024-03-20 14:15:00', '紧急入库', '2024-03-20 14:15:00', 'admin', NULL, NULL),
(3, 'IN20240321001', '广州二号仓', '茶叶礼盒', '食品', 800, '箱', '岭南供应链', '1', '2024-03-21 09:20:00', NULL, '2024-03-21 09:20:00', 'admin', NULL, NULL),
(4, 'IN20240321002', '广州二号仓', '办公椅', '家具', 260, '把', '广大家居', '0', '2024-03-21 16:40:00', '待验收入库', '2024-03-21 16:40:00', 'admin', NULL, NULL),
(5, 'IN20240322001', '上海三号仓', '洗护套装', '日用品', 1500, '件', '沪上日化', '1', '2024-03-22 11:05:00', NULL, '2024-03-22 11:05:00', 'admin', NULL, NULL),
(6, 'IN20240322002', '上海三号仓', '服务器机柜', '电子产品', 45, '台', '星云科技', '0', '2024-03-22 15:50:00', '待入库排期', '2024-03-22 15:50:00', 'admin', NULL, NULL);

