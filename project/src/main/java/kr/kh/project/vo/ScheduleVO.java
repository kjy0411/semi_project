package kr.kh.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO {
	int sk_num;
	String sk_ap_num;
	int sk_ro_num;
	Date sk_start_time;
	Date sk_end_time;
	Date sk_time;
	int sk_price;
	
	public String getAi_standard_time_str() {
		if(sk_start_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		return format.format(sk_start_time);
	}
	
	public String getSk_end_time_str() {
		if(sk_end_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		return format.format(sk_end_time);
	}
	
	public String getSk_time_str() {
		if(sk_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		return format.format(sk_time);
	}
}
