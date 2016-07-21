CREATE TABLE `c_feedback` (

`id` varchar(64) NOT NULL,

`content` varchar(500) NULL,

`user_id` varchar(64) NULL,

`email` varchar(500) NULL,

`name` varchar(255) NULL,

`phone` varchar(255) NULL,

`status` char(1) NULL,

`create_date` datetime NULL,

`update_by` varchar(64) NULL,

`update_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT 0,

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

COMMENT='反馈'
;



CREATE TABLE `c_article` (

`id` varchar(64) NOT NULL,

`type` char(1) NULL COMMENT '',

`title` varchar(255) NULL,

`image_url` varchar(500) NULL,

`content` varchar(5000) NULL,

`sub_title` varchar(255) NULL,

`create_by` varchar(64) NULL,

`create_date` datetime NULL,

`update_by` varchar(64) NULL,

`update_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT 0,

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='文章'
;



CREATE TABLE `c_user` (

`id` varchar(64) NOT NULL COMMENT '用户ID',

`user_type` char(1) DEFAULT NULL COMMENT '用户分类 0：注册用户\r\n1：第三方用户',

`login_name` varchar(40) NULL DEFAULT NULL COMMENT '登录名',

`password` varchar(50) NULL DEFAULT NULL COMMENT '密码',

`device_type` char(1) NULL COMMENT '设备类型 0:iPhone\r\n1:iPad\r\n2:android3:androidPad',

`device_id` varchar(40) NULL DEFAULT NULL COMMENT '设备ID',

`open_id` varchar(64) NULL DEFAULT NULL COMMENT '第三方ID',

`real_name` varchar(50) NULL DEFAULT NULL COMMENT '真实姓名',

`nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',

`image_url` varchar(255) NULL DEFAULT NULL COMMENT '用户头像',

`sex` char(1) NULL DEFAULT NULL COMMENT '性别 0：男\r\n1：女',

`phone` varchar(20) NULL DEFAULT NULL COMMENT '手机号码',

`jf` int(10) NULL DEFAULT 0 COMMENT '积分',

`status` char(1) NULL DEFAULT '0' COMMENT '0:启用\r\n1:禁止',

`create_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT '0',

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

COMMENT='用户'
;

CREATE TABLE `c_session` (

`id` varchar(64) NOT NULL,

`user_id` varchar(64) NULL,

`status` char(1) NULL,

`device_type` char(1) NULL,

`login_ip` varchar(255) NULL,

`login_date` datetime NULL,

`logout_date` datetime NULL,

`remarks` varchar(255) NULL,

`del_flag` char(1) NULL DEFAULT 0,

PRIMARY KEY (`id`) 

)

ENGINE=InnoDB

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

COMMENT='会话'
;


CREATE TABLE `c_log` (

`id` varchar(64) NULL,

`title` varchar(255) NULL COMMENT '标题',

`type` char(1) NULL COMMENT '类型',

`user_token` varchar(64) NULL COMMENT '用户token',

`remote_addr` varchar(255) NULL COMMENT 'IP地址',

`user_agent` varchar(255) NULL COMMENT '用户代理',

`request_uri` varchar(255) NULL COMMENT '请求uri',

`method` varchar(5) NULL COMMENT '请求方法',

`params` text NULL COMMENT '请求参数',

`exception` text NULL COMMENT '异常信息',

`create_date` datetime NULL COMMENT '创建时间'

)

ENGINE=MyISAM

DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;

-- ----------------------------
-- Table structure for c_telsms
-- ----------------------------
DROP TABLE IF EXISTS `c_telsms`;
CREATE TABLE `c_telsms` (
  `id` varchar(64) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `type` char(1) DEFAULT NULL COMMENT '0:注册\r\n1:找回密码',
  `code` varchar(10) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证码';

-- ----------------------------
-- Table structure for c_version
-- ----------------------------
DROP TABLE IF EXISTS `c_version`;
CREATE TABLE `c_version` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `system_type` char(1) DEFAULT NULL COMMENT '系统类型 0 安卓Pad 1 IOS ',
  `res_id` varchar(64) DEFAULT NULL COMMENT '文件ID',
  `res_url` varchar(200) DEFAULT NULL COMMENT '安装包url',
  `version_no` varchar(20) DEFAULT NULL COMMENT '版本号',
  `content` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本';

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `name` varchar(128) NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_sequence` VALUES ('default', '0', '1');

DROP FUNCTION IF EXISTS `currval`;

CREATE FUNCTION `currval`(seq_name VARCHAR(128))
 RETURNS int(11)
BEGIN  
  DECLARE value INTEGER;  
  SET value = 0;  
  SELECT current_value INTO value  
  FROM sys_sequence  
  WHERE name = seq_name;  
  RETURN value;  
END;

DROP FUNCTION IF EXISTS `nextval`;

CREATE FUNCTION `nextval`(seq_name VARCHAR(128))
 RETURNS int(11)
BEGIN  
   UPDATE sys_sequence  
   SET          current_value = current_value + increment  
   WHERE name = seq_name;  
   RETURN currval(seq_name);  
END;

DROP FUNCTION IF EXISTS `setval`;

CREATE FUNCTION `setval`(seq_name VARCHAR(128), value INTEGER)
 RETURNS int(11)
BEGIN  
   UPDATE sys_sequence  
   SET          current_value = value  
   WHERE name = seq_name;  
   RETURN currval(seq_name);  
END;


SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables*/

DROP TABLE IF EXISTS gen_scheme;
DROP TABLE IF EXISTS gen_table_column;
DROP TABLE IF EXISTS gen_table;
DROP TABLE IF EXISTS gen_template; 




/* Create Tables */

CREATE TABLE gen_scheme
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(200) COMMENT '名称',
	category varchar(2000) COMMENT '分类',
	package_name varchar(500) COMMENT '生成包路径',
	module_name varchar(30) COMMENT '生成模块名',
	sub_module_name varchar(30) COMMENT '生成子模块名',
	function_name varchar(500) COMMENT '生成功能名',
	function_name_simple varchar(100) COMMENT '生成功能名（简写）',
	function_author varchar(100) COMMENT '生成功能作者',
	gen_table_id varchar(200) COMMENT '生成表编号',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '生成方案';


CREATE TABLE gen_table
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(200) COMMENT '名称',
	comments varchar(500) COMMENT '描述',
	class_name varchar(100) COMMENT '实体类名称',
	parent_table varchar(200) COMMENT '关联父表',
	parent_table_fk varchar(100) COMMENT '关联父表外键',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '业务表';


CREATE TABLE gen_table_column
(
	id varchar(64) NOT NULL COMMENT '编号',
	gen_table_id varchar(64) COMMENT '归属表编号',
	name varchar(200) COMMENT '名称',
	comments varchar(500) COMMENT '描述',
	jdbc_type varchar(100) COMMENT '列的数据类型的字节长度',
	java_type varchar(500) COMMENT 'JAVA类型',
	java_field varchar(200) COMMENT 'JAVA字段名',
	is_pk char(1) COMMENT '是否主键',
	is_null char(1) COMMENT '是否可为空',
	is_insert char(1) COMMENT '是否为插入字段',
	is_edit char(1) COMMENT '是否编辑字段',
	is_list char(1) COMMENT '是否列表字段',
	is_query char(1) COMMENT '是否查询字段',
	query_type varchar(200) COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
	show_type varchar(200) COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
	dict_type varchar(200) COMMENT '字典类型',
	settings varchar(2000) COMMENT '其它设置（扩展字段JSON）',
	sort decimal COMMENT '排序（升序）',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '业务表字段';


CREATE TABLE gen_template
(
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(200) COMMENT '名称',
	category varchar(2000) COMMENT '分类',
	file_path varchar(500) COMMENT '生成文件路径',
	file_name varchar(200) COMMENT '生成文件名',
	content text COMMENT '内容',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
) COMMENT = '代码模板表';



/* Create Indexes */

CREATE INDEX gen_scheme_del_flag ON gen_scheme (del_flag ASC);
CREATE INDEX gen_table_name ON gen_table (name ASC);
CREATE INDEX gen_table_del_flag ON gen_table (del_flag ASC);
CREATE INDEX gen_table_column_table_id ON gen_table_column (gen_table_id ASC);
CREATE INDEX gen_table_column_name ON gen_table_column (name ASC);
CREATE INDEX gen_table_column_sort ON gen_table_column (sort ASC);
CREATE INDEX gen_table_column_del_flag ON gen_table_column (del_flag ASC);
CREATE INDEX gen_template_del_falg ON gen_template (del_flag ASC);


-- prompt Loading GEN_SCHEME...
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_SCHEME (ID, NAME, CATEGORY, PACKAGE_NAME, MODULE_NAME, SUB_MODULE_NAME, FUNCTION_NAME, FUNCTION_NAME_SIMPLE, FUNCTION_AUTHOR, GEN_TABLE_ID, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 3 records loaded
-- prompt Loading GEN_TABLE...
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE (ID, NAME, COMMENTS, CLASS_NAME, PARENT_TABLE, PARENT_TABLE_FK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 4 records loaded
-- prompt Loading GEN_TABLE_COLUMN...
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 12, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 13, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, 1, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, 2, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, 3, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, 4, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, 5, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, 6, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, 7, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, 8, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, 9, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, 10, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
insert into GEN_TABLE_COLUMN (ID, GEN_TABLE_ID, NAME, COMMENTS, JDBC_TYPE, JAVA_TYPE, JAVA_FIELD, IS_PK, IS_NULL, IS_INSERT, IS_EDIT, IS_LIST, IS_QUERY, QUERY_TYPE, SHOW_TYPE, DICT_TYPE, SETTINGS, SORT, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
values ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, 11, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
commit;
-- prompt 46 records loaded


SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS oa_notify_record;
DROP TABLE IF EXISTS oa_notify;

/* Create Tables */
CREATE TABLE oa_notify
(
	id varchar(64) NOT NULL COMMENT '编号',
	type char(1) COMMENT '类型',
	title varchar(200) COMMENT '标题',
	content varchar(2000) COMMENT '内容',
	files varchar(2000) COMMENT '附件',
	status char(1) COMMENT '状态',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '通知通告';

CREATE TABLE oa_notify_record
(
	id varchar(64) NOT NULL COMMENT '编号',
	oa_notify_id varchar(64) COMMENT '通知通告ID',
	user_id varchar(64) COMMENT '接受人',
	read_flag char(1) DEFAULT '0' COMMENT '阅读标记',
	read_date date COMMENT '阅读时间',
	PRIMARY KEY (id)
) COMMENT = '通知通告发送记录';

/* Create Indexes */
CREATE INDEX oa_notify_del_flag ON oa_notify (del_flag ASC);
CREATE INDEX oa_notify_record_notify_id ON oa_notify_record (oa_notify_id ASC);
CREATE INDEX oa_notify_record_user_id ON oa_notify_record (user_id ASC);
CREATE INDEX oa_notify_record_read_flag ON oa_notify_record (read_flag ASC);



SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sys_role_office;
DROP TABLE IF EXISTS sys_user_role;
DROP TABLE IF EXISTS sys_user;
DROP TABLE IF EXISTS sys_office;
DROP TABLE IF EXISTS sys_area;
DROP TABLE IF EXISTS sys_dict;
DROP TABLE IF EXISTS sys_log;
DROP TABLE IF EXISTS sys_mdict;
DROP TABLE IF EXISTS sys_role_menu;
DROP TABLE IF EXISTS sys_menu;
DROP TABLE IF EXISTS sys_role;




/* Create Tables */

CREATE TABLE sys_area
(
	id varchar(64) NOT NULL COMMENT '编号',
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	name varchar(100) NOT NULL COMMENT '名称',
	sort decimal(10,0) NOT NULL COMMENT '排序',
	code varchar(100) COMMENT '区域编码',
	type char(1) COMMENT '区域类型',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '区域表';


CREATE TABLE sys_dict
(
	id varchar(64) NOT NULL COMMENT '编号',
	value varchar(100) NOT NULL COMMENT '数据值',
	label varchar(100) NOT NULL COMMENT '标签名',
	type varchar(100) NOT NULL COMMENT '类型',
	description varchar(100) NOT NULL COMMENT '描述',
	sort decimal(10,0) NOT NULL COMMENT '排序（升序）',
	parent_id varchar(64) DEFAULT '0' COMMENT '父级编号',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('105', '1', '会议通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('106', '2', '奖惩通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('107', '3', '活动通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');
INSERT INTO `sys_dict` (`id`, `value`, `label`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0');


CREATE TABLE sys_log
(
	id varchar(64) NOT NULL COMMENT '编号',
	type char(1) DEFAULT '1' COMMENT '日志类型',
	title varchar(255) DEFAULT '' COMMENT '日志标题',
	create_by varchar(64) COMMENT '创建者',
	create_date datetime COMMENT '创建时间',
	remote_addr varchar(255) COMMENT '操作IP地址',
	user_agent varchar(255) COMMENT '用户代理',
	request_uri varchar(255) COMMENT '请求URI',
	method varchar(5) COMMENT '操作方式',
	params text COMMENT '操作提交的数据',
	exception text COMMENT '异常信息',
	PRIMARY KEY (id)
) COMMENT = '日志表';


CREATE TABLE sys_mdict
(
	id varchar(64) NOT NULL COMMENT '编号',
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	name varchar(100) NOT NULL COMMENT '名称',
	sort decimal(10,0) NOT NULL COMMENT '排序',
	description varchar(100) COMMENT '描述',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '多级字典表';


CREATE TABLE sys_menu
(
	id varchar(64) NOT NULL COMMENT '编号',
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	name varchar(100) NOT NULL COMMENT '名称',
	sort decimal(10,0) NOT NULL COMMENT '排序',
	href varchar(2000) COMMENT '链接',
	target varchar(20) COMMENT '目标',
	icon varchar(100) COMMENT '图标',
	is_show char(1) NOT NULL COMMENT '是否在菜单中显示',
	permission varchar(200) COMMENT '权限标识',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', 60, '', '', '', '0', 'test:testData:edit', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', 90, '/test/testTree', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', 0, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', 60, '/sys/dict/', NULL, 'th-list', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', 30, NULL, NULL, NULL, '0', 'sys:dict:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', 40, NULL, NULL, NULL, '0', 'sys:dict:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', 970, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', 50, '/sys/area/', NULL, 'th', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', 30, NULL, NULL, NULL, '0', 'sys:area:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', 40, NULL, NULL, NULL, '0', 'sys:area:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', 40, '/sys/office/', NULL, 'th-large', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', 30, NULL, NULL, NULL, '0', 'sys:office:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', 40, NULL, NULL, NULL, '0', 'sys:office:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', 900, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', 30, '/sys/user/index', NULL, 'user', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', 30, '', '', '', '0', 'sys:user:view', '1', '2013-5-27 08:00:00', '1', '2015-5-29 10:33:17', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', 40, NULL, NULL, NULL, '0', 'sys:user:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('2652d8b8cf80447980e419b9f0d057a1', '1', '0,1,', '管理菜单', 5030, '', '', '', '1', '', '1', '2016-7-20 11:34:42', '1', '2016-7-20 11:34:42', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '个人中心', 100, '', '', '', '1', '', '1', '2013-5-27 08:00:00', '1', '2015-5-28 13:14:44', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', 30, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', 30, '/sys/user/info', NULL, 'user', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', 980, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', 40, '/sys/user/modifyPwd', NULL, 'lock', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', 120, '', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', 30, '/sys/menu/', NULL, 'list-alt', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', 30, '', '', '', '0', 'test:testDataMain:view', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4eac1748666d4cd6b2e835a23149c57c', '98afebc8d89a4ebcb86702813db70143', '0,1,27,98afebc8d89a4ebcb86702813db70143,', '通告管理', 50, '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2016-5-13 17:14:51', '1', '2016-5-13 17:14:51', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', 30, NULL, NULL, NULL, '0', 'sys:menu:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', 90, '/../static/ckfinder/ckfinder.html', NULL, 'folder-open', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', 30, NULL, NULL, NULL, '0', 'cms:ckfinder:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', 40, NULL, NULL, NULL, '0', 'cms:ckfinder:upload', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', 50, NULL, NULL, NULL, '0', 'cms:ckfinder:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', 40, NULL, NULL, NULL, '0', 'sys:menu:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', 985, NULL, NULL, NULL, '1', NULL, '1', '2013-6-3 08:00:00', '1', '2013-6-3 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', 30, '/sys/log', NULL, 'pencil', '1', 'sys:log:view', '1', '2013-6-3 08:00:00', '1', '2013-6-3 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', 50, '/sys/role/', NULL, 'lock', '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', 90, NULL, NULL, NULL, '1', NULL, '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', 5000, NULL, NULL, NULL, '1', NULL, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', 30, NULL, NULL, NULL, '0', 'sys:role:view', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', 50, NULL, NULL, NULL, '1', NULL, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', 30, '/gen/genScheme', NULL, NULL, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', 20, '/gen/genTable', NULL, NULL, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', 40, '/../druid', NULL, NULL, '1', NULL, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', 80, '/../static/map/map-city.html', NULL, NULL, '1', NULL, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', 40, NULL, NULL, NULL, '0', 'sys:role:edit', '1', '2013-5-27 08:00:00', '1', '2013-5-27 08:00:00', NULL, '0');
INSERT INTO `sys_menu` VALUES ('98afebc8d89a4ebcb86702813db70143', '27', '0,1,27,', '通知通告', 20, '', '', '', '1', '', '1', '2016-5-13 17:13:18', '1', '2016-5-13 17:13:18', '', '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', 60, '', '', '', '0', 'test:testTree:edit', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', 60, '/test/testDataMain', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b2d622c3cbeb45ad80438cd34501593f', '2652d8b8cf80447980e419b9f0d057a1', '0,1,2652d8b8cf80447980e419b9f0d057a1,', '用户管理', 30, '/user/cUser/list', '', '', '1', 'user:cUser:view,user:cUser:edit', '1', '2016-7-20 11:37:09', '1', '2016-7-20 11:37:09', '', '1');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', 30, '/test/testData', '', '', '1', '', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('bcaf28e42714410fb9c76b2725a0f57b', '2652d8b8cf80447980e419b9f0d057a1', '0,1,2652d8b8cf80447980e419b9f0d057a1,', '基础数据', 60, '', '', '', '1', '', '1', '2016-7-20 11:40:10', '1', '2016-7-20 11:40:10', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', 30, '', '', '', '0', 'test:testTree:view', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c66ccee5d6c34daea011a7330a733a0b', '98afebc8d89a4ebcb86702813db70143', '0,1,27,98afebc8d89a4ebcb86702813db70143,', '我的通告', 30, '/oa/oaNotify/self', '', '', '1', '', '1', '2016-5-13 17:14:10', '1', '2016-5-13 17:14:10', '', '0');
INSERT INTO `sys_menu` VALUES ('c6e1d0f17a46461e8fe819c7b5d4df91', 'bcaf28e42714410fb9c76b2725a0f57b', '0,1,2652d8b8cf80447980e419b9f0d057a1,bcaf28e42714410fb9c76b2725a0f57b,', '关于我们', 60, '/basis/aboutus/form', '', '', '1', 'basis:aboutus:edit', '1', '2016-7-20 11:41:24', '1', '2016-7-20 11:41:24', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', 60, '', '', '', '0', 'test:testDataMain:edit', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', 30, '', '', '', '0', 'test:testData:view', '1', '2013-8-12 13:10:05', '1', '2013-8-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ea10007746e24ff891677ec8fd418fac', 'bcaf28e42714410fb9c76b2725a0f57b', '0,1,2652d8b8cf80447980e419b9f0d057a1,bcaf28e42714410fb9c76b2725a0f57b,', '用户管理', 30, '/user/cUser/list?userType=1', '', '', '1', 'user:cUser:view,user:cUser:edit', '1', '2016-7-20 11:40:37', '1', '2016-7-20 13:48:24', '', '0');
INSERT INTO `sys_menu` VALUES ('f6addfae30fb4995bf190ab08f18b720', 'bcaf28e42714410fb9c76b2725a0f57b', '0,1,2652d8b8cf80447980e419b9f0d057a1,bcaf28e42714410fb9c76b2725a0f57b,', '版权声明', 90, '/basis/copyRight/form', '', '', '1', 'basis:copyright:edit', '1', '2016-7-20 11:42:25', '1', '2016-7-20 11:42:25', '', '0');

CREATE TABLE sys_office
(
	id varchar(64) NOT NULL COMMENT '编号',
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	name varchar(100) NOT NULL COMMENT '名称',
	sort decimal(10,0) NOT NULL COMMENT '排序',
	area_id varchar(64) NOT NULL COMMENT '归属区域',
	code varchar(100) COMMENT '区域编码',
	type char(1) NOT NULL COMMENT '机构类型',
	grade char(1) NOT NULL COMMENT '机构等级',
	address varchar(255) COMMENT '联系地址',
	zip_code varchar(100) COMMENT '邮政编码',
	master varchar(100) COMMENT '负责人',
	phone varchar(200) COMMENT '电话',
	fax varchar(200) COMMENT '传真',
	email varchar(200) COMMENT '邮箱',
	USEABLE varchar(64) COMMENT '是否启用',
	PRIMARY_PERSON varchar(64) COMMENT '主负责人',
	DEPUTY_PERSON varchar(64) COMMENT '副负责人',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '机构表';


-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('4f15b69f97a64916ada77c8df53de233', '0', '0,', '北京神州中联教育科技有限公司', '30', '100001', 'SZZL', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2016-05-16 17:35:00', '1', '2016-05-16 17:35:00', '', '0');
INSERT INTO `sys_office` VALUES ('54b6b3285a4a4c1c893c0f4f9afbb2a4', '4f15b69f97a64916ada77c8df53de233', '0,4f15b69f97a64916ada77c8df53de233,', '移动事业部', '30', '100001', 'YD', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2016-05-16 17:36:05', '1', '2016-05-16 17:36:05', '', '0');



CREATE TABLE sys_role
(
	id varchar(64) NOT NULL COMMENT '编号',
	office_id varchar(64) COMMENT '归属机构',
	name varchar(100) NOT NULL COMMENT '角色名称',
	enname varchar(255) COMMENT '英文名称',
	role_type varchar(255) COMMENT '角色类型',
	data_scope char(1) COMMENT '数据范围',
	is_sys varchar(64) COMMENT '是否系统数据',
	useable varchar(64) COMMENT '是否可用',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('e729950f13684c12a07abe4f93a89ab2', '54b6b3285a4a4c1c893c0f4f9afbb2a4', '系统管理员', 'administrator', 'assignment', '8', '1', '1', '1', '2016-05-16 17:42:01', '1', '2016-05-16 17:42:44', '', '0');


CREATE TABLE sys_role_menu
(
	role_id varchar(64) NOT NULL COMMENT '角色编号',
	menu_id varchar(64) NOT NULL COMMENT '菜单编号',
	PRIMARY KEY (role_id, menu_id)
) COMMENT = '角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '1');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '27');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '28');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '29');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '30');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '4eac1748666d4cd6b2e835a23149c57c');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '56');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '57');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '58');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '59');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '71');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', '98afebc8d89a4ebcb86702813db70143');
INSERT INTO `sys_role_menu` VALUES ('e729950f13684c12a07abe4f93a89ab2', 'c66ccee5d6c34daea011a7330a733a0b');


CREATE TABLE sys_role_office
(
	role_id varchar(64) NOT NULL COMMENT '角色编号',
	office_id varchar(64) NOT NULL COMMENT '机构编号',
	PRIMARY KEY (role_id, office_id)
) COMMENT = '角色-机构';


CREATE TABLE sys_user
(
	id varchar(64) NOT NULL COMMENT '编号',
	company_id varchar(64) NOT NULL COMMENT '归属公司',
	office_id varchar(64) NOT NULL COMMENT '归属部门',
	login_name varchar(100) NOT NULL COMMENT '登录名',
	password varchar(100) NOT NULL COMMENT '密码',
	no varchar(100) COMMENT '工号',
	name varchar(100) NOT NULL COMMENT '姓名',
	email varchar(200) COMMENT '邮箱',
	phone varchar(200) COMMENT '电话',
	mobile varchar(200) COMMENT '手机',
	user_type char(1) COMMENT '用户类型',
	photo varchar(1000) COMMENT '用户头像',
	login_ip varchar(100) COMMENT '最后登陆IP',
	login_date datetime COMMENT '最后登陆时间',
	login_flag varchar(64) COMMENT '是否可登录',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '用户表';
-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', '', '', '', '', '', '127.0.0.1', '2016-05-16 18:01:15', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');


CREATE TABLE sys_user_role
(
	user_id varchar(64) NOT NULL COMMENT '用户编号',
	role_id varchar(64) NOT NULL COMMENT '角色编号',
	PRIMARY KEY (user_id, role_id)
) COMMENT = '用户-角色';



/* Create Indexes */

CREATE INDEX sys_area_parent_id ON sys_area (parent_id ASC);
/*CREATE INDEX sys_area_parent_ids ON sys_area (parent_ids ASC);*/
CREATE INDEX sys_area_del_flag ON sys_area (del_flag ASC);
CREATE INDEX sys_dict_value ON sys_dict (value ASC);
CREATE INDEX sys_dict_label ON sys_dict (label ASC);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag ASC);
CREATE INDEX sys_log_create_by ON sys_log (create_by ASC);
CREATE INDEX sys_log_request_uri ON sys_log (request_uri ASC);
CREATE INDEX sys_log_type ON sys_log (type ASC);
CREATE INDEX sys_log_create_date ON sys_log (create_date ASC);
CREATE INDEX sys_mdict_parent_id ON sys_mdict (parent_id ASC);
/*CREATE INDEX sys_mdict_parent_ids ON sys_mdict (parent_ids ASC);*/
CREATE INDEX sys_mdict_del_flag ON sys_mdict (del_flag ASC);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id ASC);
/*CREATE INDEX sys_menu_parent_ids ON sys_menu (parent_ids ASC);*/
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag ASC);
CREATE INDEX sys_office_parent_id ON sys_office (parent_id ASC);
/*CREATE INDEX sys_office_parent_ids ON sys_office (parent_ids ASC);*/
CREATE INDEX sys_office_del_flag ON sys_office (del_flag ASC);
CREATE INDEX sys_office_type ON sys_office (type ASC);
CREATE INDEX sys_role_del_flag ON sys_role (del_flag ASC);
CREATE INDEX sys_role_enname ON sys_role (enname ASC);
CREATE INDEX sys_user_office_id ON sys_user (office_id ASC);
CREATE INDEX sys_user_login_name ON sys_user (login_name ASC);
CREATE INDEX sys_user_company_id ON sys_user (company_id ASC);
CREATE INDEX sys_user_update_date ON sys_user (update_date ASC);
CREATE INDEX sys_user_del_flag ON sys_user (del_flag ASC);



-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '100001', '0100001,', '北京市', '110000', '010', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:26:24', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('10', '1', '0,100001,1', '通州区', '110112', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('100', '83', '0,100001,35,83', '魏县', '130434', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1000', '999', '0,100001,929,999', '柯城区', '330802', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('100001', '0', '0', '中国', '1', null, '1', 'yyx', '2015-07-12 12:10:53', 'yyx', '2015-07-12 12:11:03', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1001', '999', '0,100001,929,999', '衢江区', '330803', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1002', '999', '0,100001,929,999', '常山县', '330822', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1003', '999', '0,100001,929,999', '开化县', '330824', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1004', '999', '0,100001,929,999', '龙游县', '330825', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1005', '999', '0,100001,929,999', '江山市', '330881', '0570', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1006', '929', '0,100001,929', '舟山市', '330900', '0580', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1007', '1006', '0,100001,929,1006', '定海区', '330902', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1008', '1006', '0,100001,929,1006', '普陀区', '330903', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1009', '1006', '0,100001,929,1006', '岱山县', '330921', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('101', '83', '0,100001,35,83', '曲周县', '130435', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1010', '1006', '0,100001,929,1006', '嵊泗县', '330922', '0580', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1011', '929', '0,100001,929', '台州市', '331000', '0576', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1012', '1011', '0,100001,929,1011', '椒江区', '331002', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1013', '1011', '0,100001,929,1011', '黄岩区', '331003', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1014', '1011', '0,100001,929,1011', '路桥区', '331004', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1015', '1011', '0,100001,929,1011', '玉环县', '331021', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1016', '1011', '0,100001,929,1011', '三门县', '331022', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1017', '1011', '0,100001,929,1011', '天台县', '331023', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1018', '1011', '0,100001,929,1011', '仙居县', '331024', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1019', '1011', '0,100001,929,1011', '温岭市', '331081', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('102', '83', '0,100001,35,83', '武安市', '130481', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1020', '1011', '0,100001,929,1011', '临海市', '331082', '0576', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1021', '929', '0,100001,929', '丽水市', '331100', '0578', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1022', '1021', '0,100001,929,1021', '莲都区', '331102', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1023', '1021', '0,100001,929,1021', '青田县', '331121', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1024', '1021', '0,100001,929,1021', '缙云县', '331122', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1025', '1021', '0,100001,929,1021', '遂昌县', '331123', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1026', '1021', '0,100001,929,1021', '松阳县', '331124', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1027', '1021', '0,100001,929,1021', '云和县', '331125', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1028', '1021', '0,100001,929,1021', '庆元县', '331126', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1029', '1021', '0,100001,929,1021', '景宁畲族自治县', '331127', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('103', '35', '0,100001,35', '邢台市', '130500', '0319', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1030', '1021', '0,100001,929,1021', '龙泉市', '331181', '0578', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1031', '100001', '0,100001', '安徽省', '340000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1032', '1031', '0,100001,1031', '合肥市', '340100', '0551', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1033', '1032', '0,100001,1031,1032', '瑶海区', '340102', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1034', '1032', '0,100001,1031,1032', '庐阳区', '340103', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1035', '1032', '0,100001,1031,1032', '蜀山区', '340104', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1036', '1032', '0,100001,1031,1032', '包河区', '340111', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1037', '1032', '0,100001,1031,1032', '长丰县', '340121', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1038', '1032', '0,100001,1031,1032', '肥东县', '340122', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1039', '1032', '0,100001,1031,1032', '肥西县', '340123', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('104', '103', '0,100001,35,103', '桥东区', '130502', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1040', '1032', '0,100001,1031,1032', '庐江县', '340124', '0551', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1041', '1032', '0,100001,1031,1032', '巢湖市', '340181', '0565', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1042', '1031', '0,100001,1031', '芜湖市', '340200', '0553', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1043', '1042', '0,100001,1031,1042', '镜湖区', '340202', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1044', '1042', '0,100001,1031,1042', '弋江区', '340203', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1045', '1042', '0,100001,1031,1042', '鸠江区', '340207', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1046', '1042', '0,100001,1031,1042', '三山区', '340208', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1047', '1042', '0,100001,1031,1042', '芜湖县', '340221', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1048', '1042', '0,100001,1031,1042', '繁昌县', '340222', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1049', '1042', '0,100001,1031,1042', '南陵县', '340223', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('105', '103', '0,100001,35,103', '桥西区', '130503', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1050', '1042', '0,100001,1031,1042', '无为县', '340225', '0553', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1051', '1031', '0,100001,1031', '蚌埠市', '340300', '0552', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1052', '1051', '0,100001,1031,1051', '龙子湖区', '340302', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1053', '1051', '0,100001,1031,1051', '蚌山区', '340303', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1054', '1051', '0,100001,1031,1051', '禹会区', '340304', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1055', '1051', '0,100001,1031,1051', '淮上区', '340311', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1056', '1051', '0,100001,1031,1051', '怀远县', '340321', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1057', '1051', '0,100001,1031,1051', '五河县', '340322', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1058', '1051', '0,100001,1031,1051', '固镇县', '340323', '0552', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1059', '1031', '0,100001,1031', '淮南市', '340400', '0554', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('106', '103', '0,100001,35,103', '邢台县', '130521', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1060', '1059', '0,100001,1031,1059', '大通区', '340402', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1061', '1059', '0,100001,1031,1059', '田家庵区', '340403', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1062', '1059', '0,100001,1031,1059', '谢家集区', '340404', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1063', '1059', '0,100001,1031,1059', '八公山区', '340405', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1064', '1059', '0,100001,1031,1059', '潘集区', '340406', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1065', '1059', '0,100001,1031,1059', '凤台县', '340421', '0554', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1066', '1031', '0,100001,1031', '马鞍山市', '340500', '0555', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1067', '1066', '0,100001,1031,1066', '花山区', '340503', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1068', '1066', '0,100001,1031,1066', '雨山区', '340504', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1069', '1066', '0,100001,1031,1066', '当涂县', '340521', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('107', '103', '0,100001,35,103', '临城县', '130522', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1070', '1066', '0,100001,1031,1066', '含山县', '340522', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1071', '1066', '0,100001,1031,1066', '和县', '340523', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1072', '1066', '0,100001,1031,1066', '博望区', '340596', '0555', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1073', '1031', '0,100001,1031', '淮北市', '340600', '0561', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1074', '1073', '0,100001,1031,1073', '杜集区', '340602', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1075', '1073', '0,100001,1031,1073', '相山区', '340603', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1076', '1073', '0,100001,1031,1073', '烈山区', '340604', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1077', '1073', '0,100001,1031,1073', '濉溪县', '340621', '0561', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1078', '1031', '0,100001,1031', '铜陵市', '340700', '0562', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1079', '1078', '0,100001,1031,1078', '铜官山区', '340702', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('108', '103', '0,100001,35,103', '内丘县', '130523', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1080', '1078', '0,100001,1031,1078', '狮子山区', '340703', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1081', '1078', '0,100001,1031,1078', '郊区', '340711', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1082', '1078', '0,100001,1031,1078', '铜陵县', '340721', '0562', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1083', '1031', '0,100001,1031', '安庆市', '340800', '0556', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1084', '1083', '0,100001,1031,1083', '迎江区', '340802', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1085', '1083', '0,100001,1031,1083', '大观区', '340803', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1086', '1083', '0,100001,1031,1083', '宜秀区', '340811', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1087', '1083', '0,100001,1031,1083', '怀宁县', '340822', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1088', '1083', '0,100001,1031,1083', '枞阳县', '340823', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1089', '1083', '0,100001,1031,1083', '潜山县', '340824', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('109', '103', '0,100001,35,103', '柏乡县', '130524', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1090', '1083', '0,100001,1031,1083', '太湖县', '340825', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1091', '1083', '0,100001,1031,1083', '宿松县', '340826', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1092', '1083', '0,100001,1031,1083', '望江县', '340827', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1093', '1083', '0,100001,1031,1083', '岳西县', '340828', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1094', '1083', '0,100001,1031,1083', '桐城市', '340881', '0556', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1095', '1031', '0,100001,1031', '黄山市', '341000', '0559', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1096', '1095', '0,100001,1031,1095', '屯溪区', '341002', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1097', '1095', '0,100001,1031,1095', '黄山区', '341003', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1098', '1095', '0,100001,1031,1095', '徽州区', '341004', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1099', '1095', '0,100001,1031,1095', '歙县', '341021', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('11', '1', '0,100001,1', '顺义区', '110113', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('110', '103', '0,100001,35,103', '隆尧县', '130525', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1100', '1095', '0,100001,1031,1095', '休宁县', '341022', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1101', '1095', '0,100001,1031,1095', '黟县', '341023', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1102', '1095', '0,100001,1031,1095', '祁门县', '341024', '0559', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1103', '1031', '0,100001,1031', '滁州市', '341100', '0550', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1104', '1103', '0,100001,1031,1103', '琅琊区', '341102', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1105', '1103', '0,100001,1031,1103', '南谯区', '341103', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1106', '1103', '0,100001,1031,1103', '来安县', '341122', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1107', '1103', '0,100001,1031,1103', '全椒县', '341124', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1108', '1103', '0,100001,1031,1103', '定远县', '341125', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1109', '1103', '0,100001,1031,1103', '凤阳县', '341126', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('111', '103', '0,100001,35,103', '任县', '130526', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1110', '1103', '0,100001,1031,1103', '天长市', '341181', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1111', '1103', '0,100001,1031,1103', '明光市', '341182', '0550', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1112', '1031', '0,100001,1031', '阜阳市', '341200', '0558', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1113', '1112', '0,100001,1031,1112', '颍州区', '341202', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1114', '1112', '0,100001,1031,1112', '颍东区', '341203', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1115', '1112', '0,100001,1031,1112', '颍泉区', '341204', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1116', '1112', '0,100001,1031,1112', '临泉县', '341221', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1117', '1112', '0,100001,1031,1112', '太和县', '341222', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1118', '1112', '0,100001,1031,1112', '阜南县', '341225', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1119', '1112', '0,100001,1031,1112', '颍上县', '341226', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('112', '103', '0,100001,35,103', '南和县', '130527', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1120', '1112', '0,100001,1031,1112', '界首市', '341282', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1121', '1031', '0,100001,1031', '宿州市', '341300', '0557', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1122', '1121', '0,100001,1031,1121', '埇桥区', '341302', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1123', '1121', '0,100001,1031,1121', '砀山县', '341321', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1124', '1121', '0,100001,1031,1121', '萧县', '341322', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1125', '1121', '0,100001,1031,1121', '灵璧县', '341323', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1126', '1121', '0,100001,1031,1121', '泗县', '341324', '0557', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1127', '1031', '0,100001,1031', '六安市', '341500', '0564', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1128', '1127', '0,100001,1031,1127', '金安区', '341502', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1129', '1127', '0,100001,1031,1127', '裕安区', '341503', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('113', '103', '0,100001,35,103', '宁晋县', '130528', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1130', '1127', '0,100001,1031,1127', '寿县', '341521', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1131', '1127', '0,100001,1031,1127', '霍邱县', '341522', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1132', '1127', '0,100001,1031,1127', '舒城县', '341523', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1133', '1127', '0,100001,1031,1127', '金寨县', '341524', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1134', '1127', '0,100001,1031,1127', '霍山县', '341525', '0564', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1135', '1031', '0,100001,1031', '亳州市', '341600', '0558', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1136', '1135', '0,100001,1031,1135', '谯城区', '341602', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1137', '1135', '0,100001,1031,1135', '涡阳县', '341621', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1138', '1135', '0,100001,1031,1135', '蒙城县', '341622', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1139', '1135', '0,100001,1031,1135', '利辛县', '341623', '0558', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('114', '103', '0,100001,35,103', '巨鹿县', '130529', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1140', '1031', '0,100001,1031', '池州市', '341700', '0566', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1141', '1140', '0,100001,1031,1140', '贵池区', '341702', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1142', '1140', '0,100001,1031,1140', '东至县', '341721', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1143', '1140', '0,100001,1031,1140', '石台县', '341722', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1144', '1140', '0,100001,1031,1140', '青阳县', '341723', '0566', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1145', '1031', '0,100001,1031', '宣城市', '341800', '0563', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1146', '1145', '0,100001,1031,1145', '宣州区', '341802', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1147', '1145', '0,100001,1031,1145', '郎溪县', '341821', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1148', '1145', '0,100001,1031,1145', '广德县', '341822', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1149', '1145', '0,100001,1031,1145', '泾县', '341823', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('115', '103', '0,100001,35,103', '新河县', '130530', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1150', '1145', '0,100001,1031,1145', '绩溪县', '341824', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1151', '1145', '0,100001,1031,1145', '旌德县', '341825', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1152', '1145', '0,100001,1031,1145', '宁国市', '341881', '0563', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1153', '100001', '0,100001', '福建省', '350000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1154', '1153', '0,100001,1153', '福州市', '350100', '0591', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1155', '1154', '0,100001,1153,1154', '鼓楼区', '350102', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1156', '1154', '0,100001,1153,1154', '台江区', '350103', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1157', '1154', '0,100001,1153,1154', '仓山区', '350104', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1158', '1154', '0,100001,1153,1154', '马尾区', '350105', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1159', '1154', '0,100001,1153,1154', '晋安区', '350111', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('116', '103', '0,100001,35,103', '广宗县', '130531', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1160', '1154', '0,100001,1153,1154', '闽侯县', '350121', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1161', '1154', '0,100001,1153,1154', '连江县', '350122', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1162', '1154', '0,100001,1153,1154', '罗源县', '350123', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1163', '1154', '0,100001,1153,1154', '闽清县', '350124', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1164', '1154', '0,100001,1153,1154', '永泰县', '350125', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1165', '1154', '0,100001,1153,1154', '平潭县', '350128', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1166', '1154', '0,100001,1153,1154', '福清市', '350181', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1167', '1154', '0,100001,1153,1154', '长乐市', '350182', '0591', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1168', '1153', '0,100001,1153', '厦门市', '350200', '0592', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1169', '1168', '0,100001,1153,1168', '思明区', '350203', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('117', '103', '0,100001,35,103', '平乡县', '130532', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1170', '1168', '0,100001,1153,1168', '海沧区', '350205', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1171', '1168', '0,100001,1153,1168', '湖里区', '350206', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1172', '1168', '0,100001,1153,1168', '集美区', '350211', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1173', '1168', '0,100001,1153,1168', '同安区', '350212', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1174', '1168', '0,100001,1153,1168', '翔安区', '350213', '0592', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1175', '1153', '0,100001,1153', '莆田市', '350300', '0594', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1176', '1175', '0,100001,1153,1175', '城厢区', '350302', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1177', '1175', '0,100001,1153,1175', '涵江区', '350303', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1178', '1175', '0,100001,1153,1175', '荔城区', '350304', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1179', '1175', '0,100001,1153,1175', '秀屿区', '350305', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('118', '103', '0,100001,35,103', '威县', '130533', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1180', '1175', '0,100001,1153,1175', '仙游县', '350322', '0594', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1181', '1153', '0,100001,1153', '三明市', '350400', '0598', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1182', '1181', '0,100001,1153,1181', '梅列区', '350402', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1183', '1181', '0,100001,1153,1181', '三元区', '350403', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1184', '1181', '0,100001,1153,1181', '明溪县', '350421', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1185', '1181', '0,100001,1153,1181', '清流县', '350423', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1186', '1181', '0,100001,1153,1181', '宁化县', '350424', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1187', '1181', '0,100001,1153,1181', '大田县', '350425', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1188', '1181', '0,100001,1153,1181', '尤溪县', '350426', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1189', '1181', '0,100001,1153,1181', '沙县', '350427', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('119', '103', '0,100001,35,103', '清河县', '130534', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1190', '1181', '0,100001,1153,1181', '将乐县', '350428', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1191', '1181', '0,100001,1153,1181', '泰宁县', '350429', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1192', '1181', '0,100001,1153,1181', '建宁县', '350430', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1193', '1181', '0,100001,1153,1181', '永安市', '350481', '0598', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1194', '1153', '0,100001,1153', '泉州市', '350500', '0595', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1195', '1194', '0,100001,1153,1194', '鲤城区', '350502', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1196', '1194', '0,100001,1153,1194', '丰泽区', '350503', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1197', '1194', '0,100001,1153,1194', '洛江区', '350504', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1198', '1194', '0,100001,1153,1194', '泉港区', '350505', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1199', '1194', '0,100001,1153,1194', '惠安县', '350521', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('12', '1', '0,100001,1', '昌平区', '110114', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('120', '103', '0,100001,35,103', '临西县', '130535', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1200', '1194', '0,100001,1153,1194', '安溪县', '350524', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1201', '1194', '0,100001,1153,1194', '永春县', '350525', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1202', '1194', '0,100001,1153,1194', '德化县', '350526', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1203', '1194', '0,100001,1153,1194', '金门县', '350527', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1204', '1194', '0,100001,1153,1194', '石狮市', '350581', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1205', '1194', '0,100001,1153,1194', '晋江市', '350582', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1206', '1194', '0,100001,1153,1194', '南安市', '350583', '0595', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1207', '1153', '0,100001,1153', '漳州市', '350600', '0596', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1208', '1207', '0,100001,1153,1207', '芗城区', '350602', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1209', '1207', '0,100001,1153,1207', '龙文区', '350603', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('121', '103', '0,100001,35,103', '南宫市', '130581', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1210', '1207', '0,100001,1153,1207', '云霄县', '350622', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1211', '1207', '0,100001,1153,1207', '漳浦县', '350623', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1212', '1207', '0,100001,1153,1207', '诏安县', '350624', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1213', '1207', '0,100001,1153,1207', '长泰县', '350625', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1214', '1207', '0,100001,1153,1207', '东山县', '350626', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1215', '1207', '0,100001,1153,1207', '南靖县', '350627', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1216', '1207', '0,100001,1153,1207', '平和县', '350628', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1217', '1207', '0,100001,1153,1207', '华安县', '350629', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1218', '1207', '0,100001,1153,1207', '龙海市', '350681', '0596', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1219', '1153', '0,100001,1153', '南平市', '350700', '0599', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('122', '103', '0,100001,35,103', '沙河市', '130582', '0319', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1220', '1219', '0,100001,1153,1219', '延平区', '350702', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1221', '1219', '0,100001,1153,1219', '顺昌县', '350721', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1222', '1219', '0,100001,1153,1219', '浦城县', '350722', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1223', '1219', '0,100001,1153,1219', '光泽县', '350723', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1224', '1219', '0,100001,1153,1219', '松溪县', '350724', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1225', '1219', '0,100001,1153,1219', '政和县', '350725', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1226', '1219', '0,100001,1153,1219', '邵武市', '350781', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1227', '1219', '0,100001,1153,1219', '武夷山市', '350782', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1228', '1219', '0,100001,1153,1219', '建瓯市', '350783', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1229', '1219', '0,100001,1153,1219', '建阳市', '350784', '0599', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('123', '35', '0,100001,35', '保定市', '130600', '0312', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1230', '1153', '0,100001,1153', '龙岩市', '350800', '0597', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1231', '1230', '0,100001,1153,1230', '新罗区', '350802', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1232', '1230', '0,100001,1153,1230', '长汀县', '350821', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1233', '1230', '0,100001,1153,1230', '永定县', '350822', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1234', '1230', '0,100001,1153,1230', '上杭县', '350823', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1235', '1230', '0,100001,1153,1230', '武平县', '350824', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1236', '1230', '0,100001,1153,1230', '连城县', '350825', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1237', '1230', '0,100001,1153,1230', '漳平市', '350881', '0597', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1238', '1153', '0,100001,1153', '宁德市', '350900', '0593', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1239', '1238', '0,100001,1153,1238', '蕉城区', '350902', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('124', '123', '0,100001,35,123', '新市区', '130602', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1240', '1238', '0,100001,1153,1238', '霞浦县', '350921', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1241', '1238', '0,100001,1153,1238', '古田县', '350922', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1242', '1238', '0,100001,1153,1238', '屏南县', '350923', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1243', '1238', '0,100001,1153,1238', '寿宁县', '350924', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1244', '1238', '0,100001,1153,1238', '周宁县', '350925', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1245', '1238', '0,100001,1153,1238', '柘荣县', '350926', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1246', '1238', '0,100001,1153,1238', '福安市', '350981', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1247', '1238', '0,100001,1153,1238', '福鼎市', '350982', '0593', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1248', '100001', '0,100001', '江西省', '360000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1249', '1248', '0,100001,1248', '南昌市', '360100', '0791', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('125', '123', '0,100001,35,123', '北市区', '130603', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1250', '1249', '0,100001,1248,1249', '东湖区', '360102', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1251', '1249', '0,100001,1248,1249', '西湖区', '360103', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1252', '1249', '0,100001,1248,1249', '青云谱区', '360104', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1253', '1249', '0,100001,1248,1249', '湾里区', '360105', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1254', '1249', '0,100001,1248,1249', '青山湖区', '360111', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1255', '1249', '0,100001,1248,1249', '南昌县', '360121', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1256', '1249', '0,100001,1248,1249', '新建县', '360122', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1257', '1249', '0,100001,1248,1249', '安义县', '360123', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1258', '1249', '0,100001,1248,1249', '进贤县', '360124', '0791', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1259', '1248', '0,100001,1248', '景德镇市', '360200', '0798', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('126', '123', '0,100001,35,123', '南市区', '130604', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1260', '1259', '0,100001,1248,1259', '昌江区', '360202', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1261', '1259', '0,100001,1248,1259', '珠山区', '360203', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1262', '1259', '0,100001,1248,1259', '浮梁县', '360222', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1263', '1259', '0,100001,1248,1259', '乐平市', '360281', '0798', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1264', '1248', '0,100001,1248', '萍乡市', '360300', '0799', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1265', '1264', '0,100001,1248,1264', '安源区', '360302', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1266', '1264', '0,100001,1248,1264', '湘东区', '360313', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1267', '1264', '0,100001,1248,1264', '莲花县', '360321', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1268', '1264', '0,100001,1248,1264', '上栗县', '360322', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1269', '1264', '0,100001,1248,1264', '芦溪县', '360323', '0799', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('127', '123', '0,100001,35,123', '满城县', '130621', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1270', '1248', '0,100001,1248', '九江市', '360400', '0792', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1271', '1270', '0,100001,1248,1270', '庐山区', '360402', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1272', '1270', '0,100001,1248,1270', '浔阳区', '360403', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1273', '1270', '0,100001,1248,1270', '九江县', '360421', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1274', '1270', '0,100001,1248,1270', '武宁县', '360423', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1275', '1270', '0,100001,1248,1270', '修水县', '360424', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1276', '1270', '0,100001,1248,1270', '永修县', '360425', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1277', '1270', '0,100001,1248,1270', '德安县', '360426', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1278', '1270', '0,100001,1248,1270', '星子县', '360427', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1279', '1270', '0,100001,1248,1270', '都昌县', '360428', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('128', '123', '0,100001,35,123', '清苑县', '130622', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1280', '1270', '0,100001,1248,1270', '湖口县', '360429', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1281', '1270', '0,100001,1248,1270', '彭泽县', '360430', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1282', '1270', '0,100001,1248,1270', '瑞昌市', '360481', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1283', '1270', '0,100001,1248,1270', '共青城市', '360482', '0792', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1284', '1248', '0,100001,1248', '新余市', '360500', '0790', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1285', '1284', '0,100001,1248,1284', '渝水区', '360502', '0790', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1286', '1284', '0,100001,1248,1284', '分宜县', '360521', '0790', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1287', '1248', '0,100001,1248', '鹰潭市', '360600', '0701', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1288', '1287', '0,100001,1248,1287', '月湖区', '360602', '0701', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1289', '1287', '0,100001,1248,1287', '余江县', '360622', '0701', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('129', '123', '0,100001,35,123', '涞水县', '130623', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1290', '1287', '0,100001,1248,1287', '贵溪市', '360681', '0701', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1291', '1248', '0,100001,1248', '赣州市', '360700', '0797', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1292', '1291', '0,100001,1248,1291', '章贡区', '360702', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1293', '1291', '0,100001,1248,1291', '赣县', '360721', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1294', '1291', '0,100001,1248,1291', '信丰县', '360722', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1295', '1291', '0,100001,1248,1291', '大余县', '360723', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1296', '1291', '0,100001,1248,1291', '上犹县', '360724', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1297', '1291', '0,100001,1248,1291', '崇义县', '360725', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1298', '1291', '0,100001,1248,1291', '安远县', '360726', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1299', '1291', '0,100001,1248,1291', '龙南县', '360727', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('13', '1', '0,100001,1', '大兴区', '110115', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('130', '123', '0,100001,35,123', '阜平县', '130624', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1300', '1291', '0,100001,1248,1291', '定南县', '360728', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1301', '1291', '0,100001,1248,1291', '全南县', '360729', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1302', '1291', '0,100001,1248,1291', '宁都县', '360730', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1303', '1291', '0,100001,1248,1291', '于都县', '360731', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1304', '1291', '0,100001,1248,1291', '兴国县', '360732', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1305', '1291', '0,100001,1248,1291', '会昌县', '360733', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1306', '1291', '0,100001,1248,1291', '寻乌县', '360734', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1307', '1291', '0,100001,1248,1291', '石城县', '360735', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1308', '1291', '0,100001,1248,1291', '瑞金市', '360781', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1309', '1291', '0,100001,1248,1291', '南康市', '360782', '0797', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('131', '123', '0,100001,35,123', '徐水县', '130625', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1310', '1248', '0,100001,1248', '吉安市', '360800', '0796', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1311', '1310', '0,100001,1248,1310', '吉州区', '360802', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1312', '1310', '0,100001,1248,1310', '青原区', '360803', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1313', '1310', '0,100001,1248,1310', '吉安县', '360821', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1314', '1310', '0,100001,1248,1310', '吉水县', '360822', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1315', '1310', '0,100001,1248,1310', '峡江县', '360823', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1316', '1310', '0,100001,1248,1310', '新干县', '360824', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1317', '1310', '0,100001,1248,1310', '永丰县', '360825', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1318', '1310', '0,100001,1248,1310', '泰和县', '360826', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1319', '1310', '0,100001,1248,1310', '遂川县', '360827', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('132', '123', '0,100001,35,123', '定兴县', '130626', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1320', '1310', '0,100001,1248,1310', '万安县', '360828', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1321', '1310', '0,100001,1248,1310', '安福县', '360829', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1322', '1310', '0,100001,1248,1310', '永新县', '360830', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1323', '1310', '0,100001,1248,1310', '井冈山市', '360881', '0796', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1324', '1248', '0,100001,1248', '宜春市', '360900', '0795', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1325', '1324', '0,100001,1248,1324', '袁州区', '360902', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1326', '1324', '0,100001,1248,1324', '奉新县', '360921', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1327', '1324', '0,100001,1248,1324', '万载县', '360922', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1328', '1324', '0,100001,1248,1324', '上高县', '360923', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1329', '1324', '0,100001,1248,1324', '宜丰县', '360924', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('133', '123', '0,100001,35,123', '唐县', '130627', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1330', '1324', '0,100001,1248,1324', '靖安县', '360925', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1331', '1324', '0,100001,1248,1324', '铜鼓县', '360926', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1332', '1324', '0,100001,1248,1324', '丰城市', '360981', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1333', '1324', '0,100001,1248,1324', '樟树市', '360982', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1334', '1324', '0,100001,1248,1324', '高安市', '360983', '0795', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1335', '1248', '0,100001,1248', '抚州市', '361000', '0794', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1336', '1335', '0,100001,1248,1335', '临川区', '361002', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1337', '1335', '0,100001,1248,1335', '南城县', '361021', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1338', '1335', '0,100001,1248,1335', '黎川县', '361022', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1339', '1335', '0,100001,1248,1335', '南丰县', '361023', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('134', '123', '0,100001,35,123', '高阳县', '130628', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1340', '1335', '0,100001,1248,1335', '崇仁县', '361024', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1341', '1335', '0,100001,1248,1335', '乐安县', '361025', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1342', '1335', '0,100001,1248,1335', '宜黄县', '361026', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1343', '1335', '0,100001,1248,1335', '金溪县', '361027', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1344', '1335', '0,100001,1248,1335', '资溪县', '361028', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1345', '1335', '0,100001,1248,1335', '东乡县', '361029', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1346', '1335', '0,100001,1248,1335', '广昌县', '361030', '0794', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1347', '1248', '0,100001,1248', '上饶市', '361100', '0793', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1348', '1347', '0,100001,1248,1347', '信州区', '361102', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1349', '1347', '0,100001,1248,1347', '上饶县', '361121', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('135', '123', '0,100001,35,123', '容城县', '130629', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1350', '1347', '0,100001,1248,1347', '广丰县', '361122', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1351', '1347', '0,100001,1248,1347', '玉山县', '361123', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1352', '1347', '0,100001,1248,1347', '铅山县', '361124', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1353', '1347', '0,100001,1248,1347', '横峰县', '361125', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1354', '1347', '0,100001,1248,1347', '弋阳县', '361126', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1355', '1347', '0,100001,1248,1347', '余干县', '361127', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1356', '1347', '0,100001,1248,1347', '鄱阳县', '361128', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1357', '1347', '0,100001,1248,1347', '万年县', '361129', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1358', '1347', '0,100001,1248,1347', '婺源县', '361130', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1359', '1347', '0,100001,1248,1347', '德兴市', '361181', '0793', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('136', '123', '0,100001,35,123', '涞源县', '130630', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1360', '100001', '0,100001', '山东省', '370000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1361', '1360', '0,100001,1360', '济南市', '370100', '0531', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1362', '1361', '0,100001,1360,1361', '历下区', '370102', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1363', '1361', '0,100001,1360,1361', '市中区', '370103', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1364', '1361', '0,100001,1360,1361', '槐荫区', '370104', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1365', '1361', '0,100001,1360,1361', '天桥区', '370105', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1366', '1361', '0,100001,1360,1361', '历城区', '370112', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1367', '1361', '0,100001,1360,1361', '长清区', '370113', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1368', '1361', '0,100001,1360,1361', '平阴县', '370124', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1369', '1361', '0,100001,1360,1361', '济阳县', '370125', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('137', '123', '0,100001,35,123', '望都县', '130631', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1370', '1361', '0,100001,1360,1361', '商河县', '370126', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1371', '1361', '0,100001,1360,1361', '章丘市', '370181', '0531', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1372', '1360', '0,100001,1360', '青岛市', '370200', '0532', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1373', '1372', '0,100001,1360,1372', '市南区', '370202', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1374', '1372', '0,100001,1360,1372', '市北区', '370203', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1375', '1372', '0,100001,1360,1372', '四方区', '370205', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1376', '1372', '0,100001,1360,1372', '黄岛区', '370211', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1377', '1372', '0,100001,1360,1372', '崂山区', '370212', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1378', '1372', '0,100001,1360,1372', '李沧区', '370213', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1379', '1372', '0,100001,1360,1372', '城阳区', '370214', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('138', '123', '0,100001,35,123', '安新县', '130632', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1380', '1372', '0,100001,1360,1372', '胶州市', '370281', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1381', '1372', '0,100001,1360,1372', '即墨市', '370282', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1382', '1372', '0,100001,1360,1372', '平度市', '370283', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1383', '1372', '0,100001,1360,1372', '胶南市', '370284', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1384', '1372', '0,100001,1360,1372', '莱西市', '370285', '0532', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1385', '1360', '0,100001,1360', '淄博市', '370300', '0533', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1386', '1385', '0,100001,1360,1385', '淄川区', '370302', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1387', '1385', '0,100001,1360,1385', '张店区', '370303', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1388', '1385', '0,100001,1360,1385', '博山区', '370304', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1389', '1385', '0,100001,1360,1385', '临淄区', '370305', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('139', '123', '0,100001,35,123', '易县', '130633', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1390', '1385', '0,100001,1360,1385', '周村区', '370306', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1391', '1385', '0,100001,1360,1385', '桓台县', '370321', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1392', '1385', '0,100001,1360,1385', '高青县', '370322', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1393', '1385', '0,100001,1360,1385', '沂源县', '370323', '0533', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1394', '1360', '0,100001,1360', '枣庄市', '370400', '0632', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1395', '1394', '0,100001,1360,1394', '市中区', '370402', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1396', '1394', '0,100001,1360,1394', '薛城区', '370403', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1397', '1394', '0,100001,1360,1394', '峄城区', '370404', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1398', '1394', '0,100001,1360,1394', '台儿庄区', '370405', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1399', '1394', '0,100001,1360,1394', '山亭区', '370406', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('14', '1', '0,100001,1', '怀柔区', '110116', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('140', '123', '0,100001,35,123', '曲阳县', '130634', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1400', '1394', '0,100001,1360,1394', '滕州市', '370481', '0632', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1401', '1360', '0,100001,1360', '东营市', '370500', '0546', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1402', '1401', '0,100001,1360,1401', '东营区', '370502', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1403', '1401', '0,100001,1360,1401', '河口区', '370503', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1404', '1401', '0,100001,1360,1401', '垦利县', '370521', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1405', '1401', '0,100001,1360,1401', '利津县', '370522', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1406', '1401', '0,100001,1360,1401', '广饶县', '370523', '0546', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1407', '1360', '0,100001,1360', '烟台市', '370600', '0535', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1408', '1407', '0,100001,1360,1407', '芝罘区', '370602', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1409', '1407', '0,100001,1360,1407', '福山区', '370611', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('141', '123', '0,100001,35,123', '蠡县', '130635', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1410', '1407', '0,100001,1360,1407', '牟平区', '370612', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1411', '1407', '0,100001,1360,1407', '莱山区', '370613', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1412', '1407', '0,100001,1360,1407', '长岛县', '370634', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1413', '1407', '0,100001,1360,1407', '龙口市', '370681', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1414', '1407', '0,100001,1360,1407', '莱阳市', '370682', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1415', '1407', '0,100001,1360,1407', '莱州市', '370683', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1416', '1407', '0,100001,1360,1407', '蓬莱市', '370684', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1417', '1407', '0,100001,1360,1407', '招远市', '370685', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1418', '1407', '0,100001,1360,1407', '栖霞市', '370686', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1419', '1407', '0,100001,1360,1407', '海阳市', '370687', '0535', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('142', '123', '0,100001,35,123', '顺平县', '130636', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1420', '1360', '0,100001,1360', '潍坊市', '370700', '0536', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1421', '1420', '0,100001,1360,1420', '潍城区', '370702', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1422', '1420', '0,100001,1360,1420', '寒亭区', '370703', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1423', '1420', '0,100001,1360,1420', '坊子区', '370704', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1424', '1420', '0,100001,1360,1420', '奎文区', '370705', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1425', '1420', '0,100001,1360,1420', '临朐县', '370724', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1426', '1420', '0,100001,1360,1420', '昌乐县', '370725', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1427', '1420', '0,100001,1360,1420', '青州市', '370781', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1428', '1420', '0,100001,1360,1420', '诸城市', '370782', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1429', '1420', '0,100001,1360,1420', '寿光市', '370783', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('143', '123', '0,100001,35,123', '博野县', '130637', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1430', '1420', '0,100001,1360,1420', '安丘市', '370784', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1431', '1420', '0,100001,1360,1420', '高密市', '370785', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1432', '1420', '0,100001,1360,1420', '昌邑市', '370786', '0536', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1433', '1360', '0,100001,1360', '济宁市', '370800', '0537', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1434', '1433', '0,100001,1360,1433', '市中区', '370802', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1435', '1433', '0,100001,1360,1433', '任城区', '370811', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1436', '1433', '0,100001,1360,1433', '微山县', '370826', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1437', '1433', '0,100001,1360,1433', '鱼台县', '370827', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1438', '1433', '0,100001,1360,1433', '金乡县', '370828', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1439', '1433', '0,100001,1360,1433', '嘉祥县', '370829', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('144', '123', '0,100001,35,123', '雄县', '130638', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1440', '1433', '0,100001,1360,1433', '汶上县', '370830', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1441', '1433', '0,100001,1360,1433', '泗水县', '370831', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1442', '1433', '0,100001,1360,1433', '梁山县', '370832', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1443', '1433', '0,100001,1360,1433', '曲阜市', '370881', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1444', '1433', '0,100001,1360,1433', '兖州市', '370882', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1445', '1433', '0,100001,1360,1433', '邹城市', '370883', '0537', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1446', '1360', '0,100001,1360', '泰安市', '370900', '0538', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1447', '1446', '0,100001,1360,1446', '泰山区', '370902', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1448', '1446', '0,100001,1360,1446', '岱岳区', '370911', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1449', '1446', '0,100001,1360,1446', '宁阳县', '370921', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('145', '123', '0,100001,35,123', '涿州市', '130681', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1450', '1446', '0,100001,1360,1446', '东平县', '370923', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1451', '1446', '0,100001,1360,1446', '新泰市', '370982', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1452', '1446', '0,100001,1360,1446', '肥城市', '370983', '0538', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1453', '1360', '0,100001,1360', '威海市', '371000', '0631', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1454', '1453', '0,100001,1360,1453', '环翠区', '371002', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1455', '1453', '0,100001,1360,1453', '文登市', '371081', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1456', '1453', '0,100001,1360,1453', '荣成市', '371082', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1457', '1453', '0,100001,1360,1453', '乳山市', '371083', '0631', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1458', '1360', '0,100001,1360', '日照市', '371100', '0633', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1459', '1458', '0,100001,1360,1458', '东港区', '371102', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('146', '123', '0,100001,35,123', '定州市', '130682', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1460', '1458', '0,100001,1360,1458', '岚山区', '371103', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1461', '1458', '0,100001,1360,1458', '五莲县', '371121', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1462', '1458', '0,100001,1360,1458', '莒县', '371122', '0633', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1463', '1360', '0,100001,1360', '莱芜市', '371200', '0634', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1464', '1463', '0,100001,1360,1463', '莱城区', '371202', '0634', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1465', '1463', '0,100001,1360,1463', '钢城区', '371203', '0634', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1466', '1360', '0,100001,1360', '临沂市', '371300', '0539', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1467', '1466', '0,100001,1360,1466', '兰山区', '371302', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1468', '1466', '0,100001,1360,1466', '罗庄区', '371311', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1469', '1466', '0,100001,1360,1466', '河东区', '371312', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('147', '123', '0,100001,35,123', '安国市', '130683', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1470', '1466', '0,100001,1360,1466', '沂南县', '371321', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1471', '1466', '0,100001,1360,1466', '郯城县', '371322', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1472', '1466', '0,100001,1360,1466', '沂水县', '371323', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1473', '1466', '0,100001,1360,1466', '苍山县', '371324', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1474', '1466', '0,100001,1360,1466', '费县', '371325', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1475', '1466', '0,100001,1360,1466', '平邑县', '371326', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1476', '1466', '0,100001,1360,1466', '莒南县', '371327', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1477', '1466', '0,100001,1360,1466', '蒙阴县', '371328', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1478', '1466', '0,100001,1360,1466', '临沭县', '371329', '0539', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1479', '1360', '0,100001,1360', '德州市', '371400', '0534', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('148', '123', '0,100001,35,123', '高碑店市', '130684', '0312', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1480', '1479', '0,100001,1360,1479', '德城区', '371402', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1481', '1479', '0,100001,1360,1479', '陵县', '371421', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1482', '1479', '0,100001,1360,1479', '宁津县', '371422', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1483', '1479', '0,100001,1360,1479', '庆云县', '371423', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1484', '1479', '0,100001,1360,1479', '临邑县', '371424', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1485', '1479', '0,100001,1360,1479', '齐河县', '371425', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1486', '1479', '0,100001,1360,1479', '平原县', '371426', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1487', '1479', '0,100001,1360,1479', '夏津县', '371427', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1488', '1479', '0,100001,1360,1479', '武城县', '371428', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1489', '1479', '0,100001,1360,1479', '乐陵市', '371481', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('149', '35', '0,100001,35', '张家口市', '130700', '0313', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1490', '1479', '0,100001,1360,1479', '禹城市', '371482', '0534', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1491', '1360', '0,100001,1360', '聊城市', '371500', '0635', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1492', '1491', '0,100001,1360,1491', '东昌府区', '371502', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1493', '1491', '0,100001,1360,1491', '阳谷县', '371521', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1494', '1491', '0,100001,1360,1491', '莘县', '371522', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1495', '1491', '0,100001,1360,1491', '茌平县', '371523', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1496', '1491', '0,100001,1360,1491', '东阿县', '371524', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1497', '1491', '0,100001,1360,1491', '冠县', '371525', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1498', '1491', '0,100001,1360,1491', '高唐县', '371526', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1499', '1491', '0,100001,1360,1491', '临清市', '371581', '0635', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('15', '1', '0,100001,1', '平谷区', '110117', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('150', '149', '0,100001,35,149', '桥东区', '130702', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1500', '1360', '0,100001,1360', '滨州市', '371600', '0543', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1501', '1500', '0,100001,1360,1500', '滨城区', '371602', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1502', '1500', '0,100001,1360,1500', '惠民县', '371621', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1503', '1500', '0,100001,1360,1500', '阳信县', '371622', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1504', '1500', '0,100001,1360,1500', '无棣县', '371623', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1505', '1500', '0,100001,1360,1500', '沾化县', '371624', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1506', '1500', '0,100001,1360,1500', '博兴县', '371625', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1507', '1500', '0,100001,1360,1500', '邹平县', '371626', '0543', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1508', '1360', '0,100001,1360', '菏泽市', '371700', '0530', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1509', '1508', '0,100001,1360,1508', '牡丹区', '371702', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('151', '149', '0,100001,35,149', '桥西区', '130703', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1510', '1508', '0,100001,1360,1508', '曹县', '371721', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1511', '1508', '0,100001,1360,1508', '单县', '371722', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1512', '1508', '0,100001,1360,1508', '成武县', '371723', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1513', '1508', '0,100001,1360,1508', '巨野县', '371724', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1514', '1508', '0,100001,1360,1508', '郓城县', '371725', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1515', '1508', '0,100001,1360,1508', '鄄城县', '371726', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1516', '1508', '0,100001,1360,1508', '定陶县', '371727', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1517', '1508', '0,100001,1360,1508', '东明县', '371728', '0530', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1518', '100001', '0,100001', '河南省', '410000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1519', '1518', '0,100001,1518', '郑州市', '410100', '0371', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('152', '149', '0,100001,35,149', '宣化区', '130705', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1520', '1519', '0,100001,1518,1519', '中原区', '410102', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1521', '1519', '0,100001,1518,1519', '二七区', '410103', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1522', '1519', '0,100001,1518,1519', '管城回族区', '410104', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1523', '1519', '0,100001,1518,1519', '金水区', '410105', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1524', '1519', '0,100001,1518,1519', '上街区', '410106', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1525', '1519', '0,100001,1518,1519', '惠济区', '410108', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1526', '1519', '0,100001,1518,1519', '中牟县', '410122', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1527', '1519', '0,100001,1518,1519', '巩义市', '410181', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1528', '1519', '0,100001,1518,1519', '荥阳市', '410182', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1529', '1519', '0,100001,1518,1519', '新密市', '410183', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('153', '149', '0,100001,35,149', '下花园区', '130706', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1530', '1519', '0,100001,1518,1519', '新郑市', '410184', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1531', '1519', '0,100001,1518,1519', '登封市', '410185', '0371', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1532', '1518', '0,100001,1518', '开封市', '410200', '0378', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1533', '1532', '0,100001,1518,1532', '龙亭区', '410202', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1534', '1532', '0,100001,1518,1532', '顺河回族区', '410203', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1535', '1532', '0,100001,1518,1532', '鼓楼区', '410204', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1536', '1532', '0,100001,1518,1532', '禹王台区', '410205', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1537', '1532', '0,100001,1518,1532', '金明区', '410211', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1538', '1532', '0,100001,1518,1532', '杞县', '410221', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1539', '1532', '0,100001,1518,1532', '通许县', '410222', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('154', '149', '0,100001,35,149', '宣化县', '130721', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1540', '1532', '0,100001,1518,1532', '尉氏县', '410223', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1541', '1532', '0,100001,1518,1532', '开封县', '410224', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1542', '1532', '0,100001,1518,1532', '兰考县', '410225', '0378', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1543', '1518', '0,100001,1518', '洛阳市', '410300', '0379', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1544', '1543', '0,100001,1518,1543', '老城区', '410302', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1545', '1543', '0,100001,1518,1543', '西工区', '410303', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1546', '1543', '0,100001,1518,1543', '瀍河回族区', '410304', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1547', '1543', '0,100001,1518,1543', '涧西区', '410305', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1548', '1543', '0,100001,1518,1543', '吉利区', '410306', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1549', '1543', '0,100001,1518,1543', '洛龙区', '410311', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('155', '149', '0,100001,35,149', '张北县', '130722', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1550', '1543', '0,100001,1518,1543', '孟津县', '410322', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1551', '1543', '0,100001,1518,1543', '新安县', '410323', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1552', '1543', '0,100001,1518,1543', '栾川县', '410324', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1553', '1543', '0,100001,1518,1543', '嵩县', '410325', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1554', '1543', '0,100001,1518,1543', '汝阳县', '410326', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1555', '1543', '0,100001,1518,1543', '宜阳县', '410327', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1556', '1543', '0,100001,1518,1543', '洛宁县', '410328', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1557', '1543', '0,100001,1518,1543', '伊川县', '410329', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1558', '1543', '0,100001,1518,1543', '偃师市', '410381', '0379', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1559', '1518', '0,100001,1518', '平顶山市', '410400', '0375', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('156', '149', '0,100001,35,149', '康保县', '130723', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1560', '1559', '0,100001,1518,1559', '新华区', '410402', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1561', '1559', '0,100001,1518,1559', '卫东区', '410403', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1562', '1559', '0,100001,1518,1559', '石龙区', '410404', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1563', '1559', '0,100001,1518,1559', '湛河区', '410411', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1564', '1559', '0,100001,1518,1559', '宝丰县', '410421', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1565', '1559', '0,100001,1518,1559', '叶县', '410422', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1566', '1559', '0,100001,1518,1559', '鲁山县', '410423', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1567', '1559', '0,100001,1518,1559', '郏县', '410425', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1568', '1559', '0,100001,1518,1559', '舞钢市', '410481', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1569', '1559', '0,100001,1518,1559', '汝州市', '410482', '0375', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('157', '149', '0,100001,35,149', '沽源县', '130724', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1570', '1518', '0,100001,1518', '安阳市', '410500', '0372', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1571', '1570', '0,100001,1518,1570', '文峰区', '410502', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1572', '1570', '0,100001,1518,1570', '北关区', '410503', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1573', '1570', '0,100001,1518,1570', '殷都区', '410505', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1574', '1570', '0,100001,1518,1570', '龙安区', '410506', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1575', '1570', '0,100001,1518,1570', '安阳县', '410522', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1576', '1570', '0,100001,1518,1570', '汤阴县', '410523', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1577', '1570', '0,100001,1518,1570', '滑县', '410526', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1578', '1570', '0,100001,1518,1570', '内黄县', '410527', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1579', '1570', '0,100001,1518,1570', '林州市', '410581', '0372', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('158', '149', '0,100001,35,149', '尚义县', '130725', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1580', '1518', '0,100001,1518', '鹤壁市', '410600', '0392', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1581', '1580', '0,100001,1518,1580', '鹤山区', '410602', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1582', '1580', '0,100001,1518,1580', '山城区', '410603', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1583', '1580', '0,100001,1518,1580', '淇滨区', '410611', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1584', '1580', '0,100001,1518,1580', '浚县', '410621', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1585', '1580', '0,100001,1518,1580', '淇县', '410622', '0392', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1586', '1518', '0,100001,1518', '新乡市', '410700', '0373', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1587', '1586', '0,100001,1518,1586', '红旗区', '410702', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1588', '1586', '0,100001,1518,1586', '卫滨区', '410703', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1589', '1586', '0,100001,1518,1586', '凤泉区', '410704', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('159', '149', '0,100001,35,149', '蔚县', '130726', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1590', '1586', '0,100001,1518,1586', '牧野区', '410711', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1591', '1586', '0,100001,1518,1586', '新乡县', '410721', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1592', '1586', '0,100001,1518,1586', '获嘉县', '410724', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1593', '1586', '0,100001,1518,1586', '原阳县', '410725', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1594', '1586', '0,100001,1518,1586', '延津县', '410726', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1595', '1586', '0,100001,1518,1586', '封丘县', '410727', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1596', '1586', '0,100001,1518,1586', '长垣县', '410728', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1597', '1586', '0,100001,1518,1586', '卫辉市', '410781', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1598', '1586', '0,100001,1518,1586', '辉县市', '410782', '0373', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1599', '1518', '0,100001,1518', '焦作市', '410800', '0391', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('16', '1', '0,100001,1', '密云县', '110228', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('160', '149', '0,100001,35,149', '阳原县', '130727', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1600', '1599', '0,100001,1518,1599', '解放区', '410802', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1601', '1599', '0,100001,1518,1599', '中站区', '410803', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1602', '1599', '0,100001,1518,1599', '马村区', '410804', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1603', '1599', '0,100001,1518,1599', '山阳区', '410811', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1604', '1599', '0,100001,1518,1599', '修武县', '410821', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1605', '1599', '0,100001,1518,1599', '博爱县', '410822', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1606', '1599', '0,100001,1518,1599', '武陟县', '410823', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1607', '1599', '0,100001,1518,1599', '温县', '410825', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1608', '1599', '0,100001,1518,1599', '沁阳市', '410882', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1609', '1599', '0,100001,1518,1599', '孟州市', '410883', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('161', '149', '0,100001,35,149', '怀安县', '130728', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1610', '1518', '0,100001,1518', '濮阳市', '410900', '0393', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1611', '1610', '0,100001,1518,1610', '华龙区', '410902', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1612', '1610', '0,100001,1518,1610', '清丰县', '410922', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1613', '1610', '0,100001,1518,1610', '南乐县', '410923', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1614', '1610', '0,100001,1518,1610', '范县', '410926', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1615', '1610', '0,100001,1518,1610', '台前县', '410927', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1616', '1610', '0,100001,1518,1610', '濮阳县', '410928', '0393', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1617', '1518', '0,100001,1518', '许昌市', '411000', '0374', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1618', '1617', '0,100001,1518,1617', '魏都区', '411002', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1619', '1617', '0,100001,1518,1617', '许昌县', '411023', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('162', '149', '0,100001,35,149', '万全县', '130729', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1620', '1617', '0,100001,1518,1617', '鄢陵县', '411024', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1621', '1617', '0,100001,1518,1617', '襄城县', '411025', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1622', '1617', '0,100001,1518,1617', '禹州市', '411081', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1623', '1617', '0,100001,1518,1617', '长葛市', '411082', '0374', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1624', '1518', '0,100001,1518', '漯河市', '411100', '0395', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1625', '1624', '0,100001,1518,1624', '源汇区', '411102', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1626', '1624', '0,100001,1518,1624', '郾城区', '411103', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1627', '1624', '0,100001,1518,1624', '召陵区', '411104', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1628', '1624', '0,100001,1518,1624', '舞阳县', '411121', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1629', '1624', '0,100001,1518,1624', '临颍县', '411122', '0395', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('163', '149', '0,100001,35,149', '怀来县', '130730', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1630', '1518', '0,100001,1518', '三门峡市', '411200', '0398', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1631', '1630', '0,100001,1518,1630', '湖滨区', '411202', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1632', '1630', '0,100001,1518,1630', '渑池县', '411221', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1633', '1630', '0,100001,1518,1630', '陕县', '411222', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1634', '1630', '0,100001,1518,1630', '卢氏县', '411224', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1635', '1630', '0,100001,1518,1630', '义马市', '411281', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1636', '1630', '0,100001,1518,1630', '灵宝市', '411282', '0398', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1637', '1518', '0,100001,1518', '南阳市', '411300', '0377', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1638', '1637', '0,100001,1518,1637', '宛城区', '411302', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1639', '1637', '0,100001,1518,1637', '卧龙区', '411303', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('164', '149', '0,100001,35,149', '涿鹿县', '130731', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1640', '1637', '0,100001,1518,1637', '南召县', '411321', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1641', '1637', '0,100001,1518,1637', '方城县', '411322', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1642', '1637', '0,100001,1518,1637', '西峡县', '411323', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1643', '1637', '0,100001,1518,1637', '镇平县', '411324', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1644', '1637', '0,100001,1518,1637', '内乡县', '411325', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1645', '1637', '0,100001,1518,1637', '淅川县', '411326', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1646', '1637', '0,100001,1518,1637', '社旗县', '411327', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1647', '1637', '0,100001,1518,1637', '唐河县', '411328', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1648', '1637', '0,100001,1518,1637', '新野县', '411329', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1649', '1637', '0,100001,1518,1637', '桐柏县', '411330', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('165', '149', '0,100001,35,149', '赤城县', '130732', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1650', '1637', '0,100001,1518,1637', '邓州市', '411381', '0377', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1651', '1518', '0,100001,1518', '商丘市', '411400', '0370', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1652', '1651', '0,100001,1518,1651', '梁园区', '411402', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1653', '1651', '0,100001,1518,1651', '睢阳区', '411403', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1654', '1651', '0,100001,1518,1651', '民权县', '411421', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1655', '1651', '0,100001,1518,1651', '睢县', '411422', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1656', '1651', '0,100001,1518,1651', '宁陵县', '411423', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1657', '1651', '0,100001,1518,1651', '柘城县', '411424', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1658', '1651', '0,100001,1518,1651', '虞城县', '411425', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1659', '1651', '0,100001,1518,1651', '夏邑县', '411426', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('166', '149', '0,100001,35,149', '崇礼县', '130733', '0313', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1660', '1651', '0,100001,1518,1651', '永城市', '411481', '0370', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1661', '1518', '0,100001,1518', '信阳市', '411500', '0376', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1662', '1661', '0,100001,1518,1661', '浉河区', '411502', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1663', '1661', '0,100001,1518,1661', '平桥区', '411503', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1664', '1661', '0,100001,1518,1661', '罗山县', '411521', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1665', '1661', '0,100001,1518,1661', '光山县', '411522', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1666', '1661', '0,100001,1518,1661', '新县', '411523', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1667', '1661', '0,100001,1518,1661', '商城县', '411524', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1668', '1661', '0,100001,1518,1661', '固始县', '411525', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1669', '1661', '0,100001,1518,1661', '潢川县', '411526', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('167', '35', '0,100001,35', '承德市', '130800', '0314', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1670', '1661', '0,100001,1518,1661', '淮滨县', '411527', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1671', '1661', '0,100001,1518,1661', '息县', '411528', '0376', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1672', '1518', '0,100001,1518', '周口市', '411600', '0394', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1673', '1672', '0,100001,1518,1672', '川汇区', '411602', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1674', '1672', '0,100001,1518,1672', '扶沟县', '411621', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1675', '1672', '0,100001,1518,1672', '西华县', '411622', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1676', '1672', '0,100001,1518,1672', '商水县', '411623', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1677', '1672', '0,100001,1518,1672', '沈丘县', '411624', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1678', '1672', '0,100001,1518,1672', '郸城县', '411625', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1679', '1672', '0,100001,1518,1672', '淮阳县', '411626', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('168', '167', '0,100001,35,167', '双桥区', '130802', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1680', '1672', '0,100001,1518,1672', '太康县', '411627', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1681', '1672', '0,100001,1518,1672', '鹿邑县', '411628', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1682', '1672', '0,100001,1518,1672', '项城市', '411681', '0394', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1683', '1518', '0,100001,1518', '驻马店市', '411700', '0396', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1684', '1683', '0,100001,1518,1683', '驿城区', '411702', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1685', '1683', '0,100001,1518,1683', '西平县', '411721', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1686', '1683', '0,100001,1518,1683', '上蔡县', '411722', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1687', '1683', '0,100001,1518,1683', '平舆县', '411723', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1688', '1683', '0,100001,1518,1683', '正阳县', '411724', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1689', '1683', '0,100001,1518,1683', '确山县', '411725', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('169', '167', '0,100001,35,167', '双滦区', '130803', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1690', '1683', '0,100001,1518,1683', '泌阳县', '411726', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1691', '1683', '0,100001,1518,1683', '汝南县', '411727', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1692', '1683', '0,100001,1518,1683', '遂平县', '411728', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1693', '1683', '0,100001,1518,1683', '新蔡县', '411729', '0396', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1694', '1518', '0,100001,1518', '省直辖', '419000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1695', '1694', '0,100001,1518,1694', '济源市', '419001', '0391', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1696', '100001', '0,100001', '湖北省', '420000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1697', '1696', '0,100001,1696', '武汉市', '420100', '027', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1698', '1697', '0,100001,1696,1697', '江岸区', '420102', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1699', '1697', '0,100001,1696,1697', '江汉区', '420103', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('17', '1', '0,100001,1', '延庆县', '110229', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('170', '167', '0,100001,35,167', '鹰手营子矿区', '130804', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1700', '1697', '0,100001,1696,1697', '硚口区', '420104', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1701', '1697', '0,100001,1696,1697', '汉阳区', '420105', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1702', '1697', '0,100001,1696,1697', '武昌区', '420106', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1703', '1697', '0,100001,1696,1697', '青山区', '420107', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1704', '1697', '0,100001,1696,1697', '洪山区', '420111', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1705', '1697', '0,100001,1696,1697', '东西湖区', '420112', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1706', '1697', '0,100001,1696,1697', '汉南区', '420113', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1707', '1697', '0,100001,1696,1697', '蔡甸区', '420114', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1708', '1697', '0,100001,1696,1697', '江夏区', '420115', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1709', '1697', '0,100001,1696,1697', '黄陂区', '420116', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('171', '167', '0,100001,35,167', '承德县', '130821', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1710', '1697', '0,100001,1696,1697', '新洲区', '420117', '027', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1711', '1696', '0,100001,1696', '黄石市', '420200', '0714', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1712', '1711', '0,100001,1696,1711', '黄石港区', '420202', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1713', '1711', '0,100001,1696,1711', '西塞山区', '420203', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1714', '1711', '0,100001,1696,1711', '下陆区', '420204', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1715', '1711', '0,100001,1696,1711', '铁山区', '420205', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1716', '1711', '0,100001,1696,1711', '阳新县', '420222', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1717', '1711', '0,100001,1696,1711', '大冶市', '420281', '0714', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1718', '1696', '0,100001,1696', '十堰市', '420300', '0719', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1719', '1718', '0,100001,1696,1718', '茅箭区', '420302', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('172', '167', '0,100001,35,167', '兴隆县', '130822', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1720', '1718', '0,100001,1696,1718', '张湾区', '420303', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1721', '1718', '0,100001,1696,1718', '郧县', '420321', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1722', '1718', '0,100001,1696,1718', '郧西县', '420322', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1723', '1718', '0,100001,1696,1718', '竹山县', '420323', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1724', '1718', '0,100001,1696,1718', '竹溪县', '420324', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1725', '1718', '0,100001,1696,1718', '房县', '420325', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1726', '1718', '0,100001,1696,1718', '丹江口市', '420381', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1727', '1696', '0,100001,1696', '宜昌市', '420500', '0717', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1728', '1727', '0,100001,1696,1727', '西陵区', '420502', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1729', '1727', '0,100001,1696,1727', '伍家岗区', '420503', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('173', '167', '0,100001,35,167', '平泉县', '130823', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1730', '1727', '0,100001,1696,1727', '点军区', '420504', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1731', '1727', '0,100001,1696,1727', '猇亭区', '420505', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1732', '1727', '0,100001,1696,1727', '夷陵区', '420506', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1733', '1727', '0,100001,1696,1727', '远安县', '420525', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1734', '1727', '0,100001,1696,1727', '兴山县', '420526', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1735', '1727', '0,100001,1696,1727', '秭归县', '420527', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1736', '1727', '0,100001,1696,1727', '长阳土家族自治县', '420528', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1737', '1727', '0,100001,1696,1727', '五峰土家族自治县', '420529', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1738', '1727', '0,100001,1696,1727', '宜都市', '420581', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1739', '1727', '0,100001,1696,1727', '当阳市', '420582', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('174', '167', '0,100001,35,167', '滦平县', '130824', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1740', '1727', '0,100001,1696,1727', '枝江市', '420583', '0717', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1741', '1696', '0,100001,1696', '襄阳市', '420600', '0710', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1742', '1741', '0,100001,1696,1741', '襄城区', '420602', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1743', '1741', '0,100001,1696,1741', '樊城区', '420606', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1744', '1741', '0,100001,1696,1741', '襄州区', '420607', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1745', '1741', '0,100001,1696,1741', '南漳县', '420624', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1746', '1741', '0,100001,1696,1741', '谷城县', '420625', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1747', '1741', '0,100001,1696,1741', '保康县', '420626', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1748', '1741', '0,100001,1696,1741', '老河口市', '420682', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1749', '1741', '0,100001,1696,1741', '枣阳市', '420683', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('175', '167', '0,100001,35,167', '隆化县', '130825', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1750', '1741', '0,100001,1696,1741', '宜城市', '420684', '0710', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1751', '1696', '0,100001,1696', '鄂州市', '420700', '0711', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1752', '1751', '0,100001,1696,1751', '梁子湖区', '420702', '0711', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1753', '1751', '0,100001,1696,1751', '华容区', '420703', '0711', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1754', '1751', '0,100001,1696,1751', '鄂城区', '420704', '0711', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1755', '1696', '0,100001,1696', '荆门市', '420800', '0724', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1756', '1755', '0,100001,1696,1755', '东宝区', '420802', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1757', '1755', '0,100001,1696,1755', '掇刀区', '420804', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1758', '1755', '0,100001,1696,1755', '京山县', '420821', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1759', '1755', '0,100001,1696,1755', '沙洋县', '420822', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('176', '167', '0,100001,35,167', '丰宁满族自治县', '130826', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1760', '1755', '0,100001,1696,1755', '钟祥市', '420881', '0724', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1761', '1696', '0,100001,1696', '孝感市', '420900', '0712', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1762', '1761', '0,100001,1696,1761', '孝南区', '420902', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1763', '1761', '0,100001,1696,1761', '孝昌县', '420921', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1764', '1761', '0,100001,1696,1761', '大悟县', '420922', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1765', '1761', '0,100001,1696,1761', '云梦县', '420923', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1766', '1761', '0,100001,1696,1761', '应城市', '420981', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1767', '1761', '0,100001,1696,1761', '安陆市', '420982', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1768', '1761', '0,100001,1696,1761', '汉川市', '420984', '0712', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1769', '1696', '0,100001,1696', '荆州市', '421000', '0716', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('177', '167', '0,100001,35,167', '宽城满族自治县', '130827', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1770', '1769', '0,100001,1696,1769', '沙市区', '421002', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1771', '1769', '0,100001,1696,1769', '荆州区', '421003', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1772', '1769', '0,100001,1696,1769', '公安县', '421022', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1773', '1769', '0,100001,1696,1769', '监利县', '421023', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1774', '1769', '0,100001,1696,1769', '江陵县', '421024', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1775', '1769', '0,100001,1696,1769', '石首市', '421081', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1776', '1769', '0,100001,1696,1769', '洪湖市', '421083', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1777', '1769', '0,100001,1696,1769', '松滋市', '421087', '0716', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1778', '1696', '0,100001,1696', '黄冈市', '421100', '0713', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1779', '1778', '0,100001,1696,1778', '黄州区', '421102', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('178', '167', '0,100001,35,167', '围场满族蒙古族自治县', '130828', '0314', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1780', '1778', '0,100001,1696,1778', '团风县', '421121', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1781', '1778', '0,100001,1696,1778', '红安县', '421122', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1782', '1778', '0,100001,1696,1778', '罗田县', '421123', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1783', '1778', '0,100001,1696,1778', '英山县', '421124', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1784', '1778', '0,100001,1696,1778', '浠水县', '421125', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1785', '1778', '0,100001,1696,1778', '蕲春县', '421126', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1786', '1778', '0,100001,1696,1778', '黄梅县', '421127', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1787', '1778', '0,100001,1696,1778', '麻城市', '421181', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1788', '1778', '0,100001,1696,1778', '武穴市', '421182', '0713', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1789', '1696', '0,100001,1696', '咸宁市', '421200', '0715', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('179', '35', '0,100001,35', '沧州市', '130900', '0317', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1790', '1789', '0,100001,1696,1789', '咸安区', '421202', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1791', '1789', '0,100001,1696,1789', '嘉鱼县', '421221', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1792', '1789', '0,100001,1696,1789', '通城县', '421222', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1793', '1789', '0,100001,1696,1789', '崇阳县', '421223', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1794', '1789', '0,100001,1696,1789', '通山县', '421224', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1795', '1789', '0,100001,1696,1789', '赤壁市', '421281', '0715', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1796', '1696', '0,100001,1696', '随州市', '421300', '0722', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1797', '1796', '0,100001,1696,1796', '曾都区', '421303', '0722', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1798', '1796', '0,100001,1696,1796', '随县', '421321', '0722', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1799', '1796', '0,100001,1696,1796', '广水市', '421381', '0722', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('18', '100001', '0100001,', '天津市', '120000', '022', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:26:45', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('180', '179', '0,100001,35,179', '新华区', '130902', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1800', '1696', '0,100001,1696', '恩施土家族苗族自治州', '422800', '0718', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1801', '1800', '0,100001,1696,1800', '恩施市', '422801', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1802', '1800', '0,100001,1696,1800', '利川市', '422802', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1803', '1800', '0,100001,1696,1800', '建始县', '422822', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1804', '1800', '0,100001,1696,1800', '巴东县', '422823', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1805', '1800', '0,100001,1696,1800', '宣恩县', '422825', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1806', '1800', '0,100001,1696,1800', '咸丰县', '422826', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1807', '1800', '0,100001,1696,1800', '来凤县', '422827', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1808', '1800', '0,100001,1696,1800', '鹤峰县', '422828', '0718', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1809', '1696', '0,100001,1696', '省直辖', '429000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('181', '179', '0,100001,35,179', '运河区', '130903', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1810', '1809', '0,100001,1696,1809', '仙桃市', '429004', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1811', '1809', '0,100001,1696,1809', '潜江市', '429005', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1812', '1809', '0,100001,1696,1809', '天门市', '429006', '0728', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1813', '1809', '0,100001,1696,1809', '神农架林区', '429021', '0719', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1814', '100001', '0,100001', '湖南省', '430000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1815', '1814', '0,100001,1814', '长沙市', '430100', '0731', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1816', '1815', '0,100001,1814,1815', '芙蓉区', '430102', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1817', '1815', '0,100001,1814,1815', '天心区', '430103', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1818', '1815', '0,100001,1814,1815', '岳麓区', '430104', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1819', '1815', '0,100001,1814,1815', '开福区', '430105', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('182', '179', '0,100001,35,179', '沧县', '130921', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1820', '1815', '0,100001,1814,1815', '雨花区', '430111', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1821', '1815', '0,100001,1814,1815', '望城区', '430112', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1822', '1815', '0,100001,1814,1815', '长沙县', '430121', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1823', '1815', '0,100001,1814,1815', '宁乡县', '430124', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1824', '1815', '0,100001,1814,1815', '浏阳市', '430181', '0731', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1825', '1814', '0,100001,1814', '株洲市', '430200', '0733', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1826', '1825', '0,100001,1814,1825', '荷塘区', '430202', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1827', '1825', '0,100001,1814,1825', '芦淞区', '430203', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1828', '1825', '0,100001,1814,1825', '石峰区', '430204', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1829', '1825', '0,100001,1814,1825', '天元区', '430211', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('183', '179', '0,100001,35,179', '青县', '130922', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1830', '1825', '0,100001,1814,1825', '株洲县', '430221', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1831', '1825', '0,100001,1814,1825', '攸县', '430223', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1832', '1825', '0,100001,1814,1825', '茶陵县', '430224', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1833', '1825', '0,100001,1814,1825', '炎陵县', '430225', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1834', '1825', '0,100001,1814,1825', '醴陵市', '430281', '0733', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1835', '1814', '0,100001,1814', '湘潭市', '430300', '0732', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1836', '1835', '0,100001,1814,1835', '雨湖区', '430302', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1837', '1835', '0,100001,1814,1835', '岳塘区', '430304', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1838', '1835', '0,100001,1814,1835', '湘潭县', '430321', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1839', '1835', '0,100001,1814,1835', '湘乡市', '430381', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('184', '179', '0,100001,35,179', '东光县', '130923', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1840', '1835', '0,100001,1814,1835', '韶山市', '430382', '0732', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1841', '1814', '0,100001,1814', '衡阳市', '430400', '0734', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1842', '1841', '0,100001,1814,1841', '珠晖区', '430405', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1843', '1841', '0,100001,1814,1841', '雁峰区', '430406', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1844', '1841', '0,100001,1814,1841', '石鼓区', '430407', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1845', '1841', '0,100001,1814,1841', '蒸湘区', '430408', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1846', '1841', '0,100001,1814,1841', '南岳区', '430412', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1847', '1841', '0,100001,1814,1841', '衡阳县', '430421', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1848', '1841', '0,100001,1814,1841', '衡南县', '430422', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1849', '1841', '0,100001,1814,1841', '衡山县', '430423', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('185', '179', '0,100001,35,179', '海兴县', '130924', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1850', '1841', '0,100001,1814,1841', '衡东县', '430424', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1851', '1841', '0,100001,1814,1841', '祁东县', '430426', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1852', '1841', '0,100001,1814,1841', '耒阳市', '430481', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1853', '1841', '0,100001,1814,1841', '常宁市', '430482', '0734', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1854', '1814', '0,100001,1814', '邵阳市', '430500', '0739', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1855', '1854', '0,100001,1814,1854', '双清区', '430502', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1856', '1854', '0,100001,1814,1854', '大祥区', '430503', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1857', '1854', '0,100001,1814,1854', '北塔区', '430511', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1858', '1854', '0,100001,1814,1854', '邵东县', '430521', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1859', '1854', '0,100001,1814,1854', '新邵县', '430522', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('186', '179', '0,100001,35,179', '盐山县', '130925', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1860', '1854', '0,100001,1814,1854', '邵阳县', '430523', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1861', '1854', '0,100001,1814,1854', '隆回县', '430524', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1862', '1854', '0,100001,1814,1854', '洞口县', '430525', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1863', '1854', '0,100001,1814,1854', '绥宁县', '430527', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1864', '1854', '0,100001,1814,1854', '新宁县', '430528', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1865', '1854', '0,100001,1814,1854', '城步苗族自治县', '430529', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1866', '1854', '0,100001,1814,1854', '武冈市', '430581', '0739', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1867', '1814', '0,100001,1814', '岳阳市', '430600', '0730', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1868', '1867', '0,100001,1814,1867', '岳阳楼区', '430602', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1869', '1867', '0,100001,1814,1867', '云溪区', '430603', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('187', '179', '0,100001,35,179', '肃宁县', '130926', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1870', '1867', '0,100001,1814,1867', '君山区', '430611', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1871', '1867', '0,100001,1814,1867', '岳阳县', '430621', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1872', '1867', '0,100001,1814,1867', '华容县', '430623', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1873', '1867', '0,100001,1814,1867', '湘阴县', '430624', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1874', '1867', '0,100001,1814,1867', '平江县', '430626', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1875', '1867', '0,100001,1814,1867', '汨罗市', '430681', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1876', '1867', '0,100001,1814,1867', '临湘市', '430682', '0730', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1877', '1814', '0,100001,1814', '常德市', '430700', '0736', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1878', '1877', '0,100001,1814,1877', '武陵区', '430702', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1879', '1877', '0,100001,1814,1877', '鼎城区', '430703', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('188', '179', '0,100001,35,179', '南皮县', '130927', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1880', '1877', '0,100001,1814,1877', '安乡县', '430721', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1881', '1877', '0,100001,1814,1877', '汉寿县', '430722', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1882', '1877', '0,100001,1814,1877', '澧县', '430723', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1883', '1877', '0,100001,1814,1877', '临澧县', '430724', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1884', '1877', '0,100001,1814,1877', '桃源县', '430725', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1885', '1877', '0,100001,1814,1877', '石门县', '430726', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1886', '1877', '0,100001,1814,1877', '津市市', '430781', '0736', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1887', '1814', '0,100001,1814', '张家界市', '430800', '0744', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1888', '1887', '0,100001,1814,1887', '永定区', '430802', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1889', '1887', '0,100001,1814,1887', '武陵源区', '430811', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('189', '179', '0,100001,35,179', '吴桥县', '130928', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1890', '1887', '0,100001,1814,1887', '慈利县', '430821', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1891', '1887', '0,100001,1814,1887', '桑植县', '430822', '0744', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1892', '1814', '0,100001,1814', '益阳市', '430900', '0737', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1893', '1892', '0,100001,1814,1892', '资阳区', '430902', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1894', '1892', '0,100001,1814,1892', '赫山区', '430903', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1895', '1892', '0,100001,1814,1892', '南县', '430921', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1896', '1892', '0,100001,1814,1892', '桃江县', '430922', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1897', '1892', '0,100001,1814,1892', '安化县', '430923', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1898', '1892', '0,100001,1814,1892', '沅江市', '430981', '0737', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1899', '1814', '0,100001,1814', '郴州市', '431000', '0735', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('19', '18', '0,100001,18', '和平区', '120101', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('190', '179', '0,100001,35,179', '献县', '130929', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1900', '1899', '0,100001,1814,1899', '北湖区', '431002', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1901', '1899', '0,100001,1814,1899', '苏仙区', '431003', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1902', '1899', '0,100001,1814,1899', '桂阳县', '431021', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1903', '1899', '0,100001,1814,1899', '宜章县', '431022', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1904', '1899', '0,100001,1814,1899', '永兴县', '431023', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1905', '1899', '0,100001,1814,1899', '嘉禾县', '431024', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1906', '1899', '0,100001,1814,1899', '临武县', '431025', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1907', '1899', '0,100001,1814,1899', '汝城县', '431026', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1908', '1899', '0,100001,1814,1899', '桂东县', '431027', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1909', '1899', '0,100001,1814,1899', '安仁县', '431028', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('191', '179', '0,100001,35,179', '孟村回族自治县', '130930', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1910', '1899', '0,100001,1814,1899', '资兴市', '431081', '0735', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1911', '1814', '0,100001,1814', '永州市', '431100', '0746', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1912', '1911', '0,100001,1814,1911', '零陵区', '431102', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1913', '1911', '0,100001,1814,1911', '冷水滩区', '431103', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1914', '1911', '0,100001,1814,1911', '祁阳县', '431121', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1915', '1911', '0,100001,1814,1911', '东安县', '431122', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1916', '1911', '0,100001,1814,1911', '双牌县', '431123', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1917', '1911', '0,100001,1814,1911', '道县', '431124', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1918', '1911', '0,100001,1814,1911', '江永县', '431125', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1919', '1911', '0,100001,1814,1911', '宁远县', '431126', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('192', '179', '0,100001,35,179', '泊头市', '130981', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1920', '1911', '0,100001,1814,1911', '蓝山县', '431127', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1921', '1911', '0,100001,1814,1911', '新田县', '431128', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1922', '1911', '0,100001,1814,1911', '江华瑶族自治县', '431129', '0746', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1923', '1814', '0,100001,1814', '怀化市', '431200', '0745', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1924', '1923', '0,100001,1814,1923', '鹤城区', '431202', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1925', '1923', '0,100001,1814,1923', '中方县', '431221', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1926', '1923', '0,100001,1814,1923', '沅陵县', '431222', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1927', '1923', '0,100001,1814,1923', '辰溪县', '431223', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1928', '1923', '0,100001,1814,1923', '溆浦县', '431224', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1929', '1923', '0,100001,1814,1923', '会同县', '431225', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('193', '179', '0,100001,35,179', '任丘市', '130982', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1930', '1923', '0,100001,1814,1923', '麻阳苗族自治县', '431226', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1931', '1923', '0,100001,1814,1923', '新晃侗族自治县', '431227', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1932', '1923', '0,100001,1814,1923', '芷江侗族自治县', '431228', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1933', '1923', '0,100001,1814,1923', '靖州苗族侗族自治县', '431229', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1934', '1923', '0,100001,1814,1923', '通道侗族自治县', '431230', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1935', '1923', '0,100001,1814,1923', '洪江市', '431281', '0745', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1936', '1814', '0,100001,1814', '娄底市', '431300', '0738', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1937', '1936', '0,100001,1814,1936', '娄星区', '431302', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1938', '1936', '0,100001,1814,1936', '双峰县', '431321', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1939', '1936', '0,100001,1814,1936', '新化县', '431322', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('194', '179', '0,100001,35,179', '黄骅市', '130983', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1940', '1936', '0,100001,1814,1936', '冷水江市', '431381', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1941', '1936', '0,100001,1814,1936', '涟源市', '431382', '0738', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1942', '1814', '0,100001,1814', '湘西土家族苗族自治州', '433100', '0743', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1943', '1942', '0,100001,1814,1942', '吉首市', '433101', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1944', '1942', '0,100001,1814,1942', '泸溪县', '433122', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1945', '1942', '0,100001,1814,1942', '凤凰县', '433123', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1946', '1942', '0,100001,1814,1942', '花垣县', '433124', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1947', '1942', '0,100001,1814,1942', '保靖县', '433125', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1948', '1942', '0,100001,1814,1942', '古丈县', '433126', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1949', '1942', '0,100001,1814,1942', '永顺县', '433127', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('195', '179', '0,100001,35,179', '河间市', '130984', '0317', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1950', '1942', '0,100001,1814,1942', '龙山县', '433130', '0743', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1951', '100001', '0,100001', '广东省', '440000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1952', '1951', '0,100001,1951', '广州市', '440100', '020', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1953', '1952', '0,100001,1951,1952', '荔湾区', '440103', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1954', '1952', '0,100001,1951,1952', '越秀区', '440104', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1955', '1952', '0,100001,1951,1952', '海珠区', '440105', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1956', '1952', '0,100001,1951,1952', '天河区', '440106', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1957', '1952', '0,100001,1951,1952', '白云区', '440111', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1958', '1952', '0,100001,1951,1952', '黄埔区', '440112', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1959', '1952', '0,100001,1951,1952', '番禺区', '440113', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('196', '35', '0,100001,35', '廊坊市', '131000', '0316', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1960', '1952', '0,100001,1951,1952', '花都区', '440114', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1961', '1952', '0,100001,1951,1952', '南沙区', '440115', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1962', '1952', '0,100001,1951,1952', '萝岗区', '440116', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1963', '1952', '0,100001,1951,1952', '增城市', '440183', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1964', '1952', '0,100001,1951,1952', '从化市', '440184', '020', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1965', '1951', '0,100001,1951', '韶关市', '440200', '0751', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1966', '1965', '0,100001,1951,1965', '武江区', '440203', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1967', '1965', '0,100001,1951,1965', '浈江区', '440204', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1968', '1965', '0,100001,1951,1965', '曲江区', '440205', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1969', '1965', '0,100001,1951,1965', '始兴县', '440222', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('197', '196', '0,100001,35,196', '安次区', '131002', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1970', '1965', '0,100001,1951,1965', '仁化县', '440224', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1971', '1965', '0,100001,1951,1965', '翁源县', '440229', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1972', '1965', '0,100001,1951,1965', '乳源瑶族自治县', '440232', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1973', '1965', '0,100001,1951,1965', '新丰县', '440233', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1974', '1965', '0,100001,1951,1965', '乐昌市', '440281', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1975', '1965', '0,100001,1951,1965', '南雄市', '440282', '0751', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1976', '1951', '0,100001,1951', '深圳市', '440300', '0755', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1977', '1976', '0,100001,1951,1976', '罗湖区', '440303', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1978', '1976', '0,100001,1951,1976', '福田区', '440304', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1979', '1976', '0,100001,1951,1976', '南山区', '440305', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('198', '196', '0,100001,35,196', '广阳区', '131003', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1980', '1976', '0,100001,1951,1976', '宝安区', '440306', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1981', '1976', '0,100001,1951,1976', '龙岗区', '440307', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1982', '1976', '0,100001,1951,1976', '盐田区', '440308', '0755', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1983', '1951', '0,100001,1951', '珠海市', '440400', '0756', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1984', '1983', '0,100001,1951,1983', '香洲区', '440402', '0756', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1985', '1983', '0,100001,1951,1983', '斗门区', '440403', '0756', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1986', '1983', '0,100001,1951,1983', '金湾区', '440404', '0756', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1987', '1951', '0,100001,1951', '汕头市', '440500', '0754', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1988', '1987', '0,100001,1951,1987', '龙湖区', '440507', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1989', '1987', '0,100001,1951,1987', '金平区', '440511', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('199', '196', '0,100001,35,196', '固安县', '131022', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1990', '1987', '0,100001,1951,1987', '濠江区', '440512', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1991', '1987', '0,100001,1951,1987', '潮阳区', '440513', '0661', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1992', '1987', '0,100001,1951,1987', '潮南区', '440514', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1993', '1987', '0,100001,1951,1987', '澄海区', '440515', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1994', '1987', '0,100001,1951,1987', '南澳县', '440523', '0754', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1995', '1951', '0,100001,1951', '佛山市', '440600', '0757', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1996', '1995', '0,100001,1951,1995', '禅城区', '440604', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1997', '1995', '0,100001,1951,1995', '南海区', '440605', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1998', '1995', '0,100001,1951,1995', '顺德区', '440606', '0765', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('1999', '1995', '0,100001,1951,1995', '三水区', '440607', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,100001,1', '东城区', '110101', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('20', '18', '0,100001,18', '河东区', '120102', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('200', '196', '0,100001,35,196', '永清县', '131023', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2000', '1995', '0,100001,1951,1995', '高明区', '440608', '0757', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2001', '1951', '0,100001,1951', '江门市', '440700', '0750', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2002', '2001', '0,100001,1951,2001', '蓬江区', '440703', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2003', '2001', '0,100001,1951,2001', '江海区', '440704', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2004', '2001', '0,100001,1951,2001', '新会区', '440705', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2005', '2001', '0,100001,1951,2001', '台山市', '440781', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2006', '2001', '0,100001,1951,2001', '开平市', '440783', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2007', '2001', '0,100001,1951,2001', '鹤山市', '440784', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2008', '2001', '0,100001,1951,2001', '恩平市', '440785', '0750', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2009', '1951', '0,100001,1951', '湛江市', '440800', '0759', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('201', '196', '0,100001,35,196', '香河县', '131024', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2010', '2009', '0,100001,1951,2009', '赤坎区', '440802', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2011', '2009', '0,100001,1951,2009', '霞山区', '440803', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2012', '2009', '0,100001,1951,2009', '坡头区', '440804', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2013', '2009', '0,100001,1951,2009', '麻章区', '440811', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2014', '2009', '0,100001,1951,2009', '遂溪县', '440823', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2015', '2009', '0,100001,1951,2009', '徐闻县', '440825', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2016', '2009', '0,100001,1951,2009', '廉江市', '440881', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2017', '2009', '0,100001,1951,2009', '雷州市', '440882', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2018', '2009', '0,100001,1951,2009', '吴川市', '440883', '0759', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2019', '1951', '0,100001,1951', '茂名市', '440900', '0668', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('202', '196', '0,100001,35,196', '大城县', '131025', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2020', '2019', '0,100001,1951,2019', '茂南区', '440902', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2021', '2019', '0,100001,1951,2019', '茂港区', '440903', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2022', '2019', '0,100001,1951,2019', '电白县', '440923', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2023', '2019', '0,100001,1951,2019', '高州市', '440981', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2024', '2019', '0,100001,1951,2019', '化州市', '440982', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2025', '2019', '0,100001,1951,2019', '信宜市', '440983', '0668', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2026', '1951', '0,100001,1951', '肇庆市', '441200', '0758', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2027', '2026', '0,100001,1951,2026', '端州区', '441202', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2028', '2026', '0,100001,1951,2026', '鼎湖区', '441203', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2029', '2026', '0,100001,1951,2026', '广宁县', '441223', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('203', '196', '0,100001,35,196', '文安县', '131026', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2030', '2026', '0,100001,1951,2026', '怀集县', '441224', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2031', '2026', '0,100001,1951,2026', '封开县', '441225', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2032', '2026', '0,100001,1951,2026', '德庆县', '441226', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2033', '2026', '0,100001,1951,2026', '高要市', '441283', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2034', '2026', '0,100001,1951,2026', '四会市', '441284', '0758', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2035', '1951', '0,100001,1951', '惠州市', '441300', '0752', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2036', '2035', '0,100001,1951,2035', '惠城区', '441302', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2037', '2035', '0,100001,1951,2035', '惠阳区', '441303', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2038', '2035', '0,100001,1951,2035', '博罗县', '441322', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2039', '2035', '0,100001,1951,2035', '惠东县', '441323', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('204', '196', '0,100001,35,196', '大厂回族自治县', '131028', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2040', '2035', '0,100001,1951,2035', '龙门县', '441324', '0752', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2041', '1951', '0,100001,1951', '梅州市', '441400', '0753', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2042', '2041', '0,100001,1951,2041', '梅江区', '441402', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2043', '2041', '0,100001,1951,2041', '梅县', '441421', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2044', '2041', '0,100001,1951,2041', '大埔县', '441422', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2045', '2041', '0,100001,1951,2041', '丰顺县', '441423', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2046', '2041', '0,100001,1951,2041', '五华县', '441424', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2047', '2041', '0,100001,1951,2041', '平远县', '441426', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2048', '2041', '0,100001,1951,2041', '蕉岭县', '441427', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2049', '2041', '0,100001,1951,2041', '兴宁市', '441481', '0753', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('205', '196', '0,100001,35,196', '霸州市', '131081', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2050', '1951', '0,100001,1951', '汕尾市', '441500', '0660', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2051', '2050', '0,100001,1951,2050', '城区', '441502', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2052', '2050', '0,100001,1951,2050', '海丰县', '441521', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2053', '2050', '0,100001,1951,2050', '陆河县', '441523', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2054', '2050', '0,100001,1951,2050', '陆丰市', '441581', '0660', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2055', '1951', '0,100001,1951', '河源市', '441600', '0762', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2056', '2055', '0,100001,1951,2055', '源城区', '441602', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2057', '2055', '0,100001,1951,2055', '紫金县', '441621', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2058', '2055', '0,100001,1951,2055', '龙川县', '441622', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2059', '2055', '0,100001,1951,2055', '连平县', '441623', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('206', '196', '0,100001,35,196', '三河市', '131082', '0316', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2060', '2055', '0,100001,1951,2055', '和平县', '441624', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2061', '2055', '0,100001,1951,2055', '东源县', '441625', '0762', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2062', '1951', '0,100001,1951', '阳江市', '441700', '0662', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2063', '2062', '0,100001,1951,2062', '江城区', '441702', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2064', '2062', '0,100001,1951,2062', '阳西县', '441721', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2065', '2062', '0,100001,1951,2062', '阳东县', '441723', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2066', '2062', '0,100001,1951,2062', '阳春市', '441781', '0662', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2067', '1951', '0,100001,1951', '清远市', '441800', '0763', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2068', '2067', '0,100001,1951,2067', '清城区', '441802', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2069', '2067', '0,100001,1951,2067', '佛冈县', '441821', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('207', '35', '0,100001,35', '衡水市', '131100', '0318', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2070', '2067', '0,100001,1951,2067', '阳山县', '441823', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2071', '2067', '0,100001,1951,2067', '连山壮族瑶族自治县', '441825', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2072', '2067', '0,100001,1951,2067', '连南瑶族自治县', '441826', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2073', '2067', '0,100001,1951,2067', '清新县', '441827', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2074', '2067', '0,100001,1951,2067', '英德市', '441881', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2075', '2067', '0,100001,1951,2067', '连州市', '441882', '0763', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2076', '1951', '0,100001,1951', '东莞市', '441900', '0769', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2077', '2076', '0,100001,1951,2076', '东莞市', '441901', '0769', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2078', '1951', '0,100001,1951', '中山市', '442000', '0760', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2079', '2078', '0,100001,1951,2078', '中山市', '442001', '0760', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('208', '207', '0,100001,35,207', '桃城区', '131102', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2080', '1951', '0,100001,1951', '潮州市', '445100', '0768', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2081', '2080', '0,100001,1951,2080', '湘桥区', '445102', '0768', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2082', '2080', '0,100001,1951,2080', '潮安县', '445121', '0768', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2083', '2080', '0,100001,1951,2080', '饶平县', '445122', '0768', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2084', '1951', '0,100001,1951', '揭阳市', '445200', '0663', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2085', '2084', '0,100001,1951,2084', '榕城区', '445202', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2086', '2084', '0,100001,1951,2084', '揭东县', '445221', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2087', '2084', '0,100001,1951,2084', '揭西县', '445222', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2088', '2084', '0,100001,1951,2084', '惠来县', '445224', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2089', '2084', '0,100001,1951,2084', '普宁市', '445281', '0663', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('209', '207', '0,100001,35,207', '枣强县', '131121', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2090', '1951', '0,100001,1951', '云浮市', '445300', '0766', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2091', '2090', '0,100001,1951,2090', '云城区', '445302', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2092', '2090', '0,100001,1951,2090', '新兴县', '445321', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2093', '2090', '0,100001,1951,2090', '郁南县', '445322', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2094', '2090', '0,100001,1951,2090', '云安县', '445323', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2095', '2090', '0,100001,1951,2090', '罗定市', '445381', '0766', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2096', '100001', '0,100001', '广西壮族自治区', '450000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2097', '2096', '0,100001,2096', '南宁市', '450100', '0771', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2098', '2097', '0,100001,2096,2097', '兴宁区', '450102', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2099', '2097', '0,100001,2096,2097', '青秀区', '450103', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('21', '18', '0,100001,18', '河西区', '120103', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('210', '207', '0,100001,35,207', '武邑县', '131122', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2100', '2097', '0,100001,2096,2097', '江南区', '450105', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2101', '2097', '0,100001,2096,2097', '西乡塘区', '450107', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2102', '2097', '0,100001,2096,2097', '良庆区', '450108', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2103', '2097', '0,100001,2096,2097', '邕宁区', '450109', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2104', '2097', '0,100001,2096,2097', '武鸣县', '450122', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2105', '2097', '0,100001,2096,2097', '隆安县', '450123', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2106', '2097', '0,100001,2096,2097', '马山县', '450124', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2107', '2097', '0,100001,2096,2097', '上林县', '450125', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2108', '2097', '0,100001,2096,2097', '宾阳县', '450126', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2109', '2097', '0,100001,2096,2097', '横县', '450127', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('211', '207', '0,100001,35,207', '武强县', '131123', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2110', '2096', '0,100001,2096', '柳州市', '450200', '0772', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2111', '2110', '0,100001,2096,2110', '城中区', '450202', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2112', '2110', '0,100001,2096,2110', '鱼峰区', '450203', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2113', '2110', '0,100001,2096,2110', '柳南区', '450204', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2114', '2110', '0,100001,2096,2110', '柳北区', '450205', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2115', '2110', '0,100001,2096,2110', '柳江县', '450221', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2116', '2110', '0,100001,2096,2110', '柳城县', '450222', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2117', '2110', '0,100001,2096,2110', '鹿寨县', '450223', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2118', '2110', '0,100001,2096,2110', '融安县', '450224', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2119', '2110', '0,100001,2096,2110', '融水苗族自治县', '450225', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('212', '207', '0,100001,35,207', '饶阳县', '131124', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2120', '2110', '0,100001,2096,2110', '三江侗族自治县', '450226', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2121', '2096', '0,100001,2096', '桂林市', '450300', '0773', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2122', '2121', '0,100001,2096,2121', '秀峰区', '450302', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2123', '2121', '0,100001,2096,2121', '叠彩区', '450303', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2124', '2121', '0,100001,2096,2121', '象山区', '450304', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2125', '2121', '0,100001,2096,2121', '七星区', '450305', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2126', '2121', '0,100001,2096,2121', '雁山区', '450311', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2127', '2121', '0,100001,2096,2121', '阳朔县', '450321', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2128', '2121', '0,100001,2096,2121', '临桂县', '450322', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2129', '2121', '0,100001,2096,2121', '灵川县', '450323', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('213', '207', '0,100001,35,207', '安平县', '131125', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2130', '2121', '0,100001,2096,2121', '全州县', '450324', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2131', '2121', '0,100001,2096,2121', '兴安县', '450325', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2132', '2121', '0,100001,2096,2121', '永福县', '450326', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2133', '2121', '0,100001,2096,2121', '灌阳县', '450327', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2134', '2121', '0,100001,2096,2121', '龙胜各族自治县', '450328', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2135', '2121', '0,100001,2096,2121', '资源县', '450329', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2136', '2121', '0,100001,2096,2121', '平乐县', '450330', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2137', '2121', '0,100001,2096,2121', '荔蒲县', '450331', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2138', '2121', '0,100001,2096,2121', '恭城瑶族自治县', '450332', '0773', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2139', '2096', '0,100001,2096', '梧州市', '450400', '0774', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('214', '207', '0,100001,35,207', '故城县', '131126', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2140', '2139', '0,100001,2096,2139', '万秀区', '450403', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2141', '2139', '0,100001,2096,2139', '蝶山区', '450404', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2142', '2139', '0,100001,2096,2139', '长洲区', '450405', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2143', '2139', '0,100001,2096,2139', '苍梧县', '450421', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2144', '2139', '0,100001,2096,2139', '藤县', '450422', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2145', '2139', '0,100001,2096,2139', '蒙山县', '450423', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2146', '2139', '0,100001,2096,2139', '岑溪市', '450481', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2147', '2096', '0,100001,2096', '北海市', '450500', '0779', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2148', '2147', '0,100001,2096,2147', '海城区', '450502', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2149', '2147', '0,100001,2096,2147', '银海区', '450503', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('215', '207', '0,100001,35,207', '景县', '131127', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2150', '2147', '0,100001,2096,2147', '铁山港区', '450512', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2151', '2147', '0,100001,2096,2147', '合浦县', '450521', '0779', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2152', '2096', '0,100001,2096', '防城港市', '450600', '0770', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2153', '2152', '0,100001,2096,2152', '港口区', '450602', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2154', '2152', '0,100001,2096,2152', '防城区', '450603', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2155', '2152', '0,100001,2096,2152', '上思县', '450621', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2156', '2152', '0,100001,2096,2152', '东兴市', '450681', '0770', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2157', '2096', '0,100001,2096', '钦州市', '450700', '0777', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2158', '2157', '0,100001,2096,2157', '钦南区', '450702', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2159', '2157', '0,100001,2096,2157', '钦北区', '450703', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('216', '207', '0,100001,35,207', '阜城县', '131128', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2160', '2157', '0,100001,2096,2157', '灵山县', '450721', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2161', '2157', '0,100001,2096,2157', '浦北县', '450722', '0777', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2162', '2096', '0,100001,2096', '贵港市', '450800', '0775', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2163', '2162', '0,100001,2096,2162', '港北区', '450802', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2164', '2162', '0,100001,2096,2162', '港南区', '450803', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2165', '2162', '0,100001,2096,2162', '覃塘区', '450804', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2166', '2162', '0,100001,2096,2162', '平南县', '450821', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2167', '2162', '0,100001,2096,2162', '桂平市', '450881', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2168', '2096', '0,100001,2096', '玉林市', '450900', '0775', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2169', '2168', '0,100001,2096,2168', '玉州区', '450902', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('217', '207', '0,100001,35,207', '冀州市', '131181', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2170', '2168', '0,100001,2096,2168', '容县', '450921', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2171', '2168', '0,100001,2096,2168', '陆川县', '450922', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2172', '2168', '0,100001,2096,2168', '博白县', '450923', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2173', '2168', '0,100001,2096,2168', '兴业县', '450924', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2174', '2168', '0,100001,2096,2168', '北流市', '450981', '0775', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2175', '2096', '0,100001,2096', '百色市', '451000', '0776', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2176', '2175', '0,100001,2096,2175', '右江区', '451002', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2177', '2175', '0,100001,2096,2175', '田阳县', '451021', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2178', '2175', '0,100001,2096,2175', '田东县', '451022', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2179', '2175', '0,100001,2096,2175', '平果县', '451023', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('218', '207', '0,100001,35,207', '深州市', '131182', '0318', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2180', '2175', '0,100001,2096,2175', '德保县', '451024', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2181', '2175', '0,100001,2096,2175', '靖西县', '451025', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2182', '2175', '0,100001,2096,2175', '那坡县', '451026', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2183', '2175', '0,100001,2096,2175', '凌云县', '451027', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2184', '2175', '0,100001,2096,2175', '乐业县', '451028', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2185', '2175', '0,100001,2096,2175', '田林县', '451029', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2186', '2175', '0,100001,2096,2175', '西林县', '451030', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2187', '2175', '0,100001,2096,2175', '隆林各族自治县', '451031', '0776', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2188', '2096', '0,100001,2096', '贺州市', '451100', '0774', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2189', '2188', '0,100001,2096,2188', '八步区', '451102', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('219', '100001', '0,100001', '山西省', '140000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2190', '2188', '0,100001,2096,2188', '平桂管理区', '451119', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2191', '2188', '0,100001,2096,2188', '昭平县', '451121', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2192', '2188', '0,100001,2096,2188', '钟山县', '451122', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2193', '2188', '0,100001,2096,2188', '富川瑶族自治县', '451123', '0774', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2194', '2096', '0,100001,2096', '河池市', '451200', '0778', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2195', '2194', '0,100001,2096,2194', '金城江区', '451202', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2196', '2194', '0,100001,2096,2194', '南丹县', '451221', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2197', '2194', '0,100001,2096,2194', '天峨县', '451222', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2198', '2194', '0,100001,2096,2194', '凤山县', '451223', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2199', '2194', '0,100001,2096,2194', '东兰县', '451224', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('22', '18', '0,100001,18', '南开区', '120104', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('220', '219', '0,100001,219', '太原市', '140100', '0351', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2200', '2194', '0,100001,2096,2194', '罗城仫佬族自治县', '451225', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2201', '2194', '0,100001,2096,2194', '环江毛南族自治县', '451226', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2202', '2194', '0,100001,2096,2194', '巴马瑶族自治县', '451227', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2203', '2194', '0,100001,2096,2194', '都安瑶族自治县', '451228', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2204', '2194', '0,100001,2096,2194', '大化瑶族自治县', '451229', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2205', '2194', '0,100001,2096,2194', '宜州市', '451281', '0778', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2206', '2096', '0,100001,2096', '来宾市', '451300', '0772', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2207', '2206', '0,100001,2096,2206', '兴宾区', '451302', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2208', '2206', '0,100001,2096,2206', '忻城县', '451321', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2209', '2206', '0,100001,2096,2206', '象州县', '451322', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('221', '220', '0,100001,219,220', '小店区', '140105', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2210', '2206', '0,100001,2096,2206', '武宣县', '451323', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2211', '2206', '0,100001,2096,2206', '金秀瑶族自治县', '451324', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2212', '2206', '0,100001,2096,2206', '合山市', '451381', '0772', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2213', '2096', '0,100001,2096', '崇左市', '451400', '0771', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2214', '2213', '0,100001,2096,2213', '江洲区', '451402', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2215', '2213', '0,100001,2096,2213', '扶绥县', '451421', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2216', '2213', '0,100001,2096,2213', '宁明县', '451422', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2217', '2213', '0,100001,2096,2213', '龙州县', '451423', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2218', '2213', '0,100001,2096,2213', '大新县', '451424', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2219', '2213', '0,100001,2096,2213', '天等县', '451425', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('222', '220', '0,100001,219,220', '迎泽区', '140106', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2220', '2213', '0,100001,2096,2213', '凭祥市', '451481', '0771', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2221', '100001', '0,100001', '海南省', '460000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2222', '2221', '0,100001,2221', '海口市', '460100', '0898', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2223', '2222', '0,100001,2221,2222', '秀英区', '460105', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2224', '2222', '0,100001,2221,2222', '龙华区', '460106', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2225', '2222', '0,100001,2221,2222', '琼山区', '460107', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2226', '2222', '0,100001,2221,2222', '美兰区', '460108', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2227', '2221', '0,100001,2221', '三亚市', '460200', '0899', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2228', '2227', '0,100001,2221,2227', '三亚市', '460201', '0899', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2229', '2221', '0,100001,2221', '三沙市', '460300', '0898', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('223', '220', '0,100001,219,220', '杏花岭区', '140107', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2230', '2229', '0,100001,2221,2229', '西沙群岛', '460321', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2231', '2229', '0,100001,2221,2229', '南沙群岛', '460322', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2232', '2229', '0,100001,2221,2229', '中沙群岛', '460323', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2233', '2221', '0,100001,2221', '省直辖', '469000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2234', '2233', '0,100001,2221,2233', '五指山市', '469001', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2235', '2233', '0,100001,2221,2233', '琼海市', '469002', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2236', '2233', '0,100001,2221,2233', '儋州市', '469003', '0890', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2237', '2233', '0,100001,2221,2233', '文昌市', '469005', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2238', '2233', '0,100001,2221,2233', '万宁市', '469006', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2239', '2233', '0,100001,2221,2233', '东方市', '469007', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('224', '220', '0,100001,219,220', '尖草坪区', '140108', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2240', '2233', '0,100001,2221,2233', '定安县', '469021', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2241', '2233', '0,100001,2221,2233', '屯昌县', '469022', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2242', '2233', '0,100001,2221,2233', '澄迈县', '469023', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2243', '2233', '0,100001,2221,2233', '临高县', '469024', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2244', '2233', '0,100001,2221,2233', '白沙黎族自治县', '469025', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2245', '2233', '0,100001,2221,2233', '昌江黎族自治县', '469026', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2246', '2233', '0,100001,2221,2233', '乐东黎族自治县', '469027', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2247', '2233', '0,100001,2221,2233', '陵水黎族自治县', '469028', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2248', '2233', '0,100001,2221,2233', '保亭黎族苗族自治县', '469029', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2249', '2233', '0,100001,2221,2233', '琼中黎族苗族自治县', '469030', '0898', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('225', '220', '0,100001,219,220', '万柏林区', '140109', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2250', '100001', '0100001,', '重庆市', '500000', '0811', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:27:48', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2251', '2250', '0,100001,2250', '万州区', '500101', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2252', '2250', '0,100001,2250', '涪陵区', '500102', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2253', '2250', '0,100001,2250', '渝中区', '500103', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2254', '2250', '0,100001,2250', '大渡口区', '500104', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2255', '2250', '0,100001,2250', '江北区', '500105', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2256', '2250', '0,100001,2250', '沙坪坝区', '500106', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2257', '2250', '0,100001,2250', '九龙坡区', '500107', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2258', '2250', '0,100001,2250', '南岸区', '500108', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2259', '2250', '0,100001,2250', '北碚区', '500109', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('226', '220', '0,100001,219,220', '晋源区', '140110', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2260', '2250', '0,100001,2250', '綦江区', '500110', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2261', '2250', '0,100001,2250', '大足区', '500111', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2262', '2250', '0,100001,2250', '渝北区', '500112', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2263', '2250', '0,100001,2250', '巴南区', '500113', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2264', '2250', '0,100001,2250', '黔江区', '500114', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2265', '2250', '0,100001,2250', '长寿区', '500115', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2266', '2250', '0,100001,2250', '江津区', '500116', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2267', '2250', '0,100001,2250', '合川区', '500117', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2268', '2250', '0,100001,2250', '永川区', '500118', '0814', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2269', '2250', '0,100001,2250', '南川区', '500119', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('227', '220', '0,100001,219,220', '清徐县', '140121', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2270', '2250', '0,100001,2250', '潼南县', '500223', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2271', '2250', '0,100001,2250', '铜梁县', '500224', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2272', '2250', '0,100001,2250', '荣昌县', '500226', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2273', '2250', '0,100001,2250', '璧山县', '500227', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2274', '2250', '0,100001,2250', '梁平县', '500228', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2275', '2250', '0,100001,2250', '城口县', '500229', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2276', '2250', '0,100001,2250', '丰都县', '500230', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2277', '2250', '0,100001,2250', '垫江县', '500231', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2278', '2250', '0,100001,2250', '武隆县', '500232', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2279', '2250', '0,100001,2250', '忠县', '500233', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('228', '220', '0,100001,219,220', '阳曲县', '140122', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2280', '2250', '0,100001,2250', '开县', '500234', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2281', '2250', '0,100001,2250', '云阳县', '500235', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2282', '2250', '0,100001,2250', '奉节县', '500236', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2283', '2250', '0,100001,2250', '巫山县', '500237', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2284', '2250', '0,100001,2250', '巫溪县', '500238', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2285', '2250', '0,100001,2250', '石柱土家族自治县', '500240', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2286', '2250', '0,100001,2250', '秀山土家族苗族自治县', '500241', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2287', '2250', '0,100001,2250', '酉阳土家族苗族自治县', '500242', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2288', '2250', '0,100001,2250', '彭水苗族土家族自治县', '500243', '0811', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2289', '100001', '0,100001', '四川省', '510000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('229', '220', '0,100001,219,220', '娄烦县', '140123', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2290', '2289', '0,100001,2289', '成都市', '510100', '028', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2291', '2290', '0,100001,2289,2290', '锦江区', '510104', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2292', '2290', '0,100001,2289,2290', '青羊区', '510105', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2293', '2290', '0,100001,2289,2290', '金牛区', '510106', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2294', '2290', '0,100001,2289,2290', '武侯区', '510107', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2295', '2290', '0,100001,2289,2290', '成华区', '510108', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2296', '2290', '0,100001,2289,2290', '龙泉驿区', '510112', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2297', '2290', '0,100001,2289,2290', '青白江区', '510113', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2298', '2290', '0,100001,2289,2290', '新都区', '510114', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2299', '2290', '0,100001,2289,2290', '温江区', '510115', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('23', '18', '0,100001,18', '河北区', '120105', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('230', '220', '0,100001,219,220', '古交市', '140181', '0351', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2300', '2290', '0,100001,2289,2290', '金堂县', '510121', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2301', '2290', '0,100001,2289,2290', '双流县', '510122', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2302', '2290', '0,100001,2289,2290', '郫县', '510124', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2303', '2290', '0,100001,2289,2290', '大邑县', '510129', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2304', '2290', '0,100001,2289,2290', '蒲江县', '510131', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2305', '2290', '0,100001,2289,2290', '新津县', '510132', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2306', '2290', '0,100001,2289,2290', '都江堰市', '510181', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2307', '2290', '0,100001,2289,2290', '彭州市', '510182', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2308', '2290', '0,100001,2289,2290', '邛崃市', '510183', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2309', '2290', '0,100001,2289,2290', '崇州市', '510184', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('231', '219', '0,100001,219', '大同市', '140200', '0352', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2310', '2289', '0,100001,2289', '自贡市', '510300', '0813', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2311', '2310', '0,100001,2289,2310', '自流井区', '510302', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2312', '2310', '0,100001,2289,2310', '贡井区', '510303', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2313', '2310', '0,100001,2289,2310', '大安区', '510304', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2314', '2310', '0,100001,2289,2310', '沿滩区', '510311', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2315', '2310', '0,100001,2289,2310', '荣县', '510321', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2316', '2310', '0,100001,2289,2310', '富顺县', '510322', '0813', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2317', '2289', '0,100001,2289', '攀枝花市', '510400', '0812', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2318', '2317', '0,100001,2289,2317', '东区', '510402', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2319', '2317', '0,100001,2289,2317', '西区', '510403', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('232', '231', '0,100001,219,231', '城区', '140202', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2320', '2317', '0,100001,2289,2317', '仁和区', '510411', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2321', '2317', '0,100001,2289,2317', '米易县', '510421', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2322', '2317', '0,100001,2289,2317', '盐边县', '510422', '0812', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2323', '2289', '0,100001,2289', '泸州市', '510500', '0840', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2324', '2323', '0,100001,2289,2323', '江阳区', '510502', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2325', '2323', '0,100001,2289,2323', '纳溪区', '510503', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2326', '2323', '0,100001,2289,2323', '龙马潭区', '510504', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2327', '2323', '0,100001,2289,2323', '泸县', '510521', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2328', '2323', '0,100001,2289,2323', '合江县', '510522', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2329', '2323', '0,100001,2289,2323', '叙永县', '510524', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('233', '231', '0,100001,219,231', '矿区', '140203', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2330', '2323', '0,100001,2289,2323', '古蔺县', '510525', '0840', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2331', '2289', '0,100001,2289', '德阳市', '510600', '0838', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2332', '2331', '0,100001,2289,2331', '旌阳区', '510603', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2333', '2331', '0,100001,2289,2331', '中江县', '510623', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2334', '2331', '0,100001,2289,2331', '罗江县', '510626', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2335', '2331', '0,100001,2289,2331', '广汉市', '510681', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2336', '2331', '0,100001,2289,2331', '什邡市', '510682', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2337', '2331', '0,100001,2289,2331', '绵竹市', '510683', '0838', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2338', '2289', '0,100001,2289', '绵阳市', '510700', '0816', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2339', '2338', '0,100001,2289,2338', '涪城区', '510703', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('234', '231', '0,100001,219,231', '南郊区', '140211', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2340', '2338', '0,100001,2289,2338', '游仙区', '510704', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2341', '2338', '0,100001,2289,2338', '三台县', '510722', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2342', '2338', '0,100001,2289,2338', '盐亭县', '510723', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2343', '2338', '0,100001,2289,2338', '安县', '510724', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2344', '2338', '0,100001,2289,2338', '梓潼县', '510725', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2345', '2338', '0,100001,2289,2338', '北川羌族自治县', '510726', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2346', '2338', '0,100001,2289,2338', '平武县', '510727', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2347', '2338', '0,100001,2289,2338', '江油市', '510781', '0816', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2348', '2289', '0,100001,2289', '广元市', '510800', '0839', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2349', '2348', '0,100001,2289,2348', '利州区', '510802', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('235', '231', '0,100001,219,231', '新荣区', '140212', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2350', '2348', '0,100001,2289,2348', '元坝区', '510811', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2351', '2348', '0,100001,2289,2348', '朝天区', '510812', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2352', '2348', '0,100001,2289,2348', '旺苍县', '510821', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2353', '2348', '0,100001,2289,2348', '青川县', '510822', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2354', '2348', '0,100001,2289,2348', '剑阁县', '510823', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2355', '2348', '0,100001,2289,2348', '苍溪县', '510824', '0839', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2356', '2289', '0,100001,2289', '遂宁市', '510900', '0825', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2357', '2356', '0,100001,2289,2356', '船山区', '510903', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2358', '2356', '0,100001,2289,2356', '安居区', '510904', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2359', '2356', '0,100001,2289,2356', '蓬溪县', '510921', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('236', '231', '0,100001,219,231', '阳高县', '140221', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2360', '2356', '0,100001,2289,2356', '射洪县', '510922', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2361', '2356', '0,100001,2289,2356', '大英县', '510923', '0825', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2362', '2289', '0,100001,2289', '内江市', '511000', '0832', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2363', '2362', '0,100001,2289,2362', '市中区', '511002', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2364', '2362', '0,100001,2289,2362', '东兴区', '511011', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2365', '2362', '0,100001,2289,2362', '威远县', '511024', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2366', '2362', '0,100001,2289,2362', '资中县', '511025', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2367', '2362', '0,100001,2289,2362', '隆昌县', '511028', '0832', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2368', '2289', '0,100001,2289', '乐山市', '511100', '0833', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2369', '2368', '0,100001,2289,2368', '市中区', '511102', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('237', '231', '0,100001,219,231', '天镇县', '140222', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2370', '2368', '0,100001,2289,2368', '沙湾区', '511111', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2371', '2368', '0,100001,2289,2368', '五通桥区', '511112', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2372', '2368', '0,100001,2289,2368', '金口河区', '511113', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2373', '2368', '0,100001,2289,2368', '犍为县', '511123', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2374', '2368', '0,100001,2289,2368', '井研县', '511124', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2375', '2368', '0,100001,2289,2368', '夹江县', '511126', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2376', '2368', '0,100001,2289,2368', '沐川县', '511129', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2377', '2368', '0,100001,2289,2368', '峨边彝族自治县', '511132', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2378', '2368', '0,100001,2289,2368', '马边彝族自治县', '511133', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2379', '2368', '0,100001,2289,2368', '峨眉山市', '511181', '0833', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('238', '231', '0,100001,219,231', '广灵县', '140223', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2380', '2289', '0,100001,2289', '南充市', '511300', '0817', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2381', '2380', '0,100001,2289,2380', '顺庆区', '511302', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2382', '2380', '0,100001,2289,2380', '高坪区', '511303', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2383', '2380', '0,100001,2289,2380', '嘉陵区', '511304', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2384', '2380', '0,100001,2289,2380', '南部县', '511321', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2385', '2380', '0,100001,2289,2380', '营山县', '511322', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2386', '2380', '0,100001,2289,2380', '蓬安县', '511323', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2387', '2380', '0,100001,2289,2380', '仪陇县', '511324', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2388', '2380', '0,100001,2289,2380', '西充县', '511325', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2389', '2380', '0,100001,2289,2380', '阆中市', '511381', '0817', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('239', '231', '0,100001,219,231', '灵丘县', '140224', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2390', '2289', '0,100001,2289', '眉山市', '511400', '028', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2391', '2390', '0,100001,2289,2390', '东坡区', '511402', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2392', '2390', '0,100001,2289,2390', '仁寿县', '511421', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2393', '2390', '0,100001,2289,2390', '彭山县', '511422', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2394', '2390', '0,100001,2289,2390', '洪雅县', '511423', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2395', '2390', '0,100001,2289,2390', '丹棱县', '511424', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2396', '2390', '0,100001,2289,2390', '青神县', '511425', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2397', '2289', '0,100001,2289', '宜宾市', '511500', '0831', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2398', '2397', '0,100001,2289,2397', '翠屏区', '511502', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2399', '2397', '0,100001,2289,2397', '宜宾县', '511521', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('24', '18', '0,100001,18', '红桥区', '120106', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('240', '231', '0,100001,219,231', '浑源县', '140225', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2400', '2397', '0,100001,2289,2397', '南溪区', '511522', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2401', '2397', '0,100001,2289,2397', '江安县', '511523', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2402', '2397', '0,100001,2289,2397', '长宁县', '511524', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2403', '2397', '0,100001,2289,2397', '高县', '511525', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2404', '2397', '0,100001,2289,2397', '珙县', '511526', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2405', '2397', '0,100001,2289,2397', '筠连县', '511527', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2406', '2397', '0,100001,2289,2397', '兴文县', '511528', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2407', '2397', '0,100001,2289,2397', '屏山县', '511529', '0831', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2408', '2289', '0,100001,2289', '广安市', '511600', '0826', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2409', '2408', '0,100001,2289,2408', '广安区', '511602', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('241', '231', '0,100001,219,231', '左云县', '140226', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2410', '2408', '0,100001,2289,2408', '岳池县', '511621', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2411', '2408', '0,100001,2289,2408', '武胜县', '511622', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2412', '2408', '0,100001,2289,2408', '邻水县', '511623', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2413', '2408', '0,100001,2289,2408', '华蓥市', '511681', '0826', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2414', '2289', '0,100001,2289', '达州市', '511700', '0818', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2415', '2414', '0,100001,2289,2414', '通川区', '511702', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2416', '2414', '0,100001,2289,2414', '达县', '511721', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2417', '2414', '0,100001,2289,2414', '宣汉县', '511722', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2418', '2414', '0,100001,2289,2414', '开江县', '511723', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2419', '2414', '0,100001,2289,2414', '大竹县', '511724', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('242', '231', '0,100001,219,231', '大同县', '140227', '0352', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2420', '2414', '0,100001,2289,2414', '渠县', '511725', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2421', '2414', '0,100001,2289,2414', '万源市', '511781', '0818', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2422', '2289', '0,100001,2289', '雅安市', '511800', '0835', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2423', '2422', '0,100001,2289,2422', '雨城区', '511802', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2424', '2422', '0,100001,2289,2422', '名山县', '511821', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2425', '2422', '0,100001,2289,2422', '荥经县', '511822', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2426', '2422', '0,100001,2289,2422', '汉源县', '511823', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2427', '2422', '0,100001,2289,2422', '石棉县', '511824', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2428', '2422', '0,100001,2289,2422', '天全县', '511825', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2429', '2422', '0,100001,2289,2422', '芦山县', '511826', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('243', '219', '0,100001,219', '阳泉市', '140300', '0353', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2430', '2422', '0,100001,2289,2422', '宝兴县', '511827', '0835', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2431', '2289', '0,100001,2289', '巴中市', '511900', '0827', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2432', '2431', '0,100001,2289,2431', '巴州区', '511902', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2433', '2431', '0,100001,2289,2431', '通江县', '511921', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2434', '2431', '0,100001,2289,2431', '南江县', '511922', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2435', '2431', '0,100001,2289,2431', '平昌县', '511923', '0827', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2436', '2289', '0,100001,2289', '资阳市', '512000', '028', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2437', '2436', '0,100001,2289,2436', '雁江区', '512002', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2438', '2436', '0,100001,2289,2436', '安岳县', '512021', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2439', '2436', '0,100001,2289,2436', '乐至县', '512022', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('244', '243', '0,100001,219,243', '城区', '140302', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2440', '2436', '0,100001,2289,2436', '简阳市', '512081', '028', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2441', '2289', '0,100001,2289', '阿坝藏族羌族自治州', '513200', '0837', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2442', '2441', '0,100001,2289,2441', '汶川县', '513221', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2443', '2441', '0,100001,2289,2441', '理县', '513222', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2444', '2441', '0,100001,2289,2441', '茂县', '513223', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2445', '2441', '0,100001,2289,2441', '松潘县', '513224', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2446', '2441', '0,100001,2289,2441', '九寨沟县', '513225', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2447', '2441', '0,100001,2289,2441', '金川县', '513226', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2448', '2441', '0,100001,2289,2441', '小金县', '513227', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2449', '2441', '0,100001,2289,2441', '黑水县', '513228', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('245', '243', '0,100001,219,243', '矿区', '140303', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2450', '2441', '0,100001,2289,2441', '马尔康县', '513229', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2451', '2441', '0,100001,2289,2441', '壤塘县', '513230', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2452', '2441', '0,100001,2289,2441', '阿坝县', '513231', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2453', '2441', '0,100001,2289,2441', '若尔盖县', '513232', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2454', '2441', '0,100001,2289,2441', '红原县', '513233', '0837', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2455', '2289', '0,100001,2289', '甘孜藏族自治州', '513300', '0836', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2456', '2455', '0,100001,2289,2455', '康定县', '513321', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2457', '2455', '0,100001,2289,2455', '泸定县', '513322', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2458', '2455', '0,100001,2289,2455', '丹巴县', '513323', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2459', '2455', '0,100001,2289,2455', '九龙县', '513324', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('246', '243', '0,100001,219,243', '郊区', '140311', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2460', '2455', '0,100001,2289,2455', '雅江县', '513325', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2461', '2455', '0,100001,2289,2455', '道孚县', '513326', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2462', '2455', '0,100001,2289,2455', '炉霍县', '513327', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2463', '2455', '0,100001,2289,2455', '甘孜县', '513328', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2464', '2455', '0,100001,2289,2455', '新龙县', '513329', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2465', '2455', '0,100001,2289,2455', '德格县', '513330', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2466', '2455', '0,100001,2289,2455', '白玉县', '513331', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2467', '2455', '0,100001,2289,2455', '石渠县', '513332', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2468', '2455', '0,100001,2289,2455', '色达县', '513333', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2469', '2455', '0,100001,2289,2455', '理塘县', '513334', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('247', '243', '0,100001,219,243', '平定县', '140321', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2470', '2455', '0,100001,2289,2455', '巴塘县', '513335', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2471', '2455', '0,100001,2289,2455', '乡城县', '513336', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2472', '2455', '0,100001,2289,2455', '稻城县', '513337', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2473', '2455', '0,100001,2289,2455', '得荣县', '513338', '0836', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2474', '2289', '0,100001,2289', '凉山彝族自治州', '513400', '0834', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2475', '2474', '0,100001,2289,2474', '西昌市', '513401', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2476', '2474', '0,100001,2289,2474', '木里藏族自治县', '513422', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2477', '2474', '0,100001,2289,2474', '盐源县', '513423', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2478', '2474', '0,100001,2289,2474', '德昌县', '513424', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2479', '2474', '0,100001,2289,2474', '会理县', '513425', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('248', '243', '0,100001,219,243', '盂县', '140322', '0353', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2480', '2474', '0,100001,2289,2474', '会东县', '513426', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2481', '2474', '0,100001,2289,2474', '宁南县', '513427', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2482', '2474', '0,100001,2289,2474', '普格县', '513428', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2483', '2474', '0,100001,2289,2474', '布拖县', '513429', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2484', '2474', '0,100001,2289,2474', '金阳县', '513430', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2485', '2474', '0,100001,2289,2474', '昭觉县', '513431', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2486', '2474', '0,100001,2289,2474', '喜德县', '513432', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2487', '2474', '0,100001,2289,2474', '冕宁县', '513433', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2488', '2474', '0,100001,2289,2474', '越西县', '513434', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2489', '2474', '0,100001,2289,2474', '甘洛县', '513435', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('249', '219', '0,100001,219', '长治市', '140400', '0355', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2490', '2474', '0,100001,2289,2474', '美姑县', '513436', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2491', '2474', '0,100001,2289,2474', '雷波县', '513437', '0834', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2492', '100001', '0,100001', '贵州省', '520000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2493', '2492', '0,100001,2492', '贵阳市', '520100', '0851', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2494', '2493', '0,100001,2492,2493', '南明区', '520102', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2495', '2493', '0,100001,2492,2493', '云岩区', '520103', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2496', '2493', '0,100001,2492,2493', '花溪区', '520111', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2497', '2493', '0,100001,2492,2493', '乌当区', '520112', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2498', '2493', '0,100001,2492,2493', '白云区', '520113', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2499', '2493', '0,100001,2492,2493', '小河区', '520114', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('25', '18', '0,100001,18', '东丽区', '120110', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('250', '249', '0,100001,219,249', '城区', '140402', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2500', '2493', '0,100001,2492,2493', '开阳县', '520121', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2501', '2493', '0,100001,2492,2493', '息烽县', '520122', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2502', '2493', '0,100001,2492,2493', '修文县', '520123', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2503', '2493', '0,100001,2492,2493', '清镇市', '520181', '0851', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2504', '2492', '0,100001,2492', '六盘水市', '520200', '0858', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2505', '2504', '0,100001,2492,2504', '钟山区', '520201', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2506', '2504', '0,100001,2492,2504', '六枝特区', '520203', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2507', '2504', '0,100001,2492,2504', '水城县', '520221', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2508', '2504', '0,100001,2492,2504', '盘县', '520222', '0858', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2509', '2492', '0,100001,2492', '遵义市', '520300', '0852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('251', '249', '0,100001,219,249', '郊区', '140411', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2510', '2509', '0,100001,2492,2509', '红花岗区', '520302', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2511', '2509', '0,100001,2492,2509', '汇川区', '520303', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2512', '2509', '0,100001,2492,2509', '遵义县', '520321', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2513', '2509', '0,100001,2492,2509', '桐梓县', '520322', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2514', '2509', '0,100001,2492,2509', '绥阳县', '520323', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2515', '2509', '0,100001,2492,2509', '正安县', '520324', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2516', '2509', '0,100001,2492,2509', '道真仡佬族苗族自治县', '520325', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2517', '2509', '0,100001,2492,2509', '务川仡佬族苗族自治县', '520326', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2518', '2509', '0,100001,2492,2509', '凤冈县', '520327', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2519', '2509', '0,100001,2492,2509', '湄潭县', '520328', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('252', '249', '0,100001,219,249', '长治县', '140421', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2520', '2509', '0,100001,2492,2509', '余庆县', '520329', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2521', '2509', '0,100001,2492,2509', '习水县', '520330', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2522', '2509', '0,100001,2492,2509', '赤水市', '520381', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2523', '2509', '0,100001,2492,2509', '仁怀市', '520382', '0852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2524', '2492', '0,100001,2492', '安顺市', '520400', '0853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2525', '2524', '0,100001,2492,2524', '西秀区', '520402', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2526', '2524', '0,100001,2492,2524', '平坝县', '520421', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2527', '2524', '0,100001,2492,2524', '普定县', '520422', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2528', '2524', '0,100001,2492,2524', '镇宁布依族苗族自治县', '520423', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2529', '2524', '0,100001,2492,2524', '关岭布依族苗族自治县', '520424', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('253', '249', '0,100001,219,249', '襄垣县', '140423', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2530', '2524', '0,100001,2492,2524', '紫云苗族布依族自治县', '520425', '0853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2531', '2492', '0,100001,2492', '毕节市', '520500', '0857', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2532', '2531', '0,100001,2492,2531', '七星关区', '520501', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2533', '2531', '0,100001,2492,2531', '大方县', '520522', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2534', '2531', '0,100001,2492,2531', '黔西县', '520523', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2535', '2531', '0,100001,2492,2531', '金沙县', '520524', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2536', '2531', '0,100001,2492,2531', '织金县', '520525', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2537', '2531', '0,100001,2492,2531', '纳雍县', '520526', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2538', '2531', '0,100001,2492,2531', '威宁彝族回族苗族自治县', '520527', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2539', '2531', '0,100001,2492,2531', '赫章县', '520528', '0857', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('254', '249', '0,100001,219,249', '屯留县', '140424', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2540', '2492', '0,100001,2492', '铜仁市', '520600', '0856', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2541', '2540', '0,100001,2492,2540', '碧江区', '520601', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2542', '2540', '0,100001,2492,2540', '万山区', '520602', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2543', '2540', '0,100001,2492,2540', '江口县', '520622', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2544', '2540', '0,100001,2492,2540', '玉屏侗族自治县', '520623', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2545', '2540', '0,100001,2492,2540', '石阡县', '520624', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2546', '2540', '0,100001,2492,2540', '思南县', '520625', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2547', '2540', '0,100001,2492,2540', '印江土家族苗族自治县', '520626', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2548', '2540', '0,100001,2492,2540', '德江县', '520627', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2549', '2540', '0,100001,2492,2540', '沿河土家族自治县', '520628', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('255', '249', '0,100001,219,249', '平顺县', '140425', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2550', '2540', '0,100001,2492,2540', '松桃苗族自治县', '520629', '0856', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2551', '2492', '0,100001,2492', '黔西南布依族苗族自治州', '522300', '0859', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2552', '2551', '0,100001,2492,2551', '兴义市', '522301', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2553', '2551', '0,100001,2492,2551', '兴仁县', '522322', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2554', '2551', '0,100001,2492,2551', '普安县', '522323', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2555', '2551', '0,100001,2492,2551', '晴隆县', '522324', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2556', '2551', '0,100001,2492,2551', '贞丰县', '522325', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2557', '2551', '0,100001,2492,2551', '望谟县', '522326', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2558', '2551', '0,100001,2492,2551', '册亨县', '522327', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2559', '2551', '0,100001,2492,2551', '安龙县', '522328', '0859', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('256', '249', '0,100001,219,249', '黎城县', '140426', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2560', '2492', '0,100001,2492', '黔东南苗族侗族自治州', '522600', '0855', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2561', '2560', '0,100001,2492,2560', '凯里市', '522601', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2562', '2560', '0,100001,2492,2560', '黄平县', '522622', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2563', '2560', '0,100001,2492,2560', '施秉县', '522623', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2564', '2560', '0,100001,2492,2560', '三穗县', '522624', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2565', '2560', '0,100001,2492,2560', '镇远县', '522625', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2566', '2560', '0,100001,2492,2560', '岑巩县', '522626', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2567', '2560', '0,100001,2492,2560', '天柱县', '522627', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2568', '2560', '0,100001,2492,2560', '锦屏县', '522628', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2569', '2560', '0,100001,2492,2560', '剑河县', '522629', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('257', '249', '0,100001,219,249', '壶关县', '140427', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2570', '2560', '0,100001,2492,2560', '台江县', '522630', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2571', '2560', '0,100001,2492,2560', '黎平县', '522631', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2572', '2560', '0,100001,2492,2560', '榕江县', '522632', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2573', '2560', '0,100001,2492,2560', '从江县', '522633', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2574', '2560', '0,100001,2492,2560', '雷山县', '522634', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2575', '2560', '0,100001,2492,2560', '麻江县', '522635', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2576', '2560', '0,100001,2492,2560', '丹寨县', '522636', '0855', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2577', '2492', '0,100001,2492', '黔南布依族苗族自治州', '522700', '0854', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2578', '2577', '0,100001,2492,2577', '都匀市', '522701', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2579', '2577', '0,100001,2492,2577', '福泉市', '522702', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('258', '249', '0,100001,219,249', '长子县', '140428', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2580', '2577', '0,100001,2492,2577', '荔波县', '522722', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2581', '2577', '0,100001,2492,2577', '贵定县', '522723', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2582', '2577', '0,100001,2492,2577', '瓮安县', '522725', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2583', '2577', '0,100001,2492,2577', '独山县', '522726', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2584', '2577', '0,100001,2492,2577', '平塘县', '522727', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2585', '2577', '0,100001,2492,2577', '罗甸县', '522728', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2586', '2577', '0,100001,2492,2577', '长顺县', '522729', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2587', '2577', '0,100001,2492,2577', '龙里县', '522730', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2588', '2577', '0,100001,2492,2577', '惠水县', '522731', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2589', '2577', '0,100001,2492,2577', '三都水族自治县', '522732', '0854', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('259', '249', '0,100001,219,249', '武乡县', '140429', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2590', '100001', '0,100001', '云南省', '530000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2591', '2590', '0,100001,2590', '昆明市', '530100', '0871', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2592', '2591', '0,100001,2590,2591', '五华区', '530102', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2593', '2591', '0,100001,2590,2591', '盘龙区', '530103', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2594', '2591', '0,100001,2590,2591', '官渡区', '530111', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2595', '2591', '0,100001,2590,2591', '西山区', '530112', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2596', '2591', '0,100001,2590,2591', '东川区', '530113', '0881', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2597', '2591', '0,100001,2590,2591', '呈贡区', '530121', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2598', '2591', '0,100001,2590,2591', '晋宁县', '530122', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2599', '2591', '0,100001,2590,2591', '富民县', '530124', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('26', '18', '0,100001,18', '西青区', '120111', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('260', '249', '0,100001,219,249', '沁县', '140430', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2600', '2591', '0,100001,2590,2591', '宜良县', '530125', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2601', '2591', '0,100001,2590,2591', '石林彝族自治县', '530126', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2602', '2591', '0,100001,2590,2591', '嵩明县', '530127', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2603', '2591', '0,100001,2590,2591', '禄劝彝族苗族自治县', '530128', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2604', '2591', '0,100001,2590,2591', '寻甸回族彝族自治县', '530129', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2605', '2591', '0,100001,2590,2591', '安宁市', '530181', '0871', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2606', '2590', '0,100001,2590', '曲靖市', '530300', '0874', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2607', '2606', '0,100001,2590,2606', '麒麟区', '530302', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2608', '2606', '0,100001,2590,2606', '马龙县', '530321', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2609', '2606', '0,100001,2590,2606', '陆良县', '530322', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('261', '249', '0,100001,219,249', '沁源县', '140431', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2610', '2606', '0,100001,2590,2606', '师宗县', '530323', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2611', '2606', '0,100001,2590,2606', '罗平县', '530324', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2612', '2606', '0,100001,2590,2606', '富源县', '530325', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2613', '2606', '0,100001,2590,2606', '会泽县', '530326', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2614', '2606', '0,100001,2590,2606', '沾益县', '530328', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2615', '2606', '0,100001,2590,2606', '宣威市', '530381', '0874', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2616', '2590', '0,100001,2590', '玉溪市', '530400', '0877', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2617', '2616', '0,100001,2590,2616', '红塔区', '530402', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2618', '2616', '0,100001,2590,2616', '江川县', '530421', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2619', '2616', '0,100001,2590,2616', '澄江县', '530422', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('262', '249', '0,100001,219,249', '潞城市', '140481', '0355', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2620', '2616', '0,100001,2590,2616', '通海县', '530423', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2621', '2616', '0,100001,2590,2616', '华宁县', '530424', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2622', '2616', '0,100001,2590,2616', '易门县', '530425', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2623', '2616', '0,100001,2590,2616', '峨山彝族自治县', '530426', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2624', '2616', '0,100001,2590,2616', '新平彝族傣族自治县', '530427', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2625', '2616', '0,100001,2590,2616', '元江哈尼族彝族傣族自治县', '530428', '0877', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2626', '2590', '0,100001,2590', '保山市', '530500', '0875', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2627', '2626', '0,100001,2590,2626', '隆阳区', '530502', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2628', '2626', '0,100001,2590,2626', '施甸县', '530521', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2629', '2626', '0,100001,2590,2626', '腾冲县', '530522', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('263', '219', '0,100001,219', '晋城市', '140500', '0356', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2630', '2626', '0,100001,2590,2626', '龙陵县', '530523', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2631', '2626', '0,100001,2590,2626', '昌宁县', '530524', '0875', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2632', '2590', '0,100001,2590', '昭通市', '530600', '0870', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2633', '2632', '0,100001,2590,2632', '昭阳区', '530602', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2634', '2632', '0,100001,2590,2632', '鲁甸县', '530621', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2635', '2632', '0,100001,2590,2632', '巧家县', '530622', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2636', '2632', '0,100001,2590,2632', '盐津县', '530623', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2637', '2632', '0,100001,2590,2632', '大关县', '530624', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2638', '2632', '0,100001,2590,2632', '永善县', '530625', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2639', '2632', '0,100001,2590,2632', '绥江县', '530626', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('264', '263', '0,100001,219,263', '城区', '140502', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2640', '2632', '0,100001,2590,2632', '镇雄县', '530627', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2641', '2632', '0,100001,2590,2632', '彝良县', '530628', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2642', '2632', '0,100001,2590,2632', '威信县', '530629', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2643', '2632', '0,100001,2590,2632', '水富县', '530630', '0870', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2644', '2590', '0,100001,2590', '丽江市', '530700', '0888', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2645', '2644', '0,100001,2590,2644', '古城区', '530702', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2646', '2644', '0,100001,2590,2644', '玉龙纳西族自治县', '530721', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2647', '2644', '0,100001,2590,2644', '永胜县', '530722', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2648', '2644', '0,100001,2590,2644', '华坪县', '530723', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2649', '2644', '0,100001,2590,2644', '宁蒗彝族自治县', '530724', '0888', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('265', '263', '0,100001,219,263', '沁水县', '140521', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2650', '2590', '0,100001,2590', '普洱市', '530800', '0879', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2651', '2650', '0,100001,2590,2650', '思茅区', '530802', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2652', '2650', '0,100001,2590,2650', '宁洱哈尼族彝族自治县', '530821', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2653', '2650', '0,100001,2590,2650', '墨江哈尼族自治县', '530822', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2654', '2650', '0,100001,2590,2650', '景东彝族自治县', '530823', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2655', '2650', '0,100001,2590,2650', '景谷傣族彝族自治县', '530824', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2656', '2650', '0,100001,2590,2650', '镇沅彝族哈尼族拉祜族自治县', '530825', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2657', '2650', '0,100001,2590,2650', '江城哈尼族彝族自治县', '530826', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2658', '2650', '0,100001,2590,2650', '孟连傣族拉祜族佤族自治县', '530827', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2659', '2650', '0,100001,2590,2650', '澜沧拉祜族自治县', '530828', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('266', '263', '0,100001,219,263', '阳城县', '140522', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2660', '2650', '0,100001,2590,2650', '西盟佤族自治县', '530829', '0879', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2661', '2590', '0,100001,2590', '临沧市', '530900', '0883', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2662', '2661', '0,100001,2590,2661', '临翔区', '530902', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2663', '2661', '0,100001,2590,2661', '凤庆县', '530921', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2664', '2661', '0,100001,2590,2661', '云县', '530922', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2665', '2661', '0,100001,2590,2661', '永德县', '530923', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2666', '2661', '0,100001,2590,2661', '镇康县', '530924', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2667', '2661', '0,100001,2590,2661', '双江拉祜族佤族布朗族傣族自治县', '530925', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2668', '2661', '0,100001,2590,2661', '耿马傣族佤族自治县', '530926', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2669', '2661', '0,100001,2590,2661', '沧源佤族自治县', '530927', '0883', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('267', '263', '0,100001,219,263', '陵川县', '140524', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2670', '2590', '0,100001,2590', '楚雄彝族自治州', '532300', '0878', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2671', '2670', '0,100001,2590,2670', '楚雄市', '532301', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2672', '2670', '0,100001,2590,2670', '双柏县', '532322', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2673', '2670', '0,100001,2590,2670', '牟定县', '532323', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2674', '2670', '0,100001,2590,2670', '南华县', '532324', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2675', '2670', '0,100001,2590,2670', '姚安县', '532325', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2676', '2670', '0,100001,2590,2670', '大姚县', '532326', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2677', '2670', '0,100001,2590,2670', '永仁县', '532327', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2678', '2670', '0,100001,2590,2670', '元谋县', '532328', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2679', '2670', '0,100001,2590,2670', '武定县', '532329', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('268', '263', '0,100001,219,263', '泽州县', '140525', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2680', '2670', '0,100001,2590,2670', '禄丰县', '532331', '0878', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2681', '2590', '0,100001,2590', '红河哈尼族彝族自治州', '532500', '0873', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2682', '2681', '0,100001,2590,2681', '个旧市', '532501', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2683', '2681', '0,100001,2590,2681', '开远市', '532502', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2684', '2681', '0,100001,2590,2681', '蒙自市', '532503', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2685', '2681', '0,100001,2590,2681', '屏边苗族自治县', '532523', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2686', '2681', '0,100001,2590,2681', '建水县', '532524', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2687', '2681', '0,100001,2590,2681', '石屏县', '532525', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2688', '2681', '0,100001,2590,2681', '弥勒县', '532526', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2689', '2681', '0,100001,2590,2681', '泸西县', '532527', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('269', '263', '0,100001,219,263', '高平市', '140581', '0356', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2690', '2681', '0,100001,2590,2681', '元阳县', '532528', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2691', '2681', '0,100001,2590,2681', '红河县', '532529', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2692', '2681', '0,100001,2590,2681', '金平苗族瑶族傣族自治县', '532530', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2693', '2681', '0,100001,2590,2681', '绿春县', '532531', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2694', '2681', '0,100001,2590,2681', '河口瑶族自治县', '532532', '0873', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2695', '2590', '0,100001,2590', '文山壮族苗族自治州', '532600', '0876', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2696', '2695', '0,100001,2590,2695', '文山市', '532621', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2697', '2695', '0,100001,2590,2695', '砚山县', '532622', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2698', '2695', '0,100001,2590,2695', '西畴县', '532623', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2699', '2695', '0,100001,2590,2695', '麻栗坡县', '532624', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('27', '18', '0,100001,18', '津南区', '120112', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('270', '219', '0,100001,219', '朔州市', '140600', '0349', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2700', '2695', '0,100001,2590,2695', '马关县', '532625', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2701', '2695', '0,100001,2590,2695', '丘北县', '532626', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2702', '2695', '0,100001,2590,2695', '广南县', '532627', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2703', '2695', '0,100001,2590,2695', '富宁县', '532628', '0876', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2704', '2590', '0,100001,2590', '西双版纳傣族自治州', '532800', '0691', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2705', '2704', '0,100001,2590,2704', '景洪市', '532801', '0691', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2706', '2704', '0,100001,2590,2704', '勐海县', '532822', '0691', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2707', '2704', '0,100001,2590,2704', '勐腊县', '532823', '0691', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2708', '2590', '0,100001,2590', '大理白族自治州', '532900', '0872', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2709', '2708', '0,100001,2590,2708', '大理市', '532901', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('271', '270', '0,100001,219,270', '朔城区', '140602', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2710', '2708', '0,100001,2590,2708', '漾濞彝族自治县', '532922', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2711', '2708', '0,100001,2590,2708', '祥云县', '532923', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2712', '2708', '0,100001,2590,2708', '宾川县', '532924', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2713', '2708', '0,100001,2590,2708', '弥渡县', '532925', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2714', '2708', '0,100001,2590,2708', '南涧彝族自治县', '532926', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2715', '2708', '0,100001,2590,2708', '巍山彝族回族自治县', '532927', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2716', '2708', '0,100001,2590,2708', '永平县', '532928', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2717', '2708', '0,100001,2590,2708', '云龙县', '532929', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2718', '2708', '0,100001,2590,2708', '洱源县', '532930', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2719', '2708', '0,100001,2590,2708', '剑川县', '532931', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('272', '270', '0,100001,219,270', '平鲁区', '140603', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2720', '2708', '0,100001,2590,2708', '鹤庆县', '532932', '0872', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2721', '2590', '0,100001,2590', '德宏傣族景颇族自治州', '533100', '0692', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2722', '2721', '0,100001,2590,2721', '瑞丽市', '533102', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2723', '2721', '0,100001,2590,2721', '芒市', '533103', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2724', '2721', '0,100001,2590,2721', '梁河县', '533122', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2725', '2721', '0,100001,2590,2721', '盈江县', '533123', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2726', '2721', '0,100001,2590,2721', '陇川县', '533124', '0692', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2727', '2590', '0,100001,2590', '怒江傈僳族自治州', '533300', '0886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2728', '2727', '0,100001,2590,2727', '泸水县', '533321', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2729', '2727', '0,100001,2590,2727', '福贡县', '533323', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('273', '270', '0,100001,219,270', '山阴县', '140621', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2730', '2727', '0,100001,2590,2727', '贡山独龙族怒族自治县', '533324', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2731', '2727', '0,100001,2590,2727', '兰坪白族普米族自治县', '533325', '0886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2732', '2590', '0,100001,2590', '迪庆藏族自治州', '533400', '0887', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2733', '2732', '0,100001,2590,2732', '香格里拉县', '533421', '0887', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2734', '2732', '0,100001,2590,2732', '德钦县', '533422', '0887', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2735', '2732', '0,100001,2590,2732', '维西傈僳族自治县', '533423', '0887', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2736', '100001', '0,100001', '西藏自治区', '540000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2737', '2736', '0,100001,2736', '拉萨市', '540100', '0891', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2738', '2737', '0,100001,2736,2737', '城关区', '540102', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2739', '2737', '0,100001,2736,2737', '林周县', '540121', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('274', '270', '0,100001,219,270', '应县', '140622', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2740', '2737', '0,100001,2736,2737', '当雄县', '540122', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2741', '2737', '0,100001,2736,2737', '尼木县', '540123', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2742', '2737', '0,100001,2736,2737', '曲水县', '540124', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2743', '2737', '0,100001,2736,2737', '堆龙德庆县', '540125', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2744', '2737', '0,100001,2736,2737', '达孜县', '540126', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2745', '2737', '0,100001,2736,2737', '墨竹工卡县', '540127', '0891', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2746', '2736', '0,100001,2736', '昌都地区', '542100', '0895', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2747', '2746', '0,100001,2736,2746', '昌都县', '542121', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2748', '2746', '0,100001,2736,2746', '江达县', '542122', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2749', '2746', '0,100001,2736,2746', '贡觉县', '542123', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('275', '270', '0,100001,219,270', '右玉县', '140623', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2750', '2746', '0,100001,2736,2746', '类乌齐县', '542124', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2751', '2746', '0,100001,2736,2746', '丁青县', '542125', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2752', '2746', '0,100001,2736,2746', '察雅县', '542126', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2753', '2746', '0,100001,2736,2746', '八宿县', '542127', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2754', '2746', '0,100001,2736,2746', '左贡县', '542128', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2755', '2746', '0,100001,2736,2746', '芒康县', '542129', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2756', '2746', '0,100001,2736,2746', '洛隆县', '542132', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2757', '2746', '0,100001,2736,2746', '边坝县', '542133', '0895', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2758', '2736', '0,100001,2736', '山南地区', '542200', '0893', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2759', '2758', '0,100001,2736,2758', '乃东县', '542221', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('276', '270', '0,100001,219,270', '怀仁县', '140624', '0349', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2760', '2758', '0,100001,2736,2758', '扎囊县', '542222', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2761', '2758', '0,100001,2736,2758', '贡嘎县', '542223', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2762', '2758', '0,100001,2736,2758', '桑日县', '542224', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2763', '2758', '0,100001,2736,2758', '琼结县', '542225', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2764', '2758', '0,100001,2736,2758', '曲松县', '542226', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2765', '2758', '0,100001,2736,2758', '措美县', '542227', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2766', '2758', '0,100001,2736,2758', '洛扎县', '542228', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2767', '2758', '0,100001,2736,2758', '加查县', '542229', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2768', '2758', '0,100001,2736,2758', '隆子县', '542231', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2769', '2758', '0,100001,2736,2758', '错那县', '542232', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('277', '219', '0,100001,219', '晋中市', '140700', '0354', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2770', '2758', '0,100001,2736,2758', '浪卡子县', '542233', '0893', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2771', '2736', '0,100001,2736', '日喀则地区', '542300', '0892', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2772', '2771', '0,100001,2736,2771', '日喀则市', '542301', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2773', '2771', '0,100001,2736,2771', '南木林县', '542322', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2774', '2771', '0,100001,2736,2771', '江孜县', '542323', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2775', '2771', '0,100001,2736,2771', '定日县', '542324', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2776', '2771', '0,100001,2736,2771', '萨迦县', '542325', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2777', '2771', '0,100001,2736,2771', '拉孜县', '542326', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2778', '2771', '0,100001,2736,2771', '昂仁县', '542327', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2779', '2771', '0,100001,2736,2771', '谢通门县', '542328', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('278', '277', '0,100001,219,277', '榆次区', '140702', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2780', '2771', '0,100001,2736,2771', '白朗县', '542329', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2781', '2771', '0,100001,2736,2771', '仁布县', '542330', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2782', '2771', '0,100001,2736,2771', '康马县', '542331', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2783', '2771', '0,100001,2736,2771', '定结县', '542332', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2784', '2771', '0,100001,2736,2771', '仲巴县', '542333', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2785', '2771', '0,100001,2736,2771', '亚东县', '542334', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2786', '2771', '0,100001,2736,2771', '吉隆县', '542335', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2787', '2771', '0,100001,2736,2771', '聂拉木县', '542336', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2788', '2771', '0,100001,2736,2771', '萨嘎县', '542337', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2789', '2771', '0,100001,2736,2771', '岗巴县', '542338', '0892', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('279', '277', '0,100001,219,277', '榆社县', '140721', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2790', '2736', '0,100001,2736', '那曲地区', '542400', '0896', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2791', '2790', '0,100001,2736,2790', '那曲县', '542421', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2792', '2790', '0,100001,2736,2790', '嘉黎县', '542422', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2793', '2790', '0,100001,2736,2790', '比如县', '542423', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2794', '2790', '0,100001,2736,2790', '聂荣县', '542424', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2795', '2790', '0,100001,2736,2790', '安多县', '542425', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2796', '2790', '0,100001,2736,2790', '申扎县', '542426', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2797', '2790', '0,100001,2736,2790', '索县', '542427', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2798', '2790', '0,100001,2736,2790', '班戈县', '542428', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2799', '2790', '0,100001,2736,2790', '巴青县', '542429', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('28', '18', '0,100001,18', '北辰区', '120113', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('280', '277', '0,100001,219,277', '左权县', '140722', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2800', '2790', '0,100001,2736,2790', '尼玛县', '542430', '0896', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2801', '2736', '0,100001,2736', '阿里地区', '542500', '0897', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2802', '2801', '0,100001,2736,2801', '普兰县', '542521', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2803', '2801', '0,100001,2736,2801', '札达县', '542522', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2804', '2801', '0,100001,2736,2801', '噶尔县', '542523', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2805', '2801', '0,100001,2736,2801', '日土县', '542524', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2806', '2801', '0,100001,2736,2801', '革吉县', '542525', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2807', '2801', '0,100001,2736,2801', '改则县', '542526', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2808', '2801', '0,100001,2736,2801', '措勤县', '542527', '0897', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2809', '2736', '0,100001,2736', '林芝地区', '542600', '0894', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('281', '277', '0,100001,219,277', '和顺县', '140723', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2810', '2809', '0,100001,2736,2809', '林芝县', '542621', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2811', '2809', '0,100001,2736,2809', '工布江达县', '542622', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2812', '2809', '0,100001,2736,2809', '米林县', '542623', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2813', '2809', '0,100001,2736,2809', '墨脱县', '542624', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2814', '2809', '0,100001,2736,2809', '波密县', '542625', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2815', '2809', '0,100001,2736,2809', '察隅县', '542626', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2816', '2809', '0,100001,2736,2809', '朗县', '542627', '0894', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2817', '100001', '0,100001', '陕西省', '610000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2818', '2817', '0,100001,2817', '西安市', '610100', '029', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2819', '2818', '0,100001,2817,2818', '新城区', '610102', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('282', '277', '0,100001,219,277', '昔阳县', '140724', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2820', '2818', '0,100001,2817,2818', '碑林区', '610103', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2821', '2818', '0,100001,2817,2818', '莲湖区', '610104', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2822', '2818', '0,100001,2817,2818', '灞桥区', '610111', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2823', '2818', '0,100001,2817,2818', '未央区', '610112', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2824', '2818', '0,100001,2817,2818', '雁塔区', '610113', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2825', '2818', '0,100001,2817,2818', '阎良区', '610114', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2826', '2818', '0,100001,2817,2818', '临潼区', '610115', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2827', '2818', '0,100001,2817,2818', '长安区', '610116', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2828', '2818', '0,100001,2817,2818', '蓝田县', '610122', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2829', '2818', '0,100001,2817,2818', '周至县', '610124', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('283', '277', '0,100001,219,277', '寿阳县', '140725', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2830', '2818', '0,100001,2817,2818', '户县', '610125', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2831', '2818', '0,100001,2817,2818', '高陵县', '610126', '029', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2832', '2817', '0,100001,2817', '铜川市', '610200', '0919', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2833', '2832', '0,100001,2817,2832', '王益区', '610202', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2834', '2832', '0,100001,2817,2832', '印台区', '610203', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2835', '2832', '0,100001,2817,2832', '耀州区', '610204', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2836', '2832', '0,100001,2817,2832', '宜君县', '610222', '0919', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2837', '2817', '0,100001,2817', '宝鸡市', '610300', '0917', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2838', '2837', '0,100001,2817,2837', '渭滨区', '610302', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2839', '2837', '0,100001,2817,2837', '金台区', '610303', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('284', '277', '0,100001,219,277', '太谷县', '140726', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2840', '2837', '0,100001,2817,2837', '陈仓区', '610304', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2841', '2837', '0,100001,2817,2837', '凤翔县', '610322', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2842', '2837', '0,100001,2817,2837', '岐山县', '610323', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2843', '2837', '0,100001,2817,2837', '扶风县', '610324', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2844', '2837', '0,100001,2817,2837', '眉县', '610326', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2845', '2837', '0,100001,2817,2837', '陇县', '610327', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2846', '2837', '0,100001,2817,2837', '千阳县', '610328', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2847', '2837', '0,100001,2817,2837', '麟游县', '610329', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2848', '2837', '0,100001,2817,2837', '凤县', '610330', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2849', '2837', '0,100001,2817,2837', '太白县', '610331', '0917', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('285', '277', '0,100001,219,277', '祁县', '140727', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2850', '2817', '0,100001,2817', '咸阳市', '610400', '0910', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2851', '2850', '0,100001,2817,2850', '秦都区', '610402', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2852', '2850', '0,100001,2817,2850', '杨陵区', '610403', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2853', '2850', '0,100001,2817,2850', '渭城区', '610404', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2854', '2850', '0,100001,2817,2850', '三原县', '610422', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2855', '2850', '0,100001,2817,2850', '泾阳县', '610423', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2856', '2850', '0,100001,2817,2850', '乾县', '610424', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2857', '2850', '0,100001,2817,2850', '礼泉县', '610425', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2858', '2850', '0,100001,2817,2850', '永寿县', '610426', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2859', '2850', '0,100001,2817,2850', '彬县', '610427', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('286', '277', '0,100001,219,277', '平遥县', '140728', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2860', '2850', '0,100001,2817,2850', '长武县', '610428', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2861', '2850', '0,100001,2817,2850', '旬邑县', '610429', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2862', '2850', '0,100001,2817,2850', '淳化县', '610430', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2863', '2850', '0,100001,2817,2850', '武功县', '610431', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2864', '2850', '0,100001,2817,2850', '兴平市', '610481', '0910', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2865', '2817', '0,100001,2817', '渭南市', '610500', '0913', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2866', '2865', '0,100001,2817,2865', '临渭区', '610502', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2867', '2865', '0,100001,2817,2865', '华县', '610521', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2868', '2865', '0,100001,2817,2865', '潼关县', '610522', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2869', '2865', '0,100001,2817,2865', '大荔县', '610523', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('287', '277', '0,100001,219,277', '灵石县', '140729', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2870', '2865', '0,100001,2817,2865', '合阳县', '610524', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2871', '2865', '0,100001,2817,2865', '澄城县', '610525', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2872', '2865', '0,100001,2817,2865', '蒲城县', '610526', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2873', '2865', '0,100001,2817,2865', '白水县', '610527', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2874', '2865', '0,100001,2817,2865', '富平县', '610528', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2875', '2865', '0,100001,2817,2865', '韩城市', '610581', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2876', '2865', '0,100001,2817,2865', '华阴市', '610582', '0913', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2877', '2817', '0,100001,2817', '延安市', '610600', '0911', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2878', '2877', '0,100001,2817,2877', '宝塔区', '610602', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2879', '2877', '0,100001,2817,2877', '延长县', '610621', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('288', '277', '0,100001,219,277', '介休市', '140781', '0354', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2880', '2877', '0,100001,2817,2877', '延川县', '610622', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2881', '2877', '0,100001,2817,2877', '子长县', '610623', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2882', '2877', '0,100001,2817,2877', '安塞县', '610624', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2883', '2877', '0,100001,2817,2877', '志丹县', '610625', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2884', '2877', '0,100001,2817,2877', '吴起县', '610626', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2885', '2877', '0,100001,2817,2877', '甘泉县', '610627', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2886', '2877', '0,100001,2817,2877', '富县', '610628', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2887', '2877', '0,100001,2817,2877', '洛川县', '610629', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2888', '2877', '0,100001,2817,2877', '宜川县', '610630', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2889', '2877', '0,100001,2817,2877', '黄龙县', '610631', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('289', '219', '0,100001,219', '运城市', '140800', '0359', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2890', '2877', '0,100001,2817,2877', '黄陵县', '610632', '0911', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2891', '2817', '0,100001,2817', '汉中市', '610700', '0916', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2892', '2891', '0,100001,2817,2891', '汉台区', '610702', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2893', '2891', '0,100001,2817,2891', '南郑县', '610721', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2894', '2891', '0,100001,2817,2891', '城固县', '610722', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2895', '2891', '0,100001,2817,2891', '洋县', '610723', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2896', '2891', '0,100001,2817,2891', '西乡县', '610724', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2897', '2891', '0,100001,2817,2891', '勉县', '610725', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2898', '2891', '0,100001,2817,2891', '宁强县', '610726', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2899', '2891', '0,100001,2817,2891', '略阳县', '610727', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('29', '18', '0,100001,18', '武清区', '120114', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('290', '289', '0,100001,219,289', '盐湖区', '140802', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2900', '2891', '0,100001,2817,2891', '镇巴县', '610728', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2901', '2891', '0,100001,2817,2891', '留坝县', '610729', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2902', '2891', '0,100001,2817,2891', '佛坪县', '610730', '0916', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2903', '2817', '0,100001,2817', '榆林市', '610800', '0912', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2904', '2903', '0,100001,2817,2903', '榆阳区', '610802', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2905', '2903', '0,100001,2817,2903', '神木县', '610821', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2906', '2903', '0,100001,2817,2903', '府谷县', '610822', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2907', '2903', '0,100001,2817,2903', '横山县', '610823', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2908', '2903', '0,100001,2817,2903', '靖边县', '610824', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2909', '2903', '0,100001,2817,2903', '定边县', '610825', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('291', '289', '0,100001,219,289', '临猗县', '140821', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2910', '2903', '0,100001,2817,2903', '绥德县', '610826', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2911', '2903', '0,100001,2817,2903', '米脂县', '610827', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2912', '2903', '0,100001,2817,2903', '佳县', '610828', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2913', '2903', '0,100001,2817,2903', '吴堡县', '610829', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2914', '2903', '0,100001,2817,2903', '清涧县', '610830', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2915', '2903', '0,100001,2817,2903', '子洲县', '610831', '0912', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2916', '2817', '0,100001,2817', '安康市', '610900', '0915', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2917', '2916', '0,100001,2817,2916', '汉滨区', '610902', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2918', '2916', '0,100001,2817,2916', '汉阴县', '610921', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2919', '2916', '0,100001,2817,2916', '石泉县', '610922', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('292', '289', '0,100001,219,289', '万荣县', '140822', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2920', '2916', '0,100001,2817,2916', '宁陕县', '610923', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2921', '2916', '0,100001,2817,2916', '紫阳县', '610924', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2922', '2916', '0,100001,2817,2916', '岚皋县', '610925', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2923', '2916', '0,100001,2817,2916', '平利县', '610926', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2924', '2916', '0,100001,2817,2916', '镇坪县', '610927', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2925', '2916', '0,100001,2817,2916', '旬阳县', '610928', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2926', '2916', '0,100001,2817,2916', '白河县', '610929', '0915', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2927', '2817', '0,100001,2817', '商洛市', '611000', '0914', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2928', '2927', '0,100001,2817,2927', '商州区', '611002', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2929', '2927', '0,100001,2817,2927', '洛南县', '611021', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('293', '289', '0,100001,219,289', '闻喜县', '140823', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2930', '2927', '0,100001,2817,2927', '丹凤县', '611022', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2931', '2927', '0,100001,2817,2927', '商南县', '611023', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2932', '2927', '0,100001,2817,2927', '山阳县', '611024', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2933', '2927', '0,100001,2817,2927', '镇安县', '611025', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2934', '2927', '0,100001,2817,2927', '柞水县', '611026', '0914', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2935', '100001', '0,100001', '甘肃省', '620000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2936', '2935', '0,100001,2935', '兰州市', '620100', '0931', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2937', '2936', '0,100001,2935,2936', '城关区', '620102', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2938', '2936', '0,100001,2935,2936', '七里河区', '620103', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2939', '2936', '0,100001,2935,2936', '西固区', '620104', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('294', '289', '0,100001,219,289', '稷山县', '140824', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2940', '2936', '0,100001,2935,2936', '安宁区', '620105', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2941', '2936', '0,100001,2935,2936', '红古区', '620111', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2942', '2936', '0,100001,2935,2936', '永登县', '620121', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2943', '2936', '0,100001,2935,2936', '皋兰县', '620122', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2944', '2936', '0,100001,2935,2936', '榆中县', '620123', '0931', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2945', '2935', '0,100001,2935', '嘉峪关市', '620200', '0937', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2946', '2945', '0,100001,2935,2945', '嘉峪关市', '620201', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2947', '2935', '0,100001,2935', '金昌市', '620300', '0935', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2948', '2947', '0,100001,2935,2947', '金川区', '620302', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2949', '2947', '0,100001,2935,2947', '永昌县', '620321', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('295', '289', '0,100001,219,289', '新绛县', '140825', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2950', '2935', '0,100001,2935', '白银市', '620400', '0943', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2951', '2950', '0,100001,2935,2950', '白银区', '620402', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2952', '2950', '0,100001,2935,2950', '平川区', '620403', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2953', '2950', '0,100001,2935,2950', '靖远县', '620421', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2954', '2950', '0,100001,2935,2950', '会宁县', '620422', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2955', '2950', '0,100001,2935,2950', '景泰县', '620423', '0943', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2956', '2935', '0,100001,2935', '天水市', '620500', '0938', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2957', '2956', '0,100001,2935,2956', '秦州区', '620502', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2958', '2956', '0,100001,2935,2956', '麦积区', '620503', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2959', '2956', '0,100001,2935,2956', '清水县', '620521', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('296', '289', '0,100001,219,289', '绛县', '140826', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2960', '2956', '0,100001,2935,2956', '秦安县', '620522', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2961', '2956', '0,100001,2935,2956', '甘谷县', '620523', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2962', '2956', '0,100001,2935,2956', '武山县', '620524', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2963', '2956', '0,100001,2935,2956', '张家川回族自治县', '620525', '0938', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2964', '2935', '0,100001,2935', '武威市', '620600', '0935', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2965', '2964', '0,100001,2935,2964', '凉州区', '620602', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2966', '2964', '0,100001,2935,2964', '民勤县', '620621', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2967', '2964', '0,100001,2935,2964', '古浪县', '620622', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2968', '2964', '0,100001,2935,2964', '天祝藏族自治县', '620623', '0935', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2969', '2935', '0,100001,2935', '张掖市', '620700', '0936', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('297', '289', '0,100001,219,289', '垣曲县', '140827', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2970', '2969', '0,100001,2935,2969', '甘州区', '620702', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2971', '2969', '0,100001,2935,2969', '肃南裕固族自治县', '620721', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2972', '2969', '0,100001,2935,2969', '民乐县', '620722', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2973', '2969', '0,100001,2935,2969', '临泽县', '620723', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2974', '2969', '0,100001,2935,2969', '高台县', '620724', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2975', '2969', '0,100001,2935,2969', '山丹县', '620725', '0936', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2976', '2935', '0,100001,2935', '平凉市', '620800', '0933', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2977', '2976', '0,100001,2935,2976', '崆峒区', '620802', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2978', '2976', '0,100001,2935,2976', '泾川县', '620821', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2979', '2976', '0,100001,2935,2976', '灵台县', '620822', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('298', '289', '0,100001,219,289', '夏县', '140828', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2980', '2976', '0,100001,2935,2976', '崇信县', '620823', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2981', '2976', '0,100001,2935,2976', '华亭县', '620824', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2982', '2976', '0,100001,2935,2976', '庄浪县', '620825', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2983', '2976', '0,100001,2935,2976', '静宁县', '620826', '0933', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2984', '2935', '0,100001,2935', '酒泉市', '620900', '0937', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2985', '2984', '0,100001,2935,2984', '肃州区', '620902', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2986', '2984', '0,100001,2935,2984', '金塔县', '620921', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2987', '2984', '0,100001,2935,2984', '瓜州县', '620922', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2988', '2984', '0,100001,2935,2984', '肃北蒙古族自治县', '620923', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2989', '2984', '0,100001,2935,2984', '阿克塞哈萨克族自治县', '620924', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('299', '289', '0,100001,219,289', '平陆县', '140829', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2990', '2984', '0,100001,2935,2984', '玉门市', '620981', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2991', '2984', '0,100001,2935,2984', '敦煌市', '620982', '0937', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2992', '2935', '0,100001,2935', '庆阳市', '621000', '0934', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2993', '2992', '0,100001,2935,2992', '西峰区', '621002', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2994', '2992', '0,100001,2935,2992', '庆城县', '621021', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2995', '2992', '0,100001,2935,2992', '环县', '621022', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2996', '2992', '0,100001,2935,2992', '华池县', '621023', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2997', '2992', '0,100001,2935,2992', '合水县', '621024', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2998', '2992', '0,100001,2935,2992', '正宁县', '621025', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('2999', '2992', '0,100001,2935,2992', '宁县', '621026', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3', '1', '0,100001,1', '西城区', '110102', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('30', '18', '0,100001,18', '宝坻区', '120115', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('300', '289', '0,100001,219,289', '芮城县', '140830', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3000', '2992', '0,100001,2935,2992', '镇原县', '621027', '0934', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3001', '2935', '0,100001,2935', '定西市', '621100', '0932', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3002', '3001', '0,100001,2935,3001', '安定区', '621102', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3003', '3001', '0,100001,2935,3001', '通渭县', '621121', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3004', '3001', '0,100001,2935,3001', '陇西县', '621122', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3005', '3001', '0,100001,2935,3001', '渭源县', '621123', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3006', '3001', '0,100001,2935,3001', '临洮县', '621124', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3007', '3001', '0,100001,2935,3001', '漳县', '621125', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3008', '3001', '0,100001,2935,3001', '岷县', '621126', '0932', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3009', '2935', '0,100001,2935', '陇南市', '621200', '0939', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('301', '289', '0,100001,219,289', '永济市', '140881', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3010', '3009', '0,100001,2935,3009', '武都区', '621202', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3011', '3009', '0,100001,2935,3009', '成县', '621221', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3012', '3009', '0,100001,2935,3009', '文县', '621222', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3013', '3009', '0,100001,2935,3009', '宕昌县', '621223', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3014', '3009', '0,100001,2935,3009', '康县', '621224', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3015', '3009', '0,100001,2935,3009', '西和县', '621225', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3016', '3009', '0,100001,2935,3009', '礼县', '621226', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3017', '3009', '0,100001,2935,3009', '徽县', '621227', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3018', '3009', '0,100001,2935,3009', '两当县', '621228', '0939', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3019', '2935', '0,100001,2935', '临夏回族自治州', '622900', '0930', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('302', '289', '0,100001,219,289', '河津市', '140882', '0359', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3020', '3019', '0,100001,2935,3019', '临夏市', '622901', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3021', '3019', '0,100001,2935,3019', '临夏县', '622921', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3022', '3019', '0,100001,2935,3019', '康乐县', '622922', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3023', '3019', '0,100001,2935,3019', '永靖县', '622923', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3024', '3019', '0,100001,2935,3019', '广河县', '622924', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3025', '3019', '0,100001,2935,3019', '和政县', '622925', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3026', '3019', '0,100001,2935,3019', '东乡族自治县', '622926', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3027', '3019', '0,100001,2935,3019', '积石山保安族东乡族撒拉族自治县', '622927', '0930', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3028', '2935', '0,100001,2935', '甘南藏族自治州', '623000', '0941', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3029', '3028', '0,100001,2935,3028', '合作市', '623001', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('303', '219', '0,100001,219', '忻州市', '140900', '0350', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3030', '3028', '0,100001,2935,3028', '临潭县', '623021', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3031', '3028', '0,100001,2935,3028', '卓尼县', '623022', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3032', '3028', '0,100001,2935,3028', '舟曲县', '623023', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3033', '3028', '0,100001,2935,3028', '迭部县', '623024', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3034', '3028', '0,100001,2935,3028', '玛曲县', '623025', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3035', '3028', '0,100001,2935,3028', '碌曲县', '623026', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3036', '3028', '0,100001,2935,3028', '夏河县', '623027', '0941', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3037', '100001', '0,100001', '青海省', '630000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3038', '3037', '0,100001,3037', '西宁市', '630100', '0971', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3039', '3038', '0,100001,3037,3038', '城东区', '630102', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('304', '303', '0,100001,219,303', '忻府区', '140902', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3040', '3038', '0,100001,3037,3038', '城中区', '630103', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3041', '3038', '0,100001,3037,3038', '城西区', '630104', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3042', '3038', '0,100001,3037,3038', '城北区', '630105', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3043', '3038', '0,100001,3037,3038', '大通回族土族自治县', '630121', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3044', '3038', '0,100001,3037,3038', '湟中县', '630122', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3045', '3038', '0,100001,3037,3038', '湟源县', '630123', '0971', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3046', '3037', '0,100001,3037', '海东地区', '632100', '0972', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3047', '3046', '0,100001,3037,3046', '平安县', '632121', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3048', '3046', '0,100001,3037,3046', '民和回族土族自治县', '632122', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3049', '3046', '0,100001,3037,3046', '乐都县', '632123', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('305', '303', '0,100001,219,303', '定襄县', '140921', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3050', '3046', '0,100001,3037,3046', '互助土族自治县', '632126', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3051', '3046', '0,100001,3037,3046', '化隆回族自治县', '632127', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3052', '3046', '0,100001,3037,3046', '循化撒拉族自治县', '632128', '0972', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3053', '3037', '0,100001,3037', '海北藏族自治州', '632200', '0970', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3054', '3053', '0,100001,3037,3053', '门源回族自治县', '632221', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3055', '3053', '0,100001,3037,3053', '祁连县', '632222', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3056', '3053', '0,100001,3037,3053', '海晏县', '632223', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3057', '3053', '0,100001,3037,3053', '刚察县', '632224', '0970', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3058', '3037', '0,100001,3037', '黄南藏族自治州', '632300', '0973', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3059', '3058', '0,100001,3037,3058', '同仁县', '632321', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('306', '303', '0,100001,219,303', '五台县', '140922', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3060', '3058', '0,100001,3037,3058', '尖扎县', '632322', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3061', '3058', '0,100001,3037,3058', '泽库县', '632323', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3062', '3058', '0,100001,3037,3058', '河南蒙古族自治县', '632324', '0973', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3063', '3037', '0,100001,3037', '海南藏族自治州', '632500', '0974', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3064', '3063', '0,100001,3037,3063', '共和县', '632521', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3065', '3063', '0,100001,3037,3063', '同德县', '632522', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3066', '3063', '0,100001,3037,3063', '贵德县', '632523', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3067', '3063', '0,100001,3037,3063', '兴海县', '632524', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3068', '3063', '0,100001,3037,3063', '贵南县', '632525', '0974', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3069', '3037', '0,100001,3037', '果洛藏族自治州', '632600', '0975', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('307', '303', '0,100001,219,303', '代县', '140923', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3070', '3069', '0,100001,3037,3069', '玛沁县', '632621', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3071', '3069', '0,100001,3037,3069', '班玛县', '632622', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3072', '3069', '0,100001,3037,3069', '甘德县', '632623', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3073', '3069', '0,100001,3037,3069', '达日县', '632624', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3074', '3069', '0,100001,3037,3069', '久治县', '632625', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3075', '3069', '0,100001,3037,3069', '玛多县', '632626', '0975', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3076', '3037', '0,100001,3037', '玉树藏族自治州', '632700', '0976', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3077', '3076', '0,100001,3037,3076', '玉树县', '632721', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3078', '3076', '0,100001,3037,3076', '杂多县', '632722', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3079', '3076', '0,100001,3037,3076', '称多县', '632723', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('308', '303', '0,100001,219,303', '繁峙县', '140924', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3080', '3076', '0,100001,3037,3076', '治多县', '632724', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3081', '3076', '0,100001,3037,3076', '囊谦县', '632725', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3082', '3076', '0,100001,3037,3076', '曲麻莱县', '632726', '0976', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3083', '3037', '0,100001,3037', '海西蒙古族藏族自治州', '632800', '0977', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3084', '3083', '0,100001,3037,3083', '格尔木市', '632801', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3085', '3083', '0,100001,3037,3083', '德令哈市', '632802', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3086', '3083', '0,100001,3037,3083', '乌兰县', '632821', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3087', '3083', '0,100001,3037,3083', '都兰县', '632822', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3088', '3083', '0,100001,3037,3083', '天峻县', '632823', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3089', '100001', '0,100001', '宁夏回族自治区', '640000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('309', '303', '0,100001,219,303', '宁武县', '140925', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3090', '3089', '0,100001,3089', '银川市', '640100', '0951', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3091', '3090', '0,100001,3089,3090', '兴庆区', '640104', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3092', '3090', '0,100001,3089,3090', '西夏区', '640105', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3093', '3090', '0,100001,3089,3090', '金凤区', '640106', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3094', '3090', '0,100001,3089,3090', '永宁县', '640121', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3095', '3090', '0,100001,3089,3090', '贺兰县', '640122', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3096', '3090', '0,100001,3089,3090', '灵武市', '640181', '0951', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3097', '3089', '0,100001,3089', '石嘴山市', '640200', '0952', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3098', '3097', '0,100001,3089,3097', '大武口区', '640202', '0952', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3099', '3097', '0,100001,3089,3097', '惠农区', '640205', '0952', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('31', '18', '0,100001,18', '滨海新区', '120116', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('310', '303', '0,100001,219,303', '静乐县', '140926', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3100', '3097', '0,100001,3089,3097', '平罗县', '640221', '0952', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3101', '3089', '0,100001,3089', '吴忠市', '640300', '0953', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3102', '3101', '0,100001,3089,3101', '利通区', '640302', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3103', '3101', '0,100001,3089,3101', '红寺堡区', '640303', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3104', '3101', '0,100001,3089,3101', '盐池县', '640323', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3105', '3101', '0,100001,3089,3101', '同心县', '640324', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3106', '3101', '0,100001,3089,3101', '青铜峡市', '640381', '0953', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3107', '3089', '0,100001,3089', '固原市', '640400', '0954', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3108', '3107', '0,100001,3089,3107', '原州区', '640402', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3109', '3107', '0,100001,3089,3107', '西吉县', '640422', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('311', '303', '0,100001,219,303', '神池县', '140927', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3110', '3107', '0,100001,3089,3107', '隆德县', '640423', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3111', '3107', '0,100001,3089,3107', '泾源县', '640424', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3112', '3107', '0,100001,3089,3107', '彭阳县', '640425', '0954', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3113', '3089', '0,100001,3089', '中卫市', '640500', '0977', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3114', '3113', '0,100001,3089,3113', '沙坡头区', '640502', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3115', '3113', '0,100001,3089,3113', '中宁县', '640521', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3116', '3113', '0,100001,3089,3113', '海原县', '640522', '0977', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3117', '100001', '0,100001', '新疆维吾尔自治区', '650000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3118', '3117', '0,100001,3117', '乌鲁木齐市', '650100', '0991', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3119', '3118', '0,100001,3117,3118', '天山区', '650102', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('312', '303', '0,100001,219,303', '五寨县', '140928', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3120', '3118', '0,100001,3117,3118', '沙依巴克区', '650103', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3121', '3118', '0,100001,3117,3118', '新市区', '650104', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3122', '3118', '0,100001,3117,3118', '水磨沟区', '650105', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3123', '3118', '0,100001,3117,3118', '头屯河区', '650106', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3124', '3118', '0,100001,3117,3118', '达坂城区', '650107', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3125', '3118', '0,100001,3117,3118', '米东区', '650109', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3126', '3118', '0,100001,3117,3118', '乌鲁木齐县', '650121', '0991', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3127', '3117', '0,100001,3117', '克拉玛依市', '650200', '0990', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3128', '3127', '0,100001,3117,3127', '独山子区', '650202', '0992', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3129', '3127', '0,100001,3117,3127', '克拉玛依区', '650203', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('313', '303', '0,100001,219,303', '岢岚县', '140929', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3130', '3127', '0,100001,3117,3127', '白碱滩区', '650204', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3131', '3127', '0,100001,3117,3127', '乌尔禾区', '650205', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3132', '3117', '0,100001,3117', '吐鲁番地区', '652100', '0995', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3133', '3132', '0,100001,3117,3132', '吐鲁番市', '652101', '0995', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3134', '3132', '0,100001,3117,3132', '鄯善县', '652122', '0995', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3135', '3132', '0,100001,3117,3132', '托克逊县', '652123', '0995', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3136', '3117', '0,100001,3117', '哈密地区', '652200', '0902', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3137', '3136', '0,100001,3117,3136', '哈密市', '652201', '0902', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3138', '3136', '0,100001,3117,3136', '巴里坤哈萨克自治县', '652222', '0902', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3139', '3136', '0,100001,3117,3136', '伊吾县', '652223', '0902', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('314', '303', '0,100001,219,303', '河曲县', '140930', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3140', '3117', '0,100001,3117', '昌吉回族自治州', '652300', '0994', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3141', '3140', '0,100001,3117,3140', '昌吉市', '652301', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3142', '3140', '0,100001,3117,3140', '阜康市', '652302', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3143', '3140', '0,100001,3117,3140', '呼图壁县', '652323', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3144', '3140', '0,100001,3117,3140', '玛纳斯县', '652324', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3145', '3140', '0,100001,3117,3140', '奇台县', '652325', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3146', '3140', '0,100001,3117,3140', '吉木萨尔县', '652327', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3147', '3140', '0,100001,3117,3140', '木垒哈萨克自治县', '652328', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3148', '3117', '0,100001,3117', '博尔塔拉蒙古自治州', '652700', '0909', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3149', '3148', '0,100001,3117,3148', '博乐市', '652701', '0909', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('315', '303', '0,100001,219,303', '保德县', '140931', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3150', '3148', '0,100001,3117,3148', '精河县', '652722', '0909', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3151', '3148', '0,100001,3117,3148', '温泉县', '652723', '0909', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3152', '3117', '0,100001,3117', '巴音郭楞蒙古自治州', '652800', '0996', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3153', '3152', '0,100001,3117,3152', '库尔勒市', '652801', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3154', '3152', '0,100001,3117,3152', '轮台县', '652822', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3155', '3152', '0,100001,3117,3152', '尉犁县', '652823', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3156', '3152', '0,100001,3117,3152', '若羌县', '652824', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3157', '3152', '0,100001,3117,3152', '且末县', '652825', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3158', '3152', '0,100001,3117,3152', '焉耆回族自治县', '652826', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3159', '3152', '0,100001,3117,3152', '和静县', '652827', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('316', '303', '0,100001,219,303', '偏关县', '140932', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3160', '3152', '0,100001,3117,3152', '和硕县', '652828', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3161', '3152', '0,100001,3117,3152', '博湖县', '652829', '0996', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3162', '3117', '0,100001,3117', '阿克苏地区', '652900', '0997', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3163', '3162', '0,100001,3117,3162', '阿克苏市', '652901', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3164', '3162', '0,100001,3117,3162', '温宿县', '652922', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3165', '3162', '0,100001,3117,3162', '库车县', '652923', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3166', '3162', '0,100001,3117,3162', '沙雅县', '652924', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3167', '3162', '0,100001,3117,3162', '新和县', '652925', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3168', '3162', '0,100001,3117,3162', '拜城县', '652926', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3169', '3162', '0,100001,3117,3162', '乌什县', '652927', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('317', '303', '0,100001,219,303', '原平市', '140981', '0350', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3170', '3162', '0,100001,3117,3162', '阿瓦提县', '652928', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3171', '3162', '0,100001,3117,3162', '柯坪县', '652929', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3172', '3117', '0,100001,3117', '克孜勒苏柯尔克孜自治州', '653000', '0908', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3173', '3172', '0,100001,3117,3172', '阿图什市', '653001', '0908', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3174', '3172', '0,100001,3117,3172', '阿克陶县', '653022', '0908', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3175', '3172', '0,100001,3117,3172', '阿合奇县', '653023', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3176', '3172', '0,100001,3117,3172', '乌恰县', '653024', '0908', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3177', '3117', '0,100001,3117', '喀什地区', '653100', '0998', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3178', '3177', '0,100001,3117,3177', '喀什市', '653101', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3179', '3177', '0,100001,3117,3177', '疏附县', '653121', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('318', '219', '0,100001,219', '临汾市', '141000', '0357', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3180', '3177', '0,100001,3117,3177', '疏勒县', '653122', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3181', '3177', '0,100001,3117,3177', '英吉沙县', '653123', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3182', '3177', '0,100001,3117,3177', '泽普县', '653124', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3183', '3177', '0,100001,3117,3177', '莎车县', '653125', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3184', '3177', '0,100001,3117,3177', '叶城县', '653126', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3185', '3177', '0,100001,3117,3177', '麦盖提县', '653127', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3186', '3177', '0,100001,3117,3177', '岳普湖县', '653128', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3187', '3177', '0,100001,3117,3177', '伽师县', '653129', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3188', '3177', '0,100001,3117,3177', '巴楚县', '653130', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3189', '3177', '0,100001,3117,3177', '塔什库尔干塔吉克自治县', '653131', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('319', '318', '0,100001,219,318', '尧都区', '141002', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3190', '3117', '0,100001,3117', '和田地区', '653200', '0903', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3191', '3190', '0,100001,3117,3190', '和田市', '653201', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3192', '3190', '0,100001,3117,3190', '和田县', '653221', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3193', '3190', '0,100001,3117,3190', '墨玉县', '653222', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3194', '3190', '0,100001,3117,3190', '皮山县', '653223', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3195', '3190', '0,100001,3117,3190', '洛浦县', '653224', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3196', '3190', '0,100001,3117,3190', '策勒县', '653225', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3197', '3190', '0,100001,3117,3190', '于田县', '653226', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3198', '3190', '0,100001,3117,3190', '民丰县', '653227', '0903', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3199', '3117', '0,100001,3117', '伊犁哈萨克自治州', '654000', '0999', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('32', '18', '0,100001,18', '宁河县', '120221', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('320', '318', '0,100001,219,318', '曲沃县', '141021', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3200', '3199', '0,100001,3117,3199', '伊宁市', '654002', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3201', '3199', '0,100001,3117,3199', '奎屯市', '654003', '0992', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3202', '3199', '0,100001,3117,3199', '伊宁县', '654021', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3203', '3199', '0,100001,3117,3199', '察布查尔锡伯自治县', '654022', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3204', '3199', '0,100001,3117,3199', '霍城县', '654023', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3205', '3199', '0,100001,3117,3199', '巩留县', '654024', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3206', '3199', '0,100001,3117,3199', '新源县', '654025', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3207', '3199', '0,100001,3117,3199', '昭苏县', '654026', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3208', '3199', '0,100001,3117,3199', '特克斯县', '654027', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3209', '3199', '0,100001,3117,3199', '尼勒克县', '654028', '0999', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('321', '318', '0,100001,219,318', '翼城县', '141022', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3210', '3117', '0,100001,3117', '塔城地区', '654200', '0901', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3211', '3210', '0,100001,3117,3210', '塔城市', '654201', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3212', '3210', '0,100001,3117,3210', '乌苏市', '654202', '0992', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3213', '3210', '0,100001,3117,3210', '额敏县', '654221', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3214', '3210', '0,100001,3117,3210', '沙湾县', '654223', '0993', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3215', '3210', '0,100001,3117,3210', '托里县', '654224', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3216', '3210', '0,100001,3117,3210', '裕民县', '654225', '0901', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3217', '3210', '0,100001,3117,3210', '和布克赛尔蒙古自治县', '654226', '0990', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3218', '3117', '0,100001,3117', '阿勒泰地区', '654300', '0906', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3219', '3218', '0,100001,3117,3218', '阿勒泰市', '654301', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('322', '318', '0,100001,219,318', '襄汾县', '141023', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3220', '3218', '0,100001,3117,3218', '布尔津县', '654321', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3221', '3218', '0,100001,3117,3218', '富蕴县', '654322', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3222', '3218', '0,100001,3117,3218', '福海县', '654323', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3223', '3218', '0,100001,3117,3218', '哈巴河县', '654324', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3224', '3218', '0,100001,3117,3218', '青河县', '654325', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3225', '3218', '0,100001,3117,3218', '吉木乃县', '654326', '0906', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3226', '3117', '0,100001,3117', '自治区直辖', '659000', '', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3227', '3226', '0,100001,3117,3226', '石河子市', '659001', '0993', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3228', '3226', '0,100001,3117,3226', '阿拉尔市', '659002', '0997', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3229', '3226', '0,100001,3117,3226', '图木舒克市', '659003', '0998', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('323', '318', '0,100001,219,318', '洪洞县', '141024', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3230', '3226', '0,100001,3117,3226', '五家渠市', '659004', '0994', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3231', '100001', '0,100001', '台湾省', '710000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3232', '3231', '0,100001,3231', '台北市', '710100', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3233', '3232', '0,100001,3231,3232', '中正区', '710101', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3234', '3232', '0,100001,3231,3232', '大同区', '710102', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3235', '3232', '0,100001,3231,3232', '中山区', '710103', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3236', '3232', '0,100001,3231,3232', '松山区', '710104', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3237', '3232', '0,100001,3231,3232', '大安区', '710105', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3238', '3232', '0,100001,3231,3232', '万华区', '710106', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3239', '3232', '0,100001,3231,3232', '信义区', '710107', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('324', '318', '0,100001,219,318', '古县', '141025', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3240', '3232', '0,100001,3231,3232', '士林区', '710108', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3241', '3232', '0,100001,3231,3232', '北投区', '710109', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3242', '3232', '0,100001,3231,3232', '内湖区', '710110', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3243', '3232', '0,100001,3231,3232', '南港区', '710111', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3244', '3232', '0,100001,3231,3232', '文山区', '710112', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3245', '3231', '0,100001,3231', '高雄市', '710200', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3246', '3245', '0,100001,3231,3245', '新兴区', '710201', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3247', '3245', '0,100001,3231,3245', '前金区', '710202', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3248', '3245', '0,100001,3231,3245', '芩雅区', '710203', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3249', '3245', '0,100001,3231,3245', '盐埕区', '710204', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('325', '318', '0,100001,219,318', '安泽县', '141026', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3250', '3245', '0,100001,3231,3245', '鼓山区', '710205', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3251', '3245', '0,100001,3231,3245', '旗津区', '710206', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3252', '3245', '0,100001,3231,3245', '前镇区', '710207', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3253', '3245', '0,100001,3231,3245', '三民区', '710208', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3254', '3245', '0,100001,3231,3245', '左营区', '710209', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3255', '3245', '0,100001,3231,3245', '楠梓区', '710210', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3256', '3245', '0,100001,3231,3245', '小港区', '710211', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3257', '3231', '0,100001,3231', '基隆市', '710300', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3258', '3257', '0,100001,3231,3257', '仁爱区', '710301', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3259', '3257', '0,100001,3231,3257', '信义区', '710302', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('326', '318', '0,100001,219,318', '浮山县', '141027', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3260', '3257', '0,100001,3231,3257', '中正区', '710303', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3261', '3257', '0,100001,3231,3257', '中山区', '710304', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3262', '3257', '0,100001,3231,3257', '安乐区', '710305', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3263', '3257', '0,100001,3231,3257', '暖暖区', '710306', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3264', '3257', '0,100001,3231,3257', '七堵区', '710307', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3265', '3231', '0,100001,3231', '台中市', '710400', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3266', '3265', '0,100001,3231,3265', '中区', '710401', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3267', '3265', '0,100001,3231,3265', '东区', '710402', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3268', '3265', '0,100001,3231,3265', '南区', '710403', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3269', '3265', '0,100001,3231,3265', '西区', '710404', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('327', '318', '0,100001,219,318', '吉县', '141028', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3270', '3265', '0,100001,3231,3265', '北区', '710405', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3271', '3265', '0,100001,3231,3265', '北屯区', '710406', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3272', '3265', '0,100001,3231,3265', '西屯区', '710407', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3273', '3265', '0,100001,3231,3265', '南屯区', '710408', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3274', '3231', '0,100001,3231', '台南市', '710500', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3275', '3274', '0,100001,3231,3274', '中西区', '710501', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3276', '3274', '0,100001,3231,3274', '东区', '710502', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3277', '3274', '0,100001,3231,3274', '南区', '710503', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3278', '3274', '0,100001,3231,3274', '北区', '710504', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3279', '3274', '0,100001,3231,3274', '安平区', '710505', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('328', '318', '0,100001,219,318', '乡宁县', '141029', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3280', '3274', '0,100001,3231,3274', '安南区', '710506', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3281', '3231', '0,100001,3231', '新竹市', '710600', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3282', '3281', '0,100001,3231,3281', '东区', '710601', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3283', '3281', '0,100001,3231,3281', '北区', '710602', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3284', '3281', '0,100001,3231,3281', '香山区', '710603', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3285', '3231', '0,100001,3231', '嘉义市', '710700', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3286', '3285', '0,100001,3231,3285', '东区', '710701', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3287', '3285', '0,100001,3231,3285', '西区', '710702', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3288', '3231', '0,100001,3231', '省直辖', '719000', '00886', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3289', '3288', '0,100001,3231,3288', '台北县', '719001', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('329', '318', '0,100001,219,318', '大宁县', '141030', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3290', '3288', '0,100001,3231,3288', '宜兰县', '719002', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3291', '3288', '0,100001,3231,3288', '新竹县', '719003', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3292', '3288', '0,100001,3231,3288', '桃园县', '719004', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3293', '3288', '0,100001,3231,3288', '苗栗县', '719005', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3294', '3288', '0,100001,3231,3288', '台中县', '719006', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3295', '3288', '0,100001,3231,3288', '彰化县', '719007', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3296', '3288', '0,100001,3231,3288', '南投县', '719008', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3297', '3288', '0,100001,3231,3288', '嘉义县', '719009', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3298', '3288', '0,100001,3231,3288', '云林县', '719010', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3299', '3288', '0,100001,3231,3288', '台南县', '719011', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('33', '18', '0,100001,18', '静海县', '120223', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('330', '318', '0,100001,219,318', '隰县', '141031', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3300', '3288', '0,100001,3231,3288', '高雄县', '719012', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3301', '3288', '0,100001,3231,3288', '屏东县', '719013', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3302', '3288', '0,100001,3231,3288', '台东县', '719014', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3303', '3288', '0,100001,3231,3288', '花莲县', '719015', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3304', '3288', '0,100001,3231,3288', '澎湖县', '719016', '00886', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3305', '100001', '0,100001', '香港特别行政区', '810000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3306', '3305', '0,100001,3305', '香港岛', '810100', '00852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3307', '3306', '0,100001,3305,3306', '中西区', '810101', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3308', '3306', '0,100001,3305,3306', '湾仔区', '810102', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3309', '3306', '0,100001,3305,3306', '东区', '810103', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('331', '318', '0,100001,219,318', '永和县', '141032', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3310', '3306', '0,100001,3305,3306', '南区', '810104', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3311', '3305', '0,100001,3305', '九龙', '810200', '00852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3312', '3311', '0,100001,3305,3311', '油尖旺区', '810201', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3313', '3311', '0,100001,3305,3311', '深水埗区', '810202', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3314', '3311', '0,100001,3305,3311', '九龙城区', '810203', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3315', '3311', '0,100001,3305,3311', '黄大仙区', '810204', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3316', '3311', '0,100001,3305,3311', '观塘区', '810205', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3317', '3305', '0,100001,3305', '新界', '810300', '00852', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3318', '3317', '0,100001,3305,3317', '北区', '810301', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3319', '3317', '0,100001,3305,3317', '大埔区', '810302', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('332', '318', '0,100001,219,318', '蒲县', '141033', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3320', '3317', '0,100001,3305,3317', '沙田区', '810303', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3321', '3317', '0,100001,3305,3317', '西贡区', '810304', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3322', '3317', '0,100001,3305,3317', '荃湾区', '810305', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3323', '3317', '0,100001,3305,3317', '屯门区', '810306', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3324', '3317', '0,100001,3305,3317', '元朗区', '810307', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3325', '3317', '0,100001,3305,3317', '葵青区', '810308', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3326', '3317', '0,100001,3305,3317', '离岛区', '810309', '00852', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3327', '100001', '0,100001', '澳门特别行政区', '820000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3328', '3327', '0,100001,3327', '澳门半岛', '820100', '00853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3329', '3328', '0,100001,3327,3328', '花地玛堂区', '820101', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('333', '318', '0,100001,219,318', '汾西县', '141034', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3330', '3328', '0,100001,3327,3328', '圣安多尼堂区', '820102', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3331', '3328', '0,100001,3327,3328', '大堂区', '820103', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3332', '3328', '0,100001,3327,3328', '望德堂区', '820104', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3333', '3328', '0,100001,3327,3328', '风顺堂区', '820105', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3334', '3327', '0,100001,3327', '澳门离岛', '820200', '00853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3335', '3334', '0,100001,3327,3334', '嘉模堂区', '820201', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3336', '3334', '0,100001,3327,3334', '圣方济各堂区', '820202', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3337', '3327', '0,100001,3327', '无堂区划分区域', '820300', '00853', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('3338', '3337', '0,100001,3327,3337', '路氹城', '820301', '00853', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('334', '318', '0,100001,219,318', '侯马市', '141081', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('335', '318', '0,100001,219,318', '霍州市', '141082', '0357', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('336', '219', '0,100001,219', '吕梁市', '141100', '0358', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('337', '336', '0,100001,219,336', '离石区', '141102', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('338', '336', '0,100001,219,336', '文水县', '141121', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('339', '336', '0,100001,219,336', '交城县', '141122', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('34', '18', '0,100001,18', '蓟县', '120225', '022', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('340', '336', '0,100001,219,336', '兴县', '141123', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('341', '336', '0,100001,219,336', '临县', '141124', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('342', '336', '0,100001,219,336', '柳林县', '141125', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('343', '336', '0,100001,219,336', '石楼县', '141126', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('344', '336', '0,100001,219,336', '岚县', '141127', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('345', '336', '0,100001,219,336', '方山县', '141128', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('346', '336', '0,100001,219,336', '中阳县', '141129', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('347', '336', '0,100001,219,336', '交口县', '141130', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('348', '336', '0,100001,219,336', '孝义市', '141181', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('349', '336', '0,100001,219,336', '汾阳市', '141182', '0358', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('35', '100001', '0,100001', '河北省', '130000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('350', '100001', '0,100001', '内蒙古自治区', '150000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('351', '350', '0,100001,350', '呼和浩特市', '150100', '0471', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('352', '351', '0,100001,350,351', '新城区', '150102', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('353', '351', '0,100001,350,351', '回民区', '150103', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('354', '351', '0,100001,350,351', '玉泉区', '150104', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('355', '351', '0,100001,350,351', '赛罕区', '150105', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('356', '351', '0,100001,350,351', '土默特左旗', '150121', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('357', '351', '0,100001,350,351', '托克托县', '150122', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('358', '351', '0,100001,350,351', '和林格尔县', '150123', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('359', '351', '0,100001,350,351', '清水河县', '150124', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('36', '35', '0,100001,35', '石家庄市', '130100', '0311', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('360', '351', '0,100001,350,351', '武川县', '150125', '0471', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('361', '350', '0,100001,350', '包头市', '150200', '0472', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('362', '361', '0,100001,350,361', '东河区', '150202', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('363', '361', '0,100001,350,361', '昆都仑区', '150203', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('364', '361', '0,100001,350,361', '青山区', '150204', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('365', '361', '0,100001,350,361', '石拐区', '150205', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('366', '361', '0,100001,350,361', '白云鄂博矿区', '150206', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('367', '361', '0,100001,350,361', '九原区', '150207', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('368', '361', '0,100001,350,361', '土默特右旗', '150221', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('369', '361', '0,100001,350,361', '固阳县', '150222', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('37', '36', '0,100001,35,36', '长安区', '130102', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('370', '361', '0,100001,350,361', '达尔罕茂明安联合旗', '150223', '0472', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('371', '350', '0,100001,350', '乌海市', '150300', '0473', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('372', '371', '0,100001,350,371', '海勃湾区', '150302', '0473', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('373', '371', '0,100001,350,371', '海南区', '150303', '0473', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('374', '371', '0,100001,350,371', '乌达区', '150304', '0473', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('375', '350', '0,100001,350', '赤峰市', '150400', '0476', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('376', '375', '0,100001,350,375', '红山区', '150402', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('377', '375', '0,100001,350,375', '元宝山区', '150403', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('378', '375', '0,100001,350,375', '松山区', '150404', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('379', '375', '0,100001,350,375', '阿鲁科尔沁旗', '150421', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('38', '36', '0,100001,35,36', '桥东区', '130103', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('380', '375', '0,100001,350,375', '巴林左旗', '150422', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('381', '375', '0,100001,350,375', '巴林右旗', '150423', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('382', '375', '0,100001,350,375', '林西县', '150424', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('383', '375', '0,100001,350,375', '克什克腾旗', '150425', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('384', '375', '0,100001,350,375', '翁牛特旗', '150426', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('385', '375', '0,100001,350,375', '喀喇沁旗', '150428', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('386', '375', '0,100001,350,375', '宁城县', '150429', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('387', '375', '0,100001,350,375', '敖汉旗', '150430', '0476', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('388', '350', '0,100001,350', '通辽市', '150500', '0475', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('389', '388', '0,100001,350,388', '科尔沁区', '150502', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('39', '36', '0,100001,35,36', '桥西区', '130104', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('390', '388', '0,100001,350,388', '科尔沁左翼中旗', '150521', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('391', '388', '0,100001,350,388', '科尔沁左翼后旗', '150522', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('392', '388', '0,100001,350,388', '开鲁县', '150523', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('393', '388', '0,100001,350,388', '库伦旗', '150524', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('394', '388', '0,100001,350,388', '奈曼旗', '150525', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('395', '388', '0,100001,350,388', '扎鲁特旗', '150526', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('396', '388', '0,100001,350,388', '霍林郭勒市', '150581', '0475', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('397', '350', '0,100001,350', '鄂尔多斯市', '150600', '0477', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('398', '397', '0,100001,350,397', '东胜区', '150602', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('399', '397', '0,100001,350,397', '达拉特旗', '150621', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('4', '1', '0,100001,1', '朝阳区', '110105', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('40', '36', '0,100001,35,36', '新华区', '130105', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('400', '397', '0,100001,350,397', '准格尔旗', '150622', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('401', '397', '0,100001,350,397', '鄂托克前旗', '150623', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('402', '397', '0,100001,350,397', '鄂托克旗', '150624', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('403', '397', '0,100001,350,397', '杭锦旗', '150625', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('404', '397', '0,100001,350,397', '乌审旗', '150626', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('405', '397', '0,100001,350,397', '伊金霍洛旗', '150627', '0477', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('406', '350', '0,100001,350', '呼伦贝尔市', '150700', '0470', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('407', '406', '0,100001,350,406', '海拉尔区', '150702', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('408', '406', '0,100001,350,406', '阿荣旗', '150721', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('409', '406', '0,100001,350,406', '莫力达瓦达斡尔族自治旗', '150722', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('41', '36', '0,100001,35,36', '井陉矿区', '130107', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('410', '406', '0,100001,350,406', '鄂伦春自治旗', '150723', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('411', '406', '0,100001,350,406', '鄂温克族自治旗', '150724', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('412', '406', '0,100001,350,406', '陈巴尔虎旗', '150725', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('413', '406', '0,100001,350,406', '新巴尔虎左旗', '150726', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('414', '406', '0,100001,350,406', '新巴尔虎右旗', '150727', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('415', '406', '0,100001,350,406', '满洲里市', '150781', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('416', '406', '0,100001,350,406', '牙克石市', '150782', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('417', '406', '0,100001,350,406', '扎兰屯市', '150783', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('418', '406', '0,100001,350,406', '额尔古纳市', '150784', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('419', '406', '0,100001,350,406', '根河市', '150785', '0470', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('42', '36', '0,100001,35,36', '裕华区', '130108', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('420', '350', '0,100001,350', '巴彦淖尔市', '150800', '0478', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('421', '420', '0,100001,350,420', '临河区', '150802', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('422', '420', '0,100001,350,420', '五原县', '150821', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('423', '420', '0,100001,350,420', '磴口县', '150822', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('424', '420', '0,100001,350,420', '乌拉特前旗', '150823', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('425', '420', '0,100001,350,420', '乌拉特中旗', '150824', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('426', '420', '0,100001,350,420', '乌拉特后旗', '150825', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('427', '420', '0,100001,350,420', '杭锦后旗', '150826', '0478', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('428', '350', '0,100001,350', '乌兰察布市', '150900', '0474', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('429', '428', '0,100001,350,428', '集宁区', '150902', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('43', '36', '0,100001,35,36', '井陉县', '130121', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('430', '428', '0,100001,350,428', '卓资县', '150921', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('431', '428', '0,100001,350,428', '化德县', '150922', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('432', '428', '0,100001,350,428', '商都县', '150923', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('433', '428', '0,100001,350,428', '兴和县', '150924', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('434', '428', '0,100001,350,428', '凉城县', '150925', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('435', '428', '0,100001,350,428', '察哈尔右翼前旗', '150926', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('436', '428', '0,100001,350,428', '察哈尔右翼中旗', '150927', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('437', '428', '0,100001,350,428', '察哈尔右翼后旗', '150928', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('438', '428', '0,100001,350,428', '四子王旗', '150929', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('439', '428', '0,100001,350,428', '丰镇市', '150981', '0474', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('44', '36', '0,100001,35,36', '正定县', '130123', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('440', '350', '0,100001,350', '兴安盟', '152200', '0482', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('441', '440', '0,100001,350,440', '乌兰浩特市', '152201', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('442', '440', '0,100001,350,440', '阿尔山市', '152202', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('443', '440', '0,100001,350,440', '科尔沁右翼前旗', '152221', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('444', '440', '0,100001,350,440', '科尔沁右翼中旗', '152222', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('445', '440', '0,100001,350,440', '扎赉特旗', '152223', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('446', '440', '0,100001,350,440', '突泉县', '152224', '0482', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('447', '350', '0,100001,350', '锡林郭勒盟', '152500', '0479', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('448', '447', '0,100001,350,447', '二连浩特市', '152501', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('449', '447', '0,100001,350,447', '锡林浩特市', '152502', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('45', '36', '0,100001,35,36', '栾城县', '130124', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('450', '447', '0,100001,350,447', '阿巴嘎旗', '152522', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('451', '447', '0,100001,350,447', '苏尼特左旗', '152523', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('452', '447', '0,100001,350,447', '苏尼特右旗', '152524', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('453', '447', '0,100001,350,447', '东乌珠穆沁旗', '152525', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('454', '447', '0,100001,350,447', '西乌珠穆沁旗', '152526', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('455', '447', '0,100001,350,447', '太仆寺旗', '152527', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('456', '447', '0,100001,350,447', '镶黄旗', '152528', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('457', '447', '0,100001,350,447', '正镶白旗', '152529', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('458', '447', '0,100001,350,447', '正蓝旗', '152530', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('459', '447', '0,100001,350,447', '多伦县', '152531', '0479', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('46', '36', '0,100001,35,36', '行唐县', '130125', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('460', '350', '0,100001,350', '阿拉善盟', '152900', '0483', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('461', '460', '0,100001,350,460', '阿拉善左旗', '152921', '0483', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('462', '460', '0,100001,350,460', '阿拉善右旗', '152922', '0483', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('463', '460', '0,100001,350,460', '额济纳旗', '152923', '0483', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('464', '100001', '0,100001', '辽宁省', '210000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('465', '464', '0,100001,464', '沈阳市', '210100', '024', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('466', '465', '0,100001,464,465', '和平区', '210102', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('467', '465', '0,100001,464,465', '沈河区', '210103', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('468', '465', '0,100001,464,465', '大东区', '210104', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('469', '465', '0,100001,464,465', '皇姑区', '210105', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('47', '36', '0,100001,35,36', '灵寿县', '130126', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('470', '465', '0,100001,464,465', '铁西区', '210106', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('471', '465', '0,100001,464,465', '苏家屯区', '210111', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('472', '465', '0,100001,464,465', '东陵区', '210112', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('473', '465', '0,100001,464,465', '沈北新区', '210113', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('474', '465', '0,100001,464,465', '于洪区', '210114', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('475', '465', '0,100001,464,465', '辽中县', '210122', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('476', '465', '0,100001,464,465', '康平县', '210123', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('477', '465', '0,100001,464,465', '法库县', '210124', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('478', '465', '0,100001,464,465', '新民市', '210181', '024', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('479', '464', '0,100001,464', '大连市', '210200', '0411', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('48', '36', '0,100001,35,36', '高邑县', '130127', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('480', '479', '0,100001,464,479', '中山区', '210202', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('481', '479', '0,100001,464,479', '西岗区', '210203', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('482', '479', '0,100001,464,479', '沙河口区', '210204', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('483', '479', '0,100001,464,479', '甘井子区', '210211', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('484', '479', '0,100001,464,479', '旅顺口区', '210212', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('485', '479', '0,100001,464,479', '金州区', '210213', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('486', '479', '0,100001,464,479', '长海县', '210224', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('487', '479', '0,100001,464,479', '瓦房店市', '210281', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('488', '479', '0,100001,464,479', '普兰店市', '210282', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('489', '479', '0,100001,464,479', '庄河市', '210283', '0411', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('49', '36', '0,100001,35,36', '深泽县', '130128', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('490', '464', '0,100001,464', '鞍山市', '210300', '0412', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('491', '490', '0,100001,464,490', '铁东区', '210302', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('492', '490', '0,100001,464,490', '铁西区', '210303', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('493', '490', '0,100001,464,490', '立山区', '210304', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('494', '490', '0,100001,464,490', '千山区', '210311', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('495', '490', '0,100001,464,490', '台安县', '210321', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('496', '490', '0,100001,464,490', '岫岩满族自治县', '210323', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('497', '490', '0,100001,464,490', '海城市', '210381', '0412', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('498', '464', '0,100001,464', '抚顺市', '210400', '0413', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('499', '498', '0,100001,464,498', '新抚区', '210402', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('5', '1', '0,100001,1', '丰台区', '110106', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('50', '36', '0,100001,35,36', '赞皇县', '130129', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('500', '498', '0,100001,464,498', '东洲区', '210403', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('501', '498', '0,100001,464,498', '望花区', '210404', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('502', '498', '0,100001,464,498', '顺城区', '210411', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('503', '498', '0,100001,464,498', '抚顺县', '210421', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('504', '498', '0,100001,464,498', '新宾满族自治县', '210422', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('505', '498', '0,100001,464,498', '清原满族自治县', '210423', '0413', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('506', '464', '0,100001,464', '本溪市', '210500', '0414', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('507', '506', '0,100001,464,506', '平山区', '210502', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('508', '506', '0,100001,464,506', '溪湖区', '210503', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('509', '506', '0,100001,464,506', '明山区', '210504', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('51', '36', '0,100001,35,36', '无极县', '130130', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('510', '506', '0,100001,464,506', '南芬区', '210505', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('511', '506', '0,100001,464,506', '本溪满族自治县', '210521', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('512', '506', '0,100001,464,506', '桓仁满族自治县', '210522', '0414', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('513', '464', '0,100001,464', '丹东市', '210600', '0415', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('514', '513', '0,100001,464,513', '元宝区', '210602', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('515', '513', '0,100001,464,513', '振兴区', '210603', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('516', '513', '0,100001,464,513', '振安区', '210604', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('517', '513', '0,100001,464,513', '宽甸满族自治县', '210624', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('518', '513', '0,100001,464,513', '东港市', '210681', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('519', '513', '0,100001,464,513', '凤城市', '210682', '0415', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('52', '36', '0,100001,35,36', '平山县', '130131', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('520', '464', '0,100001,464', '锦州市', '210700', '0416', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('521', '520', '0,100001,464,520', '古塔区', '210702', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('522', '520', '0,100001,464,520', '凌河区', '210703', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('523', '520', '0,100001,464,520', '太和区', '210711', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('524', '520', '0,100001,464,520', '黑山县', '210726', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('525', '520', '0,100001,464,520', '义县', '210727', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('526', '520', '0,100001,464,520', '凌海市', '210781', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('527', '520', '0,100001,464,520', '北镇市', '210782', '0416', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('528', '464', '0,100001,464', '营口市', '210800', '0417', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('529', '528', '0,100001,464,528', '站前区', '210802', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('53', '36', '0,100001,35,36', '元氏县', '130132', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('530', '528', '0,100001,464,528', '西市区', '210803', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('531', '528', '0,100001,464,528', '鲅鱼圈区', '210804', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('532', '528', '0,100001,464,528', '老边区', '210811', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('533', '528', '0,100001,464,528', '盖州市', '210881', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('534', '528', '0,100001,464,528', '大石桥市', '210882', '0417', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('535', '464', '0,100001,464', '阜新市', '210900', '0418', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('536', '535', '0,100001,464,535', '海州区', '210902', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('537', '535', '0,100001,464,535', '新邱区', '210903', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('538', '535', '0,100001,464,535', '太平区', '210904', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('539', '535', '0,100001,464,535', '清河门区', '210905', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('54', '36', '0,100001,35,36', '赵县', '130133', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('540', '535', '0,100001,464,535', '细河区', '210911', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('541', '535', '0,100001,464,535', '阜新蒙古族自治县', '210921', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('542', '535', '0,100001,464,535', '彰武县', '210922', '0418', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('543', '464', '0,100001,464', '辽阳市', '211000', '0419', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('544', '543', '0,100001,464,543', '白塔区', '211002', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('545', '543', '0,100001,464,543', '文圣区', '211003', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('546', '543', '0,100001,464,543', '宏伟区', '211004', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('547', '543', '0,100001,464,543', '弓长岭区', '211005', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('548', '543', '0,100001,464,543', '太子河区', '211011', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('549', '543', '0,100001,464,543', '辽阳县', '211021', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('55', '36', '0,100001,35,36', '辛集市', '130181', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('550', '543', '0,100001,464,543', '灯塔市', '211081', '0419', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('551', '464', '0,100001,464', '盘锦市', '211100', '0427', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('552', '551', '0,100001,464,551', '双台子区', '211102', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('553', '551', '0,100001,464,551', '兴隆台区', '211103', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('554', '551', '0,100001,464,551', '大洼县', '211121', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('555', '551', '0,100001,464,551', '盘山县', '211122', '0427', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('556', '464', '0,100001,464', '铁岭市', '211200', '0410', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('557', '556', '0,100001,464,556', '银州区', '211202', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('558', '556', '0,100001,464,556', '清河区', '211204', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('559', '556', '0,100001,464,556', '铁岭县', '211221', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('56', '36', '0,100001,35,36', '藁城市', '130182', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('560', '556', '0,100001,464,556', '西丰县', '211223', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('561', '556', '0,100001,464,556', '昌图县', '211224', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('562', '556', '0,100001,464,556', '调兵山市', '211281', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('563', '556', '0,100001,464,556', '开原市', '211282', '0410', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('564', '464', '0,100001,464', '朝阳市', '211300', '0421', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('565', '564', '0,100001,464,564', '双塔区', '211302', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('566', '564', '0,100001,464,564', '龙城区', '211303', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('567', '564', '0,100001,464,564', '朝阳县', '211321', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('568', '564', '0,100001,464,564', '建平县', '211322', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('569', '564', '0,100001,464,564', '喀喇沁左翼蒙古族自治县', '211324', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('57', '36', '0,100001,35,36', '晋州市', '130183', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('570', '564', '0,100001,464,564', '北票市', '211381', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('571', '564', '0,100001,464,564', '凌源市', '211382', '0421', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('572', '464', '0,100001,464', '葫芦岛市', '211400', '0429', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('573', '572', '0,100001,464,572', '连山区', '211402', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('574', '572', '0,100001,464,572', '龙港区', '211403', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('575', '572', '0,100001,464,572', '南票区', '211404', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('576', '572', '0,100001,464,572', '绥中县', '211421', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('577', '572', '0,100001,464,572', '建昌县', '211422', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('578', '572', '0,100001,464,572', '兴城市', '211481', '0429', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('579', '100001', '0,100001', '吉林省', '220000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('58', '36', '0,100001,35,36', '新乐市', '130184', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('580', '579', '0,100001,579', '长春市', '220100', '0431', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('581', '580', '0,100001,579,580', '南关区', '220102', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('582', '580', '0,100001,579,580', '宽城区', '220103', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('583', '580', '0,100001,579,580', '朝阳区', '220104', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('584', '580', '0,100001,579,580', '二道区', '220105', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('585', '580', '0,100001,579,580', '绿园区', '220106', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('586', '580', '0,100001,579,580', '双阳区', '220112', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('587', '580', '0,100001,579,580', '农安县', '220122', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('588', '580', '0,100001,579,580', '九台市', '220181', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('589', '580', '0,100001,579,580', '榆树市', '220182', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('59', '36', '0,100001,35,36', '鹿泉市', '130185', '0311', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('590', '580', '0,100001,579,580', '德惠市', '220183', '0431', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('591', '579', '0,100001,579', '吉林市', '220200', '0432', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('592', '591', '0,100001,579,591', '昌邑区', '220202', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('593', '591', '0,100001,579,591', '龙潭区', '220203', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('594', '591', '0,100001,579,591', '船营区', '220204', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('595', '591', '0,100001,579,591', '丰满区', '220211', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('596', '591', '0,100001,579,591', '永吉县', '220221', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('597', '591', '0,100001,579,591', '蛟河市', '220281', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('598', '591', '0,100001,579,591', '桦甸市', '220282', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('599', '591', '0,100001,579,591', '舒兰市', '220283', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('6', '1', '0,100001,1', '石景山区', '110107', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('60', '35', '0,100001,35', '唐山市', '130200', '0315', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('600', '591', '0,100001,579,591', '磐石市', '220284', '0432', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('601', '579', '0,100001,579', '四平市', '220300', '0434', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('602', '601', '0,100001,579,601', '铁西区', '220302', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('603', '601', '0,100001,579,601', '铁东区', '220303', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('604', '601', '0,100001,579,601', '梨树县', '220322', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('605', '601', '0,100001,579,601', '伊通满族自治县', '220323', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('606', '601', '0,100001,579,601', '公主岭市', '220381', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('607', '601', '0,100001,579,601', '双辽市', '220382', '0434', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('608', '579', '0,100001,579', '辽源市', '220400', '0437', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('609', '608', '0,100001,579,608', '龙山区', '220402', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('61', '60', '0,100001,35,60', '路南区', '130202', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('610', '608', '0,100001,579,608', '西安区', '220403', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('611', '608', '0,100001,579,608', '东丰县', '220421', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('612', '608', '0,100001,579,608', '东辽县', '220422', '0437', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('613', '579', '0,100001,579', '通化市', '220500', '0435', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('614', '613', '0,100001,579,613', '东昌区', '220502', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('615', '613', '0,100001,579,613', '二道江区', '220503', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('616', '613', '0,100001,579,613', '通化县', '220521', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('617', '613', '0,100001,579,613', '辉南县', '220523', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('618', '613', '0,100001,579,613', '柳河县', '220524', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('619', '613', '0,100001,579,613', '梅河口市', '220581', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('62', '60', '0,100001,35,60', '路北区', '130203', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('620', '613', '0,100001,579,613', '集安市', '220582', '0435', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('621', '579', '0,100001,579', '白山市', '220600', '0439', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('622', '621', '0,100001,579,621', '浑江区', '220602', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('623', '621', '0,100001,579,621', '江源区', '220605', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('624', '621', '0,100001,579,621', '抚松县', '220621', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('625', '621', '0,100001,579,621', '靖宇县', '220622', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('626', '621', '0,100001,579,621', '长白朝鲜族自治县', '220623', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('627', '621', '0,100001,579,621', '临江市', '220681', '0439', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('628', '579', '0,100001,579', '松原市', '220700', '0438', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('629', '628', '0,100001,579,628', '宁江区', '220702', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('63', '60', '0,100001,35,60', '古冶区', '130204', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('630', '628', '0,100001,579,628', '前郭尔罗斯蒙古族自治县', '220721', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('631', '628', '0,100001,579,628', '长岭县', '220722', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('632', '628', '0,100001,579,628', '乾安县', '220723', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('633', '628', '0,100001,579,628', '扶余县', '220724', '0438', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('634', '579', '0,100001,579', '白城市', '220800', '0436', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('635', '634', '0,100001,579,634', '洮北区', '220802', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('636', '634', '0,100001,579,634', '镇赉县', '220821', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('637', '634', '0,100001,579,634', '通榆县', '220822', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('638', '634', '0,100001,579,634', '洮南市', '220881', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('639', '634', '0,100001,579,634', '大安市', '220882', '0436', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('64', '60', '0,100001,35,60', '开平区', '130205', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('640', '579', '0,100001,579', '延边朝鲜族自治州', '222400', '0433', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('641', '640', '0,100001,579,640', '延吉市', '222401', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('642', '640', '0,100001,579,640', '图们市', '222402', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('643', '640', '0,100001,579,640', '敦化市', '222403', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('644', '640', '0,100001,579,640', '珲春市', '222404', '0440', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('645', '640', '0,100001,579,640', '龙井市', '222405', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('646', '640', '0,100001,579,640', '和龙市', '222406', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('647', '640', '0,100001,579,640', '汪清县', '222424', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('648', '640', '0,100001,579,640', '安图县', '222426', '0433', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('649', '100001', '0,100001', '黑龙江省', '230000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('65', '60', '0,100001,35,60', '丰南区', '130207', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('650', '649', '0,100001,649', '哈尔滨市', '230100', '0451', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('651', '650', '0,100001,649,650', '道里区', '230102', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('652', '650', '0,100001,649,650', '南岗区', '230103', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('653', '650', '0,100001,649,650', '道外区', '230104', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('654', '650', '0,100001,649,650', '平房区', '230108', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('655', '650', '0,100001,649,650', '松北区', '230109', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('656', '650', '0,100001,649,650', '香坊区', '230110', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('657', '650', '0,100001,649,650', '呼兰区', '230111', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('658', '650', '0,100001,649,650', '阿城区', '230112', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('659', '650', '0,100001,649,650', '依兰县', '230123', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('66', '60', '0,100001,35,60', '丰润区', '130208', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('660', '650', '0,100001,649,650', '方正县', '230124', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('661', '650', '0,100001,649,650', '宾县', '230125', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('662', '650', '0,100001,649,650', '巴彦县', '230126', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('663', '650', '0,100001,649,650', '木兰县', '230127', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('664', '650', '0,100001,649,650', '通河县', '230128', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('665', '650', '0,100001,649,650', '延寿县', '230129', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('666', '650', '0,100001,649,650', '双城市', '230182', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('667', '650', '0,100001,649,650', '尚志市', '230183', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('668', '650', '0,100001,649,650', '五常市', '230184', '0451', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('669', '649', '0,100001,649', '齐齐哈尔市', '230200', '0452', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('67', '60', '0,100001,35,60', '滦县', '130223', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('670', '669', '0,100001,649,669', '龙沙区', '230202', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('671', '669', '0,100001,649,669', '建华区', '230203', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('672', '669', '0,100001,649,669', '铁锋区', '230204', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('673', '669', '0,100001,649,669', '昂昂溪区', '230205', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('674', '669', '0,100001,649,669', '富拉尔基区', '230206', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('675', '669', '0,100001,649,669', '碾子山区', '230207', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('676', '669', '0,100001,649,669', '梅里斯达斡尔族区', '230208', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('677', '669', '0,100001,649,669', '龙江县', '230221', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('678', '669', '0,100001,649,669', '依安县', '230223', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('679', '669', '0,100001,649,669', '泰来县', '230224', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('68', '60', '0,100001,35,60', '滦南县', '130224', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('680', '669', '0,100001,649,669', '甘南县', '230225', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('681', '669', '0,100001,649,669', '富裕县', '230227', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('682', '669', '0,100001,649,669', '克山县', '230229', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('683', '669', '0,100001,649,669', '克东县', '230230', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('684', '669', '0,100001,649,669', '拜泉县', '230231', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('685', '669', '0,100001,649,669', '讷河市', '230281', '0452', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('686', '649', '0,100001,649', '鸡西市', '230300', '0467', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('687', '686', '0,100001,649,686', '鸡冠区', '230302', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('688', '686', '0,100001,649,686', '恒山区', '230303', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('689', '686', '0,100001,649,686', '滴道区', '230304', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('69', '60', '0,100001,35,60', '乐亭县', '130225', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('690', '686', '0,100001,649,686', '梨树区', '230305', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('691', '686', '0,100001,649,686', '城子河区', '230306', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('692', '686', '0,100001,649,686', '麻山区', '230307', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('693', '686', '0,100001,649,686', '鸡东县', '230321', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('694', '686', '0,100001,649,686', '虎林市', '230381', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('695', '686', '0,100001,649,686', '密山市', '230382', '0467', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('696', '649', '0,100001,649', '鹤岗市', '230400', '0468', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('697', '696', '0,100001,649,696', '向阳区', '230402', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('698', '696', '0,100001,649,696', '工农区', '230403', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('699', '696', '0,100001,649,696', '南山区', '230404', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('7', '1', '0,100001,1', '海淀区', '110108', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('70', '60', '0,100001,35,60', '迁西县', '130227', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('700', '696', '0,100001,649,696', '兴安区', '230405', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('701', '696', '0,100001,649,696', '东山区', '230406', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('702', '696', '0,100001,649,696', '兴山区', '230407', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('703', '696', '0,100001,649,696', '萝北县', '230421', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('704', '696', '0,100001,649,696', '绥滨县', '230422', '0468', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('705', '649', '0,100001,649', '双鸭山市', '230500', '0469', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('706', '705', '0,100001,649,705', '尖山区', '230502', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('707', '705', '0,100001,649,705', '岭东区', '230503', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('708', '705', '0,100001,649,705', '四方台区', '230505', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('709', '705', '0,100001,649,705', '宝山区', '230506', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('71', '60', '0,100001,35,60', '玉田县', '130229', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('710', '705', '0,100001,649,705', '集贤县', '230521', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('711', '705', '0,100001,649,705', '友谊县', '230522', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('712', '705', '0,100001,649,705', '宝清县', '230523', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('713', '705', '0,100001,649,705', '饶河县', '230524', '0469', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('714', '649', '0,100001,649', '大庆市', '230600', '0459', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('715', '714', '0,100001,649,714', '萨尔图区', '230602', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('716', '714', '0,100001,649,714', '龙凤区', '230603', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('717', '714', '0,100001,649,714', '让胡路区', '230604', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('718', '714', '0,100001,649,714', '红岗区', '230605', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('719', '714', '0,100001,649,714', '大同区', '230606', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('72', '60', '0,100001,35,60', '曹妃甸区', '130230', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('720', '714', '0,100001,649,714', '肇州县', '230621', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('721', '714', '0,100001,649,714', '肇源县', '230622', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('722', '714', '0,100001,649,714', '林甸县', '230623', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('723', '714', '0,100001,649,714', '杜尔伯特蒙古族自治县', '230624', '0459', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('724', '649', '0,100001,649', '伊春市', '230700', '0458', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('725', '724', '0,100001,649,724', '伊春区', '230702', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('726', '724', '0,100001,649,724', '南岔区', '230703', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('727', '724', '0,100001,649,724', '友好区', '230704', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('728', '724', '0,100001,649,724', '西林区', '230705', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('729', '724', '0,100001,649,724', '翠峦区', '230706', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('73', '60', '0,100001,35,60', '遵化市', '130281', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('730', '724', '0,100001,649,724', '新青区', '230707', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('731', '724', '0,100001,649,724', '美溪区', '230708', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('732', '724', '0,100001,649,724', '金山屯区', '230709', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('733', '724', '0,100001,649,724', '五营区', '230710', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('734', '724', '0,100001,649,724', '乌马河区', '230711', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('735', '724', '0,100001,649,724', '汤旺河区', '230712', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('736', '724', '0,100001,649,724', '带岭区', '230713', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('737', '724', '0,100001,649,724', '乌伊岭区', '230714', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('738', '724', '0,100001,649,724', '红星区', '230715', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('739', '724', '0,100001,649,724', '上甘岭区', '230716', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('74', '60', '0,100001,35,60', '迁安市', '130283', '0315', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('740', '724', '0,100001,649,724', '嘉荫县', '230722', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('741', '724', '0,100001,649,724', '铁力市', '230781', '0458', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('742', '649', '0,100001,649', '佳木斯市', '230800', '0454', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('743', '742', '0,100001,649,742', '向阳区', '230803', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('744', '742', '0,100001,649,742', '前进区', '230804', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('745', '742', '0,100001,649,742', '东风区', '230805', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('746', '742', '0,100001,649,742', '郊区', '230811', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('747', '742', '0,100001,649,742', '桦南县', '230822', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('748', '742', '0,100001,649,742', '桦川县', '230826', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('749', '742', '0,100001,649,742', '汤原县', '230828', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('75', '35', '0,100001,35', '秦皇岛市', '130300', '0335', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('750', '742', '0,100001,649,742', '抚远县', '230833', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('751', '742', '0,100001,649,742', '同江市', '230881', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('752', '742', '0,100001,649,742', '富锦市', '230882', '0454', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('753', '649', '0,100001,649', '七台河市', '230900', '0464', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('754', '753', '0,100001,649,753', '新兴区', '230902', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('755', '753', '0,100001,649,753', '桃山区', '230903', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('756', '753', '0,100001,649,753', '茄子河区', '230904', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('757', '753', '0,100001,649,753', '勃利县', '230921', '0464', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('758', '649', '0,100001,649', '牡丹江市', '231000', '0453', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('759', '758', '0,100001,649,758', '东安区', '231002', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('76', '75', '0,100001,35,75', '海港区', '130302', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('760', '758', '0,100001,649,758', '阳明区', '231003', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('761', '758', '0,100001,649,758', '爱民区', '231004', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('762', '758', '0,100001,649,758', '西安区', '231005', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('763', '758', '0,100001,649,758', '东宁县', '231024', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('764', '758', '0,100001,649,758', '林口县', '231025', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('765', '758', '0,100001,649,758', '绥芬河市', '231081', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('766', '758', '0,100001,649,758', '海林市', '231083', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('767', '758', '0,100001,649,758', '宁安市', '231084', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('768', '758', '0,100001,649,758', '穆棱市', '231085', '0453', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('769', '649', '0,100001,649', '黑河市', '231100', '0456', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('77', '75', '0,100001,35,75', '山海关区', '130303', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('770', '769', '0,100001,649,769', '爱辉区', '231102', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('771', '769', '0,100001,649,769', '嫩江县', '231121', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('772', '769', '0,100001,649,769', '逊克县', '231123', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('773', '769', '0,100001,649,769', '孙吴县', '231124', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('774', '769', '0,100001,649,769', '北安市', '231181', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('775', '769', '0,100001,649,769', '五大连池市', '231182', '0456', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('776', '649', '0,100001,649', '绥化市', '231200', '0455', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('777', '776', '0,100001,649,776', '北林区', '231202', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('778', '776', '0,100001,649,776', '望奎县', '231221', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('779', '776', '0,100001,649,776', '兰西县', '231222', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('78', '75', '0,100001,35,75', '北戴河区', '130304', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('780', '776', '0,100001,649,776', '青冈县', '231223', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('781', '776', '0,100001,649,776', '庆安县', '231224', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('782', '776', '0,100001,649,776', '明水县', '231225', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('783', '776', '0,100001,649,776', '绥棱县', '231226', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('784', '776', '0,100001,649,776', '安达市', '231281', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('785', '776', '0,100001,649,776', '肇东市', '231282', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('786', '776', '0,100001,649,776', '海伦市', '231283', '0455', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('787', '649', '0,100001,649', '大兴安岭地区', '232700', '0457', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('788', '787', '0,100001,649,787', '加格达奇区', '232701', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('789', '787', '0,100001,649,787', '松岭区', '232702', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('79', '75', '0,100001,35,75', '青龙满族自治县', '130321', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('790', '787', '0,100001,649,787', '新林区', '232703', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('791', '787', '0,100001,649,787', '呼中区', '232704', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('792', '787', '0,100001,649,787', '呼玛县', '232721', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('793', '787', '0,100001,649,787', '塔河县', '232722', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('794', '787', '0,100001,649,787', '漠河县', '232723', '0457', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('795', '100001', '0100001,', '上海市', '310000', '021', '2', 'yyx', '2015-07-13 11:44:57', '1', '2015-07-13 13:27:35', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('796', '795', '0,100001,795', '黄浦区', '310101', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('797', '795', '0,100001,795', '徐汇区', '310104', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('798', '795', '0,100001,795', '长宁区', '310105', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('799', '795', '0,100001,795', '静安区', '310106', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('8', '1', '0,100001,1', '门头沟区', '110109', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('80', '75', '0,100001,35,75', '昌黎县', '130322', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('800', '795', '0,100001,795', '普陀区', '310107', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('801', '795', '0,100001,795', '闸北区', '310108', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('802', '795', '0,100001,795', '虹口区', '310109', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('803', '795', '0,100001,795', '杨浦区', '310110', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('804', '795', '0,100001,795', '闵行区', '310112', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('805', '795', '0,100001,795', '宝山区', '310113', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('806', '795', '0,100001,795', '嘉定区', '310114', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('807', '795', '0,100001,795', '浦东新区', '310115', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('808', '795', '0,100001,795', '金山区', '310116', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('809', '795', '0,100001,795', '松江区', '310117', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('81', '75', '0,100001,35,75', '抚宁县', '130323', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('810', '795', '0,100001,795', '青浦区', '310118', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('811', '795', '0,100001,795', '奉贤区', '310120', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('812', '795', '0,100001,795', '崇明县', '310230', '021', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('813', '100001', '0,100001', '江苏省', '320000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('814', '813', '0,100001,813', '南京市', '320100', '025', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('815', '814', '0,100001,813,814', '玄武区', '320102', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('816', '814', '0,100001,813,814', '白下区', '320103', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('817', '814', '0,100001,813,814', '秦淮区', '320104', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('818', '814', '0,100001,813,814', '建邺区', '320105', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('819', '814', '0,100001,813,814', '鼓楼区', '320106', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('82', '75', '0,100001,35,75', '卢龙县', '130324', '0335', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('820', '814', '0,100001,813,814', '下关区', '320107', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('821', '814', '0,100001,813,814', '浦口区', '320111', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('822', '814', '0,100001,813,814', '栖霞区', '320113', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('823', '814', '0,100001,813,814', '雨花台区', '320114', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('824', '814', '0,100001,813,814', '江宁区', '320115', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('825', '814', '0,100001,813,814', '六合区', '320116', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('826', '814', '0,100001,813,814', '溧水县', '320124', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('827', '814', '0,100001,813,814', '高淳县', '320125', '025', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('828', '813', '0,100001,813', '无锡市', '320200', '0510', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('829', '828', '0,100001,813,828', '崇安区', '320202', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('83', '35', '0,100001,35', '邯郸市', '130400', '0310', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('830', '828', '0,100001,813,828', '南长区', '320203', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('831', '828', '0,100001,813,828', '北塘区', '320204', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('832', '828', '0,100001,813,828', '锡山区', '320205', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('833', '828', '0,100001,813,828', '惠山区', '320206', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('834', '828', '0,100001,813,828', '滨湖区', '320211', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('835', '828', '0,100001,813,828', '江阴市', '320281', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('836', '828', '0,100001,813,828', '宜兴市', '320282', '0510', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('837', '813', '0,100001,813', '徐州市', '320300', '0516', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('838', '837', '0,100001,813,837', '鼓楼区', '320302', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('839', '837', '0,100001,813,837', '云龙区', '320303', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('84', '83', '0,100001,35,83', '邯山区', '130402', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('840', '837', '0,100001,813,837', '贾汪区', '320305', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('841', '837', '0,100001,813,837', '泉山区', '320311', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('842', '837', '0,100001,813,837', '铜山区', '320312', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('843', '837', '0,100001,813,837', '丰县', '320321', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('844', '837', '0,100001,813,837', '沛县', '320322', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('845', '837', '0,100001,813,837', '睢宁县', '320324', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('846', '837', '0,100001,813,837', '新沂市', '320381', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('847', '837', '0,100001,813,837', '邳州市', '320382', '0516', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('848', '813', '0,100001,813', '常州市', '320400', '0519', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('849', '848', '0,100001,813,848', '天宁区', '320402', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('85', '83', '0,100001,35,83', '丛台区', '130403', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('850', '848', '0,100001,813,848', '钟楼区', '320404', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('851', '848', '0,100001,813,848', '戚墅堰区', '320405', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('852', '848', '0,100001,813,848', '新北区', '320411', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('853', '848', '0,100001,813,848', '武进区', '320412', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('854', '848', '0,100001,813,848', '溧阳市', '320481', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('855', '848', '0,100001,813,848', '金坛市', '320482', '0519', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('856', '813', '0,100001,813', '苏州市', '320500', '0512', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('857', '856', '0,100001,813,856', '姑苏区', '320503', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('858', '856', '0,100001,813,856', '虎丘区', '320505', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('859', '856', '0,100001,813,856', '吴中区', '320506', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('86', '83', '0,100001,35,83', '复兴区', '130404', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('860', '856', '0,100001,813,856', '相城区', '320507', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('861', '856', '0,100001,813,856', '常熟市', '320581', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('862', '856', '0,100001,813,856', '张家港市', '320582', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('863', '856', '0,100001,813,856', '昆山市', '320583', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('864', '856', '0,100001,813,856', '吴江区', '320584', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('865', '856', '0,100001,813,856', '太仓市', '320585', '0512', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('866', '813', '0,100001,813', '南通市', '320600', '0513', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('867', '866', '0,100001,813,866', '崇川区', '320602', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('868', '866', '0,100001,813,866', '港闸区', '320611', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('869', '866', '0,100001,813,866', '通州区', '320612', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('87', '83', '0,100001,35,83', '峰峰矿区', '130406', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('870', '866', '0,100001,813,866', '海安县', '320621', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('871', '866', '0,100001,813,866', '如东县', '320623', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('872', '866', '0,100001,813,866', '启东市', '320681', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('873', '866', '0,100001,813,866', '如皋市', '320682', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('874', '866', '0,100001,813,866', '海门市', '320684', '0513', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('875', '813', '0,100001,813', '连云港市', '320700', '0518', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('876', '875', '0,100001,813,875', '连云区', '320703', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('877', '875', '0,100001,813,875', '新浦区', '320705', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('878', '875', '0,100001,813,875', '海州区', '320706', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('879', '875', '0,100001,813,875', '赣榆县', '320721', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('88', '83', '0,100001,35,83', '邯郸县', '130421', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('880', '875', '0,100001,813,875', '东海县', '320722', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('881', '875', '0,100001,813,875', '灌云县', '320723', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('882', '875', '0,100001,813,875', '灌南县', '320724', '0518', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('883', '813', '0,100001,813', '淮安市', '320800', '0517', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('884', '883', '0,100001,813,883', '清河区', '320802', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('885', '883', '0,100001,813,883', '淮安区', '320803', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('886', '883', '0,100001,813,883', '淮阴区', '320804', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('887', '883', '0,100001,813,883', '青浦区', '320811', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('888', '883', '0,100001,813,883', '涟水县', '320826', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('889', '883', '0,100001,813,883', '洪泽县', '320829', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('89', '83', '0,100001,35,83', '临漳县', '130423', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('890', '883', '0,100001,813,883', '盱眙县', '320830', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('891', '883', '0,100001,813,883', '金湖县', '320831', '0517', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('892', '813', '0,100001,813', '盐城市', '320900', '0515', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('893', '892', '0,100001,813,892', '亭湖区', '320902', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('894', '892', '0,100001,813,892', '盐都区', '320903', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('895', '892', '0,100001,813,892', '响水县', '320921', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('896', '892', '0,100001,813,892', '滨海县', '320922', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('897', '892', '0,100001,813,892', '阜宁县', '320923', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('898', '892', '0,100001,813,892', '射阳县', '320924', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('899', '892', '0,100001,813,892', '建湖县', '320925', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('9', '1', '0,100001,1', '房山区', '110111', '010', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('90', '83', '0,100001,35,83', '成安县', '130424', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('900', '892', '0,100001,813,892', '东台市', '320981', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('901', '892', '0,100001,813,892', '大丰市', '320982', '0515', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('902', '813', '0,100001,813', '扬州市', '321000', '0514', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('903', '902', '0,100001,813,902', '广陵区', '321002', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('904', '902', '0,100001,813,902', '邗江区', '321003', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('905', '902', '0,100001,813,902', '宝应县', '321023', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('906', '902', '0,100001,813,902', '仪征市', '321081', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('907', '902', '0,100001,813,902', '高邮市', '321084', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('908', '902', '0,100001,813,902', '江都市', '321088', '0514', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('909', '813', '0,100001,813', '镇江市', '321100', '0511', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('91', '83', '0,100001,35,83', '大名县', '130425', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('910', '909', '0,100001,813,909', '京口区', '321102', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('911', '909', '0,100001,813,909', '润州区', '321111', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('912', '909', '0,100001,813,909', '丹徒区', '321112', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('913', '909', '0,100001,813,909', '丹阳市', '321181', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('914', '909', '0,100001,813,909', '扬中市', '321182', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('915', '909', '0,100001,813,909', '句容市', '321183', '0511', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('916', '813', '0,100001,813', '泰州市', '321200', '0523', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('917', '916', '0,100001,813,916', '海陵区', '321202', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('918', '916', '0,100001,813,916', '高港区', '321203', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('919', '916', '0,100001,813,916', '兴化市', '321281', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('92', '83', '0,100001,35,83', '涉县', '130426', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('920', '916', '0,100001,813,916', '靖江市', '321282', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('921', '916', '0,100001,813,916', '泰兴市', '321283', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('922', '916', '0,100001,813,916', '姜堰市', '321284', '0523', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('923', '813', '0,100001,813', '宿迁市', '321300', '0527', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('924', '923', '0,100001,813,923', '宿城区', '321302', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('925', '923', '0,100001,813,923', '宿豫区', '321311', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('926', '923', '0,100001,813,923', '沭阳县', '321322', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('927', '923', '0,100001,813,923', '泗阳县', '321323', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('928', '923', '0,100001,813,923', '泗洪县', '321324', '0527', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('929', '100001', '0,100001', '浙江省', '330000', '', '2', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('93', '83', '0,100001,35,83', '磁县', '130427', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('930', '929', '0,100001,929', '杭州市', '330100', '0571', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('931', '930', '0,100001,929,930', '上城区', '330102', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('932', '930', '0,100001,929,930', '下城区', '330103', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('933', '930', '0,100001,929,930', '江干区', '330104', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('934', '930', '0,100001,929,930', '拱墅区', '330105', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('935', '930', '0,100001,929,930', '西湖区', '330106', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('936', '930', '0,100001,929,930', '滨江区', '330108', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('937', '930', '0,100001,929,930', '萧山区', '330109', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('938', '930', '0,100001,929,930', '余杭区', '330110', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('939', '930', '0,100001,929,930', '桐庐县', '330122', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('94', '83', '0,100001,35,83', '肥乡县', '130428', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('940', '930', '0,100001,929,930', '淳安县', '330127', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('941', '930', '0,100001,929,930', '建德市', '330182', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('942', '930', '0,100001,929,930', '富阳市', '330183', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('943', '930', '0,100001,929,930', '临安市', '330185', '0571', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('944', '929', '0,100001,929', '宁波市', '330200', '0574', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('945', '944', '0,100001,929,944', '海曙区', '330203', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('946', '944', '0,100001,929,944', '江东区', '330204', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('947', '944', '0,100001,929,944', '江北区', '330205', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('948', '944', '0,100001,929,944', '北仑区', '330206', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('949', '944', '0,100001,929,944', '镇海区', '330211', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('95', '83', '0,100001,35,83', '永年县', '130429', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('950', '944', '0,100001,929,944', '鄞州区', '330212', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('951', '944', '0,100001,929,944', '象山县', '330225', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('952', '944', '0,100001,929,944', '宁海县', '330226', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('953', '944', '0,100001,929,944', '余姚市', '330281', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('954', '944', '0,100001,929,944', '慈溪市', '330282', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('955', '944', '0,100001,929,944', '奉化市', '330283', '0574', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('956', '929', '0,100001,929', '温州市', '330300', '0577', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('957', '956', '0,100001,929,956', '鹿城区', '330302', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('958', '956', '0,100001,929,956', '龙湾区', '330303', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('959', '956', '0,100001,929,956', '瓯海区', '330304', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('96', '83', '0,100001,35,83', '邱县', '130430', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('960', '956', '0,100001,929,956', '洞头县', '330322', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('961', '956', '0,100001,929,956', '永嘉县', '330324', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('962', '956', '0,100001,929,956', '平阳县', '330326', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('963', '956', '0,100001,929,956', '苍南县', '330327', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('964', '956', '0,100001,929,956', '文成县', '330328', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('965', '956', '0,100001,929,956', '泰顺县', '330329', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('966', '956', '0,100001,929,956', '瑞安市', '330381', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('967', '956', '0,100001,929,956', '乐清市', '330382', '0577', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('968', '929', '0,100001,929', '嘉兴市', '330400', '0573', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('969', '968', '0,100001,929,968', '南湖区', '330402', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('97', '83', '0,100001,35,83', '鸡泽县', '130431', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('970', '968', '0,100001,929,968', '秀洲区', '330411', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('971', '968', '0,100001,929,968', '嘉善县', '330421', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('972', '968', '0,100001,929,968', '海盐县', '330424', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('973', '968', '0,100001,929,968', '海宁市', '330481', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('974', '968', '0,100001,929,968', '平湖市', '330482', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('975', '968', '0,100001,929,968', '桐乡市', '330483', '0573', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('976', '929', '0,100001,929', '湖州市', '330500', '0572', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('977', '976', '0,100001,929,976', '吴兴区', '330502', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('978', '976', '0,100001,929,976', '南浔区', '330503', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('979', '976', '0,100001,929,976', '德清县', '330521', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('98', '83', '0,100001,35,83', '广平县', '130432', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('980', '976', '0,100001,929,976', '长兴县', '330522', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('981', '976', '0,100001,929,976', '安吉县', '330523', '0572', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('982', '929', '0,100001,929', '绍兴市', '330600', '0575', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('983', '982', '0,100001,929,982', '越城区', '330602', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('984', '982', '0,100001,929,982', '绍兴县', '330621', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('985', '982', '0,100001,929,982', '新昌县', '330624', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('986', '982', '0,100001,929,982', '诸暨市', '330681', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('987', '982', '0,100001,929,982', '上虞市', '330682', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('988', '982', '0,100001,929,982', '嵊州市', '330683', '0575', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('989', '929', '0,100001,929', '金华市', '330700', '0579', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('99', '83', '0,100001,35,83', '馆陶县', '130433', '0310', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('990', '989', '0,100001,929,989', '婺城区', '330702', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('991', '989', '0,100001,929,989', '金东区', '330703', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('992', '989', '0,100001,929,989', '武义县', '330723', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('993', '989', '0,100001,929,989', '浦江县', '330726', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('994', '989', '0,100001,929,989', '磐安县', '330727', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('995', '989', '0,100001,929,989', '兰溪市', '330781', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('996', '989', '0,100001,929,989', '义乌市', '330782', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('997', '989', '0,100001,929,989', '东阳市', '330783', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('998', '989', '0,100001,929,989', '永康市', '330784', '0579', '4', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');
INSERT INTO `sys_area` VALUES ('999', '929', '0,100001,929', '衢州市', '330800', '0570', '3', 'yyx', '2015-07-13 11:44:57', 'yyx', '2015-07-13 11:44:57', 'yyx', '0');


SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS test_data;
DROP TABLE IF EXISTS test_data_child;
DROP TABLE IF EXISTS test_data_main;
DROP TABLE IF EXISTS test_tree;




/* Create Tables */

CREATE TABLE test_data
(
	id varchar(64) NOT NULL COMMENT '编号',
	user_id varchar(64) COMMENT '归属用户',
	office_id varchar(64) COMMENT '归属部门',
	area_id varchar(64) COMMENT '归属区域',
	name varchar(100) COMMENT '名称',
	sex char(1) COMMENT '性别',
	in_date date COMMENT '加入日期',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '业务数据表';


CREATE TABLE test_data_child
(
	id varchar(64) NOT NULL COMMENT '编号',
	test_data_main_id varchar(64) COMMENT '业务主表ID',
	name varchar(100) COMMENT '名称',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '业务数据子表';


CREATE TABLE test_data_main
(
	id varchar(64) NOT NULL COMMENT '编号',
	user_id varchar(64) COMMENT '归属用户',
	office_id varchar(64) COMMENT '归属部门',
	area_id varchar(64) COMMENT '归属区域',
	name varchar(100) COMMENT '名称',
	sex char(1) COMMENT '性别',
	in_date date COMMENT '加入日期',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '业务数据表';


CREATE TABLE test_tree
(
	id varchar(64) NOT NULL COMMENT '编号',
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	name varchar(100) NOT NULL COMMENT '名称',
	sort decimal(10,0) NOT NULL COMMENT '排序',
	create_by varchar(64) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by varchar(64) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks varchar(255) COMMENT '备注信息',
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记',
	PRIMARY KEY (id)
) COMMENT = '树结构表';



/* Create Indexes */

CREATE INDEX test_data_del_flag ON test_data (del_flag ASC);
CREATE INDEX test_data_child_del_flag ON test_data_child (del_flag ASC);
CREATE INDEX test_data_main_del_flag ON test_data_main (del_flag ASC);
CREATE INDEX test_tree_del_flag ON test_tree (del_flag ASC);
CREATE INDEX test_data_parent_id ON test_tree (parent_id ASC);
/*CREATE INDEX test_data_parent_ids ON test_tree (parent_ids ASC);*/







