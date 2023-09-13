package kr.kh.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.project.dao.NationDAO;

@Service
public class NationServiceImp implements NationService{
	@Autowired
	NationDAO nationDao;
}
