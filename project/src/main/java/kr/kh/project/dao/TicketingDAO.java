package kr.kh.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.TicketingVO;

public interface TicketingDAO {

	boolean insertTicketing(@Param("ticketing")TicketingVO ticketing);

	TicketingVO selectTicketing(@Param("ti_me_id")String ti_me_id);

	void deleteTicketing(@Param("ti_num")int ti_num);

}
