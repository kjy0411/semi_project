package kr.kh.project.vo;

import lombok.Data;

@Data
public class PointHistoryVO {
	
	private int ph_num;
	private int ph_po_num;
	private int ph_ti_num;
	private String ph_detail;
	
	private int num;
	private int point; 
	private int ti_save_point; 
	private int ti_use_point;
	private String ti_state;
	
	private int po_accumulate_point; 
	private int po_hold_point;
}
