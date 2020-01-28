package com.pri.shop.dto;

public class ProductInfoDto {
	private String product_no;			// 상품번호
	private String class1;				// 중분류
	private String class2;				// 소분류
	private String product_name;		// 상품명
	private int price;					// 상품가격
	private int views;					// 조회수
	private int cell_count;				// 판매갯수
	private int sales;					// 할인율
	private String main_photo;			// 메인사진
	private String reg;					// 등록일
	
	public String getProduct_no() {return product_no;}
	public void setProduct_no(String product_no) {this.product_no = product_no;}
	
	public String getClass1() {return class1;}
	public void setClass1(String class1) {this.class1 = class1;}
	
	public String getClass2() {return class2;}
	public void setClass2(String class2) {this.class2 = class2;}
	
	public String getProduct_name() {return product_name;}
	public void setProduct_name(String product_name) {this.product_name = product_name;}

	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	
	public int getViews() {return views;}
	public void setViews(int views) {this.views = views;}
	
	public int getCell_count() {return cell_count;}
	public void setCell_count(int cell_count) {this.cell_count = cell_count;}
	
	public int getSales() {return sales;}
	public void setSales(int sales) {this.sales = sales;}
	
	public String getMain_photo() {return main_photo;}
	public void setMain_photo(String main_photo) {this.main_photo = main_photo;}
	
	public String getReg() {return reg;}
	public void setReg(String reg) {this.reg = reg;}
	
}
