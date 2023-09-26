package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.ScheduleDAO;
import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.ScheduleInsertVO;
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
	public boolean deleteScheduleByNumber(int sk_num) {
	    
	   return scheduleDao.deleteScheduleByNumber(sk_num);
	}

	@Override
	public ScheduleVO getSchdeule(Integer sk_num) {
		if(sk_num == 0) {
			return null;
		}
		return scheduleDao.selectSchedule(sk_num);
	}
	@Override
	public List<ScheduleVO> getScheduleList(Criteria cri) {
		return scheduleDao.selectScheduleList(cri);
	}
	@Override
	public int getTotalCount() {
		return scheduleDao.getTotalCount();
	}
	@Override
	public boolean insertSchedule(ScheduleInsertVO schedule) {
		if(schedule == null
			|| schedule.getSk_ap_num() == null
			|| schedule.getSk_ro_num() == 0
			|| schedule.getSk_start_time_str() == null
			|| schedule.getSk_time() == null) {
			return false;
		}
		boolean res = scheduleDao.insertSchedule(schedule);
		System.out.println(res);
		return res;
	}
}
