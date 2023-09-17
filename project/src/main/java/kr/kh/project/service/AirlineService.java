package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.AirlineVO;

public interface AirlineService {

	

	

	List<AirlineVO> getAirlineList();

	boolean insertAirline(AirlineVO airline, AirlineVO user);


	
	
}
