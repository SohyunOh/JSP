package com.session;

public class User {
	
	//은닉된 클래스로 생성
	private String id;
	private String pw;
	private String name;
	private String birth;
	
	//생성자
	public User() {
		// TODO Auto-generated constructor stub
	}


	public User(String id, String pw, String name, String birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
	}

	//게터,셋터
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


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	
	
	
}
