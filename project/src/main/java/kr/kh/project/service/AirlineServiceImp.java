package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirlineDAO;
import kr.kh.project.vo.AirlineVO;

@Service
public class AirlineServiceImp implements AirlineService {

	
	@Autowired
	AirlineDAO airlineDao;
	
	
	@Override
	public List<AirlineVO> getAirlineList() {
		List<AirlineVO> list = airlineDao.selectAirlineList();
		//가져오면 반환
		return list;
	}


	@Override
	public boolean insertAirline(AirlineVO airline, AirlineVO user) {
		
		if(user == null || user.getAl_name() == null) {
			return false;
		}
		
		airline.setAl_name(user.getAl_name());
		return airlineDao.insertAirline(airline);
	}


	

}
