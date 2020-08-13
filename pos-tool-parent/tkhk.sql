/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : tkhk

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 18/05/2020 17:48:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_agent
-- ----------------------------
DROP TABLE IF EXISTS `t_agent`;
CREATE TABLE `t_agent`  (
  `agent_no` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理人工号',
  `agent_name_chn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人姓名(中文）',
  `agent_name_eng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理人姓名(英文）',
  `agent_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理人电话',
  `agent_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理人电邮',
  `agent_degree` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理人职级',
  `agent_award` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人奖项',
  `certificate_no` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '从业证书号码',
  `free_cover_limit` double NULL DEFAULT NULL COMMENT '免体检额度',
  `photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人头像远程路径',
  `agent_profile` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人简介',
  `on_duty_status` tinyint(4) NULL DEFAULT NULL COMMENT '在职状态',
  `channel` tinyint(4) NULL DEFAULT NULL COMMENT '渠道',
  `sales_license` tinyint(4) NULL DEFAULT NULL COMMENT '销售执照',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`agent_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代理人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_application
-- ----------------------------
DROP TABLE IF EXISTS `t_application`;
CREATE TABLE `t_application`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `pre_application_no` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预保单号',
  `serial_no` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水号',
  `is_divide` tinyint(4) NOT NULL COMMENT '保单拆分',
  `applicant_id` int(11) NOT NULL COMMENT '投保人id',
  `is_amercian` tinyint(4) NOT NULL COMMENT '是否美国公民',
  `is_lived` tinyint(4) NOT NULL COMMENT '最近是否在此居住',
  `tax_residensy` tinyint(4) NOT NULL COMMENT '税务居住地',
  `insured_id` int(11) NOT NULL COMMENT '拟被保人id',
  `proposal_id` int(11) NOT NULL COMMENT '关联的建议书',
  `payout_manner` tinyint(4) NOT NULL COMMENT '派发方式\r\n            0-现金支付 1-积存生息',
  `application_trace` tinyint(4) NOT NULL COMMENT '保单追溯',
  `application_form` tinyint(4) NULL DEFAULT NULL COMMENT '保单形式\r\n            0-电子保单 1-纸质保单',
  `is_appoint_beneficiary` tinyint(4) NULL DEFAULT NULL COMMENT '是否委任受益人',
  `healthy_id_application` int(11) NULL DEFAULT NULL COMMENT '健康数据id-投保人',
  `healthy_id_insured` int(11) NULL DEFAULT NULL COMMENT '健康数据id-被保人',
  `account_holder` int(11) NULL DEFAULT NULL COMMENT '账户持有人',
  `renewal_payment_method` tinyint(4) NULL DEFAULT NULL COMMENT '续期保费支付方式',
  `is_has_insurance` tinyint(4) NULL DEFAULT NULL COMMENT '是否已有保险',
  `is_signed` tinyint(4) NULL DEFAULT NULL COMMENT '是否签字',
  `credit_card_no` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信用卡号码',
  `credit_card_holder` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持卡人姓名 ',
  `credit_card_validity` date NULL DEFAULT NULL COMMENT '信用卡有效期 ',
  `id_type` tinyint(4) NULL DEFAULT NULL COMMENT '证件类型',
  `id_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信用卡持有人证件号 ',
  `credit_autopay_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信用卡自动转账授权',
  `bank_account_holder` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账户持有人姓名',
  `bank` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号所属银行',
  `bank_account` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `bank_autopay_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账户自动转账授权',
  `fna_id` int(11) NULL DEFAULT NULL COMMENT 'fna_id',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_application`(`applicant_id`, `proposal_id`, `create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投保单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_application_devide
-- ----------------------------
DROP TABLE IF EXISTS `t_application_devide`;
CREATE TABLE `t_application_devide`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `application_id` int(11) NOT NULL COMMENT '投保申请单id',
  `agent_no` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主代理人工号',
  `agent_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人姓名',
  `other_agent_no` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分单到代理人工号',
  `other_agent_channel` tinyint(4) NOT NULL COMMENT '分单到代理人渠道',
  `other_agent_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分单到代理人姓名',
  `commision_proportion` tinyint(4) NOT NULL COMMENT '佣金比例',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_devide`(`application_id`, `create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '保单拆分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_beneficiary
-- ----------------------------
DROP TABLE IF EXISTS `t_beneficiary`;
CREATE TABLE `t_beneficiary`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `application_id` int(11) NOT NULL COMMENT '保单id',
  `relation_with_insured` tinyint(4) NOT NULL COMMENT '与被保人关系',
  `last_name_chn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文名',
  `first_name_chn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文姓',
  `last_name_eng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名',
  `first_name_eng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文姓',
  `id_type` tinyint(4) NOT NULL COMMENT '身份证明文件',
  `id_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证或证件号码',
  `proportion` tinyint(4) NOT NULL COMMENT '分摊比例',
  `is_irrevocable` tinyint(4) NOT NULL COMMENT '是否作为不可撤销受益人',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '受益人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_client_basic
-- ----------------------------
DROP TABLE IF EXISTS `t_client_basic`;
CREATE TABLE `t_client_basic`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `agent_no` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理人工号',
  `client_no` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户号',
  `appellation` tinyint(4) NULL DEFAULT NULL COMMENT '欢迎语',
  `surname_ch` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓（中文）',
  `given_name_ch` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名（中文）',
  `surname_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓（英文）',
  `given_name_en` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名（英文）',
  `organization` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `gender` tinyint(4) NULL DEFAULT NULL COMMENT '性别\r\n            0：男性\r\n            1：女性',
  `Birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `registration_date` date NULL DEFAULT NULL COMMENT '机构登记日期（机构客户）',
  `nationality` tinyint(4) NULL DEFAULT NULL COMMENT '国籍\r\n            0-243',
  `id_type` tinyint(4) NULL DEFAULT NULL COMMENT '证件类别',
  `id_type_more` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他证件',
  `id_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码/商业登记号码',
  `id_expiry_date` date NULL DEFAULT NULL COMMENT '证件到期日',
  `certificate_issue_country` tinyint(4) NULL DEFAULT NULL COMMENT '证件发出国家',
  `certificate_status` tinyint(4) NULL DEFAULT NULL COMMENT '证件状况',
  `telephone_code` tinyint(4) NULL DEFAULT NULL COMMENT '电话区号',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人（代理人工号）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_client`(`agent_no`, `surname_en`, `given_name_en`, `create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表_基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_client_basic
-- ----------------------------
INSERT INTO `t_client_basic` VALUES (1, '8888888', '8888888', 0, '曹', '瑞群', 'Cao', 'Ruiqun', '纬创泰康驻在', 0, '1992-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0840321', '2020-05-15 13:10:19', NULL, NULL);

-- ----------------------------
-- Table structure for t_client_more
-- ----------------------------
DROP TABLE IF EXISTS `t_client_more`;
CREATE TABLE `t_client_more`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户基本信息id',
  `is_smoking` tinyint(4) NULL DEFAULT NULL COMMENT '是否吸烟\r\n            0：是\r\n            1：否',
  `marital_status` tinyint(4) NULL DEFAULT NULL COMMENT '婚姻状况\r\n            0：未婚\r\n            1：已婚\r\n            2：离婚\r\n            3：丧偶\r\n            ',
  `birth_place` tinyint(4) NULL DEFAULT NULL COMMENT '出生地点\r\n            0-243',
  `education_level` tinyint(4) NULL DEFAULT NULL COMMENT '教育程度\r\n            0：小学或以下:1：中学:2：大专或以上',
  `dependant_quantity` tinyint(4) NULL DEFAULT NULL COMMENT '受养人数目\r\n            0-10',
  `employment_status` tinyint(4) NULL DEFAULT NULL COMMENT '就业状况\r\n            0：就业:1：待业:2：学生:3：家庭主妇:4：退休\r\n            ',
  `employer_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司/雇主名称',
  `business_nature` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务性质',
  `occupation_risk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业风险等级',
  `industry_type` tinyint(4) NULL DEFAULT NULL COMMENT '行业类别',
  `occupation_type` tinyint(4) NULL DEFAULT NULL COMMENT '职业类别',
  `occupation_class_2` tinyint(4) NULL DEFAULT NULL COMMENT '二级职业',
  `occupation_code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业代码',
  `address_of_employer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '雇主地址',
  `position` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `major_job_duties` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要工作职业',
  `avg_monthly_income_hkd` double NULL DEFAULT NULL COMMENT '平均月收入（港币）',
  `religion_code` tinyint(4) NULL DEFAULT NULL COMMENT '宗教',
  `residence_city` int(11) NULL DEFAULT NULL COMMENT '居住城市',
  `other_policy_company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他保单-公司名称',
  `other_policy_issue_date` date NULL DEFAULT NULL COMMENT '其他保单-出单日期',
  `other_policy_risk_type` tinyint(4) NULL DEFAULT NULL COMMENT '其他保单-风险类别',
  `other_policy_sa` decimal(10, 0) NULL DEFAULT NULL COMMENT '其他保单-保额',
  `service_language` tinyint(4) NULL DEFAULT NULL COMMENT '服务语言',
  `request_hardcopy` tinyint(4) NULL DEFAULT NULL COMMENT '要求硬拷贝',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人（代理人工号）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表_额外数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_compliance
-- ----------------------------
DROP TABLE IF EXISTS `t_compliance`;
CREATE TABLE `t_compliance`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户基本信息id',
  `crs_transaction_date` date NULL DEFAULT NULL COMMENT 'CRS - 更新日期',
  `crs_location` tinyint(4) NULL DEFAULT NULL COMMENT 'CRS - 稅務管轄區',
  `tax_identification_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CRS - 稅務編號',
  `no_tin_code_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '沒有稅務編號的原因',
  `source_type` tinyint(4) NULL DEFAULT NULL COMMENT '來源種類',
  `crs_status` tinyint(4) NULL DEFAULT NULL COMMENT '客戶CRS 狀態',
  `crs_remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CRS 備注',
  `crs_update_user_id` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CRS 更新人員',
  `crs_update_time` datetime(0) NULL DEFAULT NULL COMMENT 'CRS 更新時間',
  `self_signed_form_signing_date` date NULL DEFAULT NULL COMMENT '自我申報表格簽署日期',
  `tax_jurisdiction_status` tinyint(4) NULL DEFAULT NULL COMMENT '申報之稅務管轄區狀態',
  `edd_status` tinyint(4) NULL DEFAULT NULL COMMENT 'EDD狀態',
  `resaonableness_check_flag` tinyint(4) NULL DEFAULT NULL COMMENT '合理性檢查標誌',
  `capacity_indicator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '能力指标',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人（代理人工号）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合规数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_contacts
-- ----------------------------
DROP TABLE IF EXISTS `t_contacts`;
CREATE TABLE `t_contacts`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户id',
  `residential_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭电话',
  `residential_no_country` tinyint(4) NULL DEFAULT NULL COMMENT '家庭电话国家',
  `opt_out_sms` tinyint(4) NULL DEFAULT NULL COMMENT '选择短信',
  `opt_out_calling` tinyint(4) NULL DEFAULT NULL COMMENT 'OPT OUT 呼出',
  `opt_out_email` tinyint(4) NULL DEFAULT NULL COMMENT '选择退出电子邮件',
  `last_opt_out_update_time` datetime(0) NULL DEFAULT NULL COMMENT '上次OPT输出更新时间',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `communication_language` tinyint(4) NULL DEFAULT NULL COMMENT '通信语言\r\n            0：英文:1：中文简体:2：中文繁体\r\n            ',
  `address_type` tinyint(4) NULL DEFAULT NULL COMMENT '地址類型',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '地址 ID',
  `address_line_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址 1',
  `address_line_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址 2',
  `address_line_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址 3',
  `address_line_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址 4',
  `postal_code` int(11) NULL DEFAULT NULL COMMENT '邮政编码',
  `address_status` tinyint(4) NULL DEFAULT NULL COMMENT '地址状态',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人（代理人工号）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联络信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_device_login
-- ----------------------------
DROP TABLE IF EXISTS `t_device_login`;
CREATE TABLE `t_device_login`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `agent_no` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户代号',
  `device_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备型号',
  `sys_version` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统版本',
  `uuid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通用唯一识别码',
  `login_time` datetime(0) NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端设备登录信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_type`;
CREATE TABLE `t_dic_type`  (
  `type_code` int(11) NOT NULL COMMENT '字典类型代码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  PRIMARY KEY (`type_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_value`;
CREATE TABLE `t_dic_value`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典文本',
  `sort` int(11) NOT NULL COMMENT '排序',
  `type_code` int(11) NOT NULL COMMENT '字典类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_existing_application
-- ----------------------------
DROP TABLE IF EXISTS `t_existing_application`;
CREATE TABLE `t_existing_application`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `application_id` int(11) NOT NULL COMMENT '所属投保单id',
  `insurance_company` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保险公司',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请日期',
  `insurance_type` tinyint(4) NULL DEFAULT NULL COMMENT '产品类型',
  `coverage_usd` decimal(10, 2) NULL DEFAULT NULL COMMENT '保额（美元）',
  `is_reinsurance` tinyint(4) NOT NULL COMMENT '是否转保',
  `new_insurance_company` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新保险公司',
  `applicatoin_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保申请书编号',
  `proposal_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建议书编号',
  `applicant_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人或投保人姓名',
  `applicant_hkid_no` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人/投保人香港身份证',
  `applicant_passport_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人/投保人护照号码',
  `loss_hkd` decimal(10, 0) NULL DEFAULT NULL COMMENT '估计损失（港币）',
  `basis` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无损失依据',
  `is_more_expensive` tinyint(4) NULL DEFAULT NULL COMMENT '新寿险是否较为昂贵',
  `is_heathy_influence` tinyint(4) NULL DEFAULT NULL COMMENT '健康状况影响',
  `is_occupation_influence` tinyint(4) NULL DEFAULT NULL COMMENT '职业影响',
  `is_habbit_influence` tinyint(4) NULL DEFAULT NULL COMMENT '生活习惯影响',
  `is_entertainment_influence` tinyint(4) NULL DEFAULT NULL COMMENT '康乐活动影响',
  `applicant_signature_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人签字',
  `agent_signature_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纪人签字',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_exist_insurance`(`application_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已有保险表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_favorite_product
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite_product`;
CREATE TABLE `t_favorite_product`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `client_id` int(11) NOT NULL COMMENT '客户id ',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `insured_id` int(11) NOT NULL COMMENT '拟被保人id',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_favorite`(`client_id`, `product_id`, `insured_id`, `create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_flie
-- ----------------------------
DROP TABLE IF EXISTS `t_flie`;
CREATE TABLE `t_flie`  (
  `id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL COMMENT '保单id',
  `file_owner` int(11) NOT NULL COMMENT '文件隶属人',
  `file_type` tinyint(4) NOT NULL COMMENT '所需文件类别',
  `file_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件远程路径',
  `upload_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `upload_time` datetime(0) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_file`(`application_id`, `file_owner`, `upload_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '所需文件清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_fna
-- ----------------------------
DROP TABLE IF EXISTS `t_fna`;
CREATE TABLE `t_fna`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户id',
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问卷答案(json)',
  `pariticular_declaration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊声明',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_fna`(`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '财务分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_healthy
-- ----------------------------
DROP TABLE IF EXISTS `t_healthy`;
CREATE TABLE `t_healthy`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户基本信息id',
  `not_accepted_policy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不予受理指標',
  `not_accepted_company_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不予受理 - 公司名稱',
  `not_accepted_date` date NULL DEFAULT NULL COMMENT '不予受理 - 日期',
  `not_accepted_risk_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不予受理 - 風險',
  `not_accepted_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不予受理 - 原因',
  `family_history_indicator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家遺病歷',
  `family_history_relationship` tinyint(4) NULL DEFAULT NULL COMMENT '家遺病歷 - 關係',
  `family_history_disease` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家遺病歷 - 疾病',
  `family_history_onset_age` tinyint(4) NULL DEFAULT NULL COMMENT '家遺病歷 - 發病年齡',
  `height` double NULL DEFAULT NULL COMMENT '高度',
  `weight` double NULL DEFAULT NULL COMMENT '重量',
  `smoking_status` tinyint(4) NULL DEFAULT NULL COMMENT '吸烟状况',
  `daily_consumption` tinyint(4) NULL DEFAULT NULL COMMENT '每天支數',
  `alcohol_indicator` tinyint(4) NULL DEFAULT NULL COMMENT '飲酒',
  `alcohol_type` tinyint(4) NULL DEFAULT NULL COMMENT '酒種類',
  `capacity_for_liquor` tinyint(4) NULL DEFAULT NULL COMMENT '酒量',
  `drug_habit` tinyint(4) NULL DEFAULT NULL COMMENT '成癮藥物或毒品',
  `treatment_lung` tinyint(4) NULL DEFAULT NULL COMMENT '肺部疾病',
  `treatment_heart_or_blood_vessels` tinyint(4) NULL DEFAULT NULL COMMENT '心血管疾病',
  `treatment_digestive_system` tinyint(4) NULL DEFAULT NULL COMMENT '消化系統疾病',
  `treatment_urinary_sugar_etc` tinyint(4) NULL DEFAULT NULL COMMENT '尿糖或生殖泌尿系統病症',
  `treatment_brain_etc` tinyint(4) NULL DEFAULT NULL COMMENT '任何腦部或神經系統不正常或疾病',
  `treatment_cancer_tumor` tinyint(4) NULL DEFAULT NULL COMMENT '癌症或嚴重受傷',
  `treatment_sense_organ` tinyint(4) NULL DEFAULT NULL COMMENT '感官疾病或功能失常',
  `treatment_rheumatic_fever_etc` tinyint(4) NULL DEFAULT NULL COMMENT '風濕性發熱、關節炎、痛風或肌肉及骨骼疾病',
  `test_xray_etc` tinyint(4) NULL DEFAULT NULL COMMENT 'X光、心電圖、電腦掃瞄、超聲波、尿液、特殊血液檢驗及健康檢查',
  `illness_operation` tinyint(4) NULL DEFAULT NULL COMMENT '患有疾病、接受過手術',
  `current_medical_treatment` tinyint(4) NULL DEFAULT NULL COMMENT '目前是否正接受藥物治療或醫療護理',
  `aids_consultation` tinyint(4) NULL DEFAULT NULL COMMENT '曾否接受或打算接受任何有關愛滋病或愛滋病綜合病徵',
  `dangerous_activity` tinyint(4) NULL DEFAULT NULL COMMENT '危險活動',
  `any_claims_for_diease_etc` tinyint(4) NULL DEFAULT NULL COMMENT '有否理賠案',
  `pregnant` tinyint(4) NULL DEFAULT NULL COMMENT '是否懷孕',
  `pregnancy_duration` tinyint(4) NULL DEFAULT NULL COMMENT '懷孕週期',
  `breast_etc` tinyint(4) NULL DEFAULT NULL COMMENT '乳房或生殖器官疾病或產前產後之併發症、月經失調或柏氏宮頸抹片不正常',
  `Birth_premature_etc` tinyint(4) NULL DEFAULT NULL COMMENT '有否早產',
  `any_physical_defects_etc` tinyint(4) NULL DEFAULT NULL COMMENT '身體缺陷、生理上或心智發育緩慢的跡象',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人（代理人工号）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '健康数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_main_addition_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_main_addition_relation`;
CREATE TABLE `t_main_addition_relation`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `main_id` int(11) NOT NULL COMMENT '主险id',
  `additional_id` int(11) NOT NULL COMMENT '附加险id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_product_relation`(`main_id`, `additional_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主险附加险关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message_log
-- ----------------------------
DROP TABLE IF EXISTS `t_message_log`;
CREATE TABLE `t_message_log`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求路径',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送内容(json)',
  `status` tinyint(4) NOT NULL COMMENT '发送状态 0-成功 1-失败',
  `send_time` datetime(0) NOT NULL COMMENT '发送时间',
  `send_party` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送方',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息平台日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_overview
-- ----------------------------
DROP TABLE IF EXISTS `t_overview`;
CREATE TABLE `t_overview`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `application_id` int(11) NOT NULL COMMENT '保单id',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态',
  `update_date` date NULL DEFAULT NULL COMMENT '操作时间',
  `file_item` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目',
  `is_finished` tinyint(4) NULL DEFAULT NULL COMMENT '是否完成',
  `is_signed` tinyint(4) NULL DEFAULT NULL COMMENT '是否签名',
  `file_item_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目地址',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_overview`(`application_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '概览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `application_id` int(11) NULL DEFAULT NULL COMMENT '保单id',
  `request_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '入参',
  `response_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '响应结果',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_payment_record
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_record`;
CREATE TABLE `t_payment_record`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `tran_no` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易流水号',
  `pay_id` int(11) NOT NULL COMMENT '支付id',
  `tran_channel` tinyint(4) NOT NULL COMMENT '交易渠道',
  `tran_amount` decimal(10, 0) NOT NULL COMMENT '交易金额',
  `currency` tinyint(4) NOT NULL COMMENT '交易币种',
  `tran_time` datetime(0) NOT NULL COMMENT '交易时间',
  `status` tinyint(4) NOT NULL COMMENT '交易状态\r\n            0-支付成功 1-支付失败',
  `application_id` int(11) NOT NULL COMMENT '保单id',
  `error_code` int(11) NOT NULL COMMENT '错误码',
  `error_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_pay`(`tran_no`, `tran_time`, `application_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '缴费记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `product_type` tinyint(4) NOT NULL COMMENT '产品类型\r\n            0-年金类 1-重疾类 2-医疗类',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `product_profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品简介',
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品logo',
  `color_page_url` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品彩页url',
  `product_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品细节',
  `is_main` tinyint(4) NULL DEFAULT NULL COMMENT '是否主险',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_product`(`product_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_proposal
-- ----------------------------
DROP TABLE IF EXISTS `t_proposal`;
CREATE TABLE `t_proposal`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户id',
  `insured_id` int(11) NOT NULL COMMENT '被保人id',
  `currency` tinyint(4) NOT NULL COMMENT '币种',
  `pay_frequency` tinyint(4) NOT NULL COMMENT '保费交费频率',
  `is_trace` tinyint(4) NOT NULL COMMENT '保单追溯',
  `policy_trace` tinyint(4) NOT NULL COMMENT '保单追溯日',
  `proposal_serial_no` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '建议书流水号',
  `measure_id` int(11) NULL DEFAULT NULL COMMENT '测算id',
  `benefit_demo_pdf_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '利益演示url',
  `proposal_pdf_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建议书pdf远程路径',
  `proposal_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方案详情',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_proposal`(`client_id`, `create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '建议书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_relationship
-- ----------------------------
DROP TABLE IF EXISTS `t_relationship`;
CREATE TABLE `t_relationship`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '客户id',
  `family_id` int(11) NOT NULL COMMENT '家庭成员id',
  `relationship` tinyint(4) NOT NULL COMMENT '亲属关系\r\n            详情待定',
  `create_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `edit_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `edit_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_relatives`(`client_id`, `create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '家庭关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `t_suggestion`;
CREATE TABLE `t_suggestion`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `suggestted_by` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '建议人',
  `suggestion_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '建议内容',
  `status` tinyint(4) NOT NULL COMMENT '建议状态 0-已提交 1-正在处理  2-已处理',
  `suggestion_time` datetime(0) NOT NULL COMMENT '建议时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '建议与反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `log_name` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID(代理人工号)',
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类名',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `log_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志级别',
  `msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志信息',
  `create_time` datetime(0) NOT NULL COMMENT '产生时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
