package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import kr.kh.project.service.RouteService;
import kr.kh.project.vo.RouteVO;
import java.util.List;

@Controller
@RequestMapping("/route")
public class RouteController {

    @Autowired
    private RouteService routeService;

    @GetMapping("/insert")
    public String showInsertForm(Model model) {
    	// 노선 리스트 표시
        List<RouteVO> routeList = routeService.getRouteList();
        model.addAttribute("routeList", routeList);
        return "/route/insert";
    }

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
            return "/route/insert";
        }

        // 중복된 노선이 아닌 경우, 노선 등록 서비스 호출
        routeService.insertRoute(ro_ai_start, ro_ai_end);

        return "redirect:/airport/list"; // 공항 리스트 페이지로 리다이렉트
    }




    @GetMapping("/delete")
    public String showDeleteForm(Model model) {
        // 노선 리스트 표시
        List<RouteVO> routeList = routeService.getRouteList();
        model.addAttribute("routeList", routeList);

        return "/route/delete";
    }

    @PostMapping("/delete")
    public String deleteRoute(@RequestParam("ro_num") int ro_num) {
    	routeService.deleteRouteByNumber(ro_num);
        return "redirect:/airport/list";
    }

    @GetMapping("/departure-routes/{ai_num}")
    public String getDepartureRoutes(@PathVariable String ai_num, Model model) {
        List<RouteVO> departureRoutes = routeService.getDepartureRoutes(ai_num);
        model.addAttribute("departureRoutes", departureRoutes);
        return "/route/detail";
    }

    @GetMapping("/arrival-routes/{ai_num}")
    public String getArrivalRoutes(@PathVariable String ai_num, Model model) {
        List<RouteVO> arrivalRoutes = routeService.getArrivalRoutes(ai_num);
        model.addAttribute("arrivalRoutes", arrivalRoutes);
        return "/route/detail";
    }


}
