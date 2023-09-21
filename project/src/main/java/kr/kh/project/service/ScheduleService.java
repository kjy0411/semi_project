package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleService {

	List<ScheduleVO> getScheduleByRoute(int ro_num, String startDate);

	List<ScheduleVO> getScheduleList(Criteria cri);

	boolean deleteSchedule(String sk_num);

}
