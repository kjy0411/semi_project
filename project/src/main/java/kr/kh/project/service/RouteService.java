package kr.kh.project.service;

import kr.kh.project.vo.RouteVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RouteService {
    List<RouteVO> getDepartureRoutes(String ai_num);
    List<RouteVO> getArrivalRoutes(String ai_num);
    void insertRoute(String ro_ai_start, String ro_ai_end);
    void deleteRouteByNumber(int ro_num);
    RouteVO findRoute(String ro_ai_start, String ro_ai_end);
    List<RouteVO> getRouteList();
	RouteVO findRouteByNumber(int ro_num);
	void deleteSchedulesByRouteNumber(int ro_num);
	List<RouteVO> getRoutesByAirport(String aiNum);
	

	
	
}
