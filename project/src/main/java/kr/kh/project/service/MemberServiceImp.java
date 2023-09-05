package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.MemberDAO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;

}
