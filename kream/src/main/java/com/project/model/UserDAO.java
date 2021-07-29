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

	@Update("update addressbook set basicck = 'n' where memberidx = #{memberidx}")
	int changeBasicck(int memberidx);

	@Select("select count(*) from addressbook where memberidx = #{memberIdx}")
	int checkedBasicck(int memberIdx);

	@Delete("delete from addressbook where idx = #{addressIdx}")
	int deleteAdd(int addressIdx);
	
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

	@Update("update addressbook set basicck = 'y' where memberidx = #{memberidx} and idx = #{addressIdx}")
	int changBasicAdd(HashMap<String, Object> map);

	@Update("update addressbook set name = #{name}, phonenumber = #{phoneNumber}, postcode = #{postcode}, address = #{address}, detail = #{detail}, basicck = #{basicck} where idx = #{idx}")
	int modifyAdd(AddressDTO dto);

	@Select("select * from member where idx = #{idx}")
	MemberDTO AccountData(int idx);

	@Update("update member set accountbank = #{accountBank}, accountnumber = #{accountNumber}, accountname = #{accountName} where idx = #{idx}")
	int registerAccount(AccountDTO dto);

	@Select("select idx from addressbook where basicck = 'y' and memberIdx = #{memberIdx}")
	int checkBasicckIdx(int memberIdx);

	@Select("select * from (select * from buying where memberidx = #{memberIdx} and step = #{step}) where startdate between #{startDate} and #{endDate} order by startdate desc")
	List<BuySellDTO> readBuyHistory(BuySellDTO dto);

	@Select("select * from (select * from selling where memberidx = #{memberIdx} and step = #{step}) where startdate between #{startDate} and #{endDate} order by startdate desc")
	List<BuySellDTO> readSellHistory(BuySellDTO dto);

}
