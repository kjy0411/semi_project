package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO {
	private int sk_num;
	private String sk_ap_num;
	private int sk_ro_num;
	private Date sk_start_time;
	private Date sk_end_time;
	private Date sk_time;
	private int sk_price;
	
	private String sk_start_time_str;
	private String sk_end_time_str;
	private String sk_time_str;
	//검색을 위한 개체
	private String ap_al_name;
	private String ai_start_name;		//출발지의 공항이름
	private String ai_end_name;			//도착지의 공항이름
	private String start_standard_time;	//출발지의 UTC
	private String end_standard_time;	//도착지의 UTC
	
	public String getSk_start_time_str() {
		if(sk_start_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		sk_start_time_str = format.format(sk_start_time);
		return sk_start_time_str;
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
		sk_end_time_str = format.format(sk_end_time);
		return sk_end_time_str;
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
		sk_time_str = format.format(sk_time);
		return sk_time_str;
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
