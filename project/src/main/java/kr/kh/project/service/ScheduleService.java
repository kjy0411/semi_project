package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleInsertVO;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleService {

	List<ScheduleVO> getScheduleByRoute(int ro_num, String startDate);

	List<ScheduleVO> getSchedulesByRouteNumber(int sk_ro_num);
	boolean deleteScheduleByNumber(int sk_num);
	
	ScheduleVO getSchdeule(Integer sk_num);

	List<ScheduleVO> getScheduleList(Criteria cri);

	int getTotalCount();

	boolean insertSchedule(ScheduleInsertVO schedule);

}
