package com.project.model;

public class AddressDTO {

//	IDX         NOT NULL NUMBER        
//	MEMBERIDX   NOT NULL NUMBER        
//	NAME        NOT NULL VARCHAR2(200) 
//	PHONENUMBER NOT NULL VARCHAR2(200) 
//	POSTCODE    NOT NULL VARCHAR2(20)  
//	ADDRESS     NOT NULL VARCHAR2(500) 
//	DETAIL               VARCHAR2(200) 
//	BASICCK              CHAR(1)    
	
	private int idx, memberIdx;
	private String name, phoneNumber, postcode, address, detail, basicck;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberidx) {
		this.memberIdx = memberidx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getBasicck() {
		return basicck;
	}
	public void setBasicck(String basicck) {
		this.basicck = basicck;
	}
	
	
}
