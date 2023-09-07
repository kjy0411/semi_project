package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.project.service.MemberService;
import kr.kh.project.util.Message;
import kr.kh.project.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/signup")
	public String signupMember() {
		return "/member/signup";
	}
	
	@PostMapping("/member/signup")
	public String singupMemberPost(Model model, MemberVO member) {
		Message msg = new Message("/member/signup", "회원가입을 실패했습니다.");
		
		if(memberService.signup(member)) {
			msg = new Message("/", "회원가입을 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@GetMapping("/member/login")
	public String loginMember() {
		return "/member/login";
	}
	
}
