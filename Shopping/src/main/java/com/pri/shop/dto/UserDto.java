package com.pri.shop.dto;

/*
	 회원가입 DTO
*/

public class UserDto {
	private String userid;					// 아이디
	private String passwd;					// 비밀번호
	private String name;					// 이름
	private String birth;					// 생일
	private String email;					// 이메일
	private String phone;					// 핸드폰 번호
	private String rank;					// 유저의 등급
	private boolean state_provided;			// 개인정보 제 3자 제공 동의 여부
	private boolean state_consignment;		// 개인정보 처리 위탁 동의여부
	private boolean state_email;			// 마켓팅 수신동의 (이메일)
	private boolean state_sms;				// 마켓팅 수신동의 (SMS)
	
	public String getUserid() {return userid;}
	public void setUserid(String userid) {this.userid = userid;}
	
	public String getPasswd() {return passwd;}
	public void setPasswd(String passwd) {this.passwd = passwd;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public String getBirth() {return birth;}
	public void setBirth(String birth) {this.birth = birth;}
	
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}

	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	
	public String getRank() {return rank;}
	public void setRank(String rank) {this.rank = rank;}
	
	public boolean isState_provided() {return state_provided;}
	public void setState_provided(boolean state_provided) {this.state_provided = state_provided;}
	
	public boolean isState_consignment() {return state_consignment;}
	public void setState_consignment(boolean state_consignment) {this.state_consignment = state_consignment;}
	
	public boolean isState_email() {return state_email;}
	public void setState_email(boolean state_email) {this.state_email = state_email;}
	
	public boolean isState_sms() {return state_sms;}
	public void setState_sms(boolean state_sms) {this.state_sms = state_sms;}
}
