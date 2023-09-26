package kr.kh.project.vo;

import lombok.Data;

@Data
public class AirplaneVO {
	private String ap_num;
	private String ap_al_name;
	private String ap_am_model;
	private boolean ap_state;
	
	private String am_col;
	private String am_row;
	private String am_exit_col;
	private int sk_num;
	private Integer sk_price;
}
