package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.ScheduleDAO;
import kr.kh.project.vo.ScheduleVO;

@Service
public class ScheduleServiceImp implements ScheduleService{
	@Autowired
	ScheduleDAO scheduleDao;

	@Override
	public List<ScheduleVO> getScheduleByRoute(int ro_num, String startDate) {
		if(ro_num == 0) {
			return null;
		}
		return scheduleDao.selectScheduleByRoute(ro_num, startDate);
	}
	@Override
	public List<ScheduleVO> getSchedulesByRouteNumber(int sk_ro_num) {
	    return scheduleDao.getSchedulesByRouteNumber(sk_ro_num);
	}
	@Override
	public void deleteScheduleByNumber(int sk_ro_num) {
	    
	   scheduleDao.deleteScheduleByNumber(sk_ro_num);
	}

	@Override
	public ScheduleVO getSchdeule(Integer sk_num) {
		if(sk_num == 0) {
			return null;
		}
		return scheduleDao.selectSchedule(sk_num);
	}
}
