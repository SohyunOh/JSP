package com.bean;

public class User {
	/*
	 * 자바빈은 form과 DB통신과정에서 변수처리를 쉽게하기 위해서 사용한다
	 * DB와 동일한 이름으로 관련변수를 생성하고, getter, setter를 반드시 생성함
	 * 
	 * 이렇게 만들어 놓은것을 bean이라고 한다.
	 */
	private String id;
	private String pw;
	private String name;
	private String email;
	
	
	//생성자 - 빈클래스는 기본생성자, 모든 변수를 초기화하는 생성자를 만들어준다
	public User() {}


	public User(String id, String pw, String name, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + "]";
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
	
	
	
}


















































