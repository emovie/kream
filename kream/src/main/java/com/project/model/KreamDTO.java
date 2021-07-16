package com.project.model;

public class KreamDTO {

//    idx             number                   
//    productname     varchar2(200),
//    krname          varchar2(200),
//    model           varchar2(200),
//    brand           varchar2(200),
//    color           varchar2(200),
//    rdate           varchar2(200) 
//    price           number,
//    category        varchar2(200)   
	
	private int idx;
	private String productname, krname, model, brand, color, rdate, category;
	private String img, price;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getKrname() {
		return krname;
	}
	public void setKrname(String krname) {
		this.krname = krname;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	
	
}
