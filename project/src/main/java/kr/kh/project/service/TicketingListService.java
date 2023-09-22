package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.TicketingListVO;

public interface TicketingListService {

	boolean insertTicketingList(int sk_num, TicketingListVO ticket);

	TicketingListVO selectTicketingList(TicketingListVO ticket);

	void deleteTicketingList(List<TicketingListVO> ticketList);

}
