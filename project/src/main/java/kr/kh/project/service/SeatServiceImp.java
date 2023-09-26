package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.SeatDAO;
import kr.kh.project.vo.SeatVO;

@Service
public class SeatServiceImp implements SeatService {

    @Autowired
    SeatDAO seatDao;

	@Override
	public List<SeatVO> getSeatListBySchedule(int sk_num) {
		if(sk_num == 0) {
			return null;
		}
		return seatDao.selectSeatListBySchedule(sk_num);
	}


}
