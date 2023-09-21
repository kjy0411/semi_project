package kr.kh.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.service.ScheduleService;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.ScheduleVO;


@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/schedule/insert")
	public String searchReservation(Model model) {
		return "/schedule/insert";
	}
	    
	@RequestMapping("/schedule/list")
	public String list(Model model, Criteria cri) {
		List<ScheduleVO> list = scheduleService.getScheduleList(cri);
		
		model.addAttribute("list", list);
		return "/schedule/list";
	}
	
    //게시물 선택삭제
    @ResponseBody
    @RequestMapping(value = "/delete")
    public String ajaxTest(HttpServletRequest request) throws Exception {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	scheduleService.deleteSchedule(ajaxMsg[i]);
        }
        return "list";//redirect는 url을 새로고침
    }

}
