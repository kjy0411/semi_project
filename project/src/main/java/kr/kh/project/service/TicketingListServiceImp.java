package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.TicketingListDAO;
import kr.kh.project.vo.TicketingListVO;

@Service
public class TicketingListServiceImp implements TicketingListService {

    @Autowired
    TicketingListDAO ticketingListDao;

	@Override
	public TicketingListVO insertSelectTicketingList(int sk_num, TicketingListVO ticketingList) {
		if(sk_num == 0) {
			return null;
		}
		if(ticketingList == null || ticketingList.getTl_num() == null || ticketingList.getTl_ti_num() == 0 || ticketingList.getTl_se_num() == 0) {
			return null;
		}
		if(!ticketingListDao.insertTicketingList(sk_num, ticketingList)) {
			return null;
		}
		return ticketingListDao.selectTicketingList(ticketingList);
	}

}
