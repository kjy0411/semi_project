package kr.kh.project.service;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.MemberDAO;
import kr.kh.project.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;
	

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

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

		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		if(dbMember != null) {
			return false;
		}
//		//아이디는 영문으로 시작하며 영문,숫자로 이루어지고 10~20자
//		String idRegex = "^[a-zA-Z][a-zA-Z0-9]{10,20}$";
//		//비번은 영문,숫자,!@#$%로 이루어지고 12~25자
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
	public MemberVO login(MemberVO member) {
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
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = memberDao.selectMemberList();
		return list;
	}

	@Override
	public boolean updateMember(MemberVO member, MemberVO user) {
		if(member == null || member.getMe_id() == null || member.getMe_authority() == null) {
			return false;
		}
		return memberDao.updateMember(member);
	}

}
