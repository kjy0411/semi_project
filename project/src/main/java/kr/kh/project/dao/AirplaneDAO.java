package kr.kh.project.dao;

import java.util.List;

import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;

public interface AirplaneDAO {

	
	
	List<AirplaneVO> selectAirplaneList();
}
