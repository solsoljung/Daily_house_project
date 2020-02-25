package com.kh.dailyhouse.domain;

public class UserPointDto {
	private int user_point;
	private String user_email;
	
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	@Override
	public String toString() {
		return "UserPointDto [user_point=" + user_point + ", user_email=" + user_email + "]";
	}
	
}
