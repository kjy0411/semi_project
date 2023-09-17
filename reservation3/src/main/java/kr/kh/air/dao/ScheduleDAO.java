package kr.kh.air.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.air.vo.ScheduleVO;

public interface ScheduleDAO {

	ScheduleVO selectSchedule(@Param("sk_num")Integer sk_num);

	boolean insertSchedule(@Param("m")ScheduleVO schedule);

	void deleteBoard(@Param("sk_num")Integer sk_num);
}
