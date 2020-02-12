package com.kh.dailyhouse.domain;

public class RoomDto {
	
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
	
	private String user_name;
	private String user_phone;
	private String user_pic;
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	
	public RoomDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RoomDto(int room_num, String room_type_num, String user_email, String room_location, int room_score,
			int room_price, String room_explain, int room_people, int room_bed, int room_bathroom, String room_title,
			String user_name, String user_phone, String user_pic) {
		super();
		this.room_num = room_num;
		this.room_type_num = room_type_num;
		this.user_email = user_email;
		this.room_location = room_location;
		this.room_score = room_score;
		this.room_price = room_price;
		this.room_explain = room_explain;
		this.room_people = room_people;
		this.room_bed = room_bed;
		this.room_bathroom = room_bathroom;
		this.room_title = room_title;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_pic = user_pic;
	}
	
	@Override
	public String toString() {
		return "RoomDto [room_num=" + room_num + ", room_type_num=" + room_type_num + ", user_email=" + user_email
				+ ", room_location=" + room_location + ", room_score=" + room_score + ", room_price=" + room_price
				+ ", room_explain=" + room_explain + ", room_people=" + room_people + ", room_bed=" + room_bed
				+ ", room_bathroom=" + room_bathroom + ", room_title=" + room_title + ", user_name=" + user_name
				+ ", user_phone=" + user_phone + ", user_pic=" + user_pic + "]";
	}
	
}
