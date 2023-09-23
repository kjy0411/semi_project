package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import kr.kh.project.service.AirportService;
import kr.kh.project.service.NationService;
import kr.kh.project.service.RouteService;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.RouteVO;
import java.util.List;

@Controller
@RequestMapping("/airport")
public class AirportController {

    @Autowired
    private AirportService airportService;

    @Autowired
    private RouteService routeService;
    
    @Autowired
    private NationService nationService;

    @GetMapping("/list")
    public String airportList(Model model) {
        List<AirportVO> airportList = airportService.selectAirportList();
        model.addAttribute("airportList", airportList);
        return "/airport/list";
    }

	    @GetMapping("/insert")
	    public String showInsertForm() {
	        return "/airport/insert";
	    }
	
	    @PostMapping("/insert")
	    public String insertAirport(
	        @RequestParam("aiNum") String aiNum,
	        @RequestParam("aiName") String aiName,
	        @RequestParam("aiNaName") String aiNaName,
	        @RequestParam("aiStandardTime") String aiStandardTime,
	        Model model
	    ) {
	        // 사용자가 입력한 데이터로 AirportVO 객체 생성
	        AirportVO airportVO = new AirportVO();
	        airportVO.setAi_num(aiNum);
	        airportVO.setAi_name(aiName);
	        airportVO.setAi_na_name(aiNaName);
	        airportVO.setAi_standard_time(aiStandardTime);

	        // 이미 데이터가 존재하는지 데이터베이스에서 확인
	        List<AirportVO> airportList = airportService.selectAirportList();
	        
	     // 국가 유효성 검사 추가
	        if (! nationService.checkNation(aiNaName)) {
	            model.addAttribute("invalidNationMessage", "등록할 수 없는 국가입니다.");
	            return "/airport/insert";
	        }

	        for (AirportVO existingAirport : airportList) {
	            if (existingAirport.getAi_num().equals(aiNum) &&
	                existingAirport.getAi_name().equals(aiName) &&
	                existingAirport.getAi_na_name().equals(aiNaName) &&
	                existingAirport.getAi_standard_time_str().equals(aiStandardTime)) {
	                model.addAttribute("duplicateMessage", "중복된 공항입니다.");
	                return "/airport/insert";
	            }
	        }
	        for (AirportVO existingAirport : airportList) {
	            if (existingAirport.getAi_num().equals(aiNum)) {
	                model.addAttribute("duplicateIATAMessage", "중복된 IATA코드입니다.");
	                return "/airport/insert";
	            }
	        }
	        // AirportService를 사용하여 데이터베이스에 데이터 추가
	        airportService.insertAirport(airportVO);

	        return "redirect:/airport/list"; // 공항 리스트 페이지로 리다이렉트
	    }
	        


	    @GetMapping("/detail/{ai_num}")
	    public String showAirportDetail(@PathVariable String ai_num, Model model) {
	        AirportVO airport = airportService.getAirportByCode(ai_num);
	        List<RouteVO> departureRoutes = routeService.getDepartureRoutes(ai_num);
	        List<RouteVO> arrivalRoutes = routeService.getArrivalRoutes(ai_num);
	        model.addAttribute("airport", airport);
	        model.addAttribute("departureRoutes", departureRoutes);
	        model.addAttribute("arrivalRoutes", arrivalRoutes);
	        return "airport/detail";
	    }
}

