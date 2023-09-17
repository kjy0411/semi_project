package kr.kh.air.vo;

import java.util.Date;

import lombok.Data;

@Data
public interface ScheduleVO {

	int sk_num;
	String sk_ap_num;
	int sk_ro_num;
	Date sk_start_time;
	Date sk_end_time;
	Date sk_time;
	int sk_price;
}
