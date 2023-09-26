package kr.kh.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String singupMemberPost(Model model, MemberVO member, boolean id_check) {
		Message msg = new Message("member/signup", "회원가입을 실패했습니다.");
		
		if(memberService.signupMember(member)) {
			msg = new Message("/", "회원가입을 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@GetMapping("/member/login")
	public String loginMember() {
		return "/member/login";
	}
	
	@PostMapping("/member/login")
	public String loginMemberPost(Model model, MemberVO member) {
		Message msg = new Message("member/login", "로그인에 실패했습니다.");

		MemberVO user = memberService.loginMember(member);
		if(user != null) {
			msg = new Message("/", "로그인에 성공했습니다.");
			user.setAutoLogin(member.isAutoLogin());
		}
		model.addAttribute("user", user);
		model.addAttribute("msg", msg);
		
		return "message";
	}
	
	@GetMapping("/member/logout")
	public String logoutMember(Model model, HttpServletRequest request) {
		Message msg = new Message("/", null);
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		user.setMe_session_limit(null);
		memberService.updateMemberSession(user);
		if(user != null) {
			session.removeAttribute("user");
			msg.setMsg("로그아웃에 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		
		return "message";
	}
	
	@GetMapping("/member/check")
	public String checkMember(Model model,  HttpSession session) {
		String birthday_str = null;
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO member = memberService.selectMember(user.getMe_id());
		birthday_str = member.getMe_birthday_str();
		
		model.addAttribute("member", member);
		model.addAttribute("str", birthday_str);
		
		return "/member/check";
	}
	
	@ResponseBody
	@PostMapping("/member/check")
	public Map<String, Object> check(@RequestBody MemberVO member){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = memberService.checkMember(member);
		map.put("res", res);
		return map;
	}
	
	@GetMapping("/member/update")
	public String updateMember(Model model, HttpSession session) {
		String birthday_str = null;
		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO member = memberService.selectMember(user.getMe_id());
		birthday_str = member.getMe_birthday_str();
		
		model.addAttribute("member", member);
		model.addAttribute("str", birthday_str);
		
		return "/member/update";
	}
	
	@PostMapping("/member/update")
	public String updateMemberPost(Model model, MemberVO member, HttpSession session) {
Message msg = new Message("member/update", "회원정보 수정을 실패했습니다.");

		if(memberService.updateMember(member)) {
			msg = new Message("member/check", "회원정보 수정을 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		
		return "message";
	}
	
	@ResponseBody
	@PostMapping("/member/id/check")
	public boolean idCheck(@RequestParam("id") String id) {
		// Service한테 id를 주며 체크해달라고 시킴
		return memberService.checkId(id);
	}
	
	@GetMapping("/member/point")
	public String checkMyPoint(Model model, HttpSession session) {
		
		return "/member/point";
	}
}
