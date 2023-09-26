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
import kr.kh.project.pagination.PageMaker;
import kr.kh.project.service.AirlineService;
import kr.kh.project.service.AirplaneService;
import kr.kh.project.service.RouteService;
import kr.kh.project.service.ScheduleService;
import kr.kh.project.util.Message;
import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.ScheduleInsertVO;
import kr.kh.project.vo.ScheduleVO;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	AirlineService airlineService;

	@Autowired
	AirplaneService airplaneService;
	
	@Autowired
	RouteService routeService;
	
	@GetMapping("/menu/schedule")
	public String scheduleList(Model model, HttpSession session, Criteria cri) {
		List<ScheduleVO> scList = scheduleService.getScheduleList(cri);
		//전체 게시글 수 
		int totalCount = scheduleService.getTotalCount();
		//페이지네이션에서 최대 페이지 개수 
		int displayPageNum = 5;

		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		
		model.addAttribute("pm", pm);
		model.addAttribute("scList",scList);
		return "/menu/schedule";
	}
	
	@GetMapping("/schedule/insert")
	public String scheduleInsert(Model model, HttpSession session) {
		List<AirlineVO> alList = airlineService.getAirlineList();
		model.addAttribute("alList",alList);
		return "/schedule/insert";
	}
	
	@ResponseBody
	@PostMapping("/schedule/insert")
	public Map<String, Object> scheduleInsertPost(@RequestBody String al_name){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = true;
		String ap_al_name = al_name.replaceAll("\"","");
		List<AirplaneVO> apList = airplaneService.getAirplaneByAlName(ap_al_name);
		if(apList.size() == 0) {
			res = false;
		}
		map.put("apList", apList);
		map.put("res", res);
		return map;
	}
	
	@PostMapping("/schedule/input")
	public String scheduleInput(Model model, HttpSession session, ScheduleInsertVO schedule) {
		Message msg = new Message("/menu/schedule", "등록 성공");
		int ro_num = routeService.getRoNumByAiNum(schedule.getRo_ai_start(), schedule.getRo_ai_end());
		schedule.setSk_ro_num(ro_num);
		if(!scheduleService.insertSchedule(schedule)) {
			msg = new Message("/schedule/insert", "등록 실패");
		}
		model.addAttribute("msg",msg);
		return "/message";
	}
	
	@ResponseBody
	@PostMapping("/schedule/delete")
	public Map<String, Object> scheduleDeletePost(@RequestBody int sk_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = true;
		if(!scheduleService.deleteScheduleByNumber(sk_num)) {
			res = false;
		}
		map.put("res", res);
		return map;
	}
}
