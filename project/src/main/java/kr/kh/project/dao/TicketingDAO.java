package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.TicketingVO;

public interface TicketingDAO {

	List<TicketingVO> selectTicketingList(@Param("me_id")String me_id);

}
