package kr.kh.project.service;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import kr.kh.project.vo.AirlineVO;
import kr.kh.project.vo.AirplaneModelVO;
import kr.kh.project.vo.AirplaneVO;
import kr.kh.project.vo.MemberVO;
@MapperScan
public interface AirlineService {

	List<AirlineVO> getAirlineList();// 항공사명이 나오는 화면

	List<AirplaneVO> getAirplaneList();// 항공사명을 클릭했을떄 나오는 화면

	

	boolean insertAirline(AirlineVO airline, MemberVO user);

	boolean deleteAirline(String al_name, MemberVO user);

	boolean insertAirplane_ap(AirplaneVO airplane, MemberVO user);

	List<AirplaneModelVO> getModelList();


	
	
	
   

}
