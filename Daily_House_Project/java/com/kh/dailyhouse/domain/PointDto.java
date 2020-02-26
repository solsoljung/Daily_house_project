package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class PointDto {
	private int point_num;
	private Timestamp point_date;
	private int point_score;
	
	private String point_code_explain;
	private String point_code;
	
	private int room_num;
	private String room_type_num;
	private String user_email;
	private String room_location;
	private String room_location_detail;
	private int room_score;
	private int room_price;
	private int room_people;
	private int room_bed;
	private int room_bathroom;
	private String room_title;
	
	public PointDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointDto(int point_num, Timestamp point_date, int point_score, String point_code_explain, String point_code,
			int room_num, String room_type_num, String user_email, String room_location, String room_location_detail,
			int room_score, int room_price, int room_people, int room_bed, int room_bathroom, String room_title) {
		super();
		this.point_num = point_num;
		this.point_date = point_date;
		this.point_score = point_score;
		this.point_code_explain = point_code_explain;
		this.point_code = point_code;
		this.room_num = room_num;
		this.room_type_num = room_type_num;
		this.user_email = user_email;
		this.room_location = room_location;
		this.room_location_detail = room_location_detail;
		this.room_score = room_score;
		this.room_price = room_price;
		this.room_people = room_people;
		this.room_bed = room_bed;
		this.room_bathroom = room_bathroom;
		this.room_title = room_title;
	}

	public int getPoint_num() {
		return point_num;
	}

	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}

	public Timestamp getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}

	public int getPoint_score() {
		return point_score;
	}

	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}

	public String getPoint_code_explain() {
		return point_code_explain;
	}

	public void setPoint_code_explain(String point_code_explain) {
		this.point_code_explain = point_code_explain;
	}

	public String getPoint_code() {
		return point_code;
	}

	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}

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

	@Override
	public String toString() {
		return "PointDto [point_num=" + point_num + ", point_date=" + point_date + ", point_score=" + point_score
				+ ", point_code_explain=" + point_code_explain + ", point_code=" + point_code + ", room_num=" + room_num
				+ ", room_type_num=" + room_type_num + ", user_email=" + user_email + ", room_location=" + room_location
				+ ", room_location_detail=" + room_location_detail + ", room_score=" + room_score + ", room_price="
				+ room_price + ", room_people=" + room_people + ", room_bed=" + room_bed + ", room_bathroom="
				+ room_bathroom + ", room_title=" + room_title + "]";
	}
	
	
	
}
