package kr.kh.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import kr.kh.project.service.AirlineService;
import kr.kh.project.service.MemberService;
import kr.kh.project.util.Message;
import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.MemberVO;

@Controller
public class AirlineController {

	@Autowired
	private AirlineService airlineService;
	
	
	
	@GetMapping("/menu/airport")
	public String airlineList(Model model) {
		
		List<AirlineVO> list = airlineService.getAirlineList();
		
		
		model.addAttribute("list",list);
		return "/menu/airport";
	}
	@GetMapping("/airline/insert")
	public String insert(Model model) {
		
		return "/airline/insert";
	}
	

	@PostMapping("/airline/insert")
	public String insertPost(Model model, AirlineVO airline, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		Message msg = new Message("airline/insert", "항공사등록을 실패했습니다.");
		boolean res = airlineService.insertAirline(airline, user);
		if(res) {

			msg = new Message("menu/airport", "항공사등록을 성공했습니다.");
		}else {
		
			msg = new Message("airline/insert", "항공사등록을 실패했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@GetMapping("/airline/delete")
	public String deleteAirline() {
		
		return "/airline/delete";
	}
	
	
	@PostMapping("/airline/delete")
	public String deleteAirlinePost(Model model,String al_name, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		Message msg = new Message("airline/delete", "항공사삭제을 실패했습니다.");
		boolean res = airlineService.deleteAirline(al_name, user);
		if(res) {
			msg = new Message("menu/airport", "항공사삭제을 성공했습니다.");
		}else {
			msg = new Message("airline/delete", "항공사삭제을 실패했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	
	@GetMapping("/airline/detail")
	public String airplaneDetail(Model model) {
		
		List<AirplaneVO> list = airlineService.getAirplaneList();
		model.addAttribute("list", list);
		return "/airline/detail";
	}
	

	
}