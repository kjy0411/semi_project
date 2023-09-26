package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.PointHistoryVO;

public interface PointHistoryDAO {

	void insertPointHistory(@Param("ti_num")int ti_num, @Param("po_num")int po_num);

	List<PointHistoryVO> selectPotinHistoryList(@Param("ti_num")int ti_num);

	void deletePointHistoryList(@Param("ph_num")int ph_num);

}
