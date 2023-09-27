package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleInsertVO;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> selectScheduleByRoute(@Param("ro_num")int ro_num, @Param("startDate")String startDate);

	List<ScheduleVO> getSchedulesByRouteNumber(int ro_num);

	boolean deleteScheduleByNumber(@Param("sk_num")int sk_num);

	ScheduleVO selectSchedule(@Param("sk_num")Integer sk_num);

	List<ScheduleVO> selectScheduleList(@Param("cri")Criteria cri);

	int getTotalCount();

	boolean insertSchedule(@Param("schedule")ScheduleInsertVO schedule);

	void deleteScheduleByApNum(@Param("ap_num")String ap_num);

	void deleteScheduleByRoNum(@Param("ro_num")int ro_num);


}
