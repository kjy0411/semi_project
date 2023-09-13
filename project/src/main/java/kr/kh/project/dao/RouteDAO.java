package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.RouteVO;

public interface RouteDAO {
    List<RouteVO> getDepartureRoutes(String airportCode);
    List<RouteVO> getArrivalRoutes(String airportCode);
    void insertRoute(RouteVO route);
    void deleteRouteByNumber(String routeNumber);
	RouteVO findRoute(@Param("route")RouteVO route);
}
