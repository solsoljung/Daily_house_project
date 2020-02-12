package com.kh.dailyhouse.domain;

public class RegisterRoomDto1 {

	private String user_email; //임시 사용자 등록하기
	private String room_type_num;
	private int room_people;
	private int room_bed;
	private int room_bathroom;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getRoom_type_num() {
		return room_type_num;
	}
	public void setRoom_type_num(String room_type_num) {
		this.room_type_num = room_type_num;
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
	
	@Override
	public String toString() {
		return "RegisterRoomDto1 [user_email=" + user_email + ", room_type_num=" + room_type_num + ", room_people="
				+ room_people + ", room_bed=" + room_bed + ", room_bathroom=" + room_bathroom + "]";
	}

}
