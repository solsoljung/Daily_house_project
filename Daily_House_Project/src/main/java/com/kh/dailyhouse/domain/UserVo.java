package com.kh.dailyhouse.domain;

public class UserVo {
	
	private String user_email;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_point;
	private String user_pic;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_point() {
		return user_point;
	}
	public void setUser_point(String user_point) {
		this.user_point = user_point;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	@Override
	public String toString() {
		return "UserVo [user_email=" + user_email + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_phone=" + user_phone + ", user_point=" + user_point + ", user_pic=" + user_pic + "]";
	}
}
