package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.TicketingDAO;
import kr.kh.project.vo.TicketingVO;

@Service
public class TicketingServiceImp implements TicketingService {

    @Autowired
    TicketingDAO ticketingDao;

	@Override
	public TicketingVO insertSelectTicketing(TicketingVO ticketing) {
		if(ticketing == null
				|| ticketing.getTi_me_id() == null
				|| ticketing.getTi_sk_num() == 0
				|| ticketing.getTi_amount() == 0
				|| ticketing.getTi_total_price() == 0) {
			return null;
		}
		if(!ticketingDao.insertTicketing(ticketing)) {
			return null;
		}
		return ticketingDao.selectTicketing(ticketing.getTi_me_id());
	}

}
