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
    public void deleteRouteByNumber(int ro_num) {
        // 연관된 스케쥴을 가져옴
        List<ScheduleVO> schedules = scheduleService.getSchedulesByRouteNumber(ro_num);

        // 연관된 스케쥴을 삭제
        if (schedules != null && !schedules.isEmpty()) {
            for (ScheduleVO schedule : schedules) {
                scheduleService.deleteScheduleByNumber(schedule.getSk_ro_num());
            }
        }

        // 노선을 삭제
        routeDao.deleteRouteByNumber(ro_num);
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
	public void deleteSchedulesByRouteNumber(int ro_num) {
	    // 먼저 해당 노선 번호에 연관된 스케쥴을 조회
	    List<ScheduleVO> schedulesToDelete = scheduleDao.getSchedulesByRouteNumber(ro_num);

	    // 조회된 스케쥴을 하나씩 삭제
	    for (ScheduleVO schedule : schedulesToDelete) {
	        scheduleDao.deleteScheduleByNumber(schedule.getSk_ro_num());
	    }
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

	
}
