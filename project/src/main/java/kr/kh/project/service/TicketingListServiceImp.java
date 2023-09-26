package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.TicketingListDAO;
import kr.kh.project.vo.TicketingListVO;
import kr.kh.project.vo.TicketingVO;

@Service
public class TicketingListServiceImp implements TicketingListService {

    @Autowired
    TicketingListDAO ticketingListDao;

	@Override
	public boolean insertTicketingList(int sk_num, TicketingListVO ticketingList) {
		if(sk_num == 0) {
			return false;
		}
		if(ticketingList == null || ticketingList.getTl_num() == null || ticketingList.getTl_ti_num() == 0 || ticketingList.getTl_se_num() == 0) {
			return false;
		}
		if(ticketingListDao.checkTicketingListSeat(sk_num, ticketingList) != null) {
			return false;
		}
		return ticketingListDao.insertTicketingList(sk_num, ticketingList);
	}

	@Override
	public TicketingListVO selectTicketingList(TicketingListVO ticketingList) {
		if(ticketingList == null || ticketingList.getTl_num() == null || ticketingList.getTl_ti_num() == 0 || ticketingList.getTl_se_num() == 0) {
			return null;
		}
		return ticketingListDao.selectTicketingList(ticketingList);
	}
}
