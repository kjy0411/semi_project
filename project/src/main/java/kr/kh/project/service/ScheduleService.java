package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.ScheduleVO;

public interface ScheduleService {

	List<ScheduleVO> getScheduleByRoute(int ro_num, String startDate);

	ScheduleVO getSchdeule(Integer sk_num);

}
