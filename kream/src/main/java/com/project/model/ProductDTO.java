package com.project.model;

import java.util.List;

public class ProductDTO {
//	IDX         NOT NULL NUMBER         
//	PRODUCTNAME NOT NULL VARCHAR2(3000) 
//	KRNAME      NOT NULL VARCHAR2(3000) 
//	MODEL       NOT NULL VARCHAR2(500)  
//	BRAND       NOT NULL VARCHAR2(500)  
//	COLOR       NOT NULL VARCHAR2(500)  
//	RDATE       NOT NULL VARCHAR2(200)  
//	PRICE       NOT NULL VARCHAR2(500)  
//	CATEGORY    NOT NULL VARCHAR2(1000) 
//  ImgList 
	
	private int idx;
	private String productName, krName, Model, Brand, color, rdate, category, price;
	private List<ProductImgDTO> imgList;

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getKrName() {
		return krName;
	}
	public void setKrName(String krName) {
		this.krName = krName;
	}
	public String getModel() {
		return Model;
	}
	public void setModel(String model) {
		Model = model;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<ProductImgDTO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ProductImgDTO> imgList) {
		this.imgList = imgList;
	}
	
}
