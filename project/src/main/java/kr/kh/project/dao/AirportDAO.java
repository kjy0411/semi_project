package kr.kh.project.dao;

import kr.kh.project.vo.AirportVO;


import java.util.List;

public interface AirportDAO {
    List<AirportVO> selectAirportList();
    AirportVO getAirportByNumber(String ai_num);
    void insertAirport(AirportVO ai_num);
}
