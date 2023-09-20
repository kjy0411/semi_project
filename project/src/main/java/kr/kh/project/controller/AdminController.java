 package kr.kh.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.pagination.PageMaker;
import kr.kh.project.service.MemberService;
import kr.kh.project.vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	// 회원정보 출력하기 ,페이지네이션 기능구현하기
	@GetMapping("/menu/admin")
	public String menuAdmin(Model model, Criteria cri) {
		// 현재 페이지에 2개의 정보면 넣겠다. 선언
		List<MemberVO> list = memberService.getMemberList(cri);
		// 가져온 리스트를 화면에 전송한다.
		model.addAttribute("list", list);
		return "/menu/admin";
	}
	// 회원정보 수정하기
	@ResponseBody
	@PostMapping("/menu/update")
	public Map<String, Object> update(@RequestBody MemberVO member, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user"); // 로그인해서 들어온 user를 뜻한다.
		boolean res = memberService.updateMemberByAuthority(member, user);
		map.put("res", res);
		return map;
	}

}
