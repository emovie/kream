package com.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ProductDAO {

	@Select("select * from product order by idx asc")
	List<ProductDTO> getList();

	@Select("select * from product where lower(productname) like '%'||lower(#{keyword})||'%' or lower(krname) like '%'||lower(#{keyword})||'%' or lower(model) like '%'||lower(#{keyword})||'%' or lower(category) like '%'||lower(#{keyword})||'%'")
	List<ProductDTO> search(String keyword);

	@Select("select * from product order by rdate desc")
	List<ProductDTO> justDropped();

	@Select("select * from product order by rdate asc")
	List<ProductDTO> mostPopular();

	@Select("select * from productimg where productidx = #{idx}")
	List<ProductImgDTO> getImg(int idx);

}
