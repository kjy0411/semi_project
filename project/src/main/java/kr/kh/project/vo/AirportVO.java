package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class AirportVO {
	private String ai_num;
	private String ai_name;
	private String ai_na_name;
	private Date ai_standard_time;
	
	private String na_division;
	
	public String getAi_standard_time_str() {
		if(ai_standard_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		return format.format(ai_standard_time);
	}
	public void setAi_standard_time(String time) {
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		try {
			ai_standard_time = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "{\"ai_name\" : \"" + ai_name + "\", \"ai_na_name\":\"" + ai_na_name + "\"}";
	}
}
