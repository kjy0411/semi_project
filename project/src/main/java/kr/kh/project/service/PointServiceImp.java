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
		pointDao.checkPoint(me_id);
		pointDao.updateClass(me_id);
		return pointDao.selectPointByID(me_id);
	}

	@Override
	public boolean checkPoint(String me_id) {
		if(me_id == null) {
			return false;
		}
		boolean res = false;
		PointVO point1 = pointDao.selectPointByID(me_id);
		System.out.println(point1);
		pointDao.checkPoint(me_id);
		pointDao.updateClass(me_id);
		PointVO point2 = pointDao.selectPointByID(me_id);
		System.out.println(point2);
		if(!point1.getPo_mc_name().equals(point2.getPo_mc_name())) {
			res = true;
		}
		return res;
	}

	@Override
	public void insertPoint(String me_id) {
		if(me_id == null) {
			return;
		}
		pointDao.insertPoint(me_id);
	}
	
}
