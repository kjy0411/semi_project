package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirportVO;

public interface AirportDAO {
	
    List<AirportVO> selectAirportList();
    
    AirportVO getAirportByNumber(String ai_num);
    
    void insertAirport(AirportVO airportvo);

    List<AirportVO> getAirportByRoute(@Param("route")boolean route, @Param("ai_num")String ai_num);

    AirportVO getAirportByAiNameAndAiNaName(@Param("aiName") String aiName, @Param("aiNaName") String aiNaName);


}
