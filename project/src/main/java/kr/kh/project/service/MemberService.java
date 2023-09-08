package kr.kh.project.service;

import kr.kh.project.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(MemberVO member);

	MemberVO selectMember(String me_id);

}
