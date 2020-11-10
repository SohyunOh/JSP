package com.testweb.user.model;

import java.sql.Timestamp;

public class UserVO {
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String addressinfo;
	private Timestamp regdate;
	

	//생성자
	public UserVO() {
	
	}
	


	public UserVO(String id, String pw, String name, String phone, String email, String address, String addressinfo,
			Timestamp regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
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



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
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



	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", addressinfo=" + addressinfo + ", regdate=" + regdate + "]";
	}

	

}
