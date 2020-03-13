package com.clh.bean;

public class Cart {
	private String username;
	private int cno;
	private int num;
	
	public String getUsername() {
		return username;
	}
	public Cart(String username, int num,int cno) {
		super();
		this.username = username;
		this.cno = cno; 
	}
	public Cart() {
		
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
}
