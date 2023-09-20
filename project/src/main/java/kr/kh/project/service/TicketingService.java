package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.MemberVO;
import kr.kh.project.vo.TicketingVO;

public interface TicketingService {

	List<TicketingVO> getTicketingList(MemberVO userId);

}
