package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.NationVO;

public interface ReservationService {

	List<AirportVO> getAirportList();

	List<NationVO> getNationList();

}
