package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirportDAO;
import kr.kh.project.dao.RouteDAO;
import kr.kh.project.dao.ScheduleDAO;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.RouteVO;


@Service
public class AirportServiceImp implements AirportService {

    @Autowired
    AirportDAO airportDao;

    @Autowired
    RouteDAO routeDao;
    
    @Autowired
    ScheduleDAO scheduleDao;
   
    
    // 모든 공항 목록을 조회하는 메서드
    @Override
    public List<AirportVO> selectAirportList() {
        return airportDao.selectAirportList();
    }
    @Override
    public List<AirportVO> searchAirport(String keyword) {
        // 검색 로직을 구현하고 검색 결과를 반환
        return airportDao.searchAirport(keyword);
    }

    // 공항 코드로 공항 정보를 조회하는 메서드
    @Override
    public AirportVO getAirportByCode(String ai_num) {
        return airportDao.getAirportByNumber(ai_num);
    }

    // 공항 정보를 데이터베이스에 추가하는 메서드
    @Override
    public void insertAirport(AirportVO airportVO) {
        airportDao.insertAirport(airportVO);
    }

    // 노선에 연결된 공항 목록을 조회하는 메서드
    @Override
    public List<AirportVO> getAirportByRoute(boolean route, String ai_num) {
        if (route == false && ai_num == null) {
            return null;
        }
        return airportDao.getAirportByRoute(route, ai_num);
    }
    @Override
    public List<AirportVO> getAirportList() {
        return airportDao.getAirportList();
    }
    @Override
    public boolean checkDuplicateIATA(String aiNum) {
        // aiNum을 이용하여 데이터베이스에서 공항을 조회합니다.
        AirportVO airport = airportDao.getAirportByNumber(aiNum);

        // 조회된 공항이 null이 아니면 중복된 IATA 코드로 간주합니다.
        return airport != null;
    }
    
	@Override
	public List<AirportVO> getAirportByNotRoute(boolean route, String ai_num) {
		if (route == false && ai_num == null) {
            return null;
        }
        return airportDao.getAirportByNotRoute(route, ai_num);
	}
	@Override
	public boolean deleteAirport(String ai_num) {
		if (ai_num == null) {
            return false;
        }
		List<RouteVO> roGoList = routeDao.selectRouteGoByAiNum(ai_num);
		List<RouteVO> roBackList = routeDao.selectRouteBackByAiNum(ai_num);
		for(RouteVO ro : roGoList) {
			scheduleDao.deleteScheduleByRoNum(ro.getRo_num());
			routeDao.deleteRoute(ro.getRo_num());
		}
		for(RouteVO ro : roBackList) {
			scheduleDao.deleteScheduleByRoNum(ro.getRo_num());
			routeDao.deleteRoute(ro.getRo_num());
		}
        return airportDao.deleteAirport(ai_num);
	}
}
