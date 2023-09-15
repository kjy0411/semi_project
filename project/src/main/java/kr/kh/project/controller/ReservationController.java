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
import kr.kh.project.vo.DivisionVO;
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
		return "/reservation/search";
	}
	@ResponseBody
	@PostMapping("/reservation/search")
	public Map<String, Object> searchReservationPost(@RequestParam("route")boolean route, @RequestParam("ai_num")String ai_num){
		Map<String, Object> map = new HashMap<String, Object>();
		List<AirportVO> airportList = airportService.getAirportByRoute(route, ai_num);
		List<NationVO> nationList = nationService.getNationByRoute(route, ai_num);
		List<DivisionVO> divisionList = nationService.getDivisionByRoute(route, ai_num);
		if(airportList == null || nationList == null || divisionList == null) {
			map.put("msg","등록된 노선이 없습니다.");
			map.put("res", false);
			return map;
		}
		map.put("airportList", airportList);
		map.put("nationList", nationList);
		map.put("divisionList", divisionList);
		map.put("res", true);
		return map;
	}

	@GetMapping("/reservation/list")
	public String listReservation(Model model, SearchVO search) {
		String msg = search.getRo_ai_start() + "->" + search.getRo_ai_end();
		RouteVO goRoute = routeService.findRoute(search.getRo_ai_start(), search.getRo_ai_end());
		RouteVO backRoute = routeService.findRoute(search.getRo_ai_end(), search.getRo_ai_start());
		List<ScheduleVO> scheduleList = null;
		List<ScheduleVO> scheduleList2 = null;
		if(goRoute == null || backRoute == null) {
			msg = "등록되지 않은 노선입니다.";
		}else {
			if(search.getTicketType() == 1) {//1편도 2왕복
				scheduleList = scheduleService.getScheduleByRoute(goRoute.getRo_num(), search.getStartDaystr());					
			}else if(search.getTicketType() == 2) {
				scheduleList = scheduleService.getScheduleByRoute(goRoute.getRo_num(), search.getStartDaystr());					
				scheduleList2 = scheduleService.getScheduleByRoute(backRoute.getRo_num(), search.getEndDaystr());					
			}
			
			if(scheduleList == null) {
				msg = "해당 노선의 항공편이 없습니다.";
			}
		}
		model.addAttribute("goRoute", goRoute);
		model.addAttribute("backRoute", backRoute);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("scheduleList2", scheduleList2);
		model.addAttribute("msg", msg);
		return "/reservation/list";
	}
	
//	@ResponseBody
//	@PostMapping("/reservation/list")
//	public Map<String, Object> listReservationPost(@RequestParam("res")boolean res, @RequestParam("search")SearchVO search){
//		System.out.println(res);
//		System.out.println(search);
//		Map<String, Object> map = new HashMap<String, Object>();
//		String msg = search.getRo_ai_start() + "->" + search.getRo_ai_end();
//		RouteVO goRoute = routeService.findRoute(search.getRo_ai_start(), search.getRo_ai_end());
//		RouteVO backRoute = routeService.findRoute(search.getRo_ai_end(), search.getRo_ai_start());
//		List<ScheduleVO> scheduleList = null;
//		List<ScheduleVO> scheduleList2 = null;
//		if(goRoute == null || backRoute == null) {
//			msg = "등록되지 않은 노선입니다.";
//		}else {
//			if(search.getTicketType() == 1) {//1편도 2왕복
//				scheduleList = scheduleService.getScheduleByRoute(goRoute.getRo_num(), search.getStartDaystr());					
//			}else if(search.getTicketType() == 2) {
//				scheduleList = scheduleService.getScheduleByRoute(goRoute.getRo_num(), search.getStartDaystr());					
//				scheduleList2 = scheduleService.getScheduleByRoute(backRoute.getRo_num(), search.getEndDaystr());					
//			}
//			
//			if(scheduleList == null) {
//				msg = "해당 노선의 항공편이 없습니다.";
//			}
//		}
//		map.put("goRoute", goRoute);
//		map.put("backRoute", backRoute);
//		map.put("scheduleList", scheduleList);
//		map.put("scheduleList2", scheduleList2);
//		map.put("msg", msg);
//		return map;
//	}
	
}
