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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.project.service.AirplaneService;
import kr.kh.project.service.AirportService;
import kr.kh.project.service.NationService;
import kr.kh.project.service.PointService;
import kr.kh.project.service.ReservationService;
import kr.kh.project.service.RouteService;
import kr.kh.project.service.ScheduleService;
import kr.kh.project.service.SeatService;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.DivisionVO;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.NationVO;
import kr.kh.project.vo.PointVO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.ScheduleVO;
import kr.kh.project.vo.SearchVO;
import kr.kh.project.vo.SeatVO;
import kr.kh.project.vo.TicketingVO;

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
	
	@Autowired
	SeatService seatService;
	
	@Autowired
	AirplaneService airplaneService;
	
	@Autowired
	PointService pointService;
	
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
	
	@GetMapping("/reservation/seat/select")
	public String selectSeat(Model model, Integer[] sk_num, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		PointVO point = pointService.getPoint(user.getMe_id());
		if(sk_num == null || (sk_num.length != 1 && sk_num.length != 2)) {
			return "/reservation/list";
		}else {
			ScheduleVO schedule = scheduleService.getSchdeule(sk_num[0]);
			model.addAttribute("schedule", schedule);
		}if(sk_num.length == 2){
			ScheduleVO schedule2 = scheduleService.getSchdeule(sk_num[1]);
			model.addAttribute("schedule2", schedule2);
		}else {
			ScheduleVO schedule2 = new ScheduleVO();
			schedule2.setSk_price(0);
			model.addAttribute("schedule2", schedule2);			
		}
		model.addAttribute("point", point);
		model.addAttribute("search", search);
		return "/reservation/seatSelect";
	}
	
	@ResponseBody
	@PostMapping("/reservation/seat/select")
	public Map<String, Object> selectSeatPost(@RequestParam("num")Integer num, @RequestParam("sk_num")Integer sk_num){
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = null;
		if(num != 1 && num != 2) {
			msg = "잘못된 접근입니다.";
		}else{
			if(num == 1) {
				msg = "가는편";
			}else if(num == 2) {
				msg = "오는편";
			}
			AirplaneVO airplane= airplaneService.getAirplaneBySchedule(sk_num);
			List<Integer> pathList = airplaneService.getPath(sk_num);
			List<SeatVO> seatList = seatService.getSeatListBySchedule(sk_num);
			map.put("airplane", airplane);
			map.put("pathList", pathList);
			map.put("seatList", seatList);
		}
		map.put("msg", msg);
		return map;
	}
	@ResponseBody
	@PostMapping("/reservation/complete")
	public Map<String, Object> completeReservationPost(@RequestParam(value="se_num[]")Integer[] se_num){
		for(Integer i : se_num) {
			System.out.println(i);			
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("res", true);
		return map;
	}
}
