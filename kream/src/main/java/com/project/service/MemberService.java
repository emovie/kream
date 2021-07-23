package com.project.service;

import com.project.model.LoginDTO;
import com.project.model.MemberDTO;


public interface MemberService {
	
	void register(MemberDTO dto) throws Exception;
	
	void naver_register(MemberDTO dto) throws Exception;
	
	MemberDTO login(LoginDTO dto) throws Exception;

	int checkEmail(String email) throws Exception;

	int checkPw(String email) throws Exception;

	
}
