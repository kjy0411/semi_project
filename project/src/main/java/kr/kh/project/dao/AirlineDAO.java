package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;

public interface AirlineDAO {
	
	List<AirlineVO> selectAirlineList();//항공사명을 가져옴

	List<AirplaneVO> selectAirplaneList();//항공사명을 클릭시에 가져오는 데이터

	boolean insertAirline(@Param("airline")AirlineVO airline); // 항공사명을 입력할 때 가져오는 데이터

	boolean deleteAirline(@Param("al_name")String al_name); // 삭제할 항공사

	boolean insertAirplane(@Param("airplane")AirplaneVO airplane);


	
	
}
