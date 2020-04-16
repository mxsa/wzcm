/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.25-log : Database - erp_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp_dev` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `erp_dev`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `import_customer` */

DROP TABLE IF EXISTS `import_customer`;

CREATE TABLE `import_customer` (
  `enter_name` varchar(255) DEFAULT NULL,
  `fa_ren` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sale_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `import_order` */

DROP TABLE IF EXISTS `import_order`;

CREATE TABLE `import_order` (
  `enter_name` varchar(255) DEFAULT NULL,
  `serve_period` varchar(255) DEFAULT NULL,
  `serve_name` varchar(255) DEFAULT NULL,
  `saler_name` varchar(255) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_assignee_extra` */

DROP TABLE IF EXISTS `t_assignee_extra`;

CREATE TABLE `t_assignee_extra` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `assginee_num` int(4) DEFAULT NULL COMMENT '可拥有客户数',
  `user_id` int(10) NOT NULL COMMENT '跟进人userId',
  `expire_time` datetime NOT NULL COMMENT '设置自动消亡时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `t_attachment` */

DROP TABLE IF EXISTS `t_attachment`;

CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `type` enum('CONSTRACT') DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_auth_application` */

DROP TABLE IF EXISTS `t_auth_application`;

CREATE TABLE `t_auth_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `system` enum('ERP') NOT NULL COMMENT '系统编码',
  `app_id` varchar(32) NOT NULL COMMENT 'app_id',
  `app_key` varchar(32) NOT NULL COMMENT 'app_key',
  `user_id` int(11) NOT NULL COMMENT '账号ID',
  `source` varchar(32) NOT NULL COMMENT '注册来源',
  `creator` int(11) DEFAULT NULL COMMENT '创建人ID',
  `status` enum('Y','N') NOT NULL COMMENT '状态，Y-可用，N-禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_auth_resource` */

DROP TABLE IF EXISTS `t_auth_resource`;

CREATE TABLE `t_auth_resource` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `pid` int(10) NOT NULL COMMENT '父ID，顶级菜单为0',
  `name` varchar(50) NOT NULL COMMENT '中文名称',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `system` enum('ERP') NOT NULL COMMENT '系统编码',
  `type` enum('APP','NAVIGATOR','MENU','BUTTON') NOT NULL COMMENT '类型：应用-APP导航-NAVIGATOR菜单-MENU按钮-BUTTON',
  `url` varchar(200) DEFAULT NULL COMMENT '导航/菜单-路由按钮-接口地址',
  `class_name` varchar(30) DEFAULT NULL COMMENT '图标样式',
  `auth_code` varchar(50) DEFAULT NULL COMMENT '按钮标识(应用.导航.菜单.按钮)',
  `parent_path` varchar(50) DEFAULT NULL COMMENT '父级路由',
  `status` enum('Y','N') NOT NULL COMMENT '状态：<br>Y-正常（默认）<br>N-停用',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `t_auth_role` */

DROP TABLE IF EXISTS `t_auth_role`;

CREATE TABLE `t_auth_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `name` varchar(50) NOT NULL COMMENT '角色名,保留',
  `system` enum('ERP') NOT NULL COMMENT '系统编码，通用角色-1,可删除',
  `level` int(11) DEFAULT NULL COMMENT '角色等级，只能授权比自身角色等级大的角色,保留，可改为默认角色不可删',
  `enterprise_code` varchar(50) NOT NULL COMMENT '所属企业CODE，默认0,保留,增加crm_name,crm_id',
  `max_num` int(11) DEFAULT NULL COMMENT '角色最多数据量，-1无限制,可删除',
  `resouce_codes` varchar(200) DEFAULT NULL COMMENT '资源CODE正则此字段无值时，查t_auth_role_resouce表,可删除',
  `comment` varchar(200) DEFAULT NULL COMMENT '角色描述,保留',
  `creator` int(10) NOT NULL COMMENT '创建者user_id，系统创建为0,保留,增加creator_name',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_auth_role_resource` */

DROP TABLE IF EXISTS `t_auth_role_resource`;

CREATE TABLE `t_auth_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_ROLE_RES` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_auth_user_menu` */

DROP TABLE IF EXISTS `t_auth_user_menu`;

CREATE TABLE `t_auth_user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL COMMENT 't_auth_resouce表type=MENU',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名单（冗余）',
  `create_time` datetime NOT NULL,
  `url` varchar(50) NOT NULL,
  `auth_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_auth_user_role` */

DROP TABLE IF EXISTS `t_auth_user_role`;

CREATE TABLE `t_auth_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_contract` */

DROP TABLE IF EXISTS `t_contract`;

