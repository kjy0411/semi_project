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
	public void insertTicketingList(int sk_num, TicketingListVO ticketingList) {
		if(sk_num == 0) {
			return;
		}
		if(ticketingList == null || ticketingList.getTl_num() == null || ticketingList.getTl_ti_num() == 0 || ticketingList.getTl_se_num() == 0) {
			return;
		}
		System.out.println(sk_num);
		System.out.println(ticketingList);
		ticketingListDao.insertTicketingList(sk_num, ticketingList);
	}

}
