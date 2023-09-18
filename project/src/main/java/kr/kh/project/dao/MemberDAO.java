package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);

	boolean insertMember(@Param("member")MemberVO member);

	List<MemberVO> selectMemberList();

	boolean updateMemberByAuthority(@Param("member")MemberVO member);
;



}
