package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.model.LoginDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDAO dao;
	
	@Inject
	public MemberServiceImpl(MemberDAO dao) {
		this.dao = dao; 
	}
	
	@Override
	public void register(MemberDTO dto) throws Exception {
		dao.register(dto);
	}
	
	@Override
	public void naver_register(MemberDTO dto) throws Exception {
		dao.naver_register(dto);
	}

	@Override
	public MemberDTO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	
	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	@Override
	public int checkPw(String email) throws Exception {
		return dao.checkPw(email);
	}
}
