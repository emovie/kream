package com.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface KreamDAO {

	
	@Select("select product.productname ,product.brand ,product.price ,productimg.img from product join productimg on product.idx = productimg.productidx")
	List<KreamDTO> selectList();

	
}
//select product.productname ,product.brand ,product.price ,productimg.img from product join productimg on product.idx = product.idx