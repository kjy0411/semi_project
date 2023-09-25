package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import lombok.Data;

@Data
public class SearchVO {
	
	private int ticketType;
	private String startAirport;
	private String endAriport;
	private Date startDay;
	private Date endDay;
	private int seatAmount;
	private String ro_ai_start;
	private String ro_ai_end;
	
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
	
	public String getEndDaystr() {
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
	
	public String getToDay() {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	        Calendar c1 = Calendar.getInstance();

		 String strToday = sdf.format(c1.getTime());
		return strToday.substring(2);
	}
}