CREATE TABLE `t_contract` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `contract_code` varchar(20) NOT NULL COMMENT '合同号',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `status` enum('STOCK','APPLY','APPLYING','ACTIVE','CANCEL','BACK') NOT NULL COMMENT '状态',
  `type` varchar(50) NOT NULL COMMENT '类型',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业码',
  `cust_id` int(20) DEFAULT NULL COMMENT '用户公司代码',
  `cust_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `apply_id` int(10) DEFAULT NULL COMMENT '申领人id',
  `stock_time` datetime NOT NULL COMMENT '入库时间',
  `apply_time` datetime DEFAULT NULL COMMENT '申领时间',
  `active_time` datetime DEFAULT NULL COMMENT '订单激活时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `proxy_time` datetime DEFAULT NULL COMMENT '代理时间',
  `apply_name` varchar(20) DEFAULT NULL,
  `before_user_id` int(11) DEFAULT NULL COMMENT '之前用户的id',
  `crm_code` varchar(50) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_NAME` (`contract_code`,`enterprise_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_contract_return` */

DROP TABLE IF EXISTS `t_contract_return`;

CREATE TABLE `t_contract_return` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `contract_code` varchar(20) DEFAULT NULL COMMENT '合同号',
  `user_id` int(10) DEFAULT NULL COMMENT '退回人id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '退回人name',
  `return_time` datetime NOT NULL COMMENT '退还时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_coupon` */

DROP TABLE IF EXISTS `t_coupon`;

CREATE TABLE `t_coupon` (
  `coupon_id` int(10) NOT NULL COMMENT '优惠券编号',
  `region_id` varchar(20) DEFAULT NULL COMMENT '发起方业务范围(对应部门id)',
  `type` enum('1','2') DEFAULT NULL COMMENT '所属类型(1满减，2抵扣)',
  `enterprise_code` varchar(20) NOT NULL COMMENT '发放企业code',
  `crm_name` varchar(20) NOT NULL COMMENT '企业名称',
  `coupon_name` varchar(20) NOT NULL COMMENT '优惠券名称',
  `img_id` int(10) DEFAULT NULL COMMENT '优惠券图片地址',
  `provide_start_time` datetime NOT NULL COMMENT '优惠券发放开始时间',
  `provide_end_time` datetime NOT NULL COMMENT '优惠券发放结束时间',
  `employ_start_time` datetime NOT NULL COMMENT '优惠券使用开始时间',
  `employ_end_time` datetime NOT NULL COMMENT '优惠券使用结束时间',
  `cycle_time` int(10) NOT NULL COMMENT '优惠券使用周期/天',
  `money` int(12) NOT NULL COMMENT '优惠券额度/厘',
  `create_time` datetime NOT NULL COMMENT '优惠券创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '优惠券更新时间',
  `create_id` int(10) NOT NULL COMMENT '创建人ID',
  `status` enum('Y','N') NOT NULL COMMENT 'Y-启用/N-暂停',
  `remakes` varchar(500) DEFAULT NULL COMMENT '优惠券说明',
  UNIQUE KEY `NewIndex1` (`coupon_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_credits` */

DROP TABLE IF EXISTS `t_credits`;

CREATE TABLE `t_credits` (
  `credits_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `source` varchar(20) DEFAULT NULL COMMENT '对于发放部门ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `enterprise_code` varchar(20) DEFAULT NULL COMMENT '企业Code',
  `credits_value` int(10) DEFAULT NULL COMMENT '积分值(可用积分+冻结积分)',
  `block_credits_value` int(10) DEFAULT NULL COMMENT '冻结积分值',
  `remakes` varchar(200) DEFAULT NULL COMMENT '积分备注',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  UNIQUE KEY `credits_id` (`credits_id`,`user_id`,`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_credits_detail` */

DROP TABLE IF EXISTS `t_credits_detail`;

CREATE TABLE `t_credits_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `enterprise_code` varchar(20) DEFAULT NULL COMMENT '企业Code',
  `source` varchar(20) DEFAULT NULL COMMENT '优惠券来源',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键字（用户优惠券ID）',
  `type` enum('ADD','SUB','UNACCOUNT','RETURN') DEFAULT NULL COMMENT '积分类型(ADD-获取，SUB-使用，UNACCOUNT未到账，RETURN退回)',
  `credits_value` int(10) DEFAULT NULL COMMENT '积分值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `remakes` varchar(200) DEFAULT NULL COMMENT '积分备注',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer` */

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `category` enum('COMPANY-BOUND','COMPANY','PERSON','PERSONAL-SOLE','INDIVIDUAL-BUSINESS','OTHER') DEFAULT NULL COMMENT '客户类型 公司- ''COMPANY-BOUND'' \r\n个人-PERSON \r\n个体工商-''INDIVIDUAL- BUSINESS'' \r\n个人独资- ''PERSONAL-SOLE'',其他OTHER',
  `business_code` varchar(30) DEFAULT NULL COMMENT '产生业务code',
  `name` varchar(50) NOT NULL COMMENT '客户姓名',
  `enter_name` varchar(50) DEFAULT NULL COMMENT '公司名',
  `source` varchar(50) DEFAULT NULL COMMENT '客户来源',
  `address` varchar(100) DEFAULT NULL COMMENT '客户地址',
  `mobile` varchar(100) DEFAULT NULL COMMENT '客户电话',
  `urls` varchar(200) DEFAULT NULL COMMENT '客户url，网站地址',
  `linkman` int(10) DEFAULT NULL COMMENT '联系人userId',
  `linkman_position` varchar(32) DEFAULT NULL COMMENT '联系人职位',
  `crm_code` varchar(20) DEFAULT NULL COMMENT '客户crm_code',
  `creator` int(10) NOT NULL COMMENT '创建者userId',
  `enterprise_code` varchar(20) NOT NULL COMMENT '跟进人crm_code',
  `owner_id` int(10) DEFAULT NULL COMMENT '跟进人userId',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '跟进人姓名',
  `owner_position` varchar(32) DEFAULT NULL COMMENT '跟进人职位',
  `remark` varchar(200) DEFAULT NULL COMMENT '备忘',
  `status` enum('N','Y','BLACK') NOT NULL COMMENT '状态，N拉黑，Y启用',
  `type` enum('ELDER','PROCESS','PRIVATE','PUBLIC') NOT NULL COMMENT '类型，老年''ELDER'',处理中''PROCESS'',私有''PRIVATE'',公有''PUBLIC''',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `start_time` datetime DEFAULT NULL COMMENT '私有化时间',
  `taxpayer` enum('GENERAL','MIDDLE') DEFAULT NULL COMMENT '纳税人性质 一般-''GENERAL'',中小-''MIDDLE''',
  `fa_ren` varchar(20) DEFAULT NULL COMMENT '法人',
  `cust_code` varchar(50) DEFAULT NULL COMMENT '序号',
  `tax_control` int(20) DEFAULT NULL COMMENT '税控盘 1-有 0-无',
  `linkman_name` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `name_short` varchar(255) DEFAULT NULL COMMENT '公司简称\r\n',
  `credit_code` varchar(255) DEFAULT NULL COMMENT '统一信用代码',
  `business_scope` varchar(255) DEFAULT NULL COMMENT '经营范围\r\n',
  `trade` varchar(255) DEFAULT NULL COMMENT '行业\r\n',
  `reg_money` varchar(255) DEFAULT NULL COMMENT '注册资本\r\n',
  `reg_time` datetime DEFAULT NULL COMMENT '成立时间\r\n',
  `business_status` varchar(255) DEFAULT NULL COMMENT '企业状态\r\n',
  `reg_address` varchar(255) DEFAULT NULL COMMENT '注册地址\r\n',
  `idcard_no` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_CUST` (`name`,`business_code`,`mobile`,`crm_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer_assignee` */

DROP TABLE IF EXISTS `t_customer_assignee`;

CREATE TABLE `t_customer_assignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(20) DEFAULT NULL COMMENT '部门名',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名字',
  `cust_id` int(11) DEFAULT NULL COMMENT '客户id',
  `crm_code` varchar(20) DEFAULT NULL COMMENT '企业号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_USER_CUST` (`user_id`,`cust_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer_expire` */

DROP TABLE IF EXISTS `t_customer_expire`;

CREATE TABLE `t_customer_expire` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `customer_name` varchar(50) NOT NULL COMMENT '客户姓名',
  `crm_code` varchar(20) DEFAULT NULL COMMENT '企业crm_code',
  `owner_id` int(10) NOT NULL COMMENT '跟进人userId',
  `owner_name` varchar(32) NOT NULL COMMENT '跟进人姓名',
  `remark` varchar(200) DEFAULT NULL COMMENT '备忘',
  `creator` int(10) NOT NULL COMMENT '创建者userId',
  `creator_name` varchar(32) DEFAULT NULL COMMENT '创建者姓名',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer_intention` */

DROP TABLE IF EXISTS `t_customer_intention`;

CREATE TABLE `t_customer_intention` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `crm_code` varchar(50) NOT NULL,
  `cust_name` varchar(20) NOT NULL,
  `type` enum('UN','CO','SM') DEFAULT NULL COMMENT 'UN-不知道，CO-一般纳税人，SM-小规模',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `remakes` varchar(200) DEFAULT NULL COMMENT '备注',
  `intent_level` enum('LESS','MEDIUM','HIGH') NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(12) DEFAULT NULL COMMENT '客户服务人',
  `enterprise_code` varchar(50) DEFAULT NULL COMMENT '企业编码',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer_linkman` */

DROP TABLE IF EXISTS `t_customer_linkman`;

CREATE TABLE `t_customer_linkman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crm_code` varchar(50) NOT NULL COMMENT '客户号',
  `cust_name` varchar(50) NOT NULL COMMENT '客户名',
  `linkman_name` varchar(20) NOT NULL COMMENT '联系人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '联系人电话',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `linkman_id` int(11) DEFAULT NULL COMMENT '个人客户关联用户（预留）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_CUST_LINK` (`crm_code`,`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer_update` */

DROP TABLE IF EXISTS `t_customer_update`;

CREATE TABLE `t_customer_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_key` varchar(50) DEFAULT NULL,
  `crm_code` varchar(50) DEFAULT NULL,
  `cust_name` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `old_value` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` enum('INIT','ONLINE','OFFLINE') DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_customer_visitor` */

DROP TABLE IF EXISTS `t_customer_visitor`;

CREATE TABLE `t_customer_visitor` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `customer_id` int(10) NOT NULL COMMENT '客户userId',
  `customer_name` varchar(50) NOT NULL COMMENT '客户姓名',
  `crm_code` varchar(20) DEFAULT NULL,
  `owner_id` int(10) NOT NULL COMMENT '跟进人userId',
  `owner_name` varchar(32) NOT NULL COMMENT '跟进人姓名',
  `status` enum('Y','N') NOT NULL,
  `type` enum('OFFLINE','WX','PHONE') NOT NULL COMMENT '拜访方式,线下''OFFLINE'',微信''WX'',电话''PHONE''',
  `detail` varchar(400) NOT NULL COMMENT '拜访细节',
  `remark` varchar(200) DEFAULT NULL COMMENT '备忘',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `creator` int(11) DEFAULT NULL COMMENT '创建者id',
  `creator_name` varchar(20) DEFAULT NULL COMMENT '创建者姓名',
  `visit_time` varchar(50) DEFAULT NULL COMMENT '拜访时间',
  `intent_level` enum('LESS','MEDIUM','HIGH') DEFAULT NULL COMMENT '意向程度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_department` */

DROP TABLE IF EXISTS `t_department`;

CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `name` varchar(50) NOT NULL COMMENT ' 部门名称',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业crm_code',
  `parent_id` int(11) NOT NULL COMMENT '上级部门ID，顶级部门为0',
  `parent_path` varchar(50) DEFAULT NULL COMMENT '父级路由',
  `status` enum('Y','N') NOT NULL COMMENT '部门状态<br>Y-正常<br>N-停止',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `assignee_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_department_performance_daily` */

DROP TABLE IF EXISTS `t_department_performance_daily`;

CREATE TABLE `t_department_performance_daily` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `department_id` int(12) NOT NULL COMMENT '部门ID',
  `department_name` varchar(50) NOT NULL COMMENT '部门名称',
  `parent_path` varchar(20) DEFAULT NULL COMMENT '父级路由',
  `create_time` date NOT NULL COMMENT '日期',
  `trading_money` bigint(50) DEFAULT '0' COMMENT '成交金额',
  `call_volume` int(20) DEFAULT '0' COMMENT '电话量',
  `trading_volume` int(20) DEFAULT '0' COMMENT '成交量',
  `potentail_clients` int(20) DEFAULT '0' COMMENT '意向客户',
  `remakes` varchar(50) DEFAULT NULL COMMENT '备注',
  `enterprise_code` varchar(50) DEFAULT NULL COMMENT '企业编号',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_department_performance_monthly` */

DROP TABLE IF EXISTS `t_department_performance_monthly`;

CREATE TABLE `t_department_performance_monthly` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `department_id` int(12) DEFAULT NULL COMMENT '部门ID',
  `department_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parent_path` varchar(50) DEFAULT NULL COMMENT '父级路由',
  `create_time` date DEFAULT NULL COMMENT '日期',
  `trading_money` bigint(50) DEFAULT '0' COMMENT '成交金额',
  `call_volume` int(20) DEFAULT '0' COMMENT '电话量',
  `trading_volume` int(20) DEFAULT '0' COMMENT '成交量',
  `potentail_clients` int(20) DEFAULT '0' COMMENT '意向客户',
  `remakes` varchar(50) DEFAULT NULL COMMENT '备注',
  `enterprise_code` varchar(50) DEFAULT NULL COMMENT '企业编码',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_dict` */

DROP TABLE IF EXISTS `t_dict`;

CREATE TABLE `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `code` varchar(20) NOT NULL,
  `text` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `enterprise_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_enterprise` */

DROP TABLE IF EXISTS `t_enterprise`;

CREATE TABLE `t_enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `name` varchar(32) NOT NULL COMMENT '企业用户名称',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业crm_code',
  `status` enum('Y','N') NOT NULL COMMENT '状态<br>Y-正常<br>N-停用',
  `linkman` int(11) DEFAULT NULL COMMENT '企业联系人(t_user表ID)',
  `district_code` varchar(20) DEFAULT NULL COMMENT '地区编码',
  `address` varchar(100) DEFAULT NULL COMMENT '企业地址',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `certify_status` enum('NOTCERTIFY','CERTIFYING','SUCCESS','FAIL') NOT NULL COMMENT '实名认证状态<br>NOTCERTIFY-未认证(默认)<br>CERTIFYING-认证中<br>SUCCESS-认证成功<br>FAIL-认证失败',
  `credit_code` varchar(18) DEFAULT NULL COMMENT '社会统一信用代码（身份ID）',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父企业ID',
  `parent_code` varchar(20) DEFAULT NULL COMMENT '父企业编码',
  `parent_name` varchar(32) DEFAULT NULL COMMENT '父企业名称',
  `parent_path` varchar(160) DEFAULT NULL COMMENT '父企业ID路径',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(16) DEFAULT NULL COMMENT '创建人名称',
  `name_short` varchar(255) DEFAULT NULL COMMENT '企业简称',
  `certify_time` datetime DEFAULT NULL COMMENT '认证时间',
  `reg_type` varchar(255) DEFAULT NULL COMMENT '注册类型(公司/个人/团体) 企业类型，0-公司，1-社会组织 ，3-',
  `reg_org_name` varchar(255) DEFAULT NULL COMMENT '登录机关(工商局/公安局/民政局)',
  `reg_end_time` varchar(50) DEFAULT NULL COMMENT '经营期限（营业执照开始结束/身份证开始结束）',
  `reg_money` varchar(50) DEFAULT NULL COMMENT '注册资金(非必填)',
  `reg_phone` varchar(25) DEFAULT NULL COMMENT '企业电话',
  `fa_ren` varchar(50) DEFAULT NULL COMMENT '法人',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `business_status` varchar(50) DEFAULT NULL COMMENT '企业状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_CRMCODE` (`enterprise_code`) USING BTREE,
  UNIQUE KEY `UNQ_NAME` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_enterprise_customer` */

DROP TABLE IF EXISTS `t_enterprise_customer`;

CREATE TABLE `t_enterprise_customer` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业code',
  `crm_code` varchar(20) NOT NULL COMMENT '客户code',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_enterprise_user` */

DROP TABLE IF EXISTS `t_enterprise_user`;

CREATE TABLE `t_enterprise_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业crm_code',
  `employee_id` int(11) NOT NULL COMMENT '员工号',
  `name` varchar(50) NOT NULL COMMENT '员工姓名',
  `user_id` int(11) NOT NULL COMMENT '个人信息表ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级领导ID',
  `parent_path` varchar(50) DEFAULT NULL COMMENT '上级领导路由',
  `status` enum('Y','N') NOT NULL COMMENT '员工状态<br>Y-在职（默认）<br>N-离职',
  `entry_date` varchar(10) DEFAULT NULL COMMENT '入职日期， yyyy-MM-dd',
  `leave_date` varchar(10) DEFAULT NULL COMMENT '离职日期， yyyy-MM-dd',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `CRM_EMPLOYEE` (`enterprise_code`,`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_goods` */

DROP TABLE IF EXISTS `t_goods`;

CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `type` varchar(20) NOT NULL COMMENT '商品类型 \r\nsite-网站 \r\nsogou-搜狗 \r\nfinance-财税',
  `original_price` bigint(12) NOT NULL COMMENT '	原价（厘）',
  `discount_price` bigint(12) NOT NULL COMMENT '	优惠价（厘）',
  `status` enum('INIT','ONLINE','OFFLINE','DELETE') NOT NULL COMMENT '状态： \r\nINIT-待上线； \r\nONLINE-已上线； \r\nOFFLINE-已下线',
  `creator_id` int(11) NOT NULL COMMENT '	创建用户ID',
  `enterprise_code` varchar(20) NOT NULL COMMENT '	企业CODE',
  `remark` varchar(200) DEFAULT NULL COMMENT '	备注',
  `create_time` datetime NOT NULL COMMENT '	创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_goods_serve` */

DROP TABLE IF EXISTS `t_goods_serve`;

CREATE TABLE `t_goods_serve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `name` varchar(255) NOT NULL COMMENT '服务名称',
  `constant` int(1) NOT NULL COMMENT '是否买断 1-买断 0-不买断',
  `amount` bigint(255) NOT NULL COMMENT '单价',
  `enterprise_code` varchar(50) NOT NULL COMMENT '企业号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `work_period` varchar(20) DEFAULT NULL COMMENT '最长工作周期-工作日',
  `status` enum('INIT','ONLINE','OFFLINE','DELETE') NOT NULL COMMENT '启用-Y，停用-N',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_inspect_name` */

DROP TABLE IF EXISTS `t_inspect_name`;

CREATE TABLE `t_inspect_name` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(12) NOT NULL COMMENT 'userId',
  `user_name` varchar(20) NOT NULL COMMENT '姓名',
  `name` varchar(50) NOT NULL COMMENT '企业名称',
  `trade` varchar(50) NOT NULL COMMENT '行业',
  `mobile` varchar(50) NOT NULL COMMENT '电话号码',
  `addresss` varchar(50) NOT NULL COMMENT '公司地址',
  `type` varchar(50) NOT NULL COMMENT '企业类型',
  `status` enum('SUCCESS','FAILD','UNTEST') NOT NULL COMMENT '状态',
  `remakes` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` date NOT NULL COMMENT '创建时间',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_invoice` */

DROP TABLE IF EXISTS `t_invoice`;

CREATE TABLE `t_invoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `type` enum('ELE','PAP') NOT NULL COMMENT '发票类型，ELE电子票，PAP纸质发票',
  `create_time` date NOT NULL COMMENT '创建时间',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `user_id` int(10) NOT NULL COMMENT '联系人ID',
  `user_name` varchar(20) NOT NULL COMMENT '联系人名',
  `mobile` varchar(20) NOT NULL COMMENT '联系人电话',
  `address` varchar(50) DEFAULT NULL COMMENT '联系地址',
  `money` int(10) NOT NULL COMMENT '金额',
  `invoice_type` enum('ORDINARY','SPECIAL') DEFAULT NULL COMMENT '发票类型，普通发票ORDINAY，专用发票SPECIAL',
  `rise` enum('PERSONAL','ENTERPRISE') DEFAULT NULL COMMENT '发票抬头，个人PERSONAL，企业ENTERPRISE',
  `courier_number` varchar(20) DEFAULT NULL COMMENT '快递单号',
  `status` enum('PROCESS','SUCCESS','DONE','FAILD') DEFAULT NULL COMMENT 'PROCESS:待处理，SUCCESS:已完成，DONE：处理中，FAILD：失败',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_lemon_test` */

DROP TABLE IF EXISTS `t_lemon_test`;

CREATE TABLE `t_lemon_test` (
  `cust_code` varchar(255) DEFAULT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `taxpayer` varchar(255) DEFAULT NULL,
  `enter_name` varchar(255) DEFAULT NULL,
  `fa_ren` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `constant` varchar(255) DEFAULT NULL,
  `serve_period` varchar(255) DEFAULT NULL,
  `serve_name` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `main_price` varchar(255) DEFAULT NULL,
  `extra_price` varchar(255) DEFAULT NULL,
  `tax_control` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `sale_name` varchar(255) DEFAULT NULL,
  `goodsRemark` varchar(255) DEFAULT NULL,
  `orderRemark` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2055 DEFAULT CHARSET=utf8;

/*Table structure for table `t_message_send` */

DROP TABLE IF EXISTS `t_message_send`;

CREATE TABLE `t_message_send` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `to_user_id` int(12) DEFAULT NULL COMMENT '接收方ID',
  `to_user` varchar(50) NOT NULL COMMENT '接收方（手机号，openId,邮箱地址）',
  `from_user_id` int(50) NOT NULL COMMENT '发送方ID',
  `type` varchar(20) DEFAULT NULL COMMENT '发送方式',
  `template_id` varchar(50) NOT NULL COMMENT '模板Id',
  `app_code` varchar(50) DEFAULT NULL COMMENT '公众号标识',
  `send_status` enum('FAILED','UNSEND','SUCCESS') DEFAULT NULL COMMENT '推送状态',
  `send_time` date DEFAULT NULL COMMENT '推送时间',
  `send_num` int(12) DEFAULT NULL COMMENT '推送次数',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  `messgae_type` varchar(50) DEFAULT NULL COMMENT '消息类型',
  `content` text COMMENT '消息内容',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_message_unsend` */

DROP TABLE IF EXISTS `t_message_unsend`;

CREATE TABLE `t_message_unsend` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `to_user_id` int(12) DEFAULT NULL COMMENT '接收方ID',
  `to_user` varchar(50) NOT NULL COMMENT '接收方（手机号，openId,邮箱地址）',
  `from_user_id` int(50) NOT NULL COMMENT '发送方ID',
  `type` varchar(20) DEFAULT NULL COMMENT '发送方式',
  `template_id` varchar(50) NOT NULL COMMENT '模板Id',
  `app_code` varchar(50) DEFAULT NULL COMMENT '公众号标识',
  `send_time` date DEFAULT NULL COMMENT '推送时间',
  `send_num` int(12) DEFAULT NULL COMMENT '推送次数',
  `messgae_type` varchar(50) DEFAULT NULL COMMENT '消息类型',
  `content` text COMMENT '消息内容',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `order_no` char(50) NOT NULL COMMENT '订单编号',
  `name` varchar(50) NOT NULL COMMENT '订单名称，默认商口类型+yyyyMMddHHmmss',
  `order_type` varchar(10) NOT NULL COMMENT '	订单类型 \r\nGOODS-商品 \r\nRECHARGE-充值 \r\nTOCASH-提现',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `cust_name` varchar(50) DEFAULT NULL COMMENT '客户名',
  `crm_code` varchar(20) NOT NULL COMMENT '企业CODE',
  `order_amount` bigint(12) DEFAULT '0' COMMENT '	订单金额（厘）',
  `amount` bigint(12) DEFAULT NULL COMMENT '	支付总金额（厘）',
  `status` enum('BEFORE','DONE','FAIL','CANCEL','OVERTIME') NOT NULL COMMENT '支付状态： \r\nBEFORE-待支付（默认） \r\nDONE-已支付 \r\nFAIL-支付失败 \r\nCANCEL-订单取消 \r\nOVERTIME-超时未支付（预留）',
  `creator_id` int(11) NOT NULL COMMENT '	创建用户ID',
  `enterprise_code` varchar(20) NOT NULL COMMENT '	创建用户企业CODE',
  `remark` varchar(200) DEFAULT NULL COMMENT '	订单备注',
  `create_time` datetime NOT NULL COMMENT '	创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '	修改时间',
  `source` varchar(20) DEFAULT NULL COMMENT '订单来源',
  `receipt` int(1) DEFAULT NULL COMMENT '收据 1有 0无',
  `saler_id` int(11) DEFAULT NULL COMMENT '销售id',
  `saler_name` varchar(20) DEFAULT NULL COMMENT '销售名',
  `attachments` varchar(500) DEFAULT NULL COMMENT '附件',
  `order_status` enum('BEFORE','PROCESS','DONE','CANCEL','OVERTIME') DEFAULT NULL COMMENT '订单状态',
  `order_time` varchar(50) DEFAULT NULL COMMENT '下单时间',
  `linkman_name` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contract_codes` varchar(80) DEFAULT NULL COMMENT '合同号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_order_discount` */

DROP TABLE IF EXISTS `t_order_discount`;

CREATE TABLE `t_order_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_no` char(0) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `amount` bigint(255) DEFAULT NULL,
  `type` enum('NEW','RENEW','GIVE') DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_order_goods` */

DROP TABLE IF EXISTS `t_order_goods`;

CREATE TABLE `t_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_no` char(50) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `goods_type` varchar(10) NOT NULL,
  `price` bigint(12) NOT NULL,
  `amount` bigint(12) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `status` enum('INIT','PROCESS','DONE') DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_order_pay` */

DROP TABLE IF EXISTS `t_order_pay`;

CREATE TABLE `t_order_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` bigint(12) DEFAULT NULL,
  `pay_type` enum('ON-ALIPAY','ON-WECHAT','ON-WALLET','OFF-ALIPAY','OFF-WECHAT','OFF-CMB','OFF-BOC','OFF-CSB','OFF-POS') DEFAULT NULL,
  `pay_time` varchar(50) DEFAULT NULL,
  `pay_code` varchar(50) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `order_no` char(50) NOT NULL,
  `attachments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_order_serve` */

DROP TABLE IF EXISTS `t_order_serve`;

CREATE TABLE `t_order_serve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(30) NOT NULL COMMENT '商品名字',
  `start_time` varchar(50) DEFAULT NULL COMMENT '服务开始日期',
  `serve_period` int(11) DEFAULT NULL COMMENT '服务期限-以月为单位',
  `end_time` datetime DEFAULT NULL COMMENT '服务截止日期',
  `serve_id` int(20) NOT NULL COMMENT '服务id',
  `serve_name` varchar(20) NOT NULL COMMENT '服务名',
  `order_no` char(50) NOT NULL COMMENT '订单号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品id，索引用',
  `expire_time` datetime DEFAULT NULL COMMENT '任务消亡时间',
  `serve_price` int(20) NOT NULL DEFAULT '0' COMMENT '服务价格',
  `status` enum('INIT','PROCESS','DONE') DEFAULT NULL COMMENT '是否完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=798 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_oss_file` */

DROP TABLE IF EXISTS `t_oss_file`;

CREATE TABLE `t_oss_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `enterprise_code` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '文件访问地址',
  `md5` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) NOT NULL COMMENT '文件名',
  `size` int(11) DEFAULT NULL COMMENT '文件大小',
  `mime_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_person_performance_daily` */

DROP TABLE IF EXISTS `t_person_performance_daily`;

CREATE TABLE `t_person_performance_daily` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `department_id` int(12) NOT NULL COMMENT '部门ID',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `parent_path` varchar(50) DEFAULT NULL COMMENT '父级路由',
  `create_time` date NOT NULL COMMENT '日期',
  `trading_money` bigint(50) DEFAULT '0' COMMENT '成交金额',
  `call_volume` int(20) DEFAULT '0' COMMENT '电话量',
  `trading_volume` int(20) DEFAULT '0' COMMENT '成交量',
  `potentail_clients` int(20) DEFAULT '0' COMMENT '意向客户',
  `remakes` varchar(50) DEFAULT NULL COMMENT '备注',
  `user_id` int(12) DEFAULT NULL COMMENT '用户ID',
  `enterprise_code` varchar(50) DEFAULT NULL COMMENT '企业编码',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_person_performance_monthly` */

DROP TABLE IF EXISTS `t_person_performance_monthly`;

CREATE TABLE `t_person_performance_monthly` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `department_id` int(12) NOT NULL COMMENT '部门ID',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `parent_path` varchar(50) DEFAULT NULL COMMENT '父级路由',
  `create_time` date NOT NULL COMMENT '日期',
  `trading_money` bigint(50) DEFAULT '0' COMMENT '成交金额',
  `call_volume` int(20) DEFAULT '0' COMMENT '电话量',
  `trading_volume` int(20) DEFAULT '0' COMMENT '成交量',
  `potentail_clients` int(20) DEFAULT '0' COMMENT '意向客户',
  `remakes` varchar(50) DEFAULT NULL COMMENT '备注',
  `user_id` int(12) DEFAULT NULL COMMENT '用户ID',
  `enterprise_code` varchar(50) DEFAULT NULL COMMENT '企业编码',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_position` */

DROP TABLE IF EXISTS `t_position`;

CREATE TABLE `t_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `name` varchar(50) NOT NULL COMMENT ' 职位名称',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业crm_code',
  `status` enum('Y','N') NOT NULL COMMENT '部门状态<br>Y-正常<br>N-停止',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_position_level` */

DROP TABLE IF EXISTS `t_position_level`;

CREATE TABLE `t_position_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `position_id` int(11) NOT NULL COMMENT '职位ID',
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业crm_code',
  `name` varchar(50) NOT NULL COMMENT ' 级别名称',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `name` varchar(32) DEFAULT NULL COMMENT '个人用户名称',
  `status` enum('Y','N') NOT NULL COMMENT '状态Y-正常N-停用',
  `source` varchar(32) DEFAULT NULL COMMENT '注册来源',
  `creator` int(11) DEFAULT NULL COMMENT '创建人ID',
  `sex` enum('M','F','D') NOT NULL COMMENT '性别<br>M-男<br>F-女<br>D-未知（默认）',
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `district_code` varchar(20) DEFAULT NULL COMMENT '地区编码',
  `address` varchar(100) DEFAULT NULL COMMENT '通讯地址',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `idcard_no` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `idcard_front` varchar(255) DEFAULT NULL COMMENT '身份证正面照',
  `idcard_back` varchar(255) DEFAULT NULL COMMENT '身份证背面照',
  `certify_status` enum('NOTCERTIFY','CERTIFYING','SUCCESS','FAIL') NOT NULL COMMENT '实名认证状态<br>NOTCERTIFY-未认证(默认)<br>CERTIFYING-认证中<br>SUCCESS-认证成功<br>FAIL-认证失败',
  `certify_fail_info` varchar(255) DEFAULT NULL COMMENT '实名认证失败原因',
  `certify_start_time` datetime DEFAULT NULL COMMENT '实名认证开始时间',
  `certify_update_time` datetime DEFAULT NULL COMMENT '实名认证更新时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNQ_MOBILE` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_activity` */

DROP TABLE IF EXISTS `t_user_activity`;

CREATE TABLE `t_user_activity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `code` varchar(50) DEFAULT NULL COMMENT '邀请码',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `time` date DEFAULT NULL COMMENT '邀请时间',
  `type` enum('HE','RE') DEFAULT NULL COMMENT '类型',
  `source` varchar(20) DEFAULT NULL COMMENT '活动来源',
  `couponId` int(10) DEFAULT NULL COMMENT '用户优惠券Id',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_coupon` */

DROP TABLE IF EXISTS `t_user_coupon`;

CREATE TABLE `t_user_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `enterprise_code` varchar(20) DEFAULT NULL COMMENT '企业Code',
  `coupon_id` int(10) DEFAULT NULL COMMENT '优惠券编号',
  `coupon_money` int(12) DEFAULT NULL COMMENT '券额',
  `source` varchar(20) NOT NULL COMMENT '优惠券来源',
  `keyword` varchar(20) DEFAULT NULL COMMENT '如邀请人ID',
  `create_time` datetime NOT NULL COMMENT '领取时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `employ_time` datetime DEFAULT NULL COMMENT '失效时间',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单号ID',
  `order_name` varchar(50) DEFAULT NULL COMMENT '订单号',
  `status` enum('UN-USED','ON-USED','YET-USED','OUT-DATE') DEFAULT NULL COMMENT 'UNUSED未使用,ONUSED使用中,YET-USED已使用，OUT-DATE已过期',
  UNIQUE KEY `id` (`id`,`user_id`,`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_customer` */

DROP TABLE IF EXISTS `t_user_customer`;

CREATE TABLE `t_user_customer` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_mobile` varchar(50) NOT NULL COMMENT '用户电话',
  `crm_code` varchar(20) NOT NULL COMMENT '客户code',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_cust_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_user_customer_action` */

DROP TABLE IF EXISTS `t_user_customer_action`;

CREATE TABLE `t_user_customer_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `crm_code` varchar(50) DEFAULT NULL,
  `action` enum('BLACKLIST') DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `cust_name` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` enum('Y','N') DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_feedback` */

DROP TABLE IF EXISTS `t_user_feedback`;

CREATE TABLE `t_user_feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `feedback` varchar(1000) DEFAULT NULL COMMENT '用户反馈',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '联系电话',
  `create_time` date NOT NULL COMMENT '创建时间',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_user_invite` */

DROP TABLE IF EXISTS `t_user_invite`;

CREATE TABLE `t_user_invite` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `enterprise_code` varchar(20) DEFAULT NULL COMMENT '企业Code',
  `type` enum('RE','HE','UN') NOT NULL COMMENT 'RE-注册/HE-助力/UN-未知',
  `invite_user_id` int(10) NOT NULL COMMENT '受邀人ID',
  `invite_user_name` varchar(20) NOT NULL COMMENT '受邀人名',
  `invite_time` datetime NOT NULL COMMENT '邀请时间',
  `remakes` varchar(200) DEFAULT NULL COMMENT '备注',
  `over_time` datetime DEFAULT NULL COMMENT '受邀人完成时间',
  `invite_code` varchar(50) NOT NULL COMMENT '邀请码',
  `coupon_id` int(20) DEFAULT NULL COMMENT '优惠券ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_login` */

DROP TABLE IF EXISTS `t_user_login`;

CREATE TABLE `t_user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(11) NOT NULL COMMENT '个人信息表ID',
  `user_name` varchar(32) NOT NULL COMMENT '登录账号名/第三方标识ID(openid)',
  `password` varchar(50) NOT NULL COMMENT '登录密码(第三方登录为0)',
  `status` enum('Y','N') NOT NULL COMMENT '状态，Y-可用，N-禁用',
  `salt` varchar(50) NOT NULL COMMENT '盐',
  `app_code` varchar(50) NOT NULL COMMENT '第三方登录应用编号(普通登录账号为0)',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最后登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UQ_USERLOGIN_USERNAME_APPCODE` (`user_name`,`app_code`) USING BTREE,
  KEY `IDX_USERLOGIN_USERID` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_position` */

DROP TABLE IF EXISTS `t_user_position`;

CREATE TABLE `t_user_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `user_id` int(11) NOT NULL,
  `enterprise_code` varchar(20) NOT NULL COMMENT '企业crm_code',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `position_id` int(11) NOT NULL COMMENT '职位ID',
  `position_level` int(11) DEFAULT NULL COMMENT '职位级别ID',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `t_user_wx` */

DROP TABLE IF EXISTS `t_user_wx`;

CREATE TABLE `t_user_wx` (
  `openid` varchar(50) NOT NULL COMMENT '用户标识',
  `subscribe` enum('1','0') DEFAULT NULL COMMENT '1-关注/0-未关注',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `sex` enum('0','1','2') DEFAULT NULL COMMENT '0-未知/1-男性/2-女性',
  `language` varchar(20) DEFAULT NULL COMMENT '用户使用的语言',
  `city` varchar(20) DEFAULT NULL COMMENT '用户所在的城市',
  `province` varchar(20) DEFAULT NULL COMMENT '用户所在的省份',
  `country` varchar(20) DEFAULT NULL COMMENT '用户所在的国家',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `subscribe_time` varchar(20) DEFAULT NULL COMMENT '用户关注时间',
  `remake` varchar(200) DEFAULT NULL COMMENT '备注',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户id',
  UNIQUE KEY `NewIndex1` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/* Procedure structure for procedure `sum1` */

/*!50003 DROP PROCEDURE IF EXISTS  `sum1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`db_erp_dev`@`%` PROCEDURE `sum1`()
begin
		    declare i int default 12;
		    declare a int default 47;
        declare b int default 2;
    while i<=a DO -- 循环开始
INSERT INTO `t_auth_user_role`(`id`, `user_id`, `role_id`, `create_time`) VALUES (b, i, 2, '2020-03-13 12:56:21');
        set i = i+1;
        set b = b+1;
    end while; -- 循环结束
    -- 输出结果
    end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
