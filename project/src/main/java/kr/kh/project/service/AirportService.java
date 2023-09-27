package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.AirportVO;

public interface AirportService {
    List<AirportVO> selectAirportList();
    AirportVO getAirportByCode(String ai_num);
    void insertAirport(AirportVO airportVO);
    void deleteAirportByCode(String aiNum);
    void deleteRoutesByAirport(String aiNum);
    List<AirportVO> getAirportByRoute(boolean route, String ai_num);
	List<AirportVO> searchAirport(String keyword);
	boolean checkDuplicateIATA(String aiNum);
	List<AirportVO> getAirportList();
	List<AirportVO> getAirportByNotRoute(boolean route, String ai_num);
	boolean deleteAirport(String ai_num);

	
	
	
	
    
}
