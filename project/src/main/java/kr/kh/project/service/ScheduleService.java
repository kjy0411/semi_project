package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleService {

	List<ScheduleVO> getScheduleByRoute(int ro_num, String startDate);

	List<ScheduleVO> getSchedulesByRouteNumber(int sk_ro_num);
	void deleteScheduleByNumber(int sk_ro_num);
	
	ScheduleVO getSchdeule(Integer sk_num);

	List<ScheduleVO> getScheduleList(Criteria cri);

	int getTotalCount();

}
