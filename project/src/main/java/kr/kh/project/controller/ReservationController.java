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
		String msg = "������";
		RouteVO dbRoute = routeService.findRoute(route);
		if(dbRoute.getRo_num() == 0) {
			msg = "�ش� �뼱�� ���� �뼱�Դϴ�";
		}
		List<ScheduleVO> scheduleList = scheduleService.getScheduleByRoute(dbRoute.getRo_num());
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("msg", msg);
		return "/reservation/list";
	}
}
