package com.pri.shop.dto;

public class OrderDto {
	private int order_no;
	private String order_user;
	private String order_product;
	private int count;
	private int order_status;
	
	public int getOrder_no() {return order_no;}
	public void setOrder_no(int order_no) {this.order_no = order_no;}
	
	public String getOrder_user() {return order_user;}
	public void setOrder_user(String order_user) {this.order_user = order_user;}
	
	public String getOrder_product() {return order_product;}
	public void setOrder_product(String order_product) {this.order_product = order_product;}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	
	public int getOrder_status() {return order_status;}
	public void setOrder_status(int order_status) {this.order_status = order_status;}
}
