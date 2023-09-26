package kr.kh.project.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.RouteVO;

public interface RouteDAO {
    List<RouteVO> getDepartureRoutes(String ai_num);
    List<RouteVO> getArrivalRoutes(String ai_num);
    void insertRoute(@Param("ro_ai_start")String ro_ai_start, @Param("ro_ai_end")String ro_ai_end);
    void deleteRouteByNumber(int ro_num);
	RouteVO findRoute(@Param("ro_ai_start")String ro_ai_start, @Param("ro_ai_end")String ro_ai_end);
	List<RouteVO> selectRouteList();
	RouteVO findRouteByNumber(int ro_num);
	List<RouteVO> getRoutesByAirport(String aiNum);
	void deleteRoutesByAirport(String aiNum);
	List<RouteVO> selectRouteListGo(@Param("ai_num")String ai_num);
	List<RouteVO> selectRouteListBack(@Param("ai_num")String ai_num);



}