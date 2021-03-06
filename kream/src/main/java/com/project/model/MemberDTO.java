package com.project.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	
//	  idx         number      PRIMARY KEY,
//    email       varchar2(200),
//    pw          varchar2(200),
//    name        varchar2(200),
//    PHONENUMBER varchar2(200),
//    consent     CHAR(1),
//    accountname varchar2(200),
//    accountbank varchar2(200),
//    accountnumber varchar2(200),
//    profileimage varchar2(255)
	
	private int idx;
	private String email, pw, name, phonenumber,accountName, accountBank, accountNumber, profileimage;
	private char consent;
	private MultipartFile profileFile;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAccountname() {
		return accountName;
	}
	public void setAccountname(String accountname) {
		this.accountName = accountname;
	}
	public String getAccountbank() {
		return accountBank;
	}
	public void setAccountbank(String accountbank) {
		this.accountBank = accountbank;
	}
	public String getAccountnumber() {
		return accountNumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountNumber = accountnumber;
	}
	
	public char getConsent() {
		return consent;
	}
	public void setConsent(char consent) {
		this.consent = consent;
	}
	public String getProfileimage() {
		return profileimage;
	}
	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}
	public MultipartFile getProfileFile() {
		return profileFile;
	}
	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}
	
}
