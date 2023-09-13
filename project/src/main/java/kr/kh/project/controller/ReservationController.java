package kr.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.project.service.AirportService;
import kr.kh.project.service.NationService;
import kr.kh.project.service.ReservationService;
import kr.kh.project.service.RouteService;
import kr.kh.project.service.ScheduleService;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.NationVO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.ScheduleVO;

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
		List<AirportVO> airportList = reservationService.getAirportList();
		List<NationVO> nationList = reservationService.getNationList();
		List<String> divisionList = List.of("����", "���ƽþ�", "�����ƽþ�", "�ϾƸ޸�ī", "����", "�����ƴϾ�", "���Ƹ޸�ī", "�ƽþ�", "������ī");
		model.addAttribute("airportList", airportList);
		model.addAttribute("nationList", nationList);
		model.addAttribute("divisionList", divisionList);
		return "/reservation/search";
	}
	
	@GetMapping("/reservation/list")
	public String listReservation(Model model, RouteVO route) {
		String msg = route.getRo_ai_start() + "->" + route.getRo_ai_end();
		RouteVO dbRoute = routeService.findRoute(route);
		List<ScheduleVO> scheduleList = null;
		if(dbRoute == null) {
			msg = "��ϵ��� ���� �뼱�Դϴ�";
		}else {
			scheduleList = scheduleService.getScheduleByRoute(dbRoute.getRo_num());	
			
			if(scheduleList == null) {
				msg = "�ش� �뼱�� �װ����� �����ϴ�";
			}
		}
		model.addAttribute("dbRoute", dbRoute);
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("msg", msg);
		return "/reservation/list";
	}
}
