package kr.kh.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.TicketingListVO;

public interface TicketingListDAO {

	boolean insertTicketingList(@Param("sk_num")int sk_num, @Param("tl")TicketingListVO ticketingList);

	TicketingListVO selectTicketingList(@Param("tl")TicketingListVO ticketingList);

	TicketingListVO checkTicketingListSeat(@Param("sk_num")int sk_num, @Param("tl")TicketingListVO ticketingList);

	void deleteTicketing(@Param("tl_num")String tl_num);

}
