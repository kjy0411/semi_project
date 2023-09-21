package kr.kh.project.vo;

import lombok.Data;

@Data
public class SeatVO {
	private int se_num; 
	private String se_name; 
	private String se_sc_name; 
	private String se_am_model;
	
	private int sc_ratio;
    private String tl_num;
    
    public int row;
    public int col;
    public int sk_num;
}
