package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.DivisionVO;
import kr.kh.project.vo.NationVO;

public interface NationService {

	List<NationVO> getNationByRoute(boolean route, String ai_num);

	List<DivisionVO> getDivisionByRoute(boolean route, String ai_num);

	boolean checkNation(String ai_na_name);
}
