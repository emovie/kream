package com.project.model;

import java.util.HashMap;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDAO {

	@Select("select count(*) from member where email=#{email} and phoneNumber=#{phoneNumber}")
	int checkEmail(HashMap<String, String> map);

	@Update("update member set pw = #{pw} where email=#{email} and phoneNumber=#{phoneNumber}")
	int changeTempPw(HashMap<String, String> map);


}
