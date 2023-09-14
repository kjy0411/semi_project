package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirportVO;

public interface AirportDAO {
	
    List<AirportVO> selectAirportList();
    
    AirportVO getAirportByNumber(String ai_num);
    
    void insertAirport(AirportVO ai_num);

	List<AirportVO> selectAirportListByRoute();

	List<AirportVO> selectAirportListByStart(@Param("ro_ai_start")String num);
}
