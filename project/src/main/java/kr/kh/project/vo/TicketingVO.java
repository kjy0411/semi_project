package kr.kh.project.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class TicketingVO {
	private int ti_num; 
	private int ti_sk_num; 
	private String ti_me_id; 
	private int ti_amount; 
	private int ti_total_price; 
	private int ti_price; 
	private int ti_save_point; 
	private int ti_use_point; 
	private String ti_state;
	
	private String ti_total_price_str; 
	private String ti_price_str; 
	private String ai_start_name;
	private String ai_end_name;

	private float mc_bonus_point;
	
	public int getTi_price() {
		this.ti_price = ti_total_price - this.ti_use_point;
		return this.ti_price;
	}
	public int getTi_save_point() {
		this.ti_save_point = (int)(ti_price * (0.005 * mc_bonus_point));
		return this.ti_save_point;
	}
	
	public String getTi_price_str() {
		if(ti_price == 0) {
			return "0";	
		}
		DecimalFormat decFormat = new DecimalFormat("###,###");
		ti_price_str = decFormat.format(ti_price);
		return ti_price_str;
	}
	public String getTi_total_price_str() {
		if(ti_total_price == 0) {
			return "0";	
		}
		DecimalFormat decFormat = new DecimalFormat("###,###");
		ti_total_price_str = decFormat.format(ti_total_price);
		return ti_total_price_str;
	}
}
