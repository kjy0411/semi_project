package kr.kh.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.project.service.AirportService;
import kr.kh.project.service.NationService;
import kr.kh.project.service.ReservationService;
import kr.kh.project.service.RouteService;
import kr.kh.project.service.ScheduleService;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.NationVO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.ScheduleVO;
import kr.kh.project.vo.SearchVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	AirportService airportService;
	
	@Autowired
	NationService nationService;
	
	@Autowired
	RouteService routeService;

	@Autowired
	ScheduleService scheduleService;
	
	
	@GetMapping("/reservation/search")
	public String searchReservation(Model model) {
		List<AirportVO> startAirportList = airportService.selectAirportListByRoute();
		System.out.println(startAirportList);
		List<NationVO> nationList = nationService.getNationList();
		List<String> divisionList = List.of("국내", "동아시아", "동남아시아", "북아메리카", "유럽", "오세아니아", "남아메리카", "아시아", "아프리카");
		model.addAttribute("startAirportList", startAirportList);
		model.addAttribute("nationList", nationList);
		model.addAttribute("divisionList", divisionList);
		return "/reservation/search";
	}
	@ResponseBody
	@PostMapping("/reservation/search")
	public Object ajaxTest(@RequestParam("num")String num, Model model){
		List<AirportVO> endAirportList = airportService.selectAirportListByStart(num);
		System.out.println(num);
		System.out.println(endAirportList);
		model.addAttribute("endAirportList", endAirportList);
		return endAirportList;
	}
	
	@GetMapping("/reservation/list")
	public String listReservation(Model model, SearchVO Search) {
		String msg = Search.getRo_ai_start() + "->" + Search.getRo_ai_end();
		RouteVO dbRoute = routeService.findRoute(Search);
		List<ScheduleVO> scheduleList = null;
		if(dbRoute == null) {
			msg = "등록되지 않은 노선입니다";
		}else {
			scheduleList = scheduleService.getScheduleByRoute(dbRoute.getRo_num());	
			
			if(scheduleList == null) {
				msg = "해당 노선의 항공편이 없습니다";
			}
		}
		model.addAttribute("dbRoute", dbRoute);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("msg", msg);
		return "/reservation/list";
	}
}
