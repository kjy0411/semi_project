package kr.kh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "/main/home";
	}
	
	@GetMapping("/menu/admin")
	public String menuAdmin() {
		return "/menu/admin";
	}
	
	@GetMapping("/menu/user")
	public String menuUser() {
		return "/menu/user";
	}
}
