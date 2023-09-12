package kr.kh.project.vo;

import lombok.Data;

@Data
public class PotinVO {
	private int po_num; 
	private String po_me_id; 
	private String po_al_name; 
	private String po_mc_name; 
	private int po_accumulate_point; 
	private int po_hold_point;
}
