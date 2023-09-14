package kr.kh.project.vo;

import lombok.Data;

@Data
public class NationVO {
	private String na_name; 
	private String na_division;
	@Override
	public String toString() {
		return "{\"na_name\" : \"" + na_name + "\", \"na_division\":\"" + na_division + "\"}";
	}
}
