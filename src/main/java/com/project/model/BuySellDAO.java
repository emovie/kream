package com.project.model;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface BuySellDAO {
	
	@Select("select * from addressbook where idx=#{idx}")
	AddressDTO getAddress(@Param("idx") int addressIdx);

	@Select("select * from member where idx=#{idx}")
	MemberDTO getMember(@Param("idx") int idx);
	
	@Insert("insert into selling values (selling_seq.nextval,#{memberIdx},#{productIdx},#{addressIdx},#{price},#{pSize},#{startDate},#{endDate},#{countDate},#{step})")
	int insertSelling(SellingDTO sell);

	@Insert("insert into buying values (buying_seq.nextval,#{memberIdx},#{productIdx},#{addressIdx},#{price},#{pSize},#{startDate},#{endDate},#{countDate},#{step})")
	int insertBuying(BuyingDTO buy);
	
}
