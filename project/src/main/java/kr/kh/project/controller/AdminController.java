package kr.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kr.kh.project.service.MemberService;
import kr.kh.project.vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	// 회원정보 출력하기
	@GetMapping("/menu/admin")
	public String menuAdmin(Model model) {
		 List<MemberVO> list = memberService.getMemberList();
		 model.addAttribute("list", list);
		return "/menu/admin";
	}
}
