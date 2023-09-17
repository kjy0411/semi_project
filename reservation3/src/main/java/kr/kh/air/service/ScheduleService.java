package kr.kh.air.service;

import org.springframework.stereotype.Service;

import kr.kh.air.vo.ScheduleVO;

@Service
public interface ScheduleService {

	boolean insert(ScheduleVO schedule);

	boolean deleteSchedule(Integer sk_num, ScheduleVO user);

}
