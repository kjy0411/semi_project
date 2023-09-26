package kr.kh.project.service;

import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.MemberVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;
@MapperScan
public interface AirlineService {

	List<AirlineVO> getAirlineList();// 항공사명이 나오는 화면

	List<AirplaneVO> getAirplaneList();// 항공사명을 클릭했을떄 나오는 화면

	

	boolean insertAirline(AirlineVO airline, MemberVO user);

	AirlineVO deleteAirline(String al_name, MemberVO user);

	boolean insertAirplane_ap(AirplaneVO airplane, MemberVO user);

	
	
	
   

}
