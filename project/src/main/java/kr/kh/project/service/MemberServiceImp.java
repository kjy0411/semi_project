package kr.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.MemberDAO;
import kr.kh.project.pagination.Criteria;
import kr.kh.project.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;
	

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public boolean signupMember(MemberVO member) {
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

		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		if(dbMember != null) {
			return false;
		}
//		String idRegex = "^[a-zA-Z][a-zA-Z0-9]{10,20}$";

//		String pwRegex = "^[a-zA-Z0-9!@#$%]{12,25}$";
//		
//		if(!Pattern.matches(idRegex, member.getMe_id())) {
//			return false;
//		}
//		if(!Pattern.matches(pwRegex, member.getMe_pw())) {
//			return false;
//		}
		

		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);

		return memberDao.insertMember(member);
	}

	@Override
	public MemberVO loginMember(MemberVO member) {
		if(member == null) {
			return null;
		}
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		if(dbMember == null) {
			return null;
		}
		if(passwordEncoder.matches(member.getMe_pw(), dbMember.getMe_pw())) {
			return dbMember;
		}
		return null;
	}

	@Override
	public MemberVO selectMember(String me_id) {
		if(me_id == null) {
			return null;
		}
		return memberDao.selectMember(me_id);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		return memberDao.selectMemberList(cri);
	}

	@Override
	public boolean updateMemberByAuthority(MemberVO member, MemberVO user) {
		if(member == null || member.getMe_id() == null || member.getMe_authority() == null) {
			return false;
		}
		return memberDao.updateMemberByAuthority(member);
	}

	@Override
	public boolean updateMember(MemberVO member) {
		if(member == null
		|| member.getMe_id() == null
		|| member.getMe_name() == null
		|| member.getMe_eng_name() == null
		|| member.getMe_birthday()  == null
		|| member.getMe_phone() == null
		|| member.getMe_email() == null) {
			return false;
		}
		String str = member.getMe_birthday_str();
		member.setMe_birthday(str);
		
		return memberDao.updateMember(member);
	}

	@Override
	public boolean checkMember(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null) {
			return false;
		}
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		return passwordEncoder.matches(member.getMe_pw(), dbMember.getMe_pw());
	}

	@Override
	public void updateMemberSession(MemberVO user) {
		if(user == null || user.getMe_session_id() == null) {
			return;
		}
		System.out.println(user);
		memberDao.updateMemberSession(user);
	}

	@Override
	public MemberVO getMemberBySession(String me_session_id) {
		return memberDao.selectMemberBySession(me_session_id);
	}

}
