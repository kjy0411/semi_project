package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.SearchVO;

public interface RouteDAO {
    List<RouteVO> getDepartureRoutes(String airportCode);
    List<RouteVO> getArrivalRoutes(String airportCode);
    void insertRoute(RouteVO route);
    void deleteRouteByNumber(String routeNumber);
	RouteVO findRoute(@Param("ro_ai_start")String ro_ai_start, @Param("ro_ai_end")String ro_ai_end);
	List<RouteVO> selectRouteList();
}
