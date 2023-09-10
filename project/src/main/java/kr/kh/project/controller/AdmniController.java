package kr.kh.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdmniController {
	
	
	@GetMapping("/menu/admin")
	public String menuAdmin() {
		return "/menu/admin";
	}
}
