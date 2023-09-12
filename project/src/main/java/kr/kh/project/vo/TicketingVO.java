package kr.kh.project.vo;

import lombok.Data;

@Data
public class TicketingVO {
	int ti_num; 
	int ti_sk_num; 
	String ti_me_id; 
	int ti_amount; 
	int ti_total_price; 
	int ti_price; 
	int ti_save_point; 
	int ti_use_point; 
	String ti_state;
}
