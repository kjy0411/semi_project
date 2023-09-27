package kr.kh.project.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.kh.project.service.AirportService;
import kr.kh.project.service.NationService;
import kr.kh.project.service.RouteService;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.DivisionVO;
import kr.kh.project.vo.NationVO;
import kr.kh.project.vo.RouteVO;
@Controller
@RequestMapping("/airport")
public class AirportController {
	
    @Autowired
    AirportService airportService;
    @Autowired
    RouteService routeService;
    
    @Autowired
    NationService nationService;
    @GetMapping("/list")
    public String airportList(Model model) {
        List<AirportVO> airportList = airportService.selectAirportList();
        List<NationVO> nationList = nationService.getNation();
		List<DivisionVO> divisionList = nationService.getDivision();
		model.addAttribute("divisionList", divisionList);
		model.addAttribute("nationList", nationList);
        model.addAttribute("airportList", airportList);
        return "/airport/list";
    }
    @ResponseBody
    @PostMapping("/list")
	public Map<String, Object> airportListPost(@RequestBody String num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = true;
		String ai_num = num.replaceAll("\"", "");
		AirportVO airport = airportService.getAirportByCode(ai_num);
		if(airport == null) {
			res = false;
		}
		List<RouteVO> route_go = routeService.findRouteGo(ai_num);
		List<RouteVO> route_back = routeService.findRouteback(ai_num);
		map.put("route_go", route_go);
		map.put("route_back", route_back);
		map.put("airport", airport);
		map.put("res", res);
		return map;
	}

    @GetMapping("/insert")
    public String showInsertForm(Model model) {
    	List<AirportVO> airportList = airportService.selectAirportList();
    	model.addAttribute("airportList", airportList);
        return "/airport/insert";
    }
    @GetMapping("/getAirportList")
    @ResponseBody
    public List<AirportVO> getAirportList() {
        // 공항 목록을 데이터베이스에서 조회하고 반환하는 코드를 작성
        List<AirportVO> airportList = airportService.selectAirportList();
        return airportList;
    }

    @ResponseBody
    @PostMapping("/delete")
	public Map<String, Object> airportDeletePost(@RequestBody String num){
		Map<String, Object> map = new HashMap<String, Object>();
		String ai_num = num.replaceAll("\"", "");
		String msg = "삭제 실패";
		boolean res = false;
		if(airportService.deleteAirport(ai_num)){
			msg = "삭제 성공";
			res = true;
		}
		map.put("msg", msg);
		map.put("res", res);
		return map;
	}
    @PostMapping("/insert")
    public String insertAirport(
        @RequestParam("aiNum") String aiNum,
        @RequestParam("aiName") String aiName,
        @RequestParam("aiNaName") String aiNaName,
        @RequestParam("aiStandardTime") String aiStandardTime,
        @RequestParam("aiStandardType") int aiStandardType,
        Model model
    ) {
        // 사용자가 입력한 데이터로 AirportVO 객체 생성
        AirportVO airportVO = new AirportVO();
        airportVO.setAi_num(aiNum);
        airportVO.setAi_name(aiName);
        airportVO.setAi_na_name(aiNaName);
        airportVO.setAi_standard_time(aiStandardTime);
        airportVO.setAi_standard_type(aiStandardType);
        // 이미 데이터가 존재하는지 데이터베이스에서 확인
        List<AirportVO> airportList = airportService.selectAirportList();
        
        // 국가 유효성 검사 추가
        if (!nationService.checkNation(aiNaName)) {
            model.addAttribute("invalidNationMessage", "등록할 수 없는 국가입니다.");
            List<AirportVO> updatedAirportList = airportService.selectAirportList();
            model.addAttribute("airportList", updatedAirportList);
            return "/airport/insert";
        }
        for (AirportVO existingAirport : airportList) {
            if (existingAirport.getAi_num().equals(aiNum) &&
                existingAirport.getAi_name().equals(aiName) &&
                existingAirport.getAi_na_name().equals(aiNaName) &&
                existingAirport.getAi_standard_time_str().equals(aiStandardTime) &&
            	existingAirport.getAi_standard_type() == aiStandardType) {
                model.addAttribute("duplicateMessage", "중복된 공항입니다.");
                List<AirportVO> updatedAirportList = airportService.selectAirportList();
                model.addAttribute("airportList", updatedAirportList);
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

    @ResponseBody
    @PostMapping("/checkDuplicateIATA")
    public Map<String, Object> checkDuplicateIATA(@RequestParam("aiNum") String aiNum) {
        Map<String, Object> response = new HashMap<String, Object>();
        // 여기에서 중복 여부를 확인하는 로직을 수행하고 결과를 response에 담습니다.
        boolean isDuplicate = airportService.checkDuplicateIATA(aiNum);
        response.put("isDuplicate", isDuplicate);
        return response;
    }

}