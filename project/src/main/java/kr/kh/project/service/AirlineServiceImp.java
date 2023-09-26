package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirlineDAO;
import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.MemberVO;

@Service
public class AirlineServiceImp implements AirlineService {

	@Autowired
	AirlineDAO airlineDao;
	
	
	
	@Override
	public List<AirlineVO> getAirlineList() {
		List<AirlineVO> list = airlineDao.selectAirlineList();//항공사명을 가져옴
		//가져오면 반환
		return list;
	}


	@Override
	public List<AirplaneVO> getAirplaneList() {
		List<AirplaneVO> list = airlineDao.selectAirplaneList();//항공사명을 클릭했을 때 가져오는 데이터
		
		return list;
	}


	@Override
	public boolean insertAirline(AirlineVO airline, MemberVO user) {


		if(airline == null || airline.getAl_name() == null || airline.getAl_name().length() == 0) {
			return false;
		}
		
		boolean res = airlineDao.insertAirline(airline);
		if(!res) {
			return false;
		}
		return true;
	}


	@Override
	public boolean deleteAirline(String al_name, MemberVO user) {

		
		if(al_name == null) {
			return false;
		}
		
		return airlineDao.deleteAirline(al_name);
	}



	@Override
	public boolean insertAirplane_ap(AirplaneVO airplane, MemberVO user) {

		if(airplane == null || airplane.getAp_num()==null||airplane.getAp_am_model()==null||airplane.getAp_al_name()==null) {
			return false;
		}
		
		boolean res = airlineDao.insertAirplane(airplane);
		if(!res) {
			return false;
		}
		
		
		return true;
	}




   
}
