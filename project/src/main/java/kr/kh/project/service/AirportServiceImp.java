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
    public void insertAirport(AirportVO ai_num) {
        airportDao.insertAirport(ai_num);
    }

	@Override
	public List<AirportVO> selectAirportListByRoute() {
		return airportDao.selectAirportListByRoute();
	}

	@Override
	public List<AirportVO> selectAirportListByStart(String num) {
		if(num == null) {
			return null;
		}
		return airportDao.selectAirportListByStart(num);
	}
}