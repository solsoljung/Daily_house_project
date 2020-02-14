package com.kh.dailyhouse.domain;

public class HostVo {
	private String user_email;
	private int room_num;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	
	@Override
	public String toString() {
		return "HostVo [user_email=" + user_email + ", room_num=" + room_num + "]";
	}
}
