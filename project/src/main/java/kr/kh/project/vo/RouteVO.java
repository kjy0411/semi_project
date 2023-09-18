package kr.kh.project.vo;

import lombok.Data;

@Data
public class RouteVO {
	private int ro_num; 
	private String ro_ai_start; 
	private String ro_ai_end;
	
	private String ai_name_start;
	private String ai_name_end;
}
