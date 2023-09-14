package kr.kh.project.service;

import kr.kh.project.vo.AirportVO;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
@MapperScan
public interface AirportService {
	
    List<AirportVO> selectAirportList();
    
    AirportVO getAirportByCode(String ai_num);
    
    void insertAirport(AirportVO ai_num);

	List<AirportVO> selectAirportListByRoute();

	List<AirportVO> selectAirportListByStart(String ro_ai_start);
}
