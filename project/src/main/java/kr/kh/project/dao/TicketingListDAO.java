package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.TicketingListVO;

public interface TicketingListDAO {

	boolean insertTicketingList(@Param("sk_num")int sk_num, @Param("tl")TicketingListVO ticketingList);

	TicketingListVO selectTicketingList(@Param("tl")TicketingListVO ticketingList);

	TicketingListVO checkTicketingListSeat(@Param("sk_num")int sk_num, @Param("tl")TicketingListVO ticketingList);

	List<TicketingListVO> selectTicketingListByTi_num(@Param("ti_num")int ti_num);

	void deleteTicketingList(@Param("tl_num")String tl_num);


}
