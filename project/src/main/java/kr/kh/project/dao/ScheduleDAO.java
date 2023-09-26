package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> selectScheduleByRoute(@Param("ro_num")int ro_num, @Param("startDate")String startDate);

	List<ScheduleVO> getSchedulesByRouteNumber(int ro_num);

	void deleteScheduleByNumber(int sk_ro_num);

	ScheduleVO selectSchedule(@Param("sk_num")Integer sk_num);

	List<ScheduleVO> selectScheduleList(@Param("cri")Criteria cri);

	int getTotalCount();


}
