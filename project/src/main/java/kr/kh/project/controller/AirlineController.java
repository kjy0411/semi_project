package kr.kh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping("/airline/detail")
	public String detail(Model model) {
	//	boardService.updateViews(bo_num);
	//	BoardVO board = boardService.getBoard(bo_num);
		List<AirplaneVO> list = airlineService.getAirplaneList();
	//	model.addAttribute("board", board);
		model.addAttribute("list", list);
		return "/airline/detail";
	}
	
	
}
