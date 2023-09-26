package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.PointDAO;
import kr.kh.project.vo.PointVO;

@Service
public class PointServiceImp implements PointService{
	@Autowired
	PointDAO pointDao;

	@Override
	public PointVO getPoint(String me_id) {
		if(me_id == null) {
			return null;
		}
		return pointDao.selectPointByID(me_id);
	}
	
}
