package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.project.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/signup")
	public String signupMember() {
		return "/member/signup";
	}
	
	@GetMapping("/member/login")
	public String loginMember() {
		return "/member/login";
	}
	
	
}
