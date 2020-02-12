package com.kh.dailyhouse.domain;

import java.util.Arrays;

public class RegisterRoomDto3 {

	private String room_title;
	private String room_explain;
	private int room_price;
	private String[] pics;
	
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
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String[] getPics() {
		return pics;
	}
	public void setPics(String[] pics) {
		this.pics = pics;
	}
	
	@Override
	public String toString() {
		return "RegisterRoomDto3 [room_title=" + room_title + ", room_explain=" + room_explain + ", room_price="
				+ room_price + ", pics=" + Arrays.toString(pics) + "]";
	}
}
