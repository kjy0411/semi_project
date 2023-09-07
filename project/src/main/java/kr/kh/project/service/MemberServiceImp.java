package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.MemberDAO;
import kr.kh.project.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;

	@Override
	public boolean signup(MemberVO member) {
		if(member == null
		|| member.getMe_id() == null
		|| member.getMe_pw() == null
		|| member.getMe_name() == null
		|| member.getMe_eng_name() == null
		|| member.getMe_birthday()  == null
		|| member.getMe_phone() == null
		|| member.getMe_email() == null) {
			return false;
		}
		return memberDao.insertMember(member);
	}

}
