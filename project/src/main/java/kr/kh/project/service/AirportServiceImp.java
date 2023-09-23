package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.project.dao.AirportDAO;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.RouteVO;

import java.util.List;

@Service
public class AirportServiceImp implements AirportService {

    @Autowired
    private AirportDAO airportDao;
    
    @Autowired
    private RouteService routeService;

    @Override
    public List<AirportVO> selectAirportList() {
        return airportDao.selectAirportList();
    }

    @Override
    public AirportVO getAirportByCode(String ai_num) {
        return airportDao.getAirportByNumber(ai_num);
    }

    @Override
    public void insertAirport(AirportVO airportVO) {
        airportDao.insertAirport(airportVO);
    }

    @Override
    public List<AirportVO> getAirportByRoute(boolean route, String ai_num) {
        if (route == false && ai_num == null) {
            return null;
        }
        return airportDao.getAirportByRoute(route, ai_num);
    }
    @Override
    public void deleteAirportByCode(String aiNum) {
        airportDao.deleteAirportByCode(aiNum);
    }
    @Override
    public void deleteRoutesByAirport(String aiNum) {
    	 // 먼저 해당 공항과 연관된 모든 노선을 조회
        List<RouteVO> routesToDelete = routeService.getRoutesByAirport(aiNum);

        // 조회된 노선을 하나씩 삭제
        for (RouteVO route : routesToDelete) {
            routeService.deleteRouteByNumber(route.getRo_num());
        }
    }
    
}
