package kr.kh.project.dao;

import java.util.List;

import kr.kh.project.vo.AirlineVO;

public interface AirlineDAO {

	List<AirlineVO> selectAirlineList();
	
	//List<AirlineVO> selectAirplaneList();
}
