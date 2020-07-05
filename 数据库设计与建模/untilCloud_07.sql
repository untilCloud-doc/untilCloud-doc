-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_zh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', 'superAdmin', '超级管理员', '1');
INSERT INTO `admin_role` VALUES ('2', 'sysAdmin', '系统管理员', '1');
INSERT INTO `admin_role` VALUES ('3', 'teacher', '老师', '1');
INSERT INTO `admin_role` VALUES ('4', 'student', '学生', '1');
INSERT INTO `admin_role` VALUES ('9', 'test', '测试角色', '1');

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_operator_role_operator_1` (`uid`),
  KEY `fk_operator_role_role_1` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `name_zh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon_cls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '/admin', 'AdminIndex', '首页', 'el-icon-s-home', 'AdminIndex', '0');
INSERT INTO `admin_menu` VALUES ('2', '/admin', 'User', '用户管理', 'el-icon-user', 'AdminIndex', '0');
INSERT INTO `admin_menu` VALUES ('3', '/admin', 'System', '系统管理', 'el-icon-s-tools', 'AdminIndex', '0');
INSERT INTO `admin_menu` VALUES ('4', '/admin', 'Error', '异常页', 'el-icon-tickets', 'AdminIndex', '0');
INSERT INTO `admin_menu` VALUES ('5', '/admin', 'About', '关于', 'el-icon-tickets', 'AdminIndex', '0');
INSERT INTO `admin_menu` VALUES ('6', '/admin/system/menu', 'MenuManagement', '菜单管理', null, 'system/MenuManagement', '3');
INSERT INTO `admin_menu` VALUES ('7', '/admin/system/role', 'RoleManagement', '角色管理', null, 'system/RoleManagement', '3');
INSERT INTO `admin_menu` VALUES ('8', '/admin/system/dataDictionary', 'DataDictionary', '数据字典', null, 'system/DataDictionary', '3');
INSERT INTO `admin_menu` VALUES ('9', '/admin/error/notFound', 'NotFound', '找不到页面', null, 'error/NotFound', '4');
INSERT INTO `admin_menu` VALUES ('10', '/admin/error/unauthorized', 'Unauthorized', '无权访问', null, 'error/Unauthorized', '4');
INSERT INTO `admin_menu` VALUES ('11', '/admin/error/serverError', 'ServerError', '服务器出错', null, 'error/ServerError', '4');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES ('1', 'users_management', '用户管理', '/api/admin/user');
INSERT INTO `admin_permission` VALUES ('2', 'system_management', '系统管理', '/api/admin/system');
INSERT INTO `admin_permission` VALUES ('3', 'content_management', '内容管理', '/api/admin/content');

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `rid` int(20) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_permission_role_1` (`rid`),
  KEY `fk_role_permission_permission_1` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES ('1', '1', '1');


-- ----------------------------
-- Table structure for dictionary_type
-- ----------------------------
CREATE TABLE `dictionary_type` (
  `id` bigint(20) NOT NULL  auto_increment COMMENT '主键',
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
	`status` tinyint(2) DEFAULT '0' COMMENT '0正常,1禁用',
  `name` varchar(255) DEFAULT NULL COMMENT '字典类型名称',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='字典类型表'


-- ----------------------------
-- Table structure for dictionary_info
-- ----------------------------
 CREATE TABLE `dictionary_info` (
  `id` bigint(20) NOT NULL  auto_increment COMMENT '主键',
  `sort` int(11) DEFAULT NULL COMMENT '序号',
  `name` varchar(255) DEFAULT NULL COMMENT '字典内容',
  `value` int(11) DEFAULT NULL COMMENT '值',
	`status` tinyint(2) DEFAULT '0' COMMENT '0正常,1禁用',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型ID',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
	FOREigN KEY(`type_id`) REFERENCES DICTIONARY_TYPE(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='字典类型条目表'


-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`key1` varchar(255) DEFAULT 'signin_experience' COMMENT '签到距离',
	`value1` varchar(255) DEFAULT '20' COMMENT '参数值',
	`key2` varchar(255) DEFAULT 'signin_range' COMMENT '签到范围',
	`value2` varchar(255) DEFAULT '2' COMMENT '参数值',
	`key3` varchar(255) DEFAULT 'class_time' COMMENT '一节课时间',
	`value3` varchar(255) DEFAULT '45' COMMENT '参数值',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`user_id` int(11) DEFAULT NULL COMMENT '用户ID',
	FOREigN KEY(`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB   AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- ----------------------------
