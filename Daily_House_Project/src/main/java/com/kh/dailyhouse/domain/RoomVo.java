package com.kh.dailyhouse.domain;

import java.util.Arrays;

public class RoomVo {

	private int room_num;
	private String room_type_num;
	private String user_email;
	private String room_location;
	private int room_score;
	private int room_price;
	private String room_explain;
	private int room_people;
	private int room_bed;
	private int room_bathroom;
	private String room_title;
	
	/*
	  room등록할 때 사진도 등록해야함
	  우리 Sample01에 할 때도 tbl_board에 pic행은 없지만 
	  board 한 개(bno)를 조회할 때 그 bno의 사진파일도 같이 조회되게 하려고 
	  BoardVo에 private String[] files를 적어줬잖아 
	  그니깐 우리도 RoomVo에 private String[] pics 이거 추가하면 안되나요?,,,,,,
	 */
	
	private String[] pics; // <- 추가
	
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getRoom_type_num() {
		return room_type_num;
	}
	public void setRoom_type_num(String room_type_num) {
		this.room_type_num = room_type_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getRoom_location() {
		return room_location;
	}
	public void setRoom_location(String room_location) {
		this.room_location = room_location;
	}
	public int getRoom_score() {
		return room_score;
	}
	public void setRoom_score(int room_score) {
		this.room_score = room_score;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public String getRoom_explain() {
		return room_explain;
	}
	public void setRoom_explain(String room_explain) {
		this.room_explain = room_explain;
	}
	public int getRoom_people() {
		return room_people;
	}
	public void setRoom_people(int room_people) {
		this.room_people = room_people;
	}
	public int getRoom_bed() {
		return room_bed;
	}
	public void setRoom_bed(int room_bed) {
		this.room_bed = room_bed;
	}
	public int getRoom_bathroom() {
		return room_bathroom;
	}
	public void setRoom_bathroom(int room_bathroom) {
		this.room_bathroom = room_bathroom;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String[] getPics() {
		return pics;
	}
	public void setPics(String[] pics) {
		this.pics = pics;
	}
	@Override
	public String toString() {
		return "RoomVo [room_num=" + room_num + ", room_type_num=" + room_type_num + ", user_email=" + user_email
				+ ", room_location=" + room_location + ", room_score=" + room_score + ", room_price=" + room_price
				+ ", room_explain=" + room_explain + ", room_people=" + room_people + ", room_bed=" + room_bed
				+ ", room_bathroom=" + room_bathroom + ", room_title=" + room_title + ", pics=" + Arrays.toString(pics)
				+ "]";
	}

}
