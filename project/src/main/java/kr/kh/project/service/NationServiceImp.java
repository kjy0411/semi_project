package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.NationDAO;
import kr.kh.project.vo.DivisionVO;
import kr.kh.project.vo.NationVO;

@Service
public class NationServiceImp implements NationService{
	@Autowired
	NationDAO nationDao;
	
	@Override
	public List<NationVO> getNationList() {
		return nationDao.selectNationList();
	}

	@Override
	public List<DivisionVO> getDivisionList() {
		return nationDao.selectDivisionList();
	}
}
