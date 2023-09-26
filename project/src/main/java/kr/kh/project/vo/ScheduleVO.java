package kr.kh.project.vo;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ScheduleVO {
	private int sk_num;
	private String sk_ap_num;
	private int sk_ro_num;
	private Date sk_start_time;
	private Date sk_end_time;
	private Date sk_time;
	private Integer sk_price;
	
	private String sk_start_time_str;
	private String sk_end_time_str;
	private String sk_time_str;
	private String sk_price_str;	
	//�˻��� ���� ��ü
	private String ap_num;
	private String ap_al_name;
	private String ap_am_model;
	private String ai_start_name;		//������� �����̸�
	private String ai_end_name;			//�������� �����̸�
	
	private String al_name;
	private int ro_num; 
	private String ro_ai_start; 
	private String ro_ai_end;
	
	private String ai_name_start;
	private String ai_name_end;
	
	public String getSk_price_str() {
		if(sk_price == null) {
			return "";	
		}
		DecimalFormat decFormat = new DecimalFormat("###,###");
		sk_price_str = decFormat.format(sk_price);
		return sk_price_str;
	}
	
	public String getSk_start_time_str() {
		if(sk_start_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sk_start_time_str = format.format(sk_start_time);
		return sk_start_time_str;
	}
	public void setSk_start_time(String time) {
		if(time.contains("T")) {
			time=time.replace('T', ' ');
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sk_end_time_str = format.format(sk_end_time);
		return sk_end_time_str;
	}
	public void setSk_end_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		sk_time_str = format.format(sk_time);
		return sk_time_str;
	}
	public void setSk_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		try {
			sk_time = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	
}
