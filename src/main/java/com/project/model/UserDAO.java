package com.project.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDAO {

	@Select("select count(*) from member where email=#{email} and phoneNumber=#{phoneNumber}")
	int checkEmail(HashMap<String, String> map);

	@Update("update member set pw = #{pw} where email=#{email} and phoneNumber=#{phoneNumber}")
	int changeTempPw(HashMap<String, String> map);

	@Select("select count(*) from member where phonenumber = #{phoneNumber}")
	int checkPhoneNum(String phoneNumber);

	@Select("select email from member where phonenumber = #{phoneNumber}")
	String getEmail(String phoneNumber);

	@Insert("insert into addressbook (memberidx, name, phonenumber, postcode, address, detail, basicck) values (#{memberIdx}, #{name}, #{phoneNumber}, #{postcode}, #{address}, #{detail}, #{basicck})")
	int regiAddress(AddressDTO dto);

	@Update("update addressbook set basicck = 'n' where basicck = 'y'")
	int changeBasicck();

	@Select("select count(*) from addressbook where memberidx = #{memberIdx}")
	int checkedBasicck(int memberIdx);

	@Select("select * from addressbook where memberidx = #{loginIdx}")
	List<AddressDTO> getAddressList(int loginIdx);

	@Select("select pw from member where email = #{email}")
	String checkSocialLog(String email);

	@Select("select count(*) from member where email=#{email}")
	int checkEmailExist(String email);

	@Update("update member set email = #{newmail} where email = #{oldmail}")
	int modifyEmail(HashMap<String, String> map);

	@Select("select * from member where email=#{newmail}")
	MemberDTO getUser(String newmail);

	@Select("select count(*) from member where pw = #{nowpw} and email = #{nowLogin}")
	int compareNowPw(HashMap<String, String> map);

	@Update("update member set pw = #{newpw} where email = #{nowLogin}")
	int changeNewPw(HashMap<String, String> map);

	@Update("update member set name = #{newName} where email = #{nowLogin}")
	int changeNewName(HashMap<String, String> map);

	@Update("update member set profileimage = #{fileName} where idx = #{nowLoginIdx}")
	int insertImage(HashMap<String, Object> map);

	@Update("update member set profileimage = 'default.jpg' where idx = #{idx}")
	int deleteProfile(int idx);

	@Delete("delete from productwish where idx = #{wishIdx}")
	int wishItemDelete(int wishIdx);


}
