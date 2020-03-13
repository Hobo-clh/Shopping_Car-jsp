package com.clh.bean;

public class User {
	private Integer userno;
	private String username;
	private String password;
	
	public User() {
	}

	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	public Integer getUserno() {
		return userno;
	}

	public void setUserno(Integer userno) {
		this.userno = userno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
