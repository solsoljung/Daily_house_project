package com.kh.dailyhouse.domain;

public class LikeDto {
	private int like_num;
	private int room_num;
	private String user_email;
	private String room_title;
	private int room_price;
	private String pic_uri;
	
	
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
	public String getPic_uri() {
		return pic_uri;
	}
	public void setPic_uri(String pic_uri) {
		this.pic_uri = pic_uri;
	}
	@Override
	public String toString() {
		return "LikeDto [like_num=" + like_num + ", room_num=" + room_num + ", user_email=" + user_email
				+ ", room_title=" + room_title + ", room_price=" + room_price + ", pic_uri=" + pic_uri + "]";
	}
	
	
}
