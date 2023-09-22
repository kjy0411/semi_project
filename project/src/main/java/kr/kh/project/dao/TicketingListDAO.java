package kr.kh.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.TicketingListVO;

public interface TicketingListDAO {

	void insertTicketingList(@Param("sk_num")int sk_num, @Param("tl")TicketingListVO ticketingList);

}
