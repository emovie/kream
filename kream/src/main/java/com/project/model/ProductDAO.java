package com.project.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ProductDAO {

	// 안희경
//	@Select("select * from product order by idx asc")
	@Select("select * from (select * from product order by idx asc) where rownum <= 40")
	List<ProductDTO> getList();

	@Select("select * from product where lower(productname) like '%'||lower(#{keyword})||'%' or lower(krname) like '%'||lower(#{keyword})||'%' or lower(model) like '%'||lower(#{keyword})||'%' or lower(category) like '%'||lower(#{keyword})||'%'")
	List<ProductDTO> search(String keyword);


	@Select("select * from (select * from product order by rdate desc) where rownum <= 12")
	List<ProductDTO> justDropped();

	@Select("select * from product order by rdate asc")
	List<ProductDTO> mostPopular();

	@Select("select * from productimg where productidx = #{idx}")
	List<ProductImgDTO> getImg(int idx);

	@Select("select * from product where idx = #{productIdx}")
	ProductDTO getProdDTO(int productIdx);
	
	@Select("select * from productwish where memberidx = #{loginIdx}")
	List<ProductWishDTO> getWishList(int loginIdx);

	// 안희경
	
	
	@Select("select * from product where idx=#{idx}")
	ProductDTO getProduct(int idx);
	
	@Select("select * from product where idx<>#{idx} AND brand=#{Brand} AND category=#{category} FETCH FIRST 5 ROWS ONLY")
	List<ProductDTO> getMoreProduct(ProductDTO dto);

	@Select("select MIN(price) from buying where productidx=#{idx} AND step='입찰'")
	Integer buyLowPrice(@Param("idx") int idx);
	
	@Select("select MIN(price) from buying where productidx=#{idx} AND psize=#{size} AND step='입찰'")
	Integer buyLowSizePrice(@Param("idx") int idx,@Param("size") String size);
	
	@Select("select MAX(price) from selling where productidx=#{idx} AND step='입찰'")
	Integer sellHighPrice(@Param("idx") int idx);
	
	@Select("select MAX(price) from selling where productidx=#{idx} AND psize=#{size} AND step='입찰'")
	Integer sellHighSizePrice(@Param("idx") int idx,@Param("size") String key);
	
	@Select("select price from buying where step='배송완료' and productidx=#{idx} order by endDate desc FETCH FIRST 1 ROWS ONLY")
	Integer latelyPrice(@Param("idx") int idx);
	
	@Select("select price from buying where step='배송완료' and productidx=#{idx} and psize=#{size} order by endDate desc FETCH FIRST 1 ROWS ONLY")
	Integer sizelatelyPrice(@Param("idx") int idx,@Param("size") String size);
	
	@Select("select psize from productwish where productidx=#{productIdx} and memberidx=#{memberIdx}")
	ArrayList<String> getSizeWishList(@Param("productIdx") int productIdx,@Param("memberIdx") int memberIdx);
	
	@Delete("delete from productwish where productidx=#{productIdx} and memberidx=#{memberIdx} and psize=#{size}")
	void deleteProductWish(@Param("productIdx") int productIdx,@Param("memberIdx") int memberIdx,@Param("size") String size);
	
	@Insert("insert into productwish values (productwish_seq.nextval,#{productIdx},#{memberIdx},#{size})")
	void insertProductWish(@Param("productIdx") int productIdx,@Param("memberIdx") int memberIdx,@Param("size") String size);

	@Select("select pSize, price, endDate from buying where productidx=#{productIdx} and step='배송완료' order by endDate desc FETCH FIRST 30 ROWS ONLY")
	ArrayList<BuySellDTO> getConclusionList(@Param("productIdx") int productIdx);
	
	@Select("select pSize, price, endDate from buying where productidx=#{productIdx} and step='배송완료' and psize=#{size} order by endDate desc FETCH FIRST 30 ROWS ONLY")
	ArrayList<BuySellDTO> getConclusionSizeList(@Param("productIdx") int productIdx,@Param("size") String size);

	@Select("select psize, price, count(*) as cnt from selling where productidx=#{idx} group by psize, price order by price")
	ArrayList<BuySellDTO> getSellList(@Param("idx") int idx);

	@Select("select psize, price, count(*) as cnt from buying where productidx=#{idx} group by psize, price order by price desc")
	ArrayList<BuySellDTO> getBuyList(@Param("idx") int idx);
	
	@Select("select psize, price, count(*) as cnt from selling where productidx=#{idx} and psize=#{size} group by psize, price order by price")
	ArrayList<BuySellDTO> getSizeSellList(@Param("idx") int idx,@Param("size") String size);
	
	@Select("select psize, price, count(*) as cnt from buying where productidx=#{idx} and psize=#{size} group by psize, price order by price desc")
	ArrayList<BuySellDTO> getSizeBuyList(@Param("idx") int idx,@Param("size") String size);
	
	@Select("select endDate from buying where productidx=${idx} and step='배송완료' order by endDate")
	ArrayList<String> getChartXData(@Param("idx") int idx);

	@Select("select price from buying where productidx=${idx} and step='배송완료' order by endDate")
	ArrayList<String> getChartYData(@Param("idx") int idx);

	@Select("select endDate from buying where productidx=${idx} and step='배송완료' and endDate>'${date}' group by endDate order by endDate")
	ArrayList<String> getChartSelectXData(@Param("idx") int idx,@Param("date") String date);
	
	@Select("select MAX(price) from buying where productidx=${idx} and step='배송완료' and endDate>'${date}' group by endDate order by endDate")
	ArrayList<String> getChartSelectYData(@Param("idx") int idx,@Param("date") String tab);

}
