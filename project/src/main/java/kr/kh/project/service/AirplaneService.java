package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.AirplaneVO;

public interface AirplaneService {

	AirplaneVO getAirplaneBySchedule(int sk_num);

	List<Integer> getPath(Integer sk_num);

	List<AirplaneVO> getAirplaneByAlName(String al_name);

	boolean deleteAirplane(String ap_num);

}
