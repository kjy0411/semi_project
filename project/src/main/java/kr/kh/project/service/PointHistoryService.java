package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.PointHistoryVO;
import kr.kh.project.vo.TicketingVO;

public interface PointHistoryService {

	void insertPointHistory(TicketingVO ticketingVO);

	List<PointHistoryVO> selectPointHistory(String me_id, Criteria cri);

	int getTotalCount(String me_id);

}
