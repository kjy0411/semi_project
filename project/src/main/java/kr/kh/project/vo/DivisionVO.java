package kr.kh.project.vo;

import lombok.Data;

@Data
public class DivisionVO {
	private String di_name;
	@Override
	public String toString() {
		return "{\"di_name\" : \"" + di_name + "\"}";
	}
}
