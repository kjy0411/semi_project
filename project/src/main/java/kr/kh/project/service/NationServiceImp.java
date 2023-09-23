package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirportDAO;
import kr.kh.project.dao.NationDAO;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.DivisionVO;
import kr.kh.project.vo.NationVO;

@Service
public class NationServiceImp implements NationService{
	@Autowired
	NationDAO nationDao;
	
	 @Autowired
	    private AirportDAO airportDao;
	

	@Override
	public List<NationVO> getNationByRoute(boolean route, String ai_num) {
		if(route == false && ai_num == null) {
			return null;
		}
		return nationDao.getNationByRoute(route, ai_num);
	}
	
	@Override
	public List<DivisionVO> getDivisionByRoute(boolean route, String ai_num) {
		if(route == false && ai_num == null) {
			return null;
		}
		return nationDao.getDivisionByRoute(route, ai_num);
	}
	
	@Override
    public boolean checkNation(String ai_na_name) {
        

        List<AirportVO> airportList = airportDao.selectAirportList();

        
        for (AirportVO airport : airportList) {
            if (ai_na_name.equals(airport.getAi_na_name())) {
                // 인식 가능한 국가인 경우
                return true;
            }
        }

        // 인식 불가능한 국가인 경우
        return false;
    }
	
}
