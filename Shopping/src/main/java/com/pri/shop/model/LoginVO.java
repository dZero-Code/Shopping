package com.pri.shop.model;

public class LoginVO {
	private String userid;					// 아이디
	private String passwd;					// 비밀번호
	
	public String getUserid() {return userid;}
	public void setUserid(String userid) {this.userid = userid;}
	
	public void setPasswd(String passwd) {this.passwd = passwd;}
	public String getPasswd() {return passwd;}
	
}
