package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.project.dao.AirportDAO;
import kr.kh.project.vo.AirportVO;
import java.util.List;

@Service
public class AirportServiceImp implements AirportService {

    @Autowired
    private AirportDAO airportDAO;

    @Override
    public List<AirportVO> selectAirportList() {
        return airportDAO.selectAirportList();
    }

    @Override
    public AirportVO getAirportByCode(String ai_num) { 
        return airportDAO.getAirportByNumber(ai_num); 
    }

    @Override
    public void insertAirport(AirportVO ai_num) {
        airportDAO.insertAirport(ai_num);
    }
}
