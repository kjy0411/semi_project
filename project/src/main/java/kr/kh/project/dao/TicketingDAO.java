package kr.kh.project.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.TicketingVO;

public interface TicketingDAO {

	List<TicketingVO> selectTicketingList(@Param("me_id")String me_id, @Param("ticketing")int ticketing);

	boolean insertTicketing(@Param("ticketing")TicketingVO ticketing);

	TicketingVO selectTicketing(@Param("ti_me_id")String ti_me_id);
	void deleteTicketing(@Param("ti_num")int ti_num);

	float findBonus(@Param("ti_me_id")String ti_me_id);

	boolean updateTicketingState(@Param("ticketing")TicketingVO ticketing);

	List<TicketingVO> selectTicketingListBySearch(@Param("cri")Criteria cri);

	TicketingVO selectTicketingByNum(int ti_num);
}