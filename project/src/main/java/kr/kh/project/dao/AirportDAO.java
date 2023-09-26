package kr.kh.project.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.AirportVO;

public interface AirportDAO {
	
    List<AirportVO> selectAirportList();

    AirportVO getAirportByNumber(String ai_num);

    void insertAirport(AirportVO airportvo);

    void deleteAirportByCode(String aiNum);

    void deleteRoutesByAirport(@Param("aiNum")String aiNum);

    List<AirportVO> getAirportByRoute(@Param("route")boolean route, @Param("ai_num")String ai_num);

	List<AirportVO> searchAirport(String keyword);

	int countTotalAirports();

	List<AirportVO> selectAirportListWithPaging(@Param("criteria")Criteria cri);








}