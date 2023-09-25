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

import kr.kh.project.service.TicketingService;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.TicketingVO;

@Controller
public class TicketingController {
	@Autowired
	TicketingService ticketingService;
	
	// 예매 정보 조회하기
	@GetMapping("/ticketing/inquiry")
	public String ticketingInquiry(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if( user != null) {
		// 티케팅 리스트를 가져오라고 서비스에게 시킴
		List<TicketingVO> list = ticketingService.getTicketingList(user.getMe_id());
		
		// 화면에 데이터를 전송하기 위해 model에서 list를 담아서 보낸다.
		model.addAttribute("list",list);
		model.addAttribute("userId",user);
		}
		//System.out.println("User ID : " + user.getMe_id());
		return "/ticketing/inquiry";
	}
	
	//예매정보 수정하기
	@ResponseBody
	@PostMapping("/ticketing/update")
	public Map<String, Object> ticketingUpdate(@RequestBody TicketingVO ticketing, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = ticketingService.updateTicketingState(ticketing);
		map.put("res", res);
		return map;
	}
	
}
