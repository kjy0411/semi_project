package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.ScheduleDAO;
import kr.kh.project.pagination.Criteria;
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
	public List<ScheduleVO> getScheduleList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return scheduleDao.selectScheduleList(cri);
	}

	@Override
	public boolean deleteSchedule(String sk_num){
		
		return scheduleDao.deleteSchedule(sk_num);
	}

	@Override
	public void insertSchedulePost(ScheduleVO schedule) {
		
		scheduleDao.insertSchedule(schedule);
	}

	@Override
	public List<ScheduleVO> getScheduleInsert(ScheduleVO scheduleVo) {
		// TODO Auto-generated method stub
		return scheduleDao.insertSchedules(scheduleVo);
	}


	
}
