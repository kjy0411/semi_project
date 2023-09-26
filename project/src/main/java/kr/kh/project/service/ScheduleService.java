package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleService {

	List<ScheduleVO> getScheduleByRoute(int ro_num, String startDate);

	List<ScheduleVO> getScheduleList(Criteria cri);

	boolean deleteSchedule(String sk_num);

	void insertSchedulePost(ScheduleVO schedule);

	List<ScheduleVO> getScheduleInsert(ScheduleVO scheduleVo);

	List<AirplaneVO> getAirplaneByRoute(boolean airline, String ap_num);

	boolean insertSchedule(ScheduleVO schedule);

	List<ScheduleVO> getSchedulesByRouteNumber(int sk_ro_num);

	void deleteScheduleByNumber(int sk_ro_num);
	
	ScheduleVO getSchdeule(Integer sk_num);


}
