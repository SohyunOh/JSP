package com.testweb.user.model;

import java.sql.Timestamp;

public class UserVO {
	
	private String id;
	private String pw;
	private String name;
	private String ph1;
	private String ph2;
	private String ph3;
	private String email;
	private String email2;
	private String address;
	private String addressinfo;
	private Timestamp regdate;
	

	//생성자
	public UserVO() {
	
	}


	public UserVO(String id, String pw, String name, String ph1, String ph2, String ph3, String email, String email2,
			String address, String addressinfo, Timestamp regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.ph1 = ph1;
		this.ph2 = ph2;
		this.ph3 = ph3;
		this.email = email;
		this.email2 = email2;
		this.address = address;
		this.addressinfo = addressinfo;
		this.regdate = regdate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public String getPh1() {
		return ph1;
	}


	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}


	public String getPh2() {
		return ph2;
	}


	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}


	public String getPh3() {
		return ph3;
	}


	public void setPh3(String ph3) {
		this.ph3 = ph3;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getEmail2() {
		return email2;
	}


	public void setEmail2(String email2) {
		this.email2 = email2;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddressinfo() {
		return addressinfo;
	}


	public void setAddressinfo(String addressinfo) {
		this.addressinfo = addressinfo;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}