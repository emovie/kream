package com.project.model;

public interface MemberDAO {
	
	void register(MemberDTO dto) throws Exception;
	
	MemberDTO login(LoginDTO dto) throws Exception;

	void naver_register(MemberDTO dto) throws Exception;

	int checkEmail(String email) throws Exception;

	int checkPw(String email) throws Exception;
}
