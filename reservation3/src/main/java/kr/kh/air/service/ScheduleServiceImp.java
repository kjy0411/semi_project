package kr.kh.air.service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import kr.kh.air.dao.ScheduleDAO;
import kr.kh.air.vo.ScheduleVO;


import org.springframework.stereotype.Service;


@Service
public class ScheduleServiceImp implements ScheduleService{

	@Autowired
	private ScheduleDAO scheduleDao;

	@Override
	public boolean insert(ScheduleVO schedule) {
		if(schedule == null) {
			return false;
		}
		
		ScheduleVO dbSchedule = scheduleDao.selectSchedule(schedule.getSk_num());
		
		return scheduleDao.insertSchedule(schedule);
	
	}

	@Override
	public boolean deleteSchedule(Integer sk_num, ScheduleVO user) {
		if(sk_num == null || user == null) {
			return false;
		}
		scheduleDao.deleteBoard(sk_num);
		return true;
	}
}
