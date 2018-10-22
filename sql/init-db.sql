/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3306

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 22/10/2018 14:22:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_menu
-- ----------------------------
DROP TABLE IF EXISTS `gen_menu`;
CREATE TABLE `gen_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  `href` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类访问URL',
  `view_perm_url` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '查看权限URL',
  `edit_perm_url` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '修改权限URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='生成菜单';

-- ----------------------------
-- Records of gen_menu
-- ----------------------------
BEGIN;
INSERT INTO `gen_menu` VALUES (1, '测试生成菜单', '1', '2018-10-15 20:00:10', '1', '2018-10-15 20:00:10', '', '1', '/tool/genMenu', 'tool:genMenu:view', 'tool:genMenu:edit');
INSERT INTO `gen_menu` VALUES (2, 'Studio用户', '1', '2018-10-15 20:01:55', '1', '2018-10-15 20:01:55', '', '1', '/psuser/psUser', 'psuser:psUser:view', 'psuser:psUser:edit');
INSERT INTO `gen_menu` VALUES (3, 'Code测试', '1', '2018-10-15 22:19:03', '1', '2018-10-15 22:19:03', '', '1', '/pscode/psCode', 'pscode:psCode:view', 'pscode:psCode:edit');
INSERT INTO `gen_menu` VALUES (4, '一对多测试', '1', '2018-10-16 10:55:28', '1', '2018-10-16 10:55:28', '', '1', '/test/testDataMain', 'test:testDataMain:view', 'test:testDataMain:edit');
INSERT INTO `gen_menu` VALUES (5, '关联测试', '1', '2018-10-16 11:12:30', '1', '2018-10-16 11:12:30', '', '0', '/test/testDataMain', 'test:testDataMain:view', 'test:testDataMain:edit');
INSERT INTO `gen_menu` VALUES (6, '用户管理', '1', '2018-10-16 12:51:01', '1', '2018-10-16 12:51:01', '', '1', '/psmatchsubmit/psUser', 'psmatchsubmit:psUser:view', 'psmatchsubmit:psUser:edit');
INSERT INTO `gen_menu` VALUES (7, '用户管理', '1', '2018-10-16 13:45:23', '1', '2018-10-16 13:45:23', '', '0', '/psuser/psUser', 'psuser:psUser:view', 'psuser:psUser:view');
INSERT INTO `gen_menu` VALUES (8, '匹配提交', '1', '2018-10-16 14:10:00', '1', '2018-10-16 14:10:00', '', '0', '/psmatchsubmit/psMatchSubmit', 'psmatchsubmit:psMatchSubmit:view', 'psmatchsubmit:psMatchSubmit:edit');
INSERT INTO `gen_menu` VALUES (9, '报名用户管理', '1', '2018-10-16 15:41:27', '1', '2018-10-16 15:41:27', '', '0', '/psmatchuser/psMatchUser', 'psmatchuser:psMatchUser:view', 'psmatchuser:psMatchUser:edit');
INSERT INTO `gen_menu` VALUES (10, '比赛管理', '1', '2018-10-16 16:32:27', '1', '2018-10-16 16:32:27', '', '0', '/psmatch/psMatch', 'psmatch:psMatch:view', 'psmatch:psMatch:edit');
INSERT INTO `gen_menu` VALUES (11, '阶段管理', '1', '2018-10-16 16:41:10', '1', '2018-10-16 16:41:10', '', '0', '/psmatchprocess/psMatchProcess', 'psmatchprocess:psMatchProcess:view', 'psmatchprocess:psMatchProcess:edit');
INSERT INTO `gen_menu` VALUES (12, '项目管理', '1', '2018-10-18 15:21:35', '1', '2018-10-18 15:21:35', '', '0', '/psproject/psProject', 'psproject:psProject:view', 'psproject:psProject:edit');
INSERT INTO `gen_menu` VALUES (13, '缓存管理', '1', '2018-10-20 16:40:30', '1', '2018-10-20 16:40:30', '', '1', '/redis/sysRedis', 'redis:sysRedis:view', 'redis:sysRedis:edit');
INSERT INTO `gen_menu` VALUES (14, 'EN信息', '1', '2018-10-21 15:45:52', '1', '2018-10-21 15:45:52', '', '1', '/eninfo/enInfo', 'eninfo:enInfo:view', 'eninfo:enInfo:edit');
INSERT INTO `gen_menu` VALUES (15, '列隐藏配置', '1', '2018-10-22 10:41:08', '1', '2018-10-22 10:41:08', '', '0', '/column/sysColumnHide', 'column:sysColumnHide:view', 'column:sysColumnHide:edit');
COMMIT;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` bigint(20) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
BEGIN;
INSERT INTO `gen_scheme` VALUES (2, 'Studio用户', 'curd', 'com.baidu.cms.studio.modules', 'psuser', '', 'Studio用户', 'Studio用户', 'shiyanjun', 3, '1', '2018-10-15 19:38:50', '1', '2018-10-15 21:26:17', '', '1');
INSERT INTO `gen_scheme` VALUES (3, 'code测试', 'curd', 'com.baidu.cms.studio.modules', 'pscode', '', 'code测试', 'code测试', 'shiyanjun', 5, '1', '2018-10-15 21:51:11', '1', '2018-10-16 10:04:47', '', '1');
INSERT INTO `gen_scheme` VALUES (4, '测试-主子表', 'curd_many', 'com.baidu.cms.studio.modules', 'test', '', '主表', '主表', 'shiyanjun', 6, '1', '2018-10-16 10:48:35', '1', '2018-10-16 17:55:19', '', '0');
INSERT INTO `gen_scheme` VALUES (5, 'studio-用户管理', 'curd', 'com.baidu.cms.studio.modules', 'psuser', '', '用户管理', '用户管理', 'shiyanjun', 11, '1', '2018-10-16 12:08:51', '1', '2018-10-18 20:56:54', '', '0');
INSERT INTO `gen_scheme` VALUES (6, 'studio-提交管理', 'curd', 'com.baidu.cms.studio.modules', 'psmatchsubmit', '', '提交管理', '提交', 'shiyanjun', 12, '1', '2018-10-16 14:07:13', '1', '2018-10-18 16:59:46', '', '0');
INSERT INTO `gen_scheme` VALUES (7, 'studio-报名用户', 'curd', 'com.baidu.cms.studio.modules', 'psmatchuser', '', '报名用户', '报名用户', 'shiyanjun', 13, '1', '2018-10-16 15:28:43', '1', '2018-10-18 16:59:27', '', '0');
INSERT INTO `gen_scheme` VALUES (8, 'studio-比赛表', 'curd', 'com.baidu.cms.studio.modules', 'psmatch', '', '比赛管理', '比赛', 'shiyanjun', 14, '1', '2018-10-16 16:27:10', '1', '2018-10-17 21:25:15', '', '0');
INSERT INTO `gen_scheme` VALUES (9, 'studio-阶段', 'curd', 'com.baidu.cms.studio.modules', 'psmatchprocess', '', '阶段管理', '比赛阶段', 'shiyanjun', 15, '1', '2018-10-16 16:27:54', '1', '2018-10-18 16:59:12', '', '0');
INSERT INTO `gen_scheme` VALUES (10, 'studio-项目表', 'curd', 'com.baidu.cms.studio.modules', 'psproject', '', '项目管理', '项目', 'shiyanjun', 16, '1', '2018-10-18 15:18:09', '1', '2018-10-18 16:58:57', '', '0');
INSERT INTO `gen_scheme` VALUES (11, '缓存管理', 'curd', 'com.baidu.cms.studio.modules', 'redis', '', '缓存管理', '缓存管理', 'shiyanjun', 17, '1', '2018-10-20 16:38:47', '1', '2018-10-20 16:38:51', '', '1');
INSERT INTO `gen_scheme` VALUES (12, 'EN信息表', 'curd', 'com.baidu.cms.studio.modules', 'eninfo', '', 'EN信息', 'EN信息', 'shiyanjun', 19, '1', '2018-10-21 15:44:45', '1', '2018-10-21 15:55:37', '', '1');
INSERT INTO `gen_scheme` VALUES (13, 'base-列隐藏配置', 'curd', 'com.baidu.cms.base.modules', 'column', '', '列隐藏配置', '列隐藏配置', 'shiyanjun', 26, '1', '2018-10-22 10:40:10', '1', '2018-10-22 13:43:53', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (2, 'ps_session', 'ps_session', 'PsSession', '', '', '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', '', '1');
INSERT INTO `gen_table` VALUES (3, 'ps_user', 'ps_user', 'PsUser', '', '', '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', '', '1');
INSERT INTO `gen_table` VALUES (4, 'ps_match_user', 'ps_match_user', 'PsMatchUser', 'ps_match_user', 'user_id', '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', '', '1');
INSERT INTO `gen_table` VALUES (5, 'ps_code', 'ps_code', 'PsCode', '', '', '1', '2018-10-15 21:45:10', '1', '2018-10-16 09:59:59', '', '1');
INSERT INTO `gen_table` VALUES (6, 'test_data_main', '主表', 'TestDataMain', '', '', '1', '2018-10-16 10:47:02', '1', '2018-10-16 21:30:09', '', '0');
INSERT INTO `gen_table` VALUES (7, 'test_data_child', '子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2018-10-16 10:50:46', '1', '2018-10-16 11:22:27', '', '0');
INSERT INTO `gen_table` VALUES (8, 'ps_match_submit', 'ps_match_submit', 'PsMatchSubmit', 'ps_user', 'user_id', '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', '', '1');
INSERT INTO `gen_table` VALUES (9, 'ps_match_user', 'ps_match_user', 'PsMatchUser', '', '', '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', '', '1');
INSERT INTO `gen_table` VALUES (10, 'ps_user', 'ps_user', 'PsUser', '', '', '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', '', '1');
INSERT INTO `gen_table` VALUES (11, 'ps_user', '用户管理', 'PsUser', '', '', '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', '', '0');
INSERT INTO `gen_table` VALUES (12, 'ps_match_submit', '提交管理', 'PsMatchSubmit', '', '', '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', '', '0');
INSERT INTO `gen_table` VALUES (13, 'ps_match_user', '报名用户', 'PsMatchUser', '', '', '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', '', '0');
INSERT INTO `gen_table` VALUES (14, 'ps_match', '比赛管理', 'PsMatch', '', '', '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', '', '0');
INSERT INTO `gen_table` VALUES (15, 'ps_match_process', '阶段管理', 'PsMatchProcess', '', '', '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', '', '0');
INSERT INTO `gen_table` VALUES (16, 'ps_project', '项目表', 'PsProject', '', '', '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', '', '0');
INSERT INTO `gen_table` VALUES (17, 'sys_redis', 'Redis缓存', 'SysRedis', '', '', '1', '2018-10-20 16:38:00', '1', '2018-10-20 16:38:00', '', '1');
INSERT INTO `gen_table` VALUES (18, 'en_info', 'EN信息表', 'EnInfo', 'us_info', 'us_id', '1', '2018-10-21 15:39:44', '1', '2018-10-21 15:55:21', '', '1');
INSERT INTO `gen_table` VALUES (19, 'us_info', 'US信息表', 'UsInfo', '', '', '1', '2018-10-21 15:48:51', '1', '2018-10-21 15:48:51', '', '1');
INSERT INTO `gen_table` VALUES (20, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 10:38:57', '1', '2018-10-22 10:38:57', '', '1');
INSERT INTO `gen_table` VALUES (21, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 11:01:40', '1', '2018-10-22 11:01:40', '', '1');
INSERT INTO `gen_table` VALUES (22, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 11:20:15', '1', '2018-10-22 11:26:19', '', '1');
INSERT INTO `gen_table` VALUES (23, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 11:42:04', '1', '2018-10-22 11:42:04', '', '1');
INSERT INTO `gen_table` VALUES (24, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 12:08:09', '1', '2018-10-22 12:08:35', '', '1');
INSERT INTO `gen_table` VALUES (25, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 13:12:41', '1', '2018-10-22 13:12:41', '', '1');
INSERT INTO `gen_table` VALUES (26, 'sys_column_hide', '列隐藏', 'SysColumnHide', '', '', '1', '2018-10-22 13:21:31', '1', '2018-10-22 13:43:42', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `gen_table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (17, 2, 'id', 'id', 'bigint(10)', 'Integer', 'id', '0', '0', '1', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (18, 2, 'session_ticket', 'session_ticket', 'varchar(66)', 'String', 'sessionTicket', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 20, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (19, 2, 'username', 'username', 'varchar(100)', 'String', 'username', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 30, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (20, 2, 'user_id', 'user_id', 'bigint(10)', 'com.baidu.cms.base.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '0', '0', '=', 'userselect', '', NULL, 40, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (21, 2, 'add_time', 'add_time', 'bigint(13)', 'Long', 'addTime', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 50, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (22, 2, 'status_code', 'status_code', 'int(2)', 'String', 'statusCode', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 60, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (23, 2, 'expire_time', 'expire_time', 'bigint(13)', 'Long', 'expireTime', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (24, 2, 'bduss', 'bduss', 'varchar(64)', 'String', 'bduss', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (25, 2, 'uid', 'uid', 'varchar(100)', 'String', 'uid', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 90, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (26, 2, 'session_id', 'session_id', 'varchar(100)', 'String', 'sessionId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 100, '1', '2018-10-15 18:54:55', '1', '2018-10-15 19:34:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (27, 3, 'id', 'id', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (28, 3, 'user_name', '用户名', 'varchar(100)', 'String', 'userName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (29, 3, 'user_source_id', '源ID', 'bigint(10)', 'Long', 'userSourceId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 30, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (30, 3, 'user_type', '用户类型 1：pass 2：uc', 'int(2)', 'String', 'userType', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 40, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (31, 3, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 50, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (32, 3, 'last_login_time', '更新时间', 'datetime', 'java.util.Date', 'lastLoginTime', '0', '0', '1', '1', '1', '1', '=', 'dateselect', '', NULL, 60, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (33, 3, 'status_code', '状态：1可用', 'int(2)', 'String', 'statusCode', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (34, 3, 'is_employee', '0:普通用户，1：百度帐号', 'int(2)', 'String', 'isEmployee', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (35, 3, 'display_name', '显示名称', 'varchar(100)', 'String', 'displayName', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 90, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (36, 3, 'true_name', '姓名', 'varchar(100)', 'String', 'trueName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 100, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (37, 3, 'idcard', '身份证', 'varchar(50)', 'String', 'idcard', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 110, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (38, 3, 'mobile', '手机号', 'varchar(50)', 'String', 'mobile', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 120, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (39, 3, 'capacity', '身份 Consts.UserCapacity', 'int(2)', 'String', 'capacity', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 130, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (40, 3, 'work_place', '工作地点', 'varchar(255)', 'String', 'workPlace', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 140, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (41, 3, 'position', '职位', 'varchar(255)', 'String', 'position', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 150, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (42, 3, 'region', '地区', 'varchar(255)', 'String', 'region', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 160, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (43, 3, 'portrait', '头像', 'varchar(255)', 'String', 'portrait', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 170, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (44, 3, 'user_abs', '介绍', 'varchar(500)', 'String', 'userAbs', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 180, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (45, 3, 'company_name', '公司名称', 'varchar(255)', 'String', 'companyName', '0', '0', '1', '1', '0', '1', 'like', 'input', '', NULL, 190, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (46, 3, 'email', '邮箱', 'varchar(255)', 'String', 'email', '0', '0', '1', '1', '0', '1', '=', 'input', '', NULL, 200, '1', '2018-10-15 19:37:02', '1', '2018-10-15 21:26:24', NULL, '1');
INSERT INTO `gen_table_column` VALUES (47, 4, 'id', 'id', 'bigint(10)', 'Integer', 'id', '0', '0', '1', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (48, 4, 'match_id', '比赛ID', 'bigint(10)', 'Integer', 'matchId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 20, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (49, 4, 'user_id', '用户ID', 'bigint(10)', 'com.baidu.cms.base.modules.sys.entity.User', 'user.id|name', '0', '0', '1', '1', '0', '0', '=', 'userselect', '', NULL, 30, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (50, 4, 'process_id', '阶段ID', 'bigint(10)', 'Integer', 'processId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 40, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (51, 4, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 50, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (52, 4, 'update_time', '更新时间', 'datetime', 'java.util.Date', 'updateTime', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 60, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (53, 4, 'routine_pass', '常规赛是否通过', 'int(2)', 'String', 'routinePass', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-10-15 20:16:05', '1', '2018-10-15 20:16:05', NULL, '1');
INSERT INTO `gen_table_column` VALUES (54, 5, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (55, 5, 'code_name', '名称', 'varchar(100)', 'String', 'codeName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (56, 5, 'code_content', '内容', 'longtext', 'String', 'codeContent', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (57, 5, 'user_id', '用户ID', 'bigint(10)', 'Long', 'userId', '0', '0', '1', '1', '1', '0', '=', 'userselect', '', NULL, 40, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (58, 5, 'code_category', '分类', 'bigint(10)', 'Long', 'codeCategory', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 50, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (59, 5, 'status_code', '状态码', 'int(2)', 'Integer', 'statusCode', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 60, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (60, 5, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '=', 'dateselect', '', NULL, 70, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (61, 5, 'code_type', '类型', 'int(2)', 'Integer', 'codeType', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-10-15 21:45:11', '1', '2018-10-16 09:59:59', NULL, '1');
INSERT INTO `gen_table_column` VALUES (62, 6, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-16 10:47:02', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (63, 6, 'user_id', '归属用户', 'bigint(64)', 'com.baidu.cms.base.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '0', '0', '0', '=', 'userselect', '', NULL, 20, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (64, 6, 'office_id', '归属部门', 'varchar(64)', 'com.baidu.cms.base.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '0', '0', '0', '=', 'officeselect', '', NULL, 30, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (65, 6, 'area_id', '归属区域', 'varchar(64)', 'com.baidu.cms.base.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '0', '0', '0', '=', 'areaselect', '', NULL, 40, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (66, 6, 'name', '名称', 'varchar(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', '', NULL, 50, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (67, 6, 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '0', '0', '0', '=', 'input', '', NULL, 60, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (68, 6, 'in_date', '加入日期', 'date', 'java.util.Date', 'inDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', '', NULL, 70, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (69, 6, 'create_by', '创建者', 'varchar(64)', 'com.baidu.cms.base.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '1', '0', '=', 'input', '', NULL, 80, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (70, 6, 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '1', '1', '0', '1', '0', '=', 'dateselect', '', NULL, 90, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (71, 6, 'update_by', '更新者', 'varchar(64)', 'com.baidu.cms.base.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', '', NULL, 100, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (72, 6, 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '1', '1', '0', '1', '0', '=', 'dateselect', '', NULL, 110, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (73, 6, 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '1', '=', 'textarea', '', NULL, 120, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (74, 6, 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', NULL, 130, '1', '2018-10-16 10:47:03', '1', '2018-10-16 21:30:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (75, 7, 'id', '编号', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (76, 7, 'test_data_main_id', '业务主表ID', 'bigint(20)', 'Long', 'testDataMainId.id', '0', '0', '1', '0', '1', '0', '=', 'input', '', NULL, 20, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (77, 7, 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (78, 7, 'create_by', '创建者', 'varchar(64)', 'com.baidu.cms.base.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 40, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (79, 7, 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', NULL, 50, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (80, 7, 'update_by', '更新者', 'varchar(64)', 'com.baidu.cms.base.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', NULL, 60, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (81, 7, 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '0', '1', '0', '=', 'dateselect', '', NULL, 70, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (82, 7, 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '1', '=', 'textarea', '', NULL, 80, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (83, 7, 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', NULL, 90, '1', '2018-10-16 10:50:47', '1', '2018-10-16 11:22:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (84, 8, 'id', '主键', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (85, 8, 'submit_name', '提交名称', 'varchar(200)', 'String', 'submitName', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 20, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (86, 8, 'version', '版本', 'varchar(20)', 'String', 'version', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 30, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (87, 8, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 40, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (88, 8, 'status_code', '1:提交2:对比中3:对比完成4:异常5:下载完成', 'int(2)', 'String', 'statusCode', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 50, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (89, 8, 'last_update_time', '最后更新时间', 'datetime', 'java.util.Date', 'lastUpdateTime', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 60, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (90, 8, 'user_id', '提交人', 'bigint(10)', 'String', 'userId.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (91, 8, 'score', '分数', 'double', 'String', 'score', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (92, 8, 'result_content', '结果json', 'varchar(2000)', 'String', 'resultContent', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 90, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (93, 8, 'bos_key', 'bos的key值', 'varchar(500)', 'String', 'bosKey', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 100, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (94, 8, 'bos_file_url', 'bos的url', 'varchar(1000)', 'String', 'bosFileUrl', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 110, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (95, 8, 'start_time', '任务开始时间', 'bigint(20)', 'Long', 'startTime', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 120, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (96, 8, 'end_time', '任务结束时间', 'bigint(20)', 'Long', 'endTime', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 130, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (97, 8, 'process_id', '阶段ID', 'bigint(11)', 'Long', 'processId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 140, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (98, 8, 'anonymous', '1匿名，0不匿名', 'tinyint(1)', 'String', 'anonymous', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 150, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (99, 8, 'reference', '参考文献', 'varchar(500)', 'String', 'reference', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 160, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (100, 8, 'introduction', '简介', 'varchar(500)', 'String', 'introduction', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 170, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (101, 8, 'project_id', '项目ID', 'bigint(10)', 'Integer', 'projectId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 180, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (102, 8, 'match_id', '比赛ID', 'bigint(10)', 'Integer', 'matchId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 190, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (103, 8, 'error_msg', '对比结果', 'varchar(255)', 'String', 'errorMsg', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 200, '1', '2018-10-16 11:57:41', '1', '2018-10-16 12:06:33', NULL, '1');
INSERT INTO `gen_table_column` VALUES (104, 9, 'id', 'id', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (105, 9, 'match_id', '比赛ID', 'bigint(10)', 'String', 'matchId', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 20, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (106, 9, 'user_id', '用户ID', 'bigint(10)', 'String', 'useId', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 30, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (107, 9, 'process_id', '阶段ID', 'bigint(10)', 'String', 'processId', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 40, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (108, 9, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', NULL, 50, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (109, 9, 'update_time', '更新时间', 'datetime', 'java.util.Date', 'updateTime', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 60, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (110, 9, 'routine_pass', '常规赛是否通过', 'int(2)', 'String', 'routinePass', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-10-16 11:59:55', '1', '2018-10-16 11:59:55', NULL, '1');
INSERT INTO `gen_table_column` VALUES (111, 10, 'id', 'id', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '0', '=', 'input', '', NULL, 10, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (112, 10, 'user_name', '用户名', 'varchar(100)', 'String', 'userName', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 20, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (113, 10, 'user_source_id', '源ID', 'bigint(10)', 'String', 'userSourceId', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 30, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (114, 10, 'user_type', '用户类型 1：pass 2：uc', 'int(2)', 'String', 'userType', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 40, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (115, 10, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', NULL, 50, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (116, 10, 'last_login_time', '更新时间', 'datetime', 'java.util.Date', 'lastLoginTime', '0', '0', '1', '1', '0', '0', '=', 'dateselect', '', NULL, 60, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (117, 10, 'status_code', '状态：1可用', 'int(2)', 'String', 'statusCode', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 70, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (118, 10, 'is_employee', '0:普通用户，1：百度帐号', 'int(2)', 'String', 'isEmployee', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 80, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (119, 10, 'display_name', '显示名称', 'varchar(100)', 'String', 'displayName', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 90, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (120, 10, 'true_name', '姓名', 'varchar(100)', 'String', 'trueName', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 100, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (121, 10, 'idcard', '身份证', 'varchar(50)', 'String', 'idcard', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 110, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (122, 10, 'mobile', '手机号', 'varchar(50)', 'String', 'mobile', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 120, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (123, 10, 'capacity', '身份 Consts.UserCapacity', 'int(2)', 'String', 'capacity', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 130, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (124, 10, 'work_place', '工作地点', 'varchar(255)', 'String', 'workPlace', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 140, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (125, 10, 'position', '职位', 'varchar(255)', 'String', 'position', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 150, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (126, 10, 'region', '地区', 'varchar(255)', 'String', 'region', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 160, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (127, 10, 'portrait', '头像', 'varchar(255)', 'String', 'portrait', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 170, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (128, 10, 'user_abs', '介绍', 'varchar(500)', 'String', 'userAbs', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 180, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (129, 10, 'company_name', '公司名称', 'varchar(255)', 'String', 'companyName', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 190, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (130, 10, 'email', '邮箱', 'varchar(255)', 'String', 'email', '0', '0', '1', '1', '0', '0', '=', 'input', '', NULL, 200, '1', '2018-10-16 12:01:37', '1', '2018-10-16 12:06:10', NULL, '1');
INSERT INTO `gen_table_column` VALUES (131, 11, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (132, 11, 'user_name', '用户名', 'varchar(100)', 'String', 'userName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (133, 11, 'user_source_id', '源ID', 'bigint(10)', 'Long', 'userSourceId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 170, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (134, 11, 'user_type', '用户类型', 'int(2)', 'Integer', 'userType', '0', '0', '1', '1', '1', '1', '=', 'select', 'user_type', NULL, 30, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (135, 11, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 190, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (136, 11, 'last_login_time', '更新时间', 'datetime', 'java.util.Date', 'lastLoginTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 200, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (137, 11, 'status_code', '可用状态', 'int(2)', 'Integer', 'statusCode', '0', '0', '1', '1', '1', '1', '=', 'select', 'studio_status_code', NULL, 180, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (138, 11, 'is_employee', '是否为员工', 'int(2)', 'Integer', 'isEmployee', '0', '0', '1', '1', '1', '1', '=', 'select', 'is_employee', NULL, 150, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (139, 11, 'display_name', '显示名称', 'varchar(100)', 'String', 'displayName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 160, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (140, 11, 'true_name', '姓名', 'varchar(100)', 'String', 'trueName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 40, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (141, 11, 'idcard', '身份证', 'varchar(50)', 'String', 'idcard', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 50, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (142, 11, 'mobile', '手机号', 'varchar(50)', 'String', 'mobile', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 60, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (143, 11, 'capacity', '身份', 'int(2)', 'Integer', 'capacity', '0', '0', '1', '1', '1', '1', '=', 'select', 'capacity', NULL, 100, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (144, 11, 'work_place', '工作地点', 'varchar(255)', 'String', 'workPlace', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 110, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (145, 11, 'position', '职位', 'varchar(255)', 'String', 'position', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 120, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (146, 11, 'region', '地区', 'varchar(255)', 'String', 'region', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 90, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (147, 11, 'portrait', '头像', 'varchar(255)', 'String', 'portrait', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 130, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (148, 11, 'user_abs', '介绍', 'varchar(500)', 'String', 'userAbs', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 140, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (149, 11, 'company_name', '公司名称', 'varchar(255)', 'String', 'companyName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 80, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (150, 11, 'email', '邮箱', 'varchar(255)', 'String', 'email', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 70, '1', '2018-10-16 13:31:49', '1', '2018-10-18 20:56:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (151, 12, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', NULL, '0');
INSERT INTO `gen_table_column` VALUES (152, 12, 'submit_name', '提交名称', 'varchar(200)', 'String', 'submitName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', NULL, '0');
INSERT INTO `gen_table_column` VALUES (153, 12, 'version', '版本', 'varchar(20)', 'String', 'version', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', NULL, '0');
INSERT INTO `gen_table_column` VALUES (154, 12, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 40, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', NULL, '0');
INSERT INTO `gen_table_column` VALUES (155, 12, 'status_code', '提交状态', 'int(2)', 'Integer', 'statusCode', '0', '0', '1', '1', '1', '1', '=', 'select', 'ps_match_submit_status_code', NULL, 50, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', NULL, '0');
INSERT INTO `gen_table_column` VALUES (156, 12, 'last_update_time', '最后更新时间', 'datetime', 'java.util.Date', 'lastUpdateTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 60, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:08', NULL, '0');
INSERT INTO `gen_table_column` VALUES (157, 12, 'user_id', '提交人', 'bigint(10)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 70, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (158, 12, 'score', '分数', 'double', 'Double', 'score', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 80, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (159, 12, 'result_content', '结果json', 'varchar(2000)', 'String', 'resultContent', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 90, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (160, 12, 'bos_key', 'bos的key值', 'varchar(500)', 'String', 'bosKey', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 100, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (161, 12, 'bos_file_url', 'bos的url', 'varchar(1000)', 'String', 'bosFileUrl', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 110, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (162, 12, 'start_time', '任务开始时间', 'bigint(20)', 'Long', 'startTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 120, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (163, 12, 'end_time', '任务结束时间', 'bigint(20)', 'Long', 'endTime', '0', '0', '1', '1', '1', '1', '&lt;=', 'input', '', NULL, 130, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (164, 12, 'process_id', '阶段ID', 'bigint(11)', 'Long', 'processId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 140, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (165, 12, 'anonymous', '是否匿名', 'tinyint(1)', 'Integer', 'anonymous', '0', '0', '1', '1', '1', '1', '=', 'select', 'anonymous', NULL, 150, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (166, 12, 'reference', '参考文献', 'varchar(500)', 'String', 'reference', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 160, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (167, 12, 'introduction', '简介', 'varchar(500)', 'String', 'introduction', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 170, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (168, 12, 'project_id', '项目ID', 'bigint(10)', 'Long', 'projectId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 180, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (169, 12, 'match_id', '比赛ID', 'bigint(10)', 'Long', 'matchId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 190, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (170, 12, 'error_msg', '对比结果', 'varchar(255)', 'String', 'errorMsg', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 200, '1', '2018-10-16 13:53:52', '1', '2018-10-18 16:48:09', NULL, '0');
INSERT INTO `gen_table_column` VALUES (171, 13, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (172, 13, 'match_id', '比赛ID', 'bigint(10)', 'Long', 'matchId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 20, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (173, 13, 'user_id', '用户ID', 'bigint(10)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 30, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (174, 13, 'process_id', '阶段ID', 'bigint(10)', 'Long', 'processId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 40, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (175, 13, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 50, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (176, 13, 'update_time', '更新时间', 'datetime', 'java.util.Date', 'updateTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 60, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (177, 13, 'routine_pass', '常规赛是否通过', 'int(2)', 'Integer', 'routinePass', '0', '0', '1', '1', '1', '1', '=', 'select', 'routine_pass', NULL, 70, '1', '2018-10-16 15:26:35', '1', '2018-10-18 16:48:27', NULL, '0');
INSERT INTO `gen_table_column` VALUES (178, 14, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (179, 14, 'match_name', '比赛名称', 'varchar(255)', 'String', 'matchName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (180, 14, 'status_code', '状态', 'int(2)', 'Integer', 'statusCode', '0', '0', '1', '1', '1', '1', '=', 'select', 'ps_match_status_code', NULL, 100, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (181, 14, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 160, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (182, 14, 'update_time', '更新时间', 'datetime', 'java.util.Date', 'updateTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 170, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (183, 14, 'match_key', '关键字', 'varchar(255)', 'String', 'matchKey', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 130, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (184, 14, 'process_id', '当前比赛阶段', 'bigint(10)', 'Long', 'processId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 40, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (185, 14, 'project_id', '关联项目', 'bigint(10)', 'Long', 'projectId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 60, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (186, 14, 'reward', '比赛奖金', 'varchar(100)', 'String', 'reward', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (187, 14, 'signup_count', '报名人数', 'bigint(10)', 'Long', 'signupCount', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 50, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (188, 14, 'tags', '标签', 'varchar(255)', 'String', 'tags', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 120, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (189, 14, 'start_time', '开始时间', 'datetime', 'java.util.Date', 'startTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 70, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (190, 14, 'end_time', '结束时间', 'datetime', 'java.util.Date', 'endTime', '0', '0', '1', '1', '1', '1', '&lt;=', 'dateselect', '', NULL, 80, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (191, 14, 'match_abs', '简介', 'varchar(1000)', 'String', 'matchAbs', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 110, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (192, 14, 'logo', '比赛logo', 'varchar(255)', 'String', 'logo', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 140, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (193, 14, 'forum_url', '论坛链接', 'varchar(255)', 'String', 'forumUrl', '0', '0', '1', '1', '1', '0', '=', 'input', '', NULL, 150, '1', '2018-10-16 16:11:03', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (194, 14, 'routine', '是否为常规赛', 'int(2)', 'Integer', 'routine', '0', '0', '1', '1', '1', '1', '=', 'select', 'ps_match_routine', NULL, 90, '1', '2018-10-16 16:11:04', '1', '2018-10-18 13:53:47', NULL, '0');
INSERT INTO `gen_table_column` VALUES (195, 15, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (196, 15, 'process_name', '阶段名称', 'varchar(255)', 'String', 'processName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (197, 15, 'match_id', '比赛ID', 'bigint(10)', 'Long', 'matchId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 30, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (198, 15, 'start_time', '开始时间', 'datetime', 'java.util.Date', 'startTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 40, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (199, 15, 'end_time', '结束时间', 'datetime', 'java.util.Date', 'endTime', '0', '0', '1', '1', '1', '1', '&lt;=', 'dateselect', '', NULL, 50, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (200, 15, 'project_id', '关联项目', 'bigint(10)', 'Long', 'projectId', '0', '0', '1', '1', '1', '1', '=', 'select', '', NULL, 60, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (201, 15, 'self_signup', '是否可自己报名', 'int(2)', 'Integer', 'selfSignup', '0', '0', '1', '1', '1', '1', '=', 'select', 'self_signup', NULL, 70, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (202, 15, 'has_leaderboard', '是否有排行版', 'int(2)', 'Integer', 'hasLeaderboard', '0', '0', '1', '1', '1', '1', '=', 'select', 'has_leaderboard', NULL, 80, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (203, 15, 'eval_docker_image', '执行脚本', 'varchar(255)', 'String', 'evalDockerImage', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 90, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (204, 15, 'eval_service', '处理类', 'varchar(255)', 'String', 'evalService', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 100, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (205, 15, 'eval_docker_command', 'Docker命令', 'varchar(255)', 'String', 'evalDockerCommand', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 110, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (206, 15, 'columns', '列JSON', 'varchar(255)', 'String', 'columns', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 120, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (207, 15, 'token_start_time', '获取Token开始时间', 'datetime', 'java.util.Date', 'tokenStartTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 130, '1', '2018-10-16 16:12:04', '1', '2018-10-18 16:51:44', NULL, '0');
INSERT INTO `gen_table_column` VALUES (208, 16, 'id', 'ID', 'bigint(10)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (209, 16, 'project_name', '项目名称', 'varchar(100)', 'String', 'projectName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (210, 16, 'project_abs', '项目简介', 'varchar(500)', 'String', 'projectAbs', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (211, 16, 'user_id', '用户ID', 'bigint(10)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 40, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (212, 16, 'status_code', '状态', 'int(2)', 'Integer', 'statusCode', '0', '0', '1', '1', '1', '1', '=', 'select', 'studio_status_code', NULL, 50, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (213, 16, 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 60, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (214, 16, 'update_time', '更新时间', 'datetime', 'java.util.Date', 'updateTime', '0', '0', '1', '1', '1', '1', '&gt;=', 'dateselect', '', NULL, 70, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (215, 16, 'project_file_id', '文件ID', 'bigint(10)', 'Long', 'projectFileId', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 80, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (216, 16, 'project_type', '项目类型', 'int(2)', 'Integer', 'projectType', '0', '0', '1', '1', '1', '1', '=', 'select', 'ps_project_project_type', NULL, 90, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (217, 16, 'office_project', '办公项目', 'int(2)', 'Integer', 'officeProject', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 100, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (218, 16, 'project_framework', '项目框架', 'int(2)', 'Integer', 'projectFramework', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 110, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (219, 16, 'project_environment', '项目环境', 'int(2)', 'Integer', 'projectEnvironment', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 120, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (220, 16, 'fork_from', 'Fork来源', 'bigint(10)', 'Long', 'forkFrom', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 130, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (221, 16, 'project_html', '项目Html', 'longtext', 'String', 'projectHtml', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 140, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (222, 16, 'project_weight', '项目权重', 'bigint(10)', 'Long', 'projectWeight', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 150, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (223, 16, 'fork_count', 'fork数', 'bigint(10)', 'Long', 'forkCount', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 160, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (224, 16, 'collect_count', '收藏数', 'bigint(10)', 'Long', 'collectCount', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 170, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (225, 16, 'comment_count', '评论数', 'bigint(10)', 'Long', 'commentCount', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 180, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (226, 16, 'week_weight', '每周热度', 'bigint(10)', 'Long', 'weekWeight', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 190, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (227, 16, 'month_weight', '每月热度', 'bigint(10)', 'Long', 'monthWeight', '0', '0', '1', '1', '1', '1', '&gt;=', 'input', '', NULL, 200, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (228, 16, 'resource_alloc', '资源分配', 'int(2)', 'Integer', 'resourceAlloc', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 210, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (229, 16, 'active_notebook_cluster', '0cpu集群', 'tinyint(4)', 'Integer', 'activeNotebookCluster', '0', '0', '1', '1', '1', '1', '=', 'select', 'active_notebook_cluster', NULL, 220, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (230, 16, 'active_notebook_cookie', '活跃Notebook', 'varchar(300)', 'String', 'activeNotebookCookie', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 230, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (231, 16, 'active_notebook_path', 'Notebook路径', 'varchar(100)', 'String', 'activeNotebookPath', '0', '0', '1', '1', '1', '0', 'like', 'input', '', NULL, 240, '1', '2018-10-18 15:04:40', '1', '2018-10-18 16:57:58', NULL, '0');
INSERT INTO `gen_table_column` VALUES (232, 17, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-20 16:38:00', '1', '2018-10-20 16:38:00', NULL, '1');
INSERT INTO `gen_table_column` VALUES (233, 17, 'redis_key', '缓存键', 'varchar(200)', 'String', 'redisKey', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-20 16:38:00', '1', '2018-10-20 16:38:00', NULL, '1');
INSERT INTO `gen_table_column` VALUES (234, 17, 'redis_value', '缓存值', 'text', 'String', 'redisValue', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-20 16:38:00', '1', '2018-10-20 16:38:00', NULL, '1');
INSERT INTO `gen_table_column` VALUES (235, 18, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-21 15:39:44', '1', '2018-10-21 15:55:21', NULL, '1');
INSERT INTO `gen_table_column` VALUES (236, 18, 'en_name', 'EN名称', 'varchar(100)', 'String', 'enName', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 20, '1', '2018-10-21 15:39:44', '1', '2018-10-21 15:55:21', NULL, '1');
INSERT INTO `gen_table_column` VALUES (237, 18, 'us_id', 'USID', 'bigint(20)', 'Long', 'usInfo.id|usName', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 30, '1', '2018-10-21 15:39:44', '1', '2018-10-21 15:55:21', NULL, '1');
INSERT INTO `gen_table_column` VALUES (238, 19, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-21 15:48:51', '1', '2018-10-21 15:48:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (239, 19, 'us_name', 'US名称', 'varchar(100)', 'String', 'usName', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 20, '1', '2018-10-21 15:48:51', '1', '2018-10-21 15:48:51', NULL, '1');
INSERT INTO `gen_table_column` VALUES (240, 20, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 10:38:57', '1', '2018-10-22 10:38:57', NULL, '1');
INSERT INTO `gen_table_column` VALUES (241, 20, 'show_type', '是否隐藏', 'int(2)', 'Integer', 'showType', '0', '0', '1', '1', '1', '1', '=', 'select', 'sys_column_hide_show_type', NULL, 20, '1', '2018-10-22 10:38:57', '1', '2018-10-22 10:38:57', NULL, '1');
INSERT INTO `gen_table_column` VALUES (242, 20, 'column_name', '列名', 'varchar(50)', 'String', 'columnName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-22 10:38:57', '1', '2018-10-22 10:38:57', NULL, '1');
INSERT INTO `gen_table_column` VALUES (243, 20, 'table_name', '表名', 'varchar(50)', 'String', 'tableName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 40, '1', '2018-10-22 10:38:57', '1', '2018-10-22 10:38:57', NULL, '1');
INSERT INTO `gen_table_column` VALUES (244, 21, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 11:01:40', '1', '2018-10-22 11:01:40', NULL, '1');
INSERT INTO `gen_table_column` VALUES (245, 21, 'show_type', '是否隐藏', 'int(2)', 'Integer', 'showType', '0', '0', '1', '1', '1', '1', '=', 'radiobox', 'sys_column_hide_show_type', NULL, 20, '1', '2018-10-22 11:01:40', '1', '2018-10-22 11:01:40', NULL, '1');
INSERT INTO `gen_table_column` VALUES (246, 21, 'show_index', '页面列索引', 'int(2)', 'Integer', 'showIndex', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 30, '1', '2018-10-22 11:01:40', '1', '2018-10-22 11:01:40', NULL, '1');
INSERT INTO `gen_table_column` VALUES (247, 21, 'mark_name', '标识名称', 'varchar(50)', 'String', 'markName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 40, '1', '2018-10-22 11:01:40', '1', '2018-10-22 11:01:40', NULL, '1');
INSERT INTO `gen_table_column` VALUES (248, 22, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 11:20:15', '1', '2018-10-22 11:26:19', NULL, '1');
INSERT INTO `gen_table_column` VALUES (249, 22, 'show_type', '是否隐藏', 'int(2)', 'Integer', 'showType', '0', '0', '1', '1', '1', '1', '=', 'radiobox', 'sys_column_hide_show_type', NULL, 20, '1', '2018-10-22 11:20:15', '1', '2018-10-22 11:26:19', NULL, '1');
INSERT INTO `gen_table_column` VALUES (250, 22, 'column_index_arr', '页面列索引', 'varchar(100)', 'String', 'columnIndexArr', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 40, '1', '2018-10-22 11:20:15', '1', '2018-10-22 11:26:19', NULL, '1');
INSERT INTO `gen_table_column` VALUES (251, 22, 'mark_name', '标识', 'varchar(50)', 'String', 'markName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-22 11:20:15', '1', '2018-10-22 11:26:19', NULL, '1');
INSERT INTO `gen_table_column` VALUES (252, 23, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 11:42:04', '1', '2018-10-22 11:42:04', NULL, '1');
INSERT INTO `gen_table_column` VALUES (253, 23, 'column_show_type', '是否隐藏', 'int(2)', 'Integer', 'columnShowType', '0', '0', '1', '1', '1', '1', '=', 'radiobox', 'sys_column_hide_show_type', NULL, 20, '1', '2018-10-22 11:42:04', '1', '2018-10-22 11:42:04', NULL, '1');
INSERT INTO `gen_table_column` VALUES (254, 23, 'column_show_index', '页面列索引', 'int(2)', 'Integer', 'columnShowIndex', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 30, '1', '2018-10-22 11:42:04', '1', '2018-10-22 11:42:04', NULL, '1');
INSERT INTO `gen_table_column` VALUES (255, 23, 'mark_name', '标识', 'varchar(50)', 'String', 'markName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 40, '1', '2018-10-22 11:42:04', '1', '2018-10-22 11:42:04', NULL, '1');
INSERT INTO `gen_table_column` VALUES (256, 24, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 12:08:09', '1', '2018-10-22 12:08:35', NULL, '1');
INSERT INTO `gen_table_column` VALUES (257, 24, 'column_hide_arr', '隐藏列索引', 'varchar(100)', 'String', 'columnHideArr', '0', '0', '1', '1', '1', '1', '=', 'textarea', '', NULL, 30, '1', '2018-10-22 12:08:09', '1', '2018-10-22 12:08:35', NULL, '1');
INSERT INTO `gen_table_column` VALUES (258, 24, 'mark_name', '标识名称', 'varchar(50)', 'String', 'markName', '0', '0', '1', '1', '1', '1', '=', 'input', '', NULL, 20, '1', '2018-10-22 12:08:09', '1', '2018-10-22 12:08:35', NULL, '1');
INSERT INTO `gen_table_column` VALUES (259, 25, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 13:12:41', '1', '2018-10-22 13:12:41', NULL, '1');
INSERT INTO `gen_table_column` VALUES (260, 25, 'column_hide_arr', '隐藏列索引', 'varchar(100)', 'String', 'columnHideArr', '0', '0', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 20, '1', '2018-10-22 13:12:41', '1', '2018-10-22 13:12:41', NULL, '1');
INSERT INTO `gen_table_column` VALUES (261, 25, 'page_name', '页面名称', 'varchar(50)', 'String', 'pageName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-22 13:12:41', '1', '2018-10-22 13:12:41', NULL, '1');
INSERT INTO `gen_table_column` VALUES (262, 25, 'table_name', '所属表名', 'varchar(50)', 'String', 'tableName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 40, '1', '2018-10-22 13:12:41', '1', '2018-10-22 13:12:41', NULL, '1');
INSERT INTO `gen_table_column` VALUES (263, 26, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '0', '0', '0', '1', '1', '=', 'input', '', NULL, 10, '1', '2018-10-22 13:21:31', '1', '2018-10-22 13:43:42', NULL, '0');
INSERT INTO `gen_table_column` VALUES (264, 26, 'column_hide_arr', '隐藏列索引', 'varchar(100)', 'String', 'columnHideArr', '0', '1', '1', '1', '1', '1', 'like', 'textarea', '', NULL, 40, '1', '2018-10-22 13:21:31', '1', '2018-10-22 13:43:42', NULL, '0');
INSERT INTO `gen_table_column` VALUES (265, 26, 'page_name', '页面名称', 'varchar(50)', 'String', 'pageName', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 20, '1', '2018-10-22 13:21:31', '1', '2018-10-22 13:43:42', NULL, '0');
INSERT INTO `gen_table_column` VALUES (266, 26, 'class_name', '所属类名', 'varchar(50)', 'String', 'className', '0', '0', '1', '1', '1', '1', 'like', 'input', '', NULL, 30, '1', '2018-10-22 13:21:31', '1', '2018-10-22 13:43:42', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
BEGIN;
INSERT INTO `sys_area` VALUES (1, 0, '0,', '中国', 10, '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_area` VALUES (2, 1, '0,1,', '北京', 20, '110000', '2', '1', '2013-05-27 08:00:00', '1', '2018-10-11 14:23:48', '', '0');
INSERT INTO `sys_area` VALUES (3, 2, '0,1,2,', '北京市', 30, '110101', '3', '1', '2013-05-27 08:00:00', '1', '2018-10-11 17:34:38', '', '0');
INSERT INTO `sys_area` VALUES (4, 3, '0,1,2,3,', '海淀区', 40, '110102', '4', '1', '2013-05-27 08:00:00', '1', '2018-10-15 21:10:41', '', '0');
INSERT INTO `sys_area` VALUES (5, 3, '0,1,2,3,', '东城区', 30, '100005', '4', '1', '2018-10-11 17:36:40', '1', '2018-10-11 18:04:41', '', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_column_hide
-- ----------------------------
DROP TABLE IF EXISTS `sys_column_hide`;
CREATE TABLE `sys_column_hide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `column_hide_arr` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面上要隐藏的列索引,使用逗号分隔',
  `page_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面名称',
  `class_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属类名,唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='列隐藏';

-- ----------------------------
-- Records of sys_column_hide
-- ----------------------------
BEGIN;
INSERT INTO `sys_column_hide` VALUES (1, '2,1', '提交列表页', 'PsMatchSubmit');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, '0', '正常', 'del_flag', '删除标记', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (2, '1', '删除', 'del_flag', '删除标记', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (3, '1', '显示', 'show_hide', '显示/隐藏', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (4, '0', '隐藏', 'show_hide', '显示/隐藏', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (5, '1', '是', 'yes_no', '是/否', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (6, '0', '否', 'yes_no', '是/否', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (7, 'red', '红色', 'color', '颜色值', 10, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-15 21:11:08', '', '0');
INSERT INTO `sys_dict` VALUES (8, 'green', '绿色', 'color', '颜色值', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (9, 'blue', '蓝色', 'color', '颜色值', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (10, 'yellow', '黄色', 'color', '颜色值', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (11, 'orange', '橙色', 'color', '颜色值', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (12, 'default', '默认主题', 'theme', '主题方案', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (13, 'cerulean', '天蓝主题', 'theme', '主题方案', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (14, 'readable', '橙色主题', 'theme', '主题方案', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (15, 'united', '红色主题', 'theme', '主题方案', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'flat', 'Flat主题', 'theme', '主题方案', 60, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (17, '1', '国家', 'sys_area_type', '区域类型', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '3', '地市', 'sys_area_type', '区域类型', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '4', '区县', 'sys_area_type', '区域类型', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (21, '1', '公司', 'sys_office_type', '机构类型', 60, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (22, '2', '部门', 'sys_office_type', '机构类型', 70, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (23, '3', '小组', 'sys_office_type', '机构类型', 80, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (24, '4', '其它', 'sys_office_type', '机构类型', 90, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (25, '1', '综合部', 'sys_office_common', '快捷通用部门', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (26, '2', '开发部', 'sys_office_common', '快捷通用部门', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (27, '3', '人力部', 'sys_office_common', '快捷通用部门', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (28, '1', '一级', 'sys_office_grade', '机构等级', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (29, '2', '二级', 'sys_office_grade', '机构等级', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (30, '3', '三级', 'sys_office_grade', '机构等级', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (31, '4', '四级', 'sys_office_grade', '机构等级', 40, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:49:44', '', '0');
INSERT INTO `sys_dict` VALUES (32, '1', '所有数据', 'sys_data_scope', '数据范围', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (33, '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (34, '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (35, '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (36, '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (37, '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (38, '9', '按明细设置', 'sys_data_scope', '数据范围', 100, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '1', '系统管理', 'sys_user_type', '用户类型', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '2', '普通用户', 'sys_user_type', '用户类型', 30, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-11 15:05:47', '', '0');
INSERT INTO `sys_dict` VALUES (67, '1', '接入日志', 'sys_log_type', '日志类型', 30, 0, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (68, '2', '异常日志', 'sys_log_type', '日志类型', 40, 0, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (96, '1', '男', 'sex', '性别', 10, 0, '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (97, '2', '女', 'sex', '性别', 20, 0, '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` VALUES (98, '22222', '红色2222', 'color2222', '颜色值2222', 10, 0, '1', '2018-10-11 17:24:41', '1', '2018-10-11 17:24:41', '', '1');
INSERT INTO `sys_dict` VALUES (99, '1', 'pass', 'user_type', '用户类型', 10, 0, '1', '2018-10-16 13:21:57', '1', '2018-10-16 13:24:25', '用户类型', '0');
INSERT INTO `sys_dict` VALUES (100, '0', 'uc', 'user_type', '用户类型', 20, 0, '1', '2018-10-16 13:22:47', '1', '2018-10-16 13:24:28', '用户类型', '0');
INSERT INTO `sys_dict` VALUES (101, '1', '可用', 'ps_user_status_code', '是否可用', 20, 0, '1', '2018-10-16 13:27:59', '1', '2018-10-16 20:34:16', '是否可用', '1');
INSERT INTO `sys_dict` VALUES (102, '0', '隐藏', 'studio_status_code', '是否显示', 10, 0, '1', '2018-10-16 13:28:20', '1', '2018-10-18 16:39:28', '', '1');
INSERT INTO `sys_dict` VALUES (103, '0', '普通用户', 'is_employee', '是否为员工', 10, 0, '1', '2018-10-16 13:29:51', '1', '2018-10-16 13:30:50', '是否为员工', '0');
INSERT INTO `sys_dict` VALUES (104, '1', '百度账号', 'is_employee', '是否为员工', 20, 0, '1', '2018-10-16 13:30:02', '1', '2018-10-16 13:30:52', '是否为员工', '0');
INSERT INTO `sys_dict` VALUES (105, '0', '是', 'capacity', '是否', 10, 0, '1', '2018-10-16 13:35:59', '1', '2018-10-16 13:35:59', '是否', '0');
INSERT INTO `sys_dict` VALUES (106, '1', '否', 'capacity', '是否', 20, 0, '1', '2018-10-16 13:36:15', '1', '2018-10-16 13:36:15', '是否', '0');
INSERT INTO `sys_dict` VALUES (107, '1', '提交', 'ps_match_submit_status_code', '提交状态', 10, 0, '1', '2018-10-16 13:58:43', '1', '2018-10-18 16:42:50', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `sys_dict` VALUES (108, '2', '对比中', 'ps_match_submit_status_code', '提交状态', 20, 0, '1', '2018-10-16 13:59:22', '1', '2018-10-18 16:43:03', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `sys_dict` VALUES (109, '3', '对比完成', 'ps_match_submit_status_code', '提交状态', 30, 0, '1', '2018-10-16 13:59:57', '1', '2018-10-18 16:43:10', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `sys_dict` VALUES (110, '4', '异常', 'ps_match_submit_status_code', '提交状态', 40, 0, '1', '2018-10-16 14:00:29', '1', '2018-10-18 16:43:22', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `sys_dict` VALUES (111, '5', '下载完成', 'ps_match_submit_status_code', '提交状态', 50, 0, '1', '2018-10-16 14:00:54', '1', '2018-10-18 16:43:35', '1:提交2:对比中3:对比完成4:异常5:下载完成', '0');
INSERT INTO `sys_dict` VALUES (112, '1', '匿名', 'anonymous', '是否匿名', 10, 0, '1', '2018-10-16 14:01:57', '1', '2018-10-16 14:01:57', '是否匿名:1匿名，0不匿名', '0');
INSERT INTO `sys_dict` VALUES (113, '0', '不匿名', 'anonymous', '是否匿名', 20, 0, '1', '2018-10-16 14:02:22', '1', '2018-10-16 14:02:22', '是否匿名:1匿名，0不匿名', '0');
INSERT INTO `sys_dict` VALUES (114, '1', '通过', 'routine_pass', '常规赛是否通过', 10, 0, '1', '2018-10-16 15:24:56', '1', '2018-10-16 15:24:56', '常规赛是否通过', '0');
INSERT INTO `sys_dict` VALUES (115, '0', '未通过', 'routine_pass', '常规赛是否通过', 20, 0, '1', '2018-10-16 15:25:28', '1', '2018-10-20 19:30:02', '常规赛是否通过', '0');
INSERT INTO `sys_dict` VALUES (116, '0', '否', 'ps_match_routine', '是否为常规赛', 10, 0, '1', '2018-10-16 16:16:26', '1', '2018-10-17 19:15:11', '是否为常规赛', '0');
INSERT INTO `sys_dict` VALUES (117, '1', '是', 'ps_match_routine', '是否为常规赛', 20, 0, '1', '2018-10-16 16:17:00', '1', '2018-10-17 19:15:25', '是否为常规赛', '0');
INSERT INTO `sys_dict` VALUES (118, '1', '是', 'has_leaderboard', '是否有排行版', 20, 0, '1', '2018-10-16 16:43:27', '1', '2018-10-16 16:48:47', '是否有排行版', '0');
INSERT INTO `sys_dict` VALUES (119, '0', '否', 'has_leaderboard', '是否有排行版', 10, 0, '1', '2018-10-16 16:43:55', '1', '2018-10-16 16:43:55', '是否有排行版', '0');
INSERT INTO `sys_dict` VALUES (120, '0', '否', 'self_signup', '是否可自己报名', 10, 0, '1', '2018-10-16 16:44:25', '1', '2018-10-16 16:44:25', '是否可自己报名', '0');
INSERT INTO `sys_dict` VALUES (121, '1', '是', 'self_signup', '是否可自己报名', 20, 0, '1', '2018-10-16 16:44:53', '1', '2018-10-16 16:48:37', '是否可自己报名', '0');
INSERT INTO `sys_dict` VALUES (122, '1', '显示', 'ps_match_status_code', '比赛状态', 10, 0, '1', '2018-10-16 20:22:28', '1', '2018-10-20 19:30:40', '软删除标识:0不显示,1显示', '0');
INSERT INTO `sys_dict` VALUES (123, '0', '不显示', 'ps_match_status_code', '比赛状态', 20, 0, '1', '2018-10-16 20:23:48', '1', '2018-10-20 19:30:48', '软删除标识:0不显示,1显示', '0');
INSERT INTO `sys_dict` VALUES (124, '1', '北京gpu', 'active_notebook_cluster', '0cpu集群', 10, 0, '1', '2018-10-18 15:05:48', '1', '2018-10-18 15:05:48', '0cpu集群  1北京gpu  2苏州gpu', '0');
INSERT INTO `sys_dict` VALUES (125, '2', '苏州gpu', 'active_notebook_cluster', '0cpu集群', 10, 0, '1', '2018-10-18 15:06:17', '1', '2018-10-18 15:06:17', '0cpu集群  1北京gpu  2苏州gpu', '0');
INSERT INTO `sys_dict` VALUES (126, '0', '隐藏', 'ps_project_status_code', '状态', 10, 0, '1', '2018-10-18 15:11:52', '1', '2018-10-18 15:14:14', '项目状态1显示0隐藏', '1');
INSERT INTO `sys_dict` VALUES (127, '1', '显示', 'ps_project_status_code', '项目状态', 10, 0, '1', '2018-10-18 15:13:59', '1', '2018-10-18 15:14:07', '项目状态1显示0隐藏', '1');
INSERT INTO `sys_dict` VALUES (128, '0', '隐藏', 'studio_status_code', '是否显示', 10, 0, '1', '2018-10-18 16:38:37', '1', '2018-10-18 16:38:37', '', '0');
INSERT INTO `sys_dict` VALUES (129, '1', '显示', 'studio_status_code', '是否显示', 10, 0, '1', '2018-10-18 16:38:52', '1', '2018-10-18 16:38:52', '', '0');
INSERT INTO `sys_dict` VALUES (130, '1', '状态1', 'ps_project_project_type', '项目状态', 10, 0, '1', '2018-10-18 16:56:04', '1', '2018-10-18 16:57:05', '', '0');
INSERT INTO `sys_dict` VALUES (131, '2', '状态2', 'ps_project_project_type', '项目状态', 20, 0, '1', '2018-10-18 16:56:19', '1', '2018-10-18 16:57:12', '', '0');
INSERT INTO `sys_dict` VALUES (132, '3', '状态3', 'ps_project_project_type', '项目状态', 30, 0, '1', '2018-10-18 16:56:36', '1', '2018-10-18 16:57:19', '', '0');
INSERT INTO `sys_dict` VALUES (133, '0', '隐藏', 'sys_column_hide_show_type', '是否隐藏列', 20, 0, '1', '2018-10-22 10:34:12', '1', '2018-10-22 10:34:12', '', '0');
INSERT INTO `sys_dict` VALUES (134, '1', '显示', 'sys_column_hide_show_type', '是否隐藏列', 10, 0, '1', '2018-10-22 10:34:25', '1', '2018-10-22 10:34:25', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8436 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '0,', '功能菜单', 0, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (2, 1, '0,1,', '系统设置', 20, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (3, 2, '0,1,2,', '系统设置', 400, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (4, 3, '0,1,2,3,', '菜单管理', 30, '/sys/menu/', '', 'list-alt', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-15 14:39:45', '', '0');
INSERT INTO `sys_menu` VALUES (5, 4, '0,1,2,3,4,', '查看', 30, NULL, NULL, NULL, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (6, 4, '0,1,2,3,4,', '修改', 40, NULL, NULL, NULL, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (7, 3, '0,1,2,3,', '角色管理', 50, '/sys/role/', NULL, 'lock', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (8, 7, '0,1,2,3,7,', '查看', 30, NULL, NULL, NULL, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (9, 7, '0,1,2,3,7,', '修改', 40, NULL, NULL, NULL, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (10, 3, '0,1,2,3,', '字典管理', 60, '/sys/dict/', NULL, 'th-list', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (11, 10, '0,1,2,3,10,', '查看', 30, NULL, NULL, NULL, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (12, 10, '0,1,2,3,10,', '修改', 40, NULL, NULL, NULL, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (13, 2, '0,1,2,', '机构用户', 300, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (14, 13, '0,1,2,13,', '区域管理', 50, '/sys/area/', NULL, 'th', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (15, 14, '0,1,2,13,14,', '查看', 30, NULL, NULL, NULL, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (16, 14, '0,1,2,13,14,', '修改', 40, NULL, NULL, NULL, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (17, 13, '0,1,2,13,', '机构管理', 40, '/sys/office/', NULL, 'th-large', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (18, 17, '0,1,2,13,17,', '查看', 30, NULL, NULL, NULL, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (19, 17, '0,1,2,13,17,', '修改', 40, NULL, NULL, NULL, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (20, 13, '0,1,2,13,', '用户管理', 30, '/sys/user/index', '', 'user', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:04:51', '', '0');
INSERT INTO `sys_menu` VALUES (21, 20, '0,1,2,13,20,', '查看', 30, '', '', '', '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2018-10-07 19:35:28', '', '0');
INSERT INTO `sys_menu` VALUES (22, 20, '0,1,2,13,20,', '修改', 40, NULL, NULL, NULL, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (23, 2, '0,1,2,', '关于帮助', 600, '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-07 21:14:45', '', '0');
INSERT INTO `sys_menu` VALUES (24, 23, '0,1,2,23,', '官方首页', 30, 'http://www.baidu.com/', '', 'circle-blank', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-16 09:57:55', '', '0');
INSERT INTO `sys_menu` VALUES (27, 2, '0,1,2,', '我的面板', 200, '', '', '', '0', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 16:17:24', '', '0');
INSERT INTO `sys_menu` VALUES (28, 27, '0,1,2,27,', '个人信息', 30, '', '', '', '1', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:49:24', '', '0');
INSERT INTO `sys_menu` VALUES (29, 28, '0,1,2,27,28,', '个人信息', 30, '/sys/user/info', NULL, 'user', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (30, 28, '0,1,2,27,28,', '修改密码', 40, '/sys/user/modifyPwd', NULL, 'lock', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (56, 71, '0,1,2,27,71,', '文件管理', 90, '/../static/ckfinder/ckfinder.html', NULL, 'folder-open', '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (57, 56, '0,1,2,27,40,56,', '查看', 30, NULL, NULL, NULL, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (58, 56, '0,1,2,27,40,56,', '上传', 40, NULL, NULL, NULL, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (59, 56, '0,1,2,27,40,56,', '修改', 50, NULL, NULL, NULL, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (67, 2, '0,1,2,', '日志查询', 500, '', '', '', '1', '', '1', '2013-06-03 08:00:00', '1', '2018-10-03 22:52:23', '', '0');
INSERT INTO `sys_menu` VALUES (68, 67, '0,1,2,67,', '日志查询', 30, '/sys/log', NULL, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (71, 27, '0,1,2,27,', '文件管理', 90, NULL, NULL, NULL, '1', NULL, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (79, 2, '0,1,2,', '代码生成', 100, '', '', '', '1', '', '1', '2013-10-16 08:00:00', '1', '2018-10-07 11:10:53', '', '1');
INSERT INTO `sys_menu` VALUES (80, 2, '0,1,2,', '开发工具', 50, '', '', '', '1', '', '1', '2013-10-16 08:00:00', '1', '2018-10-16 09:56:09', '仅供研发人员使用！', '0');
INSERT INTO `sys_menu` VALUES (81, 80, '0,1,2,80,', '生成方案配置', 30, '/gen/genScheme', '', '', '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2018-10-16 10:00:48', '', '0');
INSERT INTO `sys_menu` VALUES (82, 80, '0,1,2,80,', '业务表配置', 20, '/gen/genTable', NULL, NULL, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (84, 67, '0,1,2,67,', '连接池监视', 40, '/../druid', NULL, NULL, '1', NULL, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (86, 90, '0,1,90,', '测试站点', 230, '', '', '', '1', '', '1', '2018-10-11 19:26:04', '1', '2018-10-11 19:32:50', '', '1');
INSERT INTO `sys_menu` VALUES (87, 86, '0,1,90,86,', '测试站点', 30, '/site/testSite', '', '', '1', '', '1', '2018-10-11 19:28:01', '1', '2018-10-11 19:28:01', '', '1');
INSERT INTO `sys_menu` VALUES (88, 87, '0,1,90,86,87,', '查看', 30, '', '', '', '0', 'site:testSite:view', '1', '2018-10-11 19:29:30', '1', '2018-10-11 19:30:13', '', '1');
INSERT INTO `sys_menu` VALUES (89, 87, '0,1,90,86,87,', '修改', 60, '', '', '', '0', 'site:testSite:edit', '1', '2018-10-11 19:29:49', '1', '2018-10-11 19:29:49', '', '1');
INSERT INTO `sys_menu` VALUES (90, 1, '0,1,', '官网CMS', 10, '', '', '', '1', '', '1', '2018-10-11 19:32:38', '1', '2018-10-11 19:32:38', '', '1');
INSERT INTO `sys_menu` VALUES (91, 90, '0,1,90,', 'SEO管理', 50, '', '', '', '1', '', '1', '2018-10-11 19:34:17', '1', '2018-10-11 19:34:17', '', '1');
INSERT INTO `sys_menu` VALUES (92, 91, '0,1,90,91,', 'SEO管理', 30, '/seo/testSeo', '', '', '1', '', '1', '2018-10-11 19:34:30', '1', '2018-10-11 19:34:30', '', '1');
INSERT INTO `sys_menu` VALUES (93, 92, '0,1,90,91,92,', '查看', 30, '', '', '', '0', 'seo:testSeo:view', '1', '2018-10-11 19:34:52', '1', '2018-10-11 19:34:52', '', '1');
INSERT INTO `sys_menu` VALUES (94, 92, '0,1,90,91,92,', '修改', 60, '', '', '', '0', 'seo:testSeo:edit', '1', '2018-10-11 19:35:11', '1', '2018-10-11 19:35:11', '', '1');
INSERT INTO `sys_menu` VALUES (95, 2, '0,1,2,', '生成菜单', 630, '', '', '', '1', '', '1', '2018-10-15 19:47:39', '1', '2018-10-15 19:47:39', '', '1');
INSERT INTO `sys_menu` VALUES (96, 80, '0,1,2,80,', '快速生成菜单', 30, '/tool/genMenu', '', '', '1', '', '1', '2018-10-15 19:47:55', '1', '2018-10-16 10:04:02', '为新增加的模块快速生成菜单，相对于菜单管理中的添加菜单而言，该功能只通过一个页面就能生成列表页和表单页。默认生成到系统设置菜单下，可以根据需要修改其父级菜单。', '0');
INSERT INTO `sys_menu` VALUES (97, 96, '0,1,2,80,96,', '生成记录', 30, '', '', '', '0', 'tool:genMenu:view', '1', '2018-10-15 19:48:45', '1', '2018-10-15 19:49:17', '', '0');
INSERT INTO `sys_menu` VALUES (98, 96, '0,1,2,80,96,', '生成菜单', 60, '', '', '', '0', 'tool:genMenu:edit', '1', '2018-10-15 19:49:02', '1', '2018-10-15 19:49:37', '', '0');
INSERT INTO `sys_menu` VALUES (99, 2, '0,1,2,', '测试生成菜单', 30, NULL, NULL, NULL, '1', NULL, '1', '2018-10-15 20:00:10', '1', '2018-10-15 20:00:10', NULL, '1');
INSERT INTO `sys_menu` VALUES (100, 99, '0,1,2,99,', '测试生成菜单', 30, '/tool/genMenu', NULL, NULL, '1', NULL, '1', '2018-10-15 20:00:10', '1', '2018-10-15 20:00:10', NULL, '1');
INSERT INTO `sys_menu` VALUES (101, 100, '0,1,2,99,100,', '查看', 30, NULL, NULL, NULL, '0', 'tool:genMenu:view', '1', '2018-10-15 20:00:10', '1', '2018-10-15 20:00:10', NULL, '1');
INSERT INTO `sys_menu` VALUES (102, 100, '0,1,2,99,100,', '修改', 30, NULL, NULL, NULL, '0', 'tool:genMenu:edit', '1', '2018-10-15 20:00:10', '1', '2018-10-15 20:00:10', NULL, '1');
INSERT INTO `sys_menu` VALUES (103, 107, '0,1,107,', 'Studio用户', 30, '', '', '', '1', '', '1', '2018-10-15 20:01:54', '1', '2018-10-15 20:34:19', '', '1');
INSERT INTO `sys_menu` VALUES (104, 103, '0,1,107,103,', 'Studio用户', 30, '/psuser/psUser', '', '', '1', '', '1', '2018-10-15 20:01:55', '1', '2018-10-15 21:10:54', '', '1');
INSERT INTO `sys_menu` VALUES (105, 104, '0,1,107,103,104,', '查看', 30, '', '', '', '0', 'psuser:psUser:view', '1', '2018-10-15 20:01:55', '1', '2018-10-15 21:11:02', '', '1');
INSERT INTO `sys_menu` VALUES (106, 104, '0,1,107,103,104,', '修改', 30, NULL, NULL, NULL, '0', 'psuser:psUser:edit', '1', '2018-10-15 20:01:55', '1', '2018-10-15 20:01:55', NULL, '1');
INSERT INTO `sys_menu` VALUES (107, 1, '0,1,', '比赛管理', 1, '', '', '', '1', '', '1', '2018-10-15 20:34:08', '1', '2018-10-17 16:06:16', '', '0');
INSERT INTO `sys_menu` VALUES (108, 107, '0,1,107,', 'Code测试', 30, '', '', '', '1', '', '1', '2018-10-15 22:19:03', '1', '2018-10-16 10:17:55', '', '1');
INSERT INTO `sys_menu` VALUES (109, 108, '0,1,107,108,', 'Code测试', 30, '/pscode/psCode', NULL, NULL, '1', NULL, '1', '2018-10-15 22:19:03', '1', '2018-10-15 22:19:03', NULL, '1');
INSERT INTO `sys_menu` VALUES (110, 109, '0,1,107,108,109,', '查看', 30, NULL, NULL, NULL, '0', 'pscode:psCode:view', '1', '2018-10-15 22:19:03', '1', '2018-10-15 22:19:03', NULL, '1');
INSERT INTO `sys_menu` VALUES (111, 109, '0,1,107,108,109,', '修改', 30, NULL, NULL, NULL, '0', 'pscode:psCode:edit', '1', '2018-10-15 22:19:03', '1', '2018-10-15 22:19:03', NULL, '1');
INSERT INTO `sys_menu` VALUES (112, 2, '0,1,2,', '一对多测试', 30, NULL, NULL, NULL, '1', NULL, '1', '2018-10-16 10:55:28', '1', '2018-10-16 10:55:28', NULL, '1');
INSERT INTO `sys_menu` VALUES (113, 112, '0,1,2,112,', '一对多测试', 30, '/test/testDataMain', NULL, NULL, '1', NULL, '1', '2018-10-16 10:55:28', '1', '2018-10-16 10:55:28', NULL, '1');
INSERT INTO `sys_menu` VALUES (114, 113, '0,1,2,112,113,', '查看', 30, NULL, NULL, NULL, '0', 'test:testDataMain:view', '1', '2018-10-16 10:55:28', '1', '2018-10-16 10:55:28', NULL, '1');
INSERT INTO `sys_menu` VALUES (115, 113, '0,1,2,112,113,', '修改', 30, NULL, NULL, NULL, '0', 'test:testDataMain:edit', '1', '2018-10-16 10:55:28', '1', '2018-10-16 10:55:28', NULL, '1');
INSERT INTO `sys_menu` VALUES (116, 107, '0,1,107,', '关联测试', 100, '', '', '', '0', '', '1', '2018-10-16 11:12:30', '1', '2018-10-16 16:33:52', '', '0');
INSERT INTO `sys_menu` VALUES (117, 116, '0,1,107,116,', '关联测试', 30, '/test/testDataMain', NULL, NULL, '1', NULL, '1', '2018-10-16 11:12:30', '1', '2018-10-16 11:12:30', NULL, '0');
INSERT INTO `sys_menu` VALUES (118, 117, '0,1,107,116,117,', '查看', 30, NULL, NULL, NULL, '0', 'test:testDataMain:view', '1', '2018-10-16 11:12:30', '1', '2018-10-16 11:12:30', NULL, '0');
INSERT INTO `sys_menu` VALUES (119, 117, '0,1,107,116,117,', '修改', 30, NULL, NULL, NULL, '0', 'test:testDataMain:edit', '1', '2018-10-16 11:12:30', '1', '2018-10-16 11:12:30', NULL, '0');
INSERT INTO `sys_menu` VALUES (120, 107, '0,1,107,', '用户管理', 30, '', '', '', '1', '', '1', '2018-10-16 12:51:01', '1', '2018-10-16 12:55:55', '', '1');
INSERT INTO `sys_menu` VALUES (121, 120, '0,1,107,120,', '用户管理', 30, '/psmatchsubmit/psUser', NULL, NULL, '1', NULL, '1', '2018-10-16 12:51:01', '1', '2018-10-16 12:51:01', NULL, '1');
INSERT INTO `sys_menu` VALUES (122, 121, '0,1,107,120,121,', '查看', 30, NULL, NULL, NULL, '0', 'psmatchsubmit:psUser:view', '1', '2018-10-16 12:51:01', '1', '2018-10-16 12:51:01', NULL, '1');
INSERT INTO `sys_menu` VALUES (123, 121, '0,1,107,120,121,', '修改', 30, NULL, NULL, NULL, '0', 'psmatchsubmit:psUser:edit', '1', '2018-10-16 12:51:01', '1', '2018-10-16 12:51:01', NULL, '1');
INSERT INTO `sys_menu` VALUES (124, 107, '0,1,107,', '用户管理', 50, '', '', '', '1', '', '1', '2018-10-16 13:45:23', '1', '2018-10-16 13:49:50', '', '0');
INSERT INTO `sys_menu` VALUES (125, 124, '0,1,107,124,', '用户列表', 30, '/psuser/psUser', '', '', '1', '', '1', '2018-10-16 13:45:23', '1', '2018-10-16 16:36:45', '', '0');
INSERT INTO `sys_menu` VALUES (126, 125, '0,1,107,124,125,', '查看', 30, NULL, NULL, NULL, '0', 'psuser:psUser:view', '1', '2018-10-16 13:45:23', '1', '2018-10-16 13:45:23', NULL, '0');
INSERT INTO `sys_menu` VALUES (127, 125, '0,1,107,124,125,', '修改', 30, '', '', '', '0', 'psuser:psUser:edit', '1', '2018-10-16 13:45:23', '1', '2018-10-16 13:49:26', '', '1');
INSERT INTO `sys_menu` VALUES (128, 107, '0,1,107,', '提交管理', 40, '', '', '', '1', '', '1', '2018-10-16 14:10:00', '1', '2018-10-18 16:23:12', '', '0');
INSERT INTO `sys_menu` VALUES (129, 128, '0,1,107,128,', '提交列表', 30, '/psmatchsubmit/psMatchSubmit', '', '', '1', '', '1', '2018-10-16 14:10:00', '1', '2018-10-16 16:36:18', '', '0');
INSERT INTO `sys_menu` VALUES (130, 129, '0,1,107,128,129,', '查看', 30, NULL, NULL, NULL, '0', 'psmatchsubmit:psMatchSubmit:view', '1', '2018-10-16 14:10:00', '1', '2018-10-16 14:10:00', NULL, '0');
INSERT INTO `sys_menu` VALUES (131, 129, '0,1,107,128,129,', '修改', 30, NULL, NULL, NULL, '0', 'psmatchsubmit:psMatchSubmit:edit', '1', '2018-10-16 14:10:00', '1', '2018-10-16 14:10:00', NULL, '1');
INSERT INTO `sys_menu` VALUES (132, 107, '0,1,107,', '报名管理', 30, '', '', '', '1', '', '1', '2018-10-16 15:41:27', '1', '2018-10-18 21:08:40', '', '0');
INSERT INTO `sys_menu` VALUES (133, 132, '0,1,107,132,', '报名列表', 30, '/psmatchuser/psMatchUser', '', '', '1', '', '1', '2018-10-16 15:41:27', '1', '2018-10-16 16:36:28', '', '0');
INSERT INTO `sys_menu` VALUES (134, 133, '0,1,107,132,133,', '查看', 30, NULL, NULL, NULL, '0', 'psmatchuser:psMatchUser:view', '1', '2018-10-16 15:41:27', '1', '2018-10-16 15:41:27', NULL, '0');
INSERT INTO `sys_menu` VALUES (135, 133, '0,1,107,132,133,', '修改', 30, NULL, NULL, NULL, '0', 'psmatchuser:psMatchUser:edit', '1', '2018-10-16 15:41:27', '1', '2018-10-16 15:41:27', NULL, '1');
INSERT INTO `sys_menu` VALUES (136, 107, '0,1,107,', '比赛管理', 10, '', '', '', '1', '', '1', '2018-10-16 16:32:27', '1', '2018-10-16 16:33:33', '', '0');
INSERT INTO `sys_menu` VALUES (137, 136, '0,1,107,136,', '比赛列表', 30, '/psmatch/psMatch', '', '', '1', '', '1', '2018-10-16 16:32:27', '1', '2018-10-17 16:07:58', '', '0');
INSERT INTO `sys_menu` VALUES (138, 137, '0,1,107,136,137,', '查看', 30, NULL, NULL, NULL, '0', 'psmatch:psMatch:view', '1', '2018-10-16 16:32:27', '1', '2018-10-16 16:32:27', NULL, '0');
INSERT INTO `sys_menu` VALUES (139, 137, '0,1,107,136,137,', '修改', 30, NULL, NULL, NULL, '0', 'psmatch:psMatch:edit', '1', '2018-10-16 16:32:27', '1', '2018-10-16 16:32:27', NULL, '0');
INSERT INTO `sys_menu` VALUES (140, 107, '0,1,107,', '比赛阶段', 20, '', '', '', '1', '', '1', '2018-10-16 16:41:10', '1', '2018-10-17 11:37:24', '', '0');
INSERT INTO `sys_menu` VALUES (141, 140, '0,1,107,140,', '阶段列表', 30, '/psmatchprocess/psMatchProcess', '', '', '1', '', '1', '2018-10-16 16:41:10', '1', '2018-10-17 11:37:35', '', '0');
INSERT INTO `sys_menu` VALUES (142, 141, '0,1,107,140,141,', '查看', 30, NULL, NULL, NULL, '0', 'psmatchprocess:psMatchProcess:view', '1', '2018-10-16 16:41:10', '1', '2018-10-16 16:41:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (143, 141, '0,1,107,140,141,', '修改', 30, NULL, NULL, NULL, '0', 'psmatchprocess:psMatchProcess:edit', '1', '2018-10-16 16:41:10', '1', '2018-10-16 16:41:10', NULL, '0');
INSERT INTO `sys_menu` VALUES (144, 107, '0,1,107,', '项目管理', 30, '', '', '', '1', '', '1', '2018-10-18 15:21:35', '1', '2018-10-20 13:35:26', '', '0');
INSERT INTO `sys_menu` VALUES (145, 144, '0,1,107,144,', '项目管理', 30, '/psproject/psProject', NULL, NULL, '1', NULL, '1', '2018-10-18 15:21:35', '1', '2018-10-18 15:21:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (146, 145, '0,1,107,144,145,', '查看', 30, NULL, NULL, NULL, '0', 'psproject:psProject:view', '1', '2018-10-18 15:21:35', '1', '2018-10-18 15:21:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (147, 145, '0,1,107,144,145,', '修改', 30, NULL, NULL, NULL, '0', 'psproject:psProject:edit', '1', '2018-10-18 15:21:35', '1', '2018-10-18 15:21:35', NULL, '0');
INSERT INTO `sys_menu` VALUES (148, 80, '0,1,2,80,', '缓存管理', 30, '', '', '', '1', '', '1', '2018-10-20 16:40:30', '1', '2018-10-20 17:45:34', '', '1');
INSERT INTO `sys_menu` VALUES (149, 80, '0,1,2,80,', '缓存管理', 30, '/redis/sysRedis', '', '', '1', '', '1', '2018-10-20 16:40:30', '1', '2018-10-20 17:46:09', '', '0');
INSERT INTO `sys_menu` VALUES (150, 149, '0,1,2,80,149,', '查看', 30, NULL, NULL, NULL, '0', 'redis:sysRedis:view', '1', '2018-10-20 16:40:30', '1', '2018-10-20 16:40:30', NULL, '0');
INSERT INTO `sys_menu` VALUES (151, 149, '0,1,2,80,149,', '修改', 30, NULL, NULL, NULL, '0', 'redis:sysRedis:edit', '1', '2018-10-20 16:40:30', '1', '2018-10-20 16:40:30', NULL, '0');
INSERT INTO `sys_menu` VALUES (152, 2, '0,1,2,', 'EN信息', 30, NULL, NULL, NULL, '1', NULL, '1', '2018-10-21 15:45:52', '1', '2018-10-21 15:45:52', NULL, '1');
INSERT INTO `sys_menu` VALUES (153, 152, '0,1,2,152,', 'EN信息', 30, '/eninfo/enInfo', NULL, NULL, '1', NULL, '1', '2018-10-21 15:45:52', '1', '2018-10-21 15:45:52', NULL, '1');
INSERT INTO `sys_menu` VALUES (154, 153, '0,1,2,152,153,', '查看', 30, NULL, NULL, NULL, '0', 'eninfo:enInfo:view', '1', '2018-10-21 15:45:52', '1', '2018-10-21 15:45:52', NULL, '1');
INSERT INTO `sys_menu` VALUES (155, 153, '0,1,2,152,153,', '修改', 30, NULL, NULL, NULL, '0', 'eninfo:enInfo:edit', '1', '2018-10-21 15:45:52', '1', '2018-10-21 15:45:52', NULL, '1');
INSERT INTO `sys_menu` VALUES (156, 3, '0,1,2,3,', '列隐藏配置', 30, '', '', '', '1', '', '1', '2018-10-22 10:41:08', '1', '2018-10-22 12:51:27', '', '1');
INSERT INTO `sys_menu` VALUES (157, 3, '0,1,2,3,', '列隐藏配置', 30, '/column/sysColumnHide', '', '', '1', '', '1', '2018-10-22 10:41:08', '1', '2018-10-22 12:52:10', '', '0');
INSERT INTO `sys_menu` VALUES (158, 157, '0,1,2,3,157,', '查看', 30, NULL, NULL, NULL, '0', 'column:sysColumnHide:view', '1', '2018-10-22 10:41:08', '1', '2018-10-22 10:41:08', NULL, '0');
INSERT INTO `sys_menu` VALUES (159, 157, '0,1,2,3,157,', '修改', 30, NULL, NULL, NULL, '0', 'column:sysColumnHide:edit', '1', '2018-10-22 10:41:08', '1', '2018-10-22 10:41:08', NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
BEGIN;
INSERT INTO `sys_office` VALUES (1, 0, '0,', '百度总部', 10, '2', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-10-11 14:19:17', '', '0');
INSERT INTO `sys_office` VALUES (2, 1, '0,1,', 'AI技术生态部', 30, '4', '100000001', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2018-10-11 14:23:13', '1', '2018-10-15 21:10:36', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `office_id` bigint(20) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, 2, '系统管理员', 'dept', 'assignment', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-10-22 10:42:07', '', '0');
INSERT INTO `sys_role` VALUES (8, 2, '普通用户', 'ordinaryuser', 'user', '8', '1', '1', '1', '2018-10-17 10:14:40', '1', '2018-10-17 10:14:40', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 56);
INSERT INTO `sys_role_menu` VALUES (1, 57);
INSERT INTO `sys_role_menu` VALUES (1, 58);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 67);
INSERT INTO `sys_role_menu` VALUES (1, 68);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 80);
INSERT INTO `sys_role_menu` VALUES (1, 81);
INSERT INTO `sys_role_menu` VALUES (1, 82);
INSERT INTO `sys_role_menu` VALUES (1, 84);
INSERT INTO `sys_role_menu` VALUES (1, 96);
INSERT INTO `sys_role_menu` VALUES (1, 97);
INSERT INTO `sys_role_menu` VALUES (1, 98);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 116);
INSERT INTO `sys_role_menu` VALUES (1, 117);
INSERT INTO `sys_role_menu` VALUES (1, 118);
INSERT INTO `sys_role_menu` VALUES (1, 119);
INSERT INTO `sys_role_menu` VALUES (1, 124);
INSERT INTO `sys_role_menu` VALUES (1, 125);
INSERT INTO `sys_role_menu` VALUES (1, 126);
INSERT INTO `sys_role_menu` VALUES (1, 128);
INSERT INTO `sys_role_menu` VALUES (1, 129);
INSERT INTO `sys_role_menu` VALUES (1, 130);
INSERT INTO `sys_role_menu` VALUES (1, 132);
INSERT INTO `sys_role_menu` VALUES (1, 133);
INSERT INTO `sys_role_menu` VALUES (1, 134);
INSERT INTO `sys_role_menu` VALUES (1, 136);
INSERT INTO `sys_role_menu` VALUES (1, 137);
INSERT INTO `sys_role_menu` VALUES (1, 138);
INSERT INTO `sys_role_menu` VALUES (1, 139);
INSERT INTO `sys_role_menu` VALUES (1, 140);
INSERT INTO `sys_role_menu` VALUES (1, 141);
INSERT INTO `sys_role_menu` VALUES (1, 142);
INSERT INTO `sys_role_menu` VALUES (1, 143);
INSERT INTO `sys_role_menu` VALUES (1, 144);
INSERT INTO `sys_role_menu` VALUES (1, 145);
INSERT INTO `sys_role_menu` VALUES (1, 146);
INSERT INTO `sys_role_menu` VALUES (1, 147);
INSERT INTO `sys_role_menu` VALUES (1, 149);
INSERT INTO `sys_role_menu` VALUES (1, 150);
INSERT INTO `sys_role_menu` VALUES (1, 151);
INSERT INTO `sys_role_menu` VALUES (1, 156);
INSERT INTO `sys_role_menu` VALUES (1, 157);
INSERT INTO `sys_role_menu` VALUES (1, 158);
INSERT INTO `sys_role_menu` VALUES (1, 159);
INSERT INTO `sys_role_menu` VALUES (8, 1);
INSERT INTO `sys_role_menu` VALUES (8, 107);
INSERT INTO `sys_role_menu` VALUES (8, 116);
INSERT INTO `sys_role_menu` VALUES (8, 117);
INSERT INTO `sys_role_menu` VALUES (8, 118);
INSERT INTO `sys_role_menu` VALUES (8, 124);
INSERT INTO `sys_role_menu` VALUES (8, 125);
INSERT INTO `sys_role_menu` VALUES (8, 126);
INSERT INTO `sys_role_menu` VALUES (8, 128);
INSERT INTO `sys_role_menu` VALUES (8, 129);
INSERT INTO `sys_role_menu` VALUES (8, 130);
INSERT INTO `sys_role_menu` VALUES (8, 132);
INSERT INTO `sys_role_menu` VALUES (8, 133);
INSERT INTO `sys_role_menu` VALUES (8, 134);
INSERT INTO `sys_role_menu` VALUES (8, 136);
INSERT INTO `sys_role_menu` VALUES (8, 137);
INSERT INTO `sys_role_menu` VALUES (8, 138);
INSERT INTO `sys_role_menu` VALUES (8, 140);
INSERT INTO `sys_role_menu` VALUES (8, 141);
INSERT INTO `sys_role_menu` VALUES (8, 142);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `office_id` bigint(20) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_office` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `company_id` bigint(20) NOT NULL COMMENT '归属公司',
  `office_id` bigint(20) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 1, 2, 'admin', 'a5eaa537ee49eeb81ddeb7b4d327f98fcef83943b0cd442f06b6e3a2', '0001', '系统管理员', 'xbs1019@126.com', '17610639158', '17610639158', '1', '/userfiles/1/images/photo/2018/10/05de1b07.jpeg', '0:0:0:0:0:0:0:1', '2018-10-22 14:19:29', '1', '1', '2013-05-27 08:00:00', '1', '2018-10-17 16:34:06', '最高管理员', '0');
INSERT INTO `sys_user` VALUES (8, 1, 2, 'user', 'bb4589fdb5f226c0bd35f37b0d69748ff361d6e23c4ef7d53d5abd1c', '10010', 'user', '', '', '', '2', '/userfiles/8/images/photo/2018/10/93a27ccc.jpeg', '0:0:0:0:0:0:0:1', '2018-10-17 10:16:02', '1', '1', '2018-10-17 10:15:47', '1', '2018-10-17 16:34:02', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (8, 8);
COMMIT;

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '归属用户',
  `office_id` bigint(20) DEFAULT NULL COMMENT '归属部门',
  `area_id` bigint(20) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `test_data_main_id` bigint(20) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------
BEGIN;
INSERT INTO `test_data_child` VALUES (1, 1, 'a1', '1', '2018-10-16 11:15:33', '1', '2018-10-16 11:15:33', 'a1', '0');
INSERT INTO `test_data_child` VALUES (2, 1, 'a2', '1', '2018-10-16 11:15:54', '1', '2018-10-16 11:15:54', 'a2', '0');
INSERT INTO `test_data_child` VALUES (3, 1, 'a3', '1', '2018-10-16 11:15:54', '1', '2018-10-16 11:15:54', 'a3', '0');
INSERT INTO `test_data_child` VALUES (4, 2, 'b1', '1', '2018-10-16 11:24:16', '1', '2018-10-16 11:24:16', 'b1', '0');
INSERT INTO `test_data_child` VALUES (5, 2, 'b2', '1', '2018-10-16 11:24:16', '1', '2018-10-16 11:24:16', 'b2', '0');
INSERT INTO `test_data_child` VALUES (6, 2, 'b3', '1', '2018-10-16 11:24:16', '1', '2018-10-16 11:24:16', 'b3', '0');
COMMIT;

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Records of test_data_main
-- ----------------------------
BEGIN;
INSERT INTO `test_data_main` VALUES (1, NULL, NULL, NULL, 'aaa', NULL, NULL, '1', '2018-10-16 11:15:05', '1', '2018-10-16 11:15:05', 'aaaa', '0');
INSERT INTO `test_data_main` VALUES (2, NULL, NULL, NULL, 'bbb', NULL, NULL, '1', '2018-10-16 11:23:58', '1', '2018-10-16 11:23:58', 'bbb', '0');
COMMIT;

-- ----------------------------
-- Table structure for test_seo
-- ----------------------------
DROP TABLE IF EXISTS `test_seo`;
CREATE TABLE `test_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url_path` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '路径',
  `seo_title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'seo标题',
  `seo_keyword` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'seokeyword',
  `seo_desc` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'seo desc',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `status_code` int(2) DEFAULT '0' COMMENT '状态码',
  `seo_img_json` varchar(6000) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址json数组',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='官网SEO';

-- ----------------------------
-- Table structure for test_site
-- ----------------------------
DROP TABLE IF EXISTS `test_site`;
CREATE TABLE `test_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';

SET FOREIGN_KEY_CHECKS = 1;
