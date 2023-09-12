package kr.kh.project.vo;

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
}