-- Table structure for school_institution
-- ----------------------------
DROP TABLE IF EXISTS `school_institution`;
CREATE TABLE `school_institution` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '学校名称或下属机构名称',
	`level` VARCHAR(255) NOT NULL DEFAULT '0' COMMENT '机构级别字符串',
	`parent_id` int(11) NOT NULL COMMENT '父级主键id',
	`sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB   AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='学校机构表';

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `ino` int(11) DEFAULT NULL COMMENT '学号/工号',
	`nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
	`sex` varchar(255) DEFAULT NULL COMMENT '性别',
	`school` varchar(255) DEFAULT NULL COMMENT '学校',
	`college` varchar(255) DEFAULT NULL COMMENT '院系',
	`major` varchar(255) DEFAULT NULL COMMENT '专业',
	`cover` varchar(255) DEFAULT NULL COMMENT '头像',
	`user_id` int(11) NOT NULL COMMENT '用户ID',
	FOREigN KEY(`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程号',
	`name` varchar(255) DEFAULT NULL COMMENT '课程名',
	`grade` varchar(255) DEFAULT NULL COMMENT '年级',
	`semester` varchar(255) DEFAULT NULL COMMENT '学期',
	`school` varchar(255) DEFAULT NULL COMMENT '学校',
	`college` varchar(255) DEFAULT NULL COMMENT '院系',
	`major` varchar(255) DEFAULT NULL COMMENT '专业',
	`teacher` varchar(255) DEFAULT NULL COMMENT '任课老师',
	`learn_require` varchar(255) DEFAULT NULL COMMENT '学习要求',
	`teach_progress` varchar(255) DEFAULT NULL COMMENT '教学进度',
	`exam_arrange` varchar(255) DEFAULT NULL COMMENT '考试安排',
	`cover` varchar(255) NOT NULL COMMENT '头像',
	`qrcode` varchar(255) NOT NULL COMMENT '二维码',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Table structure for course_stu
-- ----------------------------
DROP TABLE IF EXISTS `course_stu`;
CREATE TABLE `course_stu` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`experience` int(11) DEFAULT NULL COMMENT '经验值',
	`stu_id` int(11) NOT NULL COMMENT '学生ID',
	`course_id` int(11) NOT NULL COMMENT '课程ID',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREigN KEY(`course_id`) REFERENCES `course`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREigN KEY(`stu_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='课程学生表';

-- ----------------------------
-- Table structure for course_signup
-- ----------------------------
DROP TABLE IF EXISTS `course_signin`;
CREATE TABLE `course_signin` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) DEFAULT NULL COMMENT '签到方式',
	`value` varchar(255) DEFAULT NULL COMMENT '签到值',
	`start_time` timestamp  NULL COMMENT '起始时间',
	`end_time` timestamp  NULL COMMENT '结束时间',
	`longitude` varchar(255) DEFAULT NULL COMMENT '经度',
	`latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
	`course_id` int(11) NOT NULL COMMENT '课程ID',
	FOREigN KEY(`course_id`) REFERENCES `course`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='课程签到表';

-- ----------------------------
-- Table structure for student_signup
-- ----------------------------
DROP TABLE IF EXISTS `student_signin`;
CREATE TABLE `student_signin` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`time` timestamp  NULL COMMENT '签到时间',
	`mode` varchar(255) DEFAULT NULL COMMENT '签到方式',
	`value` varchar(255) DEFAULT NULL COMMENT '签到值',
	`longitude` varchar(255) DEFAULT NULL COMMENT '经度',
	`latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
	`student` int(11) NOT NULL COMMENT '学生ID',
	`course_signin_id` int(11) NOT NULL COMMENT '课程签到ID',
	FOREigN KEY(`course_signin_id`) REFERENCES `course_signin`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='学生签到表';













