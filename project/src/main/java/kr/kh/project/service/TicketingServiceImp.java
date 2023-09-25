package kr.kh.project.service;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.PointHistoryDAO;
import kr.kh.project.dao.TicketingDAO;
import kr.kh.project.dao.TicketingListDAO;
import kr.kh.project.vo.PointHistoryVO;
import kr.kh.project.vo.TicketingListVO;
import kr.kh.project.vo.TicketingVO;

@Service
public class TicketingServiceImp implements TicketingService {

    @Autowired
    TicketingDAO ticketingDao;

    @Autowired
    TicketingListDAO ticketingListDao;
    
    @Autowired
    PointHistoryDAO pointHistoryDao;
  
	@Override
	public List<TicketingVO> getTicketingList(String me_id) {
		
		return ticketingDao.selectTicketingList(me_id);
	}
	
	@Override
	public boolean insertTicketing(TicketingVO ticketing) {
		ticketing.setMc_bonus_point(ticketingDao.findBonus(ticketing.getTi_me_id()));
		if(ticketing == null
				|| ticketing.getTi_me_id() == null
				|| ticketing.getTi_sk_num() == 0
				|| ticketing.getTi_amount() == 0
				|| ticketing.getTi_total_price() == 0) {
			return false;
		}
		
		return ticketingDao.insertTicketing(ticketing);
	}

	@Override
	public TicketingVO selectTicketing(String ti_me_id) {
		if(ti_me_id == null) {
			return null;
		}
		return ticketingDao.selectTicketing(ti_me_id);
	}

	@Override
	public void deleteTicketing(List<TicketingVO> ticketingList) {
		if(ticketingList.size() == 0) {
			return;
		}
		for(TicketingVO ticketing : ticketingList) {
			if(ticketing == null || ticketing.getTi_num() == 0) {
				continue;
			}
			List<TicketingListVO> ticketList = new ArrayList<TicketingListVO>();
			List<PointHistoryVO> pointHistoryList = new ArrayList<PointHistoryVO>();
			
			ticketList = ticketingListDao.selectTicketingListByTi_num(ticketing.getTi_num());
			pointHistoryList = pointHistoryDao.selectPotinHistoryList(ticketing.getTi_num());
			for(TicketingListVO ticket : ticketList) {
				ticketingListDao.deleteTicketingList(ticket.getTl_num());				
			}
			for(PointHistoryVO pointHistory : pointHistoryList) {
				pointHistoryDao.deletePointHistoryList(pointHistory.getPh_num());
			}
			ticketingDao.deleteTicketing(ticketing.getTi_num());
		}
	}

}
