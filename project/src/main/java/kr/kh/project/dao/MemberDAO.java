package kr.kh.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_id")String me_id);

	boolean insertMember(@Param("member")MemberVO member);


	List<MemberVO> selectMemberList(@Param("cri")Criteria cri);

	boolean updateMemberByAuthority(@Param("member")MemberVO member);



	boolean updateMember(@Param("member")MemberVO member);

	void updateMemberSession(@Param("user")MemberVO user);

	MemberVO selectMemberBySession(@Param("me_session_id")String me_session_id);

	int selectCountMemberList(@Param("cri")Criteria cri);

	MemberVO selectMemberById(@Param("id")String me_id);


}
