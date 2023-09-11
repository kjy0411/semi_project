package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.project.dao.RouteDAO;
import kr.kh.project.vo.RouteVO;
import java.util.List;

@Service
public class RouteServiceImp implements RouteService {

    @Autowired
    private RouteDAO routeDAO;

    @Override
    public List<RouteVO> getDepartureRoutes(String ai_name) {
        return routeDAO.getDepartureRoutes(ai_name);
    }

    @Override
    public List<RouteVO> getArrivalRoutes(String ai_name) {
        return routeDAO.getArrivalRoutes(ai_name);
    }

    @Override
    public void insertRoute(RouteVO route) {
        routeDAO.insertRoute(route);
    }

    @Override
    public void deleteRouteByNumber(String routeNumber) {
        routeDAO.deleteRouteByNumber(routeNumber);
    }
}
