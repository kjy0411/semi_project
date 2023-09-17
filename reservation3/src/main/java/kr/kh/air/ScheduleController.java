package kr.kh.air;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.protocol.Message;

import kr.kh.air.service.ScheduleService;
import kr.kh.air.vo.ScheduleVO;
import kr.kh.spring.vo.MemberVO;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert() {
		return "schedule/insert";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(ScheduleVO schedule, Model model) {
		Message msg = new Message("/schedule/insert", "회원 가입에 실패했습니다.");
		
		if(scheduleService.insert(schedule)) {
			msg = new Message("/", "회원 가입에 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		return "schedule/insert";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete() {
		return "schedule/delete";
	}
	
	@GetMapping("/delete")
	public String delete(Model model, HttpSession session, Integer sk_num) {
		ScheduleVO user = (ScheduleVO)session.getAttribute("user");
		Message msg;
		if(scheduleService.deleteSchedule(sk_num, user)) {
			msg = new Message("/schedule/delete", "게시글을 삭제했습니다.");
		}else {
			msg = new Message("/schedule/delete", "잘못된 접근입니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
}
