package com.project.model;

public class BuyingDTO {
	
//	IDX        NOT NULL NUMBER        
//	MEMBERIDX  NOT NULL NUMBER        
//	PRODUCTIDX NOT NULL NUMBER        
//	ADDRESS    NOT NULL VARCHAR2(500) 
//	PRICE      NOT NULL NUMBER        
//	PSIZE      NOT NULL VARCHAR2(200) 
//	BDATE      NOT NULL VARCHAR2(200) 
//	STEP       NOT NULL VARCHAR2(200)
	
	private int idx, memberIdx, productIdx, price;
	private String address, pSize, bDate, step;
	
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
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	
}
