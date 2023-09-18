package kr.kh.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_eng_name;
	private Date me_birthday;
	private String me_phone;
	private String me_email;
	private String me_authority;
	private String me_session_id;
	private Date me_session_limit;	
	
	private boolean autoLogin;
	
	
	public String getMe_birthday_str() {
		if(me_birthday == null) {
			return "";	
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(me_birthday);
	}
	public void setMe_birthday(String date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			me_birthday = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
}
