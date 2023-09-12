package kr.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.project.service.ReservationService;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.NationVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
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
	public String listReservation() {
		
		return "/reservation/list";
	}
}
