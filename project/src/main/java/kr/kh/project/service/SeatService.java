package kr.kh.project.service;

import java.util.List;

import kr.kh.project.vo.SeatVO;

public interface SeatService {

	List<SeatVO> getSeatListBySchedule(int sk_num);

}
