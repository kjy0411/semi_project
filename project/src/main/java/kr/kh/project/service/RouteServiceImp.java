package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.project.dao.RouteDAO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.SearchVO;

import java.util.List;

@Service
public class RouteServiceImp implements RouteService {

    @Autowired
    private RouteDAO routeDao;

    @Override
    public List<RouteVO> getDepartureRoutes(String ai_name) {
        return routeDao.getDepartureRoutes(ai_name);
    }

    @Override
    public List<RouteVO> getArrivalRoutes(String ai_name) {
        return routeDao.getArrivalRoutes(ai_name);
    }

    @Override
    public void insertRoute(RouteVO route) {
    	routeDao.insertRoute(route);
    }

    @Override
    public void deleteRouteByNumber(String routeNumber) {
    	routeDao.deleteRouteByNumber(routeNumber);
    }

	@Override
	public RouteVO findRoute(SearchVO search) {
		if(search == null || search.getRo_ai_start() == null || search.getRo_ai_end() == null) {
			return null;
		}
		return routeDao.findRoute(search);
	}

	@Override
	public List<RouteVO> getRouteList() {
		return routeDao.selectRouteList();
	}
}
