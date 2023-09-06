package kr.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "main/home";
	}
	
	@GetMapping("/menu")
	public String menu(String authority) {
		String url = null;
		if(authority.equals("admin")) {
			url = "menu/" + authority;
		}else if(authority.equals("user")) {
			url = "menu/" + authority;
		}else {
			url = "main/home";
		}
		return url;
	}
}
