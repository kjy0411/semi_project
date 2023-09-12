DROP DATABASE IF EXISTS RESERVATION;

CREATE DATABASE RESERVATION;

USE RESERVATION;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(20)	NOT NULL	PRIMARY KEY	COMMENT '영문으로 시작, 영문, 숫자 조합으로 10~20자',
	`me_pw`	varchar(255)	NOT NULL	COMMENT '영문, 숫자, !@#$ 조합으로 12~25자',
	`me_name`	varchar(30)	NOT NULL,
	`me_eng_name`	varchar(30)	NOT NULL,
	`me_birthday`	date	NOT NULL,
	`me_phone`	varchar(20)	NOT NULL,
	`me_email`	varchar(50)	NOT NULL,
	`me_authority`	varchar(10)	NOT NULL	DEFAULT 'USER'	COMMENT 'ADMIN, USER, STOP중 선택',
    `me_session_id`	varchar(255),
    `me_session_limit`	datetime
);

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
	`po_num`	int	NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
	`po_me_id`	varchar(20)	NOT NULL,
	`po_al_name`	varchar(20)	NOT NULL,
	`po_mc_name`	varchar(10)	NOT NULL	COMMENT '누적마일리지로 결정',
	`po_accumulate_point`	int	NOT NULL	DEFAULT 0,
	`po_hold_point`	int	NOT NULL	DEFAULT 0
);

DROP TABLE IF EXISTS `ticketing`;

CREATE TABLE `ticketing` (
	`ti_num`	int	NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
	`ti_sk_num`	int	NOT NULL,
	`ti_me_id`	varchar(20)	NOT NULL,
	`ti_amount`	int	NOT NULL	DEFAULT 1,
	`ti_total_price`	int	NOT NULL	COMMENT '각 좌석의 등급별 (배율*기본비용)의 총합',
	`ti_price`	int	NOT NULL	COMMENT '총금액 - 사용마일리지',
	`ti_save_point`	int	NULL	DEFAULT 0,
	`ti_use_point`	int	NULL	DEFAULT 0,
	`ti_state`	varchar(10)	NOT NULL	DEFAULT '미확정'	COMMENT '미확정, 확정, 예매취소 중 선택'
);

DROP TABLE IF EXISTS `ticketing_list`;

