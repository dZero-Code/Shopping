package com.pri.shop.model;
/*
	User_info
*/
public class UserVO {
	private String userid;					// 아이디
	private String passwd;					// 비밀번호
	private String name;					// 이름
	private String birth;					// 생일
	private String email;					// 이메일
	private String phone;					// 핸드폰 번호
	private String permission;				// 유저의 권한 (admin, manager, customer)
	private boolean state_provided;			// 개인정보 제 3자 제공 동의 여부
	private boolean state_consignment;		// 개인정보 처리 위탁 동의여부
	private boolean state_email;			// 마켓팅 수신동의 (이메일)
	private boolean state_sms;				// 마켓팅 수신동의 (SMS)
	
	public String getUserid() {return userid;}
	public String getPasswd() {	return passwd;}
	public String getName() {return name;}
	public String getBirth() {return birth;}
	public String getEmail() {return email;}
	public String getPhone() {return phone;}
	public String getPermission() {return permission;}
	public boolean isState_provided() {return state_provided;}
	public boolean isState_consignment() {return state_consignment;}
	public boolean isState_email() {return state_email;}
	public boolean isState_sms() {return state_sms;}
}
