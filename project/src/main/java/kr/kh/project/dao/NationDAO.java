package kr.kh.project.dao;

import java.util.List;

import kr.kh.project.vo.NationVO;

public interface NationDAO {

	List<NationVO> selectNationList();

}