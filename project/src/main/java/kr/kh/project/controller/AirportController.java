package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import kr.kh.project.pagination.Criteria;
import kr.kh.project.pagination.PageMaker;
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
    @GetMapping("/search")
    public String searchAirport(@RequestParam("keyword") String keyword, Model model) {
        // 검색어를 이용하여 공항을 검색하고 검색 결과를 모델에 추가
        List<AirportVO> airportList = airportService.searchAirport(keyword);
        model.addAttribute("airportList", airportList);
        return "/airport/list";
    }

    // 공항 등록 페이지를 불러오는 메서드
    @GetMapping("/insert")
    public String showInsertForm(Model model) {
    	List<AirportVO> airportList = airportService.selectAirportList();
        model.addAttribute("airportList", airportList);
        return "/airport/insert";
    }

    // 공항 등록을 처리하는 메서드
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
        if (!nationService.checkNation(aiNaName)) {
            model.addAttribute("invalidNationMessage", "등록할 수 없는 국가입니다.");
            // 실패 시에도 공항 리스트를 다시 가져옴
            List<AirportVO> updatedAirportList = airportService.selectAirportList();
            model.addAttribute("airportList", updatedAirportList);
            return "/airport/insert";
        }

        for (AirportVO existingAirport : airportList) {
            if (existingAirport.getAi_num().equals(aiNum) &&
                existingAirport.getAi_name().equals(aiName) &&
                existingAirport.getAi_na_name().equals(aiNaName) &&
                existingAirport.getAi_standard_time_str().equals(aiStandardTime)) {
                model.addAttribute("duplicateMessage", "중복된 공항입니다.");
                // 실패 시에도 공항 리스트를 다시 가져옴
                List<AirportVO> updatedAirportList = airportService.selectAirportList();
                model.addAttribute("airportList", updatedAirportList);
                return "/airport/insert";
            }
        }
        for (AirportVO existingAirport : airportList) {
            if (existingAirport.getAi_num().equals(aiNum)) {
                model.addAttribute("duplicateIATAMessage", "중복된 IATA코드입니다.");
                // 실패 시에도 공항 리스트를 다시 가져옴
                List<AirportVO> updatedAirportList = airportService.selectAirportList();
                model.addAttribute("airportList", updatedAirportList);
                return "/airport/insert";
            }
        }
        
        // AirportService를 사용하여 데이터베이스에 데이터 추가
        airportService.insertAirport(airportVO);
        
        model.addAttribute("successMessage", "공항이 등록되었습니다.");

        // 성공 또는 실패 시에도 공항 리스트를 다시 가져옴
        List<AirportVO> updatedAirportList = airportService.selectAirportList();
        model.addAttribute("airportList", updatedAirportList);

        return "/airport/insert"; 
    }

    // 공항 삭제 페이지를 불러오는 메서드
    @GetMapping("/delete")
    public String showDeleteForm(Model model) {
       
        List<AirportVO> airportList = airportService.selectAirportList();
        model.addAttribute("airportList", airportList);
        return "/airport/delete";
    }

    // 공항 삭제를 처리하는 메서드
    @PostMapping("/delete")
    public String deleteAirport(@RequestParam("aiNum") String aiNum, Model model) {
        airportService.deleteRoutesByAirport(aiNum);
        airportService.deleteAirportByCode(aiNum);     
        List<AirportVO> airportList = airportService.selectAirportList();
        model.addAttribute("airportList", airportList);
        model.addAttribute("successMessage", "삭제되었습니다.");
        
        return "/airport/delete";
    }

    // 공항 상세 정보 페이지를 불러오는 메서드
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
