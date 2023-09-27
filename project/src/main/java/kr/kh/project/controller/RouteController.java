package kr.kh.project.controller;

import java.util.ArrayList;
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
@RequestMapping("/route")
public class RouteController {

    @Autowired
    RouteService routeService;
    
    @Autowired
    AirportService airportService;

    @Autowired
    NationService nationService;

    // 노선 등록 페이지를 불러오는 메서드
    @GetMapping("/insert")
    public String showInsertForm(Model model) {
        // 노선 리스트 표시
        List<RouteVO> routeList = routeService.getRouteList();
        model.addAttribute("routeList", routeList);
        return "/route/insert";
    }

    // 노선 등록을 처리하는 메서드
    @PostMapping("/insert")
    public String insertRoute(
        @RequestParam("ro_ai_start") String ro_ai_start,
        @RequestParam("ro_ai_end") String ro_ai_end,
        Model model
    ) {
        // 이미 데이터베이스에 존재하는 노선인지 확인
        RouteVO existingRoute = routeService.findRoute(ro_ai_start, ro_ai_end);

        if (existingRoute != null) {
            // 이미 존재하는 노선이면 모델에 중복 메시지 추가
            model.addAttribute("duplicateMessage", "이미 존재하는 노선입니다.");
        } else {
            // 데이터베이스에서 출발 공항과 도착 공항이 모두 존재하는지 확인
            AirportVO startAirport = airportService.getAirportByCode(ro_ai_start);
            AirportVO endAirport = airportService.getAirportByCode(ro_ai_end);

            if (startAirport == null || endAirport == null) {
                // 출발 공항 또는 도착 공항이 데이터베이스에 없는 경우
                model.addAttribute("invalidAirportMessage", "인식할 수 없는 공항입니다.");
            } else {
                // 중복된 노선이 아닌 경우, 노선 등록 서비스 호출
                routeService.insertRoute(ro_ai_start, ro_ai_end);
                return "redirect:/airport/list"; // 공항 리스트 페이지로 리다이렉트
            }
        }

        // 노선 리스트 표시
        List<RouteVO> routeList = routeService.getRouteList();
        model.addAttribute("routeList", routeList);
        return "/route/insert";
    }
    @ResponseBody
	@PostMapping("/search")
	public Map<String, Object> searchRoutePost(@RequestParam("route")boolean route, @RequestParam("ai_num")String ai_num){
		Map<String, Object> map = new HashMap<String, Object>();
		List<AirportVO> airportList = new ArrayList<AirportVO>();
		List<NationVO> nationList = new ArrayList<NationVO>();
		List<DivisionVO> divisionList = new ArrayList<DivisionVO>();
		if(route) {
			airportList = airportService.getAirportList();
			nationList = nationService.getNation();
			divisionList = nationService.getDivision();						
		}else {
			airportList = airportService.getAirportByNotRoute(route, ai_num);
			nationList = nationService.getNationByNotRoute(route, ai_num);
			divisionList = nationService.getDivisionNotByRoute(route, ai_num);			
		}
		if(airportList == null || nationList == null || divisionList == null) {
			map.put("res", false);
			return map;
		}
		map.put("airportList", airportList);
		map.put("nationList", nationList);
		map.put("divisionList", divisionList);
		map.put("res", true);
		return map;
	}
    @ResponseBody
    @PostMapping("/delete")
	public Map<String, Object> routeDeletePost(@RequestBody int ro_num){
		Map<String, Object> map = new HashMap<String, Object>();
		String msg = "삭제 실패";
		boolean res = false;
		if(routeService.deleteroute(ro_num)){
			msg = "삭제 성공";
			res = true;
		}
		map.put("msg", msg);
		map.put("res", res);
		return map;
	}
    // 출발 노선 리스트 페이지를 불러오는 메서드
    @GetMapping("/departure-routes/{ai_num}")
    public String getDepartureRoutes(@PathVariable String ai_num, Model model) {
        List<RouteVO> departureRoutes = routeService.getDepartureRoutes(ai_num);
        model.addAttribute("departureRoutes", departureRoutes);
        return "/route/detail";
    }

    // 도착 노선 리스트 페이지를 불러오는 메서드
    @GetMapping("/arrival-routes/{ai_num}")
    public String getArrivalRoutes(@PathVariable String ai_num, Model model) {
        List<RouteVO> arrivalRoutes = routeService.getArrivalRoutes(ai_num);
        model.addAttribute("arrivalRoutes", arrivalRoutes);
        return "/route/detail";
    }
}
