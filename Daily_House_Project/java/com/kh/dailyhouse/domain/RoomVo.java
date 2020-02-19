package com.kh.dailyhouse.domain;

import java.util.Arrays;

public class RoomVo { 
	private int room_num;
	private String room_type_num;
	private String user_email;
	private String room_location;
	private String room_location_detail;
	private int room_score;
	private int room_price;
	private String room_explain;
	private int room_people;
	private int room_bed;
	private int room_bathroom;
	private String room_title;
	private String room_option_code;
	private String[] pics; 
	private String room_status; 
	
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
	public String getRoom_location_detail() {
		return room_location_detail;
	}
	public void setRoom_location_detail(String room_location_detail) {
		this.room_location_detail = room_location_detail;
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
	public String getRoom_option_code() {
		return room_option_code;
	}
	public void setRoom_option_code(String room_option_code) {
		this.room_option_code = room_option_code;
	}
	public String[] getPics() {
		return pics;
	}
	public void setPics(String[] pics) {
		this.pics = pics;
	}
	public String getRoom_status() {
		return room_status;
	}
	public void setRoom_status(String room_status) {
		this.room_status = room_status;
	}
	
	@Override
	public String toString() {
		return "RoomVo [room_num=" + room_num + ", room_type_num=" + room_type_num + ", user_email=" + user_email
				+ ", room_location=" + room_location + ", room_location_detail=" + room_location_detail
				+ ", room_score=" + room_score + ", room_price=" + room_price + ", room_explain=" + room_explain
				+ ", room_people=" + room_people + ", room_bed=" + room_bed + ", room_bathroom=" + room_bathroom
				+ ", room_title=" + room_title + ", room_option_code=" + room_option_code + ", pics="
				+ Arrays.toString(pics) + ", room_status=" + room_status + "]";
	}
}
