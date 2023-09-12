package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class AirportVO {
	String ai_num;
	String ai_name;
	String ai_na_name;
	Date ai_standard_time;
	
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
}
