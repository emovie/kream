package com.project.model;

import java.util.List;

public class ProductWishDTO {

//	IDX        NOT NULL NUMBER        
//	PRODUCTIDX NOT NULL NUMBER        
//	MEMBERIDX  NOT NULL NUMBER        
//	PSIZE      NOT NULL VARCHAR2(200) 
	
	private int idx, productIdx, memberIdx;
	private String psize;
	private List<ProductImgDTO> imgList;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public List<ProductImgDTO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ProductImgDTO> imgList) {
		this.imgList = imgList;
	}
	
	
}
