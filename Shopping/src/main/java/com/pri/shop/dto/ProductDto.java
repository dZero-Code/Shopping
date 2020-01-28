package com.pri.shop.dto;

public class ProductDto {	
	private String product_code;		// 상품코드
	private String product_no;			// 상품코드
	private String size;				// 사이즈
	private String color;				// 색상
	private int inventory;				// 재고량
	
	public String getProduct_code() {return product_code;}
	public void setProduct_code(String product_code) {this.product_code = product_code;}
	
	public String getProduct_no() {return product_no;}
	public void setProduct_no(String product_no) {this.product_no = product_no;}
	
	public String getSize() {return size;}
	public void setSize(String size) {this.size = size;}
	
	public String getColor() {return color;}
	public void setColor(String color) {this.color = color;}
	
	public int getInventory() {return inventory;}
	public void setInventory(int inventory) {this.inventory = inventory;}
	
}
