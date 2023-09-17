package kr.kh.air;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.air.vo.ScheduleVO;

@Controller
public class HomeController {
	
	@RequestMapping(value="/")
	public String home(Model model) {
		model.addAttribute("name", "abc");
		return "/main/home";
	}

}
