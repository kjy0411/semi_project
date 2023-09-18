package kr.kh.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.project.service.ScheduleService;
import kr.kh.project.util.Message;
import kr.kh.project.vo.ScheduleVO;


@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/schedule/admin", method=RequestMethod.GET)
	public String admin() {
		
		
		return "/schedule/admin";
	}	
	
	@GetMapping("/schedule/insert")
	public String insertSchedule() {
		
		return "/schedule/insert";
	}
	
	@PostMapping("/schedule/insert")
	public String insertSchedulePost(Model model, ScheduleVO schedule) {
		Message msg = new Message("/schedule/insert", "스케줄 등록에 실패했습니다.");
		
		if(scheduleService.insertSchedule(schedule)) {
			msg = new Message("/", "스케줄 등록에 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
    
    @PostMapping("/schedule/delete")
    public String delete() {
    	
        return "/schedule/delete";
    }
    
    @PostMapping("/schedule/list")
    public String list() {
    	
        return "/schedule/list";
    }

}
