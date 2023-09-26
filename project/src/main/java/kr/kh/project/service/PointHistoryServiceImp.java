package kr.kh.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.PointDAO;
import kr.kh.project.dao.PointHistoryDAO;
import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.PointHistoryVO;
import kr.kh.project.vo.PointVO;
import kr.kh.project.vo.TicketingVO;

@Service
public class PointHistoryServiceImp implements PointHistoryService{
	@Autowired
	PointHistoryDAO pointHistoryDao;
	@Autowired
	PointDAO pointDao;

	@Override
	public void insertPointHistory(TicketingVO ticketing) {
		if(ticketing == null || ticketing.getTi_num() == 0 || ticketing.getTi_me_id() == null) {
			return;
		}
		PointVO point = pointDao.selectPointByID(ticketing.getTi_me_id());
		pointHistoryDao.insertPointHistory(ticketing.getTi_num(), point.getPo_num());
	}

	@Override
	public List<PointHistoryVO> selectPointHistory(String me_id, Criteria cri) {
		if(me_id == null) {
			return null;
		}
		List<PointHistoryVO> dbPHList = pointHistoryDao.selectPotinHistoryListByID(me_id);
		List<PointHistoryVO> phList = new ArrayList<PointHistoryVO>(dbPHList.size());
		int count = 0;
		int i = 0;
		for(PointHistoryVO ph : dbPHList) {
			++i;
			ph.setNum(++count);
			if(ph.getPh_detail().equals("사용")) {
				ph.setPoint(ph.getTi_use_point());
				if(i != 1) {
					ph.setPo_accumulate_point(dbPHList.get(i-2).getPo_accumulate_point());
					ph.setPo_hold_point(dbPHList.get(i-2).getPo_hold_point() - ph.getPoint());
				}
			}else if(ph.getPh_detail().equals("적립")) {
				ph.setPoint(ph.getTi_save_point());
				ph.setPo_accumulate_point(dbPHList.get(i-2).getPo_accumulate_point() + ph.getPoint());
				ph.setPo_hold_point(dbPHList.get(i-2).getPo_hold_point() + ph.getPoint());
			}
		}
		for(int j = dbPHList.size() - 1; j > -1 ; j--) {
			phList.add(dbPHList.get(j));
		}
		for(PointHistoryVO p : phList) {
		}
		return phList.subList(cri.getPageStart(), cri.getPageStart() + cri.getPerPageNum() <= phList.size() ? cri.getPageStart() + cri.getPerPageNum() : phList.size() );
	}

	@Override
	public int getTotalCount(String me_id) {
		if(me_id == null) {
			return 0;
		}
		return pointHistoryDao.countByMeID(me_id);
	}

}
