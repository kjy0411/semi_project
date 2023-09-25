package kr.kh.project.service;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import kr.kh.project.vo.AirportVO;

public interface AirportService {
	
    List<AirportVO> selectAirportList();
    
    AirportVO getAirportByCode(String ai_num);
    
    void insertAirport(AirportVO ai_num);

    List<AirportVO> getAirportByRoute(boolean route, String ai_num);

}
