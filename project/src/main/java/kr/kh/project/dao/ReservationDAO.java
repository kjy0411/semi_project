package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.AirportVO;
import kr.kh.project.vo.NationVO;

public interface ReservationDAO {

	List<AirportVO> selectAirportList();

	List<NationVO> selectNationList();

}
