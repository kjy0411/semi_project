package kr.kh.project.service;

import kr.kh.project.vo.TicketingListVO;

public interface TicketingListService {

	boolean insertTicketingList(int sk_num, TicketingListVO ticket);

	TicketingListVO selectTicketingList(TicketingListVO ticket);

}
