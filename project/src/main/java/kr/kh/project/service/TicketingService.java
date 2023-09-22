package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.TicketingVO;

public interface TicketingService {

	boolean insertTicketing(TicketingVO ticketing);

	TicketingVO selectTicketing(String ti_me_id);

	void deleteTicketing(List<TicketingVO> ticketingList);

}
