package kr.kh.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.project.service.PointHistoryService;
import kr.kh.project.service.PointService;
import kr.kh.project.service.TicketingService;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.PointVO;

@Controller
public class PointController {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	PointHistoryService pointHistoryService;
	
	@Autowired
	TicketingService ticketingService;
	
	@GetMapping("/member/point")
	public String checkMyPoint(Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		PointVO point = pointService.getPoint(member.getMe_id());
		
		model.addAttribute("point", point);
		return "/member/point";
	}
}
