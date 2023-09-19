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
		// 티케팅 리스트를 가져오라고 서비스에게 시킴
		List<TicketingVO> list = ticketingService.getTicketingList();
		
		// 화면에 데이터를 전송하기 위해 model에서 list를 담아서 보낸다.
		model.addAttribute("list",list);
		return "/ticketing/inquiry";
	}
}
