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
import kr.kh.project.service.TicketingService;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.TicketingVO;
@Controller
public class TicketingController {
	@Autowired
	TicketingService ticketingService;

	//예매정보 수정하기
	@ResponseBody
	@PostMapping("/ticketing/update")
	public Map<String, Object> ticketingUpdate(@RequestBody TicketingVO ticketing, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = ticketingService.updateTicketingState(ticketing);
		map.put("res", res);
		return map;
	}

	// 전체 조회하기
	@GetMapping("/ticketing/inquiry")
	public String ticketingInquiry(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		//System.out.println("User ID : " + user.getMe_id());
		return "/ticketing/inquiry";
	}

	@ResponseBody
	@PostMapping("/ticketing/inquiry")
	public Map<String, Object> ticketingSelect(@RequestBody int ticketing, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = true;
		List<TicketingVO> ticketingList = ticketingService.getTicketingList(user.getMe_id(), ticketing);
		if(ticketingList == null) {
			res = false;
		}

		map.put("ticketingList", ticketingList);
		map.put("res", res);
		return map;
	}
}