package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.DivisionVO;
import kr.kh.project.vo.NationVO;

public interface NationDAO {

	List<NationVO> getNationByRoute();

	List<NationVO> getNationByRoute(@Param("route")boolean route, @Param("ai_num")String ai_num);
	
	List<DivisionVO> getDivisionByRoute(@Param("route")boolean route, @Param("ai_num")String ai_num);

	List<NationVO> getNation();

	List<DivisionVO> getDivision();
}
