package kr.kh.project.service;

import kr.kh.project.vo.PointVO;

public interface PointService {

	PointVO getPoint(String me_id);

	boolean checkPoint(String ti_me_id);

}
