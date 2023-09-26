package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> selectScheduleByRoute(@Param("ro_num")int ro_num, @Param("startDate")String startDate);

	List<ScheduleVO> selectScheduleList(@Param("cri")Criteria cri);

	boolean deleteSchedule(@Param("sk_num")String sk_num);

	boolean insertSchedule(@Param("schedule")ScheduleVO schedule);

	List<ScheduleVO> insertSchedules(@Param("scheduleVo")ScheduleVO scheduleVo);

	List<AirplaneVO> getAirplaneSchedule(@Param("airline")boolean airline,@Param("ap_num") String ap_num);


	List<ScheduleVO> getSchedulesByRouteNumber(int ro_num);

	void deleteScheduleByNumber(int sk_ro_num);

	ScheduleVO selectSchedule(@Param("sk_num")Integer sk_num);


}
