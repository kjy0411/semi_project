package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.ReservationDAO;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.NationVO;

@Service
public class ReservationServiceImp implements ReservationService{
	@Autowired
	ReservationDAO reservationDao;

	@Override
	public List<AirportVO> getAirportList() {
		return reservationDao.selectAirportList();
	}

	@Override
	public List<NationVO> getNationList() {
		return reservationDao.selectNationList();
	}

}
