package com.pri.shop.model;

public class ProductoptVO {
	private String product_code;
	private String product_no;
	private String size;
	private String color;
	private int Inventory;
	
	public String getProduct_code() {return product_code;}
	public void setProduct_code(String product_code) {this.product_code = product_code;}

	public String getProduct_no() {return product_no;}
	public void setProduct_no(String product_no) {this.product_no = product_no;}

	public String getSize() {return size;}
	public void setSize(String size) {this.size = size;}
	
	public String getColor() {return color;}
	public void setColor(String color) {this.color = color;}
	
	public int getInventory() {return Inventory;}	
	public void setInventory(int inventory) {Inventory = inventory;}
	
}
