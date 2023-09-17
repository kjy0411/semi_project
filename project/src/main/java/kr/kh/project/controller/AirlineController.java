package kr.kh.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mysql.cj.protocol.Message;

import kr.kh.project.service.AirlineService;
import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;


@Controller
public class AirlineController {

	@Autowired
	private AirlineService airlineService;
	
	@GetMapping("/airline/list")
	public String airlineList(Model model) {
		
		List<AirlineVO> list = airlineService.getAirlineList();
		
		
		model.addAttribute("list",list);
		return "/airline/list";
	}
	@GetMapping("/airline/insert")
	public String insert(Model model) {
		
		return "/airline/insert";
	}
	
	@PostMapping("/airline/insert")
	public String insertPost(AirlineVO airline, HttpSession session, Model model) {
		AirlineVO user = (AirlineVO)session.getAttribute("user");
		Message msg ;
		if(airlineService.insertAirline(airline, user)) {
			msg = new Message("/airline/list", "게시글을 등록했습니다.");
		}else {
			msg = new Message("/airline/insert", "게시글을 등록하지 못했습니다.");
		}
		
		System.out.println(airline);
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@GetMapping("/airline/delete")
	public String delete(Model model) {
		
		return "/airline/delete";
	}
	
	

	
}
