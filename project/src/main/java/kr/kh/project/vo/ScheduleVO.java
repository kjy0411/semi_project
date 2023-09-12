package kr.kh.project.vo;

import java.text.ParseException;
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
	
	public String getSk_start_time_str() {
		if(sk_start_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(sk_start_time);
	}
	public void setSk_start_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			sk_start_time = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public String getSk_end_time_str() {
		if(sk_end_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(sk_end_time);
	}
	public void setSk_end_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			sk_end_time = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public String getSk_time_str() {
		if(sk_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		return format.format(sk_time);
	}
	public void setSk_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		try {
			sk_time = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
