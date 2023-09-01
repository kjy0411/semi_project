DROP DATABASE IF EXISTS RESERVATION;

CREATE DATABASE RESERVATION;

USE RESERVATION;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(20)	NOT NULL	COMMENT '영문으로 시작, 영문, 숫자 조합으로 10~20자',
	`me_pw`	varchar(25)	NOT NULL	COMMENT '영문, 숫자, !@#$ 조합으로 12~25자',
	`me_name`	varchar(30)	NOT NULL,
	`me_eng_name`	varchar(30)	NOT NULL,
	`me_birthday`	date	NOT NULL,
	`me_phone`	varchar(20)	NOT NULL,
	`me_email`	varchar(50)	NOT NULL,
	`me_authority`	varchar(10)	NOT NULL	DEFAULT 'USER'	COMMENT 'ADMIN, USER, STOP중 선택'
);

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
	`po_num`	int	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`po_me_id`	varchar(20)	NOT NULL,
	`po_al_name`	varchar(20)	NOT NULL,
	`po_mc_name`	varchar(10)	NOT NULL	COMMENT '누적마일리지로 결정',
	`po_accumulate_point`	int	NOT NULL	DEFAULT 0,
	`po_hold_point`	int	NOT NULL	DEFAULT 0
);

DROP TABLE IF EXISTS `ticketing`;

CREATE TABLE `ticketing` (
	`ti_num`	int	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`ti_sk_num`	int	NOT NULL,
	`ti_me_id`	varchar(20)	NOT NULL,
	`ti_amount`	int	NOT NULL	DEFAULT 1,
	`ti_total_price`	int	NOT NULL	COMMENT '각 좌석의 등급별 (배율*기본비용)의 총합',
	`ti_price`	int	NOT NULL	COMMENT '총금액 - 사용마일리지',
	`ti_save_point`	int	NULL	DEFAULT 0,
	`ti_use_point`	int	NULL	DEFAULT 0,
	`ti_state`	varchar(10)	NOT NULL	DEFAULT '미확정'	COMMENT '미확정, 확정, 예매취소 중 선택'
);

DROP TABLE IF EXISTS `ticketting_list`;

CREATE TABLE `ticketting_list` (
	`tl_num`	varchar(20)	NOT NULL	COMMENT '예매일자(6), 출발지(3), 도착지(3), 예매순서(4), 좌석번호(4) -빈자리는 0으로 채운다',
	`tl_ti_num`	int	NOT NULL,
	`tl_se_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
	`sk_num`	int	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`sk_ap_num`	varchar(7)	NOT NULL,
	`sk_ro_num`	int	NOT NULL,
	`sk_stat_time`	datetime	NOT NULL,
	`sk_end_time`	datetime	NOT NULL	COMMENT '출발시간 - 출발지의 표준시 + 도착지의 표준시 + 비행시간',
	`sk_time`	time	NULL,
	`sk_price`	int	NOT NULL
);

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
	`ai_num`	varchar(3)	NOT NULL	COMMENT 'IATA코드',
	`ai_name`	varchar(20)	NOT NULL,
	`ai_nation`	varchar(10)	NOT NULL,
	`ai_standard_time`	int	NOT NULL	COMMENT 'UTC'
);

DROP TABLE IF EXISTS `airplane`;

CREATE TABLE `airplane` (
	`ap_num`	varchar(7)	NOT NULL	COMMENT '국가코드(최대3자리)+등록번호(0000~9999)',
	`ap_al_name`	varchar(20)	NOT NULL,
	`ap_am_model`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
	`al_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `seat`;

CREATE TABLE `seat` (
	`se_num`	int	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`se_name`	varchar(4)	NOT NULL	COMMENT '영문2, 숫자2',
	`se_sc_name`	varchar(20)	NOT NULL	DEFAULT '일반석',
	`se_am_model`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `airplane_model`;

CREATE TABLE `airplane_model` (
	`am_model`	varchar(4)	NOT NULL	COMMENT 'ICAO코드',
	`am_first_class`	int	NOT NULL	DEFAULT 0,
	`am_business_class`	int	NOT NULL	DEFAULT 0,
	`am_economy_class`	int	NOT NULL	DEFAULT 0
);

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
	`ro_num`	int	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`ro_ai_start`	varchar(3)	NOT NULL,
	`ro_ai_end`	varchar(3)	NOT NULL
);

DROP TABLE IF EXISTS `seat_class`;

CREATE TABLE `seat_class` (
	`sc_name`	varchar(20)	NOT NULL	COMMENT '이코노미, 비지니스, 퍼스트',
	`sc_ratio`	int	NOT NULL	COMMENT '1, 2, 4'
);

DROP TABLE IF EXISTS `point_history`;

CREATE TABLE `point_history` (
	`ph_num`	int	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`ph_po_num`	int	NOT NULL,
	`ph_ti_num`	int	NOT NULL,
	`ph_detail`	varchar(20)	NOT NULL	COMMENT '적립, 사용 중 선택'
);

DROP TABLE IF EXISTS `member_class`;

CREATE TABLE `member_class` (
	`mc_name`	varchar(10)	NOT NULL	COMMENT '실버, 골드, 다이아몬드, 다이아몬드플러스, 플래티넘',
	`mc_bonus_point`	int	NOT NULL	COMMENT '1, 1.05, 1.1, 1.15, 1.2'
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `point` ADD CONSTRAINT `PK_POINT` PRIMARY KEY (
	`po_num`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `PK_TICKETING` PRIMARY KEY (
	`ti_num`
);

ALTER TABLE `ticketting_list` ADD CONSTRAINT `PK_TICKETTING_LIST` PRIMARY KEY (
	`tl_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `PK_SCHEDULE` PRIMARY KEY (
	`sk_num`
);

ALTER TABLE `airport` ADD CONSTRAINT `PK_AIRPORT` PRIMARY KEY (
	`ai_num`
);

ALTER TABLE `airplane` ADD CONSTRAINT `PK_AIRPLANE` PRIMARY KEY (
	`ap_num`
);

ALTER TABLE `airline` ADD CONSTRAINT `PK_AIRLINE` PRIMARY KEY (
	`al_name`
);

ALTER TABLE `seat` ADD CONSTRAINT `PK_SEAT` PRIMARY KEY (
	`se_num`
);

ALTER TABLE `airplane_model` ADD CONSTRAINT `PK_AIRPLANE_MODEL` PRIMARY KEY (
	`am_model`
);

ALTER TABLE `route` ADD CONSTRAINT `PK_ROUTE` PRIMARY KEY (
	`ro_num`
);

ALTER TABLE `seat_class` ADD CONSTRAINT `PK_SEAT_CLASS` PRIMARY KEY (
	`sc_name`
);

ALTER TABLE `point_history` ADD CONSTRAINT `PK_POINT_HISTORY` PRIMARY KEY (
	`ph_num`
);

ALTER TABLE `member_class` ADD CONSTRAINT `PK_MEMBER_CLASS` PRIMARY KEY (
	`mc_name`
);

