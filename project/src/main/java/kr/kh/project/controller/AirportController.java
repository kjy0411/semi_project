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
    public String insertAirport(AirportVO airportVO) {
        airportService.insertAirport(airportVO);
        return "redirect:/airport/list";
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

