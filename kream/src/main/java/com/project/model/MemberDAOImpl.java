package com.project.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final String NAMESPACE = "com.project.kream.config.mapper-member";
	
	private final SqlSession sql;
	
	@Inject
	public MemberDAOImpl(SqlSession sql) {
		this.sql = sql;
	}
	
	//회원가입 처리
	@Override
	public void register(MemberDTO dto) throws Exception {
		sql.insert(NAMESPACE + ".register", dto);
	}
	@Override
	public void naver_register(MemberDTO dto) throws Exception {
		sql.insert(NAMESPACE + ".naver_register", dto);
	}

	@Override
	public MemberDTO login(LoginDTO dto) throws Exception {
		return sql.selectOne(NAMESPACE + ".login", dto);
	}


	@Override
	public int checkEmail(String email) throws Exception {
		return sql.selectOne(NAMESPACE + ".checkEmail", email);
	}

	
	
}
