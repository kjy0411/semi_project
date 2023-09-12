package kr.kh.project.util;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Message {
	private String url;
	private String msg;
	
	public String toString() {
		return "{ " + "msg : '" + msg + "', url : '" + url + "' }";
	}
}
