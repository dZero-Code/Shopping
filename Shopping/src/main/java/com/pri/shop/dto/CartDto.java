package com.pri.shop.dto;

public class CartDto {
	private int cart_no;
	private String userid;
	private String product_code;
	private int quantity;
	
	public int getCart_no() {return cart_no;}
	public void setCart_no(int cart_no) {this.cart_no = cart_no;}
	
	public String getUserid() {return userid;}
	public void setUserid(String userid) {this.userid = userid;}
	
	public String getProduct_code() {return product_code;}
	public void setProduct_code(String product_code) {this.product_code = product_code;}
	
	public int getQuantity() {return quantity;}
	public void setQuantity(int quantity) {this.quantity = quantity;}
}
