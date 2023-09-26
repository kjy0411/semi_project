package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.TicketingVO;

public interface TicketingService {

	List<TicketingVO> getTicketingList(String me_id);

	boolean insertTicketing(TicketingVO ticketing);

	TicketingVO selectTicketing(String ti_me_id);

	void deleteTicketing(List<TicketingVO> ticketingList);

	boolean updateTicketingState(TicketingVO ticketing);

	List<TicketingVO> getTicketingList2(String me_id);

	List<TicketingVO> getTicketingList3(String me_id);
	
}
