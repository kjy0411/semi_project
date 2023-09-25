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
@RequestMapping("/route")
public class RouteController {

    @Autowired
    private RouteService routeService;
    
    @Autowired
    private AirportService airportService;

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

    // 노선 삭제 페이지를 불러오는 메서드
    @GetMapping("/delete")
    public String showDeleteForm(Model model) {
        // 노선 리스트 표시
    	List<RouteVO> routeList = routeService.getRouteList();
        model.addAttribute("routeList", routeList);

        return "/route/delete";
    }

    // 노선 삭제를 처리하는 메서드
    @PostMapping("/delete")
    public String deleteRoute(@RequestParam("ro_num") int ro_num, Model model) {
        // 노선 삭제 전에 해당 노선이 존재하는지 확인.
        RouteVO existingRoute = routeService.findRouteByNumber(ro_num);

        if (existingRoute == null) {
            // 주어진 노선 번호로 노선을 찾을 수 없는 경우
            model.addAttribute("notFoundMessage", "존재하지 않는 노선입니다.");

            List<RouteVO> routeList = routeService.getRouteList();
            model.addAttribute("routeList", routeList);

            // 노선 삭제 페이지로 이동.
            return "/route/delete";
        }

        // 노선 삭제
        routeService.deleteRouteByNumber(ro_num);

        // 연관된 스케쥴 삭제
        routeService.deleteSchedulesByRouteNumber(ro_num);

        // 성공 메시지와 함께 노선 삭제 페이지로 리다이렉트.
        return "redirect:/route/delete?success=true";
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
