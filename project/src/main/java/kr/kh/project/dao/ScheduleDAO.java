package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleVO;

public interface ScheduleDAO {

	List<ScheduleVO> selectScheduleByRoute(@Param("ro_num")int ro_num, @Param("startDate")String startDate);

	List<ScheduleVO> selectScheduleList(@Param("cri")Criteria cri);

	boolean deleteSchedule(@Param("sk_num")String sk_num);


}
