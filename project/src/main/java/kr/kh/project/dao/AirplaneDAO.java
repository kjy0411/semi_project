package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirplaneVO;

public interface AirplaneDAO {

	AirplaneVO selectAirplaneBySchedule(@Param("sk_num")int sk_num);

	List<Integer> selectPath(@Param("sk_num")Integer sk_num);

	List<AirplaneVO> selectAirplaneByAlName(@Param("al_name")String al_name);

	boolean deleteAirplane(@Param("ap_num")String ap_num);

}
