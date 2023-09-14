package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirlineDAO;
import kr.kh.project.dao.AirplaneDAO;
import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;

@Service
public class AirplaneServiceImp implements AirplaneService {

	
	@Autowired
	AirplaneDAO airplaneDao;
	
	



	@Override
	public List<AirplaneVO> getAirplaneList() {
		
		List<AirplaneVO> list = airplaneDao.selectAirplaneList();
		
		return list;
	}
}





	


	
