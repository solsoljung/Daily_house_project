package com.kh.dailyhouse.domain;

public class LikeDto {
	private int like_num;
	private int room_num;
	private String room_title;
	private int room_price;
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
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	
	@Override
	public String toString() {
		return "LikeDto [like_num=" + like_num + ", room_num=" + room_num + ", room_title=" + room_title
				+ ", room_price=" + room_price + ", user_email=" + user_email + "]";
	}
}
