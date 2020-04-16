/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.25-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `t_user_wx` (
	`openid` varchar (150),
	`subscribe` varchar (3),
	`nickname` varchar (60),
	`sex` varchar (3),
	`language` varchar (60),
	`city` varchar (60),
	`province` varchar (60),
	`country` varchar (60),
	`headimgurl` varchar (765),
	`subscribe_time` varchar (60),
	`remake` varchar (600),
	`user_id` varchar (60)
); 


create table `t_user_invite` (
	`id` double ,
	`user_id` double ,
	`user_name` varchar (60),
	`crm_code` varchar (60),
	`type` varchar (6),
	`invite_user_id` double ,
	`invite_user_name` varchar (60),
	`invite_time` datetime ,
	`remakes` varchar (600),
	`over_time` datetime ,
	`invite_code` varchar (150),
	`coupon_id` double 
); 

create table `t_user_coupon` (
	`id` double ,
	`user_id` double ,
	`user_name` varchar (150),
	`crm_code` varchar (60),
	`coupon_id` double ,
	`coupon_money` double ,
	`source` varchar (60),
	`keyword` varchar (60),
	`create_time` datetime ,
	`update_time` datetime ,
	`employ_time` datetime ,
	`order_id` varchar (150),
	`order_name` varchar (150),
	`status` varchar (24)
); 

create table `t_user_activity` (
	`id` double ,
	`user_id` double ,
	`user_name` varchar (60),
	`code` varchar (150),
	`mobile` varchar (60),
	`time` date ,
	`type` varchar (6),
	`source` varchar (60),
	`couponId` double 
); 

create table `t_customer_intention` (
	`id` double ,
	`user_id` double ,
	`user_name` varchar (60),
	`type` varchar (6),
	`mobile` varchar (150),
	`remakes` varchar (600)
); 

create table `t_dict` (
	`id` double ,
	`code` varchar (60),
	`text` varchar (150),
	`type` varchar (150),
	`remark` varchar (765),
	`create_time` datetime ,
	`crm_code` varchar (60)
); 

create table `t_enterprise` (
	`id` double ,
	`name` varchar (96),
	`crm_code` varchar (60),
	`status` varchar (3),
	`linkman` double ,
	`district_code` varchar (60),
	`address` varchar (300),
	`remark` varchar (600),
	`certify_status` varchar (30),
	`credit_code` varchar (54),
	`parent_id` double ,
	`parent_code` varchar (60),
	`parent_name` varchar (96),
	`parent_path` varchar (480),
	`creator_id` double ,
	`creator_name` varchar (48),
	`name_short` varchar (765),
	`certify_time` datetime ,
	`reg_type` varchar (765),
	`reg_org_name` varchar (765),
	`reg_end_time` varchar (150),
	`reg_money` varchar (150),
	`reg_phone` varchar (75),
	`fa_ren` varchar (150),
	`email` varchar (765),
	`business_status` varchar (150),
	`create_time` datetime ,
	`update_time` datetime 
); 

create table `t_enterprise_user` (
	`id` double ,
	`crm_code` varchar (60),
	`employee_id` double ,
	`name` varchar (150),
	`user_id` double ,
	`parent_id` double ,
	`parent_path` varchar (150),
	`status` varchar (3),
	`entry_date` varchar (30),
	`leave_date` varchar (30),
	`create_time` datetime ,
	`update_time` datetime 
); 

create table `t_user` (
	`id` double ,
	`name` varchar (96),
	`status` varchar (3),
	`source` varchar (96),
	`creator` double ,
	`sex` varchar (3),
	`mobile` varchar (33),
	`email` varchar (150),
	`district_code` varchar (60),
	`address` varchar (300),
	`remark` varchar (600),
	`real_name` varchar (60),
	`idcard_no` varchar (150),
	`idcard_front` varchar (765),
	`idcard_back` varchar (765),
	`certify_status` varchar (30),
	`certify_fail_info` varchar (765),
	`certify_start_time` datetime ,
	`certify_update_time` datetime ,
	`create_time` datetime ,
	`update_time` datetime 
); 

create table `t_user_login` (
	`id` double ,
	`user_id` double ,
	`user_name` varchar (96),
	`password` varchar (150),
	`status` varchar (3),
	`salt` varchar (150),
	`app_code` varchar (150),
	`last_login_ip` varchar (90),
	`last_login_time` datetime ,
	`create_time` datetime ,
	`update_time` datetime 
); 