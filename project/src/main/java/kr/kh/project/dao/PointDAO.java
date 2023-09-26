package kr.kh.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.PointVO;

public interface PointDAO {

	PointVO selectPointByID(@Param("me_id")String me_id);
	
	void checkPoint(@Param("me_id")String me_id);

	void updateClass(@Param("me_id")String me_id);
}
