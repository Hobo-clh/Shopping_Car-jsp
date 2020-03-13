package com.clh.bean;


//描述汽车信息的类
public class Car implements java.io.Serializable {

	private Integer cno;
	private String cname;
	private String brands;
	private String items;
	private double price;
	private int inventory;
	private int sales;
	private String img;
	
	public Car() {}
	
	public Car(String cname, String brands, String items, 
			double price, int inventory, int sales,String img) {
		this.cname = cname;
		this.brands = brands;
		this.items = items;
		this.price = price;
		this.inventory = inventory;
		this.sales = sales;
		this.img = img;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getCno() {
		return cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getBrands() {
		return brands;
	}

	public void setBrands(String brands) {
		this.brands = brands;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}
}
