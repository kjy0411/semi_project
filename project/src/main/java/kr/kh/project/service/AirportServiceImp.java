package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.project.dao.AirportDAO;
import kr.kh.project.vo.AirportVO;
import java.util.List;

@Service
public class AirportServiceImp implements AirportService {

    @Autowired
    private AirportDAO airportDao;

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

    
    
}
