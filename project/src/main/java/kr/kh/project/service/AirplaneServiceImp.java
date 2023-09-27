package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.AirplaneDAO;
import kr.kh.project.vo.AirplaneVO;

@Service
public class AirplaneServiceImp implements AirplaneService {

	@Autowired
	AirplaneDAO airplaneDao;

	@Override
	public AirplaneVO getAirplaneBySchedule(int sk_num) {
		if(sk_num == 0) {
			return null;
		}
		return airplaneDao.selectAirplaneBySchedule(sk_num);
	}

	@Override
	public List<Integer> getPath(Integer sk_num) {
		if(sk_num == null) {
			return null;
		}
		return airplaneDao.selectPath(sk_num);
	}

	@Override
	public List<AirplaneVO> getAirplaneByAlName(String al_name) {
		if(al_name == null) {
			return null;
		}
		return airplaneDao.selectAirplaneByAlName(al_name);
	}

	@Override
	public boolean deleteAirplane(String ap_num) {
		return airplaneDao.deleteAirplane(ap_num);
	}
}
