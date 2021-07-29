package com.project.model;

import java.util.List;

public class BuySellDTO {
	
//	IDX        NOT NULL NUMBER        
//	MEMBERIDX  NOT NULL NUMBER        
//	PRODUCTIDX NOT NULL NUMBER        
//	ADDRESS    NOT NULL NUMBER        
//	PRICE      NOT NULL NUMBER        
//	PSIZE      NOT NULL VARCHAR2(200) 
//	STARTDATE  NOT NULL VARCHAR2(200) 
//	ENDDATE             VARCHAR2(200) 
//	COUNTDATE           VARCHAR2(200) 
//	STEP                VARCHAR2(200) 
//	cnt			: 수량 출력을 위해 추가
// 내역출력용 : imgList, productDTO, bidCount, proceedCount, endCount
	
	private int idx, memberIdx, productIdx, address, price, cnt, bidCount, proceedCount, endCount;
	private String pSize, startDate, endDate, countDate, step;
	private List<ProductImgDTO> imgList;
	private ProductDTO productDTO;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
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
	public int getAddress() {
		return address;
	}
	public void setAddress(int address) {
		this.address = address;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
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
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public List<ProductImgDTO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ProductImgDTO> imgList) {
		this.imgList = imgList;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public int getBidCount() {
		return bidCount;
	}
	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}
	public int getProceedCount() {
		return proceedCount;
	}
	public void setProceedCount(int proceedCount) {
		this.proceedCount = proceedCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	
}
