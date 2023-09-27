package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import kr.kh.project.dao.RouteDAO;
import kr.kh.project.dao.ScheduleDAO;
import kr.kh.project.vo.RouteVO;
import kr.kh.project.vo.ScheduleVO;
import kr.kh.project.vo.SearchVO;

import java.util.List;

@Service
public class RouteServiceImp implements RouteService {

    @Autowired
    private RouteDAO routeDao;
    
    @Autowired
    private ScheduleDAO scheduleDao;
    
    @Autowired
    private ScheduleService scheduleService;
    
    

    @Override
    public List<RouteVO> getDepartureRoutes(String ai_num) {
        return routeDao.getDepartureRoutes(ai_num);
    }

    @Override
    public List<RouteVO> getArrivalRoutes(String ai_num) {
        return routeDao.getArrivalRoutes(ai_num);
    }


    @Override
    public void insertRoute(String ro_ai_start, String ro_ai_end) {
        routeDao.insertRoute(ro_ai_start, ro_ai_end);
    }

	@Override
	public RouteVO findRoute(String ro_ai_start, String ro_ai_end) {
		if(ro_ai_start == null || ro_ai_end == null) {
			return null;
		}
		return routeDao.findRoute(ro_ai_start, ro_ai_end);
	}

	@Override
	public List<RouteVO> getRouteList() {
		return routeDao.selectRouteList();
	}
	@Override
	public RouteVO findRouteByNumber(int ro_num) {
	    return routeDao.findRouteByNumber(ro_num);
	}
	@Override
    public List<RouteVO> getRoutesByAirport(String aiNum) {
	
        return routeDao.getRoutesByAirport(aiNum);
    }

	@Override
	public List<RouteVO> findRouteGo(String ai_num) {
		if(ai_num == null) {
			return null;
		}
		return routeDao.selectRouteListGo(ai_num);
	}

	@Override
	public List<RouteVO> findRouteback(String ai_num) {
		if(ai_num == null) {
			return null;
		}
		return routeDao.selectRouteListBack(ai_num);
	}

	@Override
	public int getRoNumByAiNum(String ro_ai_start, String ro_ai_end) {
		if(ro_ai_start == null || ro_ai_end == null) {
			return 0;
		}
		
		return routeDao.getRoNumByAiNum(ro_ai_start, ro_ai_end);
	}

	@Override
	public boolean deleteroute(int ro_num) {
		if(ro_num == 0) {
			return false;
		}
		scheduleDao.deleteScheduleByRoNum(ro_num);
		return routeDao.deleteRoute(ro_num);
	}

	
}
