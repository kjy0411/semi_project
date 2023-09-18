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
    public String showInsertForm() {
        return "/route/insert";
    }

    @PostMapping("/insert")
    public String insertRoute(RouteVO routeVO) {
        routeService.insertRoute(routeVO);
        return "redirect:/airport/list";
    }

    @GetMapping("/delete")
    public String showDeleteForm() {
        return "/route/delete";
    }

    @GetMapping("/delete/{po_num}")
    public String deleteRoute(@PathVariable String po_num) {
        routeService.deleteRouteByNumber(po_num);
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
