package com.kh.dailyhouse.domain;


public class HomeReviewDto {
	
	private String user_name;
	private String user_pic;
	private int room_num;
	private String room_title;
	private String room_review_text;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
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
	public String getRoom_review_text() {
		return room_review_text;
	}
	public void setRoom_review_text(String room_review_text) {
		this.room_review_text = room_review_text;
	}
	@Override
	public String toString() {
		return "HomeReviewDto [user_name=" + user_name + ", user_pic=" + user_pic + ", room_num=" + room_num
				+ ", room_title=" + room_title + ", room_review_text=" + room_review_text + "]";
	}

}
