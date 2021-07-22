package com.project.model;

public class SellingDTO {
	
//	IDX        NOT NULL NUMBER        
//	MEMBERIDX           NUMBER        
//	PRODUCTIDX          NUMBER        
//	ADDRESS             VARCHAR2(500) 
//	PRICE               NUMBER        
//	PSIZE               VARCHAR2(200) 
//	SDATE               VARCHAR2(200) 
//	STEP                VARCHAR2(200) 
	
	private int idx, memberIdx, productIdx, price;
	private String address, pSize, sDate, step;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
}
