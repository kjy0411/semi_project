package kr.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.project.service.TicketingService;
import kr.kh.project.vo.TicketingVO;

@Controller
public class TicketingController {
	@Autowired
	TicketingService ticketingService;
	
	// 예매 정보 조회하기
	@GetMapping("/ticketing/inquiry")
	public String ticketingInquiry(Model model) {
		List<TicketingVO> list = ticketingService.getTicketingList();
		model.addAttribute("list",list);
		return "/ticketing/inquiry";
	}
}
