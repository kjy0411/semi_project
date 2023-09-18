package kr.kh.project.service;

import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.SearchVO;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
@MapperScan
public interface RouteService {
    List<RouteVO> getDepartureRoutes(String ai_num);
    List<RouteVO> getArrivalRoutes(String ai_num);
    void insertRoute(RouteVO route);
    void deleteRouteByNumber(String routeNumber);
	RouteVO findRoute(String ro_ai_start, String ro_ai_end);
	List<RouteVO> getRouteList();
	
}
