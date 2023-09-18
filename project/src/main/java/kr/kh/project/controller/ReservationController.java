package kr.kh.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	private SearchVO search = null;
	
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
	public String listReservation(Model model, SearchVO searchVO) {
		this.search = searchVO;
		model.addAttribute("search", search);
		return "/reservation/list";
	}
	
	@ResponseBody
	@PostMapping("/reservation/list")
	public Map<String, Object> listReservationPost(@RequestBody boolean res){
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = null;
		RouteVO route = null;
		List<ScheduleVO> scheduleList = null;
		if(res) {
			route = routeService.findRoute(search.getRo_ai_start(), search.getRo_ai_end());
		}else if(res == false && search.getTicketType() == 2){
			route = routeService.findRoute(search.getRo_ai_end(), search.getRo_ai_start());
		}

		if(route == null) {
			msg = "등록되지 않은 노선입니다.";
		}else {
			if(res) {
				msg = route.getAi_name_start() + "->" + route.getAi_name_end();
			}else {
				msg = route.getAi_name_end() + "<-" + route.getAi_name_start();
			}
		}

		if(res) {
			scheduleList = scheduleService.getScheduleByRoute(route.getRo_num(), search.getStartDaystr());
		}else {
			scheduleList = scheduleService.getScheduleByRoute(route.getRo_num(), search.getEndDaystr());	
		}
		
		map.put("route", route);
		map.put("scheduleList", scheduleList);
		map.put("msg", msg);
		map.put("res", res);
		return map;
	}
	@ResponseBody
	@PostMapping("/reservation/select")
	public Map<String, Object> selectReservationPost(@RequestBody Integer sk_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = false;
		ScheduleVO schedule = scheduleService.getSchdeule(sk_num);
		if(schedule != null) {
			res = true;
		}
		map.put("schedule", schedule);
		map.put("res", res);
		return map;
	}
}
