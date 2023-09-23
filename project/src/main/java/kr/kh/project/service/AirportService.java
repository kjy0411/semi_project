package kr.kh.project.service;

import kr.kh.project.vo.AirportVO;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
@MapperScan
public interface AirportService {
    List<AirportVO> selectAirportList();
    AirportVO getAirportByCode(String ai_num);
    void insertAirport(AirportVO airportVO);
    void deleteAirportByCode(String aiNum);
    void deleteRoutesByAirport(String aiNum);
    List<AirportVO> getAirportByRoute(boolean route, String ai_num);
	
	
    
}
