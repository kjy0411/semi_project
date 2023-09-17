package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirlineVO;

public interface AirlineDAO {

	List<AirlineVO> selectAirlineList();

	boolean insertAirline(@Param("airline")AirlineVO airline);
	
}
