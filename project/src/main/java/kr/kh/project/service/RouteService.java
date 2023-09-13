package kr.kh.project.service;

import kr.kh.project.vo.RouteVO;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
@MapperScan
public interface RouteService {
    List<RouteVO> getDepartureRoutes(String ai_name);
    List<RouteVO> getArrivalRoutes(String ai_name);
    void insertRoute(RouteVO route);
    void deleteRouteByNumber(String routeNumber);
	RouteVO findRoute(RouteVO route);
}
