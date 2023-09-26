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
	private int ai_standard_type;
	
	private String na_division;
	
	public String getAiName() {
	    return ai_name;
	}
	public String getAiNaName() {
		return ai_na_name;
	}
	public Date getAiStandardTime() {
		return ai_standard_time;
	}
	
	public String getAi_standard_time_str() {
		if(ai_standard_time == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
		if(ai_standard_type == 1) {
			return format.format(ai_standard_time).equals("12:00:00") ? "00:00:00" : format.format(ai_standard_time);
		}else{
			return "-" + format.format(ai_standard_time);
		}
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
