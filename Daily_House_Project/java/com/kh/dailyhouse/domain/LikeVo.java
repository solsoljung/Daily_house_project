package com.kh.dailyhouse.domain;

public class LikeVo {
	private int like_num;
	private int room_num;
	private String user_email;
	
	
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	
	@Override
	public String toString() {
		return "LikeVo [like_num=" + like_num + ", room_num=" + room_num + ", user_email=" + user_email + "]";
	}
}
