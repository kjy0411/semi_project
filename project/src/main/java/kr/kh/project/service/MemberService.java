package kr.kh.project.service;

import kr.kh.project.vo.MemberVO;

public interface MemberService {

	boolean signupMember(MemberVO member);

	MemberVO loginMember(MemberVO member);

	MemberVO selectMember(String me_id);

	boolean updateMember(MemberVO member);

	boolean checkMember(MemberVO member);

}
