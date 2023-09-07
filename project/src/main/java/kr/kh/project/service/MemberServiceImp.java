package kr.kh.project.service;

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
//		//���̵�� �������� �����ϸ� ����,���ڷ� �̷������ 10~20��
//		String idRegex = "^[a-zA-Z][a-zA-Z0-9]{10,20}$";
//		//����� ����,����,!@#$%�� �̷������ 12~25��
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

}
