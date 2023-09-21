package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.TicketingDAO;
import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.TicketingVO;

@Service
public class TicketingServiceImp implements TicketingService{

	@Autowired
	TicketingDAO ticketingDao;
	
	@Override
	public List<TicketingVO> getTicketingList(String me_id) {
		
		return ticketingDao.selectTicketingList(me_id);
	}
}
