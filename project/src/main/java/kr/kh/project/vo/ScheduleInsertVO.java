package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;

import lombok.Data;

@Data
public class ScheduleInsertVO {
	private String sk_ap_num;
	private int sk_ro_num;
	private Date sk_start_time;
	private LocalTime sk_time;
	private int sk_price;
	
	private String sk_start_time_str;
	private int sk_time_hour;
	private int sk_time_minute;
	private String ro_ai_start;
	private String ro_ai_end;
	
	public String getSk_start_time_str() {
		sk_start_time_str = this.sk_start_time_str.replace("T", " ");
		return sk_start_time_str;
	}
	
	public void setSk_start_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			sk_start_time = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public LocalTime getSk_time() {
		return sk_time =  LocalTime.of(this.sk_time_hour,this.sk_time_minute,0);
	}
	public void setSk_time() {
		sk_time =  LocalTime.of(this.sk_time_hour,this.sk_time_minute,0);
	}
}
