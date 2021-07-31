package com.project.model;

public class BuyingDTO {
	
	private int idx, memberIdx, productIdx, price, addressIdx;
	private String pSize, startDate, endDate, countDate, step;
	
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
	public int getAddressIdx() {
		return addressIdx;
	}
	public void setAddressIdx(int addressIdx) {
		this.addressIdx = addressIdx;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCountDate() {
		return countDate;
	}
	public void setCountDate(String countDate) {
		this.countDate = countDate;
	}
	
}
