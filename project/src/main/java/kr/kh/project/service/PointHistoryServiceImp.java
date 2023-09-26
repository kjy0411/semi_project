package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.PointDAO;
import kr.kh.project.dao.PointHistoryDAO;
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

}