CREATE TABLE `ticketing_list` (
	`tl_num`	varchar(20)	NOT NULL	PRIMARY KEY	COMMENT '예매일자(6), 출발지(3), 도착지(3), 예매순서(4), 좌석번호(4) -빈자리는 0으로 채운다',
	`tl_ti_num`	int	NOT NULL,
	`tl_se_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
	`sk_num`	int	NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
	`sk_ap_num`	varchar(7)	NOT NULL,
	`sk_ro_num`	int	NOT NULL,
	`sk_start_time`	datetime	NOT NULL,
	`sk_end_time`	datetime	NULL	COMMENT '출발시간 - 출발지의 표준시 + 도착지의 표준시 + 비행시간',
	`sk_time`	time	NOT NULL,
	`sk_price`	int	NOT NULL
);

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
	`ai_num`	varchar(3)	NOT NULL	PRIMARY KEY	COMMENT 'IATA코드',
	`ai_name`	varchar(30)	NOT NULL,
	`ai_na_name`	varchar(20)	NOT NULL,
	`ai_standard_time`	time	NOT NULL	COMMENT 'UTC'
);

DROP TABLE IF EXISTS `airplane`;

CREATE TABLE `airplane` (
	`ap_num`	varchar(7)	NOT NULL	PRIMARY KEY	COMMENT '국가코드(최대3자리)+등록번호(0000~9999)',
	`ap_al_name`	varchar(20)	NOT NULL,
	`ap_am_model`	varchar(4)	NOT NULL
);

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
	`al_name`	varchar(20)	NOT NULL	PRIMARY KEY
);

DROP TABLE IF EXISTS `seat`;

CREATE TABLE `seat` (
	`se_num`	int	NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
	`se_name`	varchar(4)	NOT NULL	COMMENT '영문2, 숫자2',
	`se_sc_name`	varchar(20)	NOT NULL	DEFAULT '일반석',
	`se_am_model`	varchar(4)	NOT NULL
);

DROP TABLE IF EXISTS `airplane_model`;

CREATE TABLE `airplane_model` (
	`am_model`	varchar(4)	NOT NULL	PRIMARY KEY	COMMENT 'ICAO코드',
	`am_name`	varchar(20)	NOT NULL,
	`am_col`	int	NOT NULL	COMMENT '좌석 열 끝 번호',
	`am_exit_col`	int	NOT NULL	COMMENT '출구가 있는 열 번호'
);

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
	`ro_num`	int	NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
	`ro_ai_start`	varchar(3)	NOT NULL,
	`ro_ai_end`	varchar(3)	NOT NULL
);

DROP TABLE IF EXISTS `seat_class`;

CREATE TABLE `seat_class` (
	`sc_name`	varchar(20)	NOT NULL	PRIMARY KEY	COMMENT '이코노미, 비지니스, 퍼스트',
	`sc_ratio`	int	NOT NULL	COMMENT '1, 2, 4'
);

DROP TABLE IF EXISTS `point_history`;

CREATE TABLE `point_history` (
	`ph_num`	int	NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
	`ph_po_num`	int	NOT NULL,
	`ph_ti_num`	int	NOT NULL,
	`ph_detail`	varchar(20)	NOT NULL	COMMENT '적립, 사용 중 선택'
);

DROP TABLE IF EXISTS `member_class`;

CREATE TABLE `member_class` (
	`mc_name`	varchar(10)	NOT NULL	PRIMARY KEY	COMMENT '실버, 골드, 다이아몬드, 다이아몬드플러스, 플래티넘',
	`mc_bonus_point`	int	NOT NULL	COMMENT '1, 1.05, 1.1, 1.15, 1.2'
);

DROP TABLE IF EXISTS `nation`;

CREATE TABLE `nation` (
	`na_name`	varchar(20)	NOT NULL PRIMARY KEY,
	`na_division`	varchar(10)	NULL
);

ALTER TABLE `point` ADD CONSTRAINT `FK_member_TO_point_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `point` ADD CONSTRAINT `FK_airline_TO_point_1` FOREIGN KEY (
	`po_al_name`
)
REFERENCES `airline` (
	`al_name`
);

ALTER TABLE `point` ADD CONSTRAINT `FK_member_class_TO_point_1` FOREIGN KEY (
	`po_mc_name`
)
REFERENCES `member_class` (
	`mc_name`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `FK_schedule_TO_ticketing_1` FOREIGN KEY (
	`ti_sk_num`
)
REFERENCES `schedule` (
	`sk_num`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `FK_member_TO_ticketing_1` FOREIGN KEY (
	`ti_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `ticketing_list` ADD CONSTRAINT `FK_ticketing_TO_ticketing_list_1` FOREIGN KEY (
	`tl_ti_num`
)
REFERENCES `ticketing` (
	`ti_num`
);

ALTER TABLE `ticketing_list` ADD CONSTRAINT `FK_seat_TO_ticketing_list_1` FOREIGN KEY (
	`tl_se_num`
)
REFERENCES `seat` (
	`se_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `FK_airplane_TO_schedule_1` FOREIGN KEY (
	`sk_ap_num`
)
REFERENCES `airplane` (
	`ap_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `FK_route_TO_schedule_1` FOREIGN KEY (
	`sk_ro_num`
)
REFERENCES `route` (
	`ro_num`
);

ALTER TABLE `airport` ADD CONSTRAINT `FK_nation_TO_airport_1` FOREIGN KEY (
	`ai_na_name`
)
REFERENCES `nation` (
	`na_name`
);

ALTER TABLE `airplane` ADD CONSTRAINT `FK_airline_TO_airplane_1` FOREIGN KEY (
	`ap_al_name`
)
REFERENCES `airline` (
	`al_name`
);

ALTER TABLE `airplane` ADD CONSTRAINT `FK_airplane_model_TO_airplane_1` FOREIGN KEY (
	`ap_am_model`
)
REFERENCES `airplane_model` (
	`am_model`
);

ALTER TABLE `seat` ADD CONSTRAINT `FK_seat_class_TO_seat_1` FOREIGN KEY (
	`se_sc_name`
)
REFERENCES `seat_class` (
	`sc_name`
);

ALTER TABLE `seat` ADD CONSTRAINT `FK_airplane_model_TO_seat_1` FOREIGN KEY (
	`se_am_model`
)
REFERENCES `airplane_model` (
	`am_model`
);

ALTER TABLE `route` ADD CONSTRAINT `FK_airport_TO_route_1` FOREIGN KEY (
	`ro_ai_start`
)
REFERENCES `airport` (
	`ai_num`
);

ALTER TABLE `route` ADD CONSTRAINT `FK_airport_TO_route_2` FOREIGN KEY (
	`ro_ai_end`
)
REFERENCES `airport` (
	`ai_num`
);

ALTER TABLE `point_history` ADD CONSTRAINT `FK_point_TO_point_history_1` FOREIGN KEY (
	`ph_po_num`
)
REFERENCES `point` (
	`po_num`
);

ALTER TABLE `point_history` ADD CONSTRAINT `FK_ticketing_TO_point_history_1` FOREIGN KEY (
	`ph_ti_num`
)
REFERENCES `ticketing` (
	`ti_num`
);

