package com.kh.dailyhouse.domain;


public class HomeHomesDto {
	
	private String pic_uri;
	private int room_price;
	private String room_title;
	private String room_explain;
	private int room_num;
	
	public String getPic_uri() {
		return pic_uri;
	}
	public void setPic_uri(String pic_uri) {
		this.pic_uri = pic_uri;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getRoom_explain() {
		return room_explain;
	}
	public void setRoom_explain(String room_explain) {
		this.room_explain = room_explain;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	@Override
	public String toString() {
		return "HomeHomesDto [pic_uri=" + pic_uri + ", room_price=" + room_price + ", room_title=" + room_title
				+ ", room_explain=" + room_explain + ", room_num=" + room_num + "]";
	}
}
