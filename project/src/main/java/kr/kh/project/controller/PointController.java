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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.pagination.PageMaker;
import kr.kh.project.service.PointHistoryService;
import kr.kh.project.service.PointService;
import kr.kh.project.service.TicketingListService;
import kr.kh.project.service.TicketingService;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.PointHistoryVO;
import kr.kh.project.vo.PointVO;
import kr.kh.project.vo.TicketingListVO;
import kr.kh.project.vo.TicketingVO;

@Controller
public class PointController {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	PointHistoryService pointHistoryService;
	
	@Autowired
	TicketingService ticketingService;
	
	@Autowired
	TicketingListService ticketingListService;
	
	@GetMapping("/point/history")
	public String checkMyPoint(Model model, HttpSession session, Criteria cri) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		PointVO point = pointService.getPoint(member.getMe_id());
		
		List<PointHistoryVO> phList = pointHistoryService.selectPointHistory(member.getMe_id(), cri); 
		//전체 게시글 수 
		int totalCount = pointHistoryService.getTotalCount(member.getMe_id());
		//페이지네이션에서 최대 페이지 개수 
		int displayPageNum = 5;

		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);

		
		model.addAttribute("pm", pm);
		model.addAttribute("phList", phList);
		model.addAttribute("point", point);
		return "/point/history";
	}
	
	@ResponseBody
	@PostMapping("/point/history")
	public Map<String, Object> checkTicketing(@RequestParam("ti_num")int ti_num){
		Map<String, Object> map = new HashMap<String, Object>();
		TicketingVO ticketing = ticketingService.selectTicketingByNum(ti_num);
		List<TicketingListVO> ticketList = ticketingListService.selectTicketListByNum(ti_num);
		boolean res = true;
		if(ticketing == null) {
			res = false;
		}
		map.put("ticketList", ticketList);
		map.put("ticketing", ticketing);
		map.put("res", res);
		return map;
	}
}
