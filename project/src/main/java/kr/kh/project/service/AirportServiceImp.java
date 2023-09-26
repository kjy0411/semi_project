package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirportDAO;
import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.AirportVO;

import kr.kh.project.vo.RouteVO;

import java.util.List;


@Service
public class AirportServiceImp implements AirportService {

    @Autowired
    private AirportDAO airportDao;

    @Autowired
    private RouteService routeService;
    
   
    
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
    public boolean checkDuplicateIATA(String aiNum) {
        // aiNum을 이용하여 데이터베이스에서 공항을 조회합니다.
        AirportVO airport = airportDao.getAirportByNumber(aiNum);

        // 조회된 공항이 null이 아니면 중복된 IATA 코드로 간주합니다.
        return airport != null;
    }

    // 공항 코드를 기반으로 공항을 삭제하는 메서드
    @Override
    public void deleteAirportByCode(String aiNum) {
        airportDao.deleteAirportByCode(aiNum);
    }

    // 공항과 연관된 모든 노선을 삭제하는 메서드
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
