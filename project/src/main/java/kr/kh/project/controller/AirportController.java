package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import kr.kh.project.service.AirportService;
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
	        @RequestParam("aiName") String aiName,
	        @RequestParam("aiNaName") String aiNaName,
	        @RequestParam("aiStandardTime") String aiStandardTime,
	        Model model
	    ) {
	        // 사용자가 입력한 데이터로 AirportVO 객체 생성
	        AirportVO airportVO = new AirportVO();
	        airportVO.setAi_name(aiName);
	        airportVO.setAi_na_name(aiNaName);
	        airportVO.setAi_standard_time(aiStandardTime);

	        // AirportService를 사용하여 데이터베이스에서 데이터 조회
	        AirportVO existingAirport = airportService.getAirportByAiNameAndAiNaName(aiName, aiNaName);

	        // 이미 데이터가 존재하면 메시지를 모델에 추가하고 공항 등록 페이지로 이동
	        if (existingAirport != null) {
	            model.addAttribute("duplicateMessage", "이미 존재하는 공항입니다."); // 모델에 중복 메시지 추가
	            return "/airport/insert"; // 공항 등록 페이지로 이동
	        }

	        // 데이터가 존재하지 않는 경우 사용자에게 메시지 표시
	        boolean isValidAirport = false;
	        if (!isValidAirport) {
	            model.addAttribute("invalidAirportMessage", "인식할 수 없는 공항입니다.");
	            return "/airport/insert";
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

