package kr.kh.project.service;

import java.util.List;

import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.MemberVO;

public interface MemberService {

	boolean signupMember(MemberVO member);

	MemberVO loginMember(MemberVO member);

	MemberVO selectMember(String me_id);


	List<MemberVO> getMemberList(Criteria cri);

	boolean updateMemberByAuthority(MemberVO member, MemberVO user);

	boolean updateMember(MemberVO member);

	boolean checkMember(MemberVO member);

	void updateMemberSession(MemberVO user);

	MemberVO getMemberBySession(String me_session_id);

	int getTotalCount(Criteria cri);

	boolean checkId(String id);


}
