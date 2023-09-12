package kr.kh.project.vo;

import lombok.Data;

@Data
public class PotinVO {
	int po_num; 
	String po_me_id; 
	String po_al_name; 
	String po_mc_name; 
	int po_accumulate_point; 
	int po_hold_point;
}
