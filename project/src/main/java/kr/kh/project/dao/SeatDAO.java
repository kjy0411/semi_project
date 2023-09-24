package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.SeatVO;

public interface SeatDAO {

	List<SeatVO> selectSeatListBySchedule(@Param("sk_num")int sk_num);
	
}
