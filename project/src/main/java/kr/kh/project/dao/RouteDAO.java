package kr.kh.project.dao;

import kr.kh.project.vo.RouteVO;
import java.util.List;

public interface RouteDAO {
    List<RouteVO> getDepartureRoutes(String airportCode);
    List<RouteVO> getArrivalRoutes(String airportCode);
    void insertRoute(RouteVO route);
    void deleteRouteByNumber(String routeNumber);
}
