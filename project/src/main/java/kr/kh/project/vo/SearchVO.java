package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class SearchVO {
	private String startAirport;
	private String endAriport;
	private Date startDay;
	private Date endDay;
	private int seatAmount;
	
	public String getStartDaystr() {
		if(startDay == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(startDay);
	}
	public void setStartDay(String date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			startDay = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public String getEndDay_str() {
		if(endDay == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(endDay);
	}
	public void setEndDay(String date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			endDay = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
