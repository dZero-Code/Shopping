package com.pri.shop.model;

public class CartVO {
	private int cart_no;
	private String userid;
	private String product_code;
	private String product_name;
	private String class1;
	private int quantity;
	private String size;
	private String color;
	private String photo;
	
	public int getCart_no() {return cart_no;}
	public void setCart_no(int cart_no) {this.cart_no = cart_no;}
	
	public String getUserid() {return userid;}
	public void setUserid(String userid) {this.userid = userid;}
	
	public String getProduct_code() {return product_code;}
	public void setProduct_code(String product_code) {this.product_code = product_code;}
	
	public String getProduct_name() {return product_name;}
	public void setProduct_name(String product_name) {this.product_name = product_name;}
	
	public String getClass1() {return class1;}
	public void setClass1(String class1) {this.class1 = class1;}
	
	public int getQuantity() {return quantity;}
	public void setQuantity(int quantity) {this.quantity = quantity;}
	
	public String getSize() {return size;}
	public void setSize(String size) {this.size = size;}
	
	public String getColor() {return color;}
	public void setColor(String color) {this.color = color;}
	
	public String getPhoto() {return photo;}
	public void setPhoto(String photo) {this.photo = photo;}
	
}
