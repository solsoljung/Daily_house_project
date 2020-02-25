package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class TestDto {
	private int room_num;
	private String check_in;
	private String check_out;
	private Timestamp room_reserv_start_date = null;
	private Timestamp room_reserv_end_date = null;
	private int room_price;
	private int room_people;
	private String room_title;
	private String user_email;
	private String room_location;
	private int v;
	private int room_price_v;
	private String reserv_state = "Y";

	public TestDto() {
		super();
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
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

	public String getRoom_title() {
		return room_title;
	}

	public void setRoom_title(String room_title) {
		this.room_title = room_title;
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

	public int getV() {
		return v;
	}

	public void setV(int v) {
		this.v = v;
	}

	public int getRoom_price_v() {
		return room_price_v;
	}

	public void setRoom_price_v(int room_price_v) {
		this.room_price_v = room_price_v;
	}

	public Timestamp getRoom_reserv_start_date() {
		return room_reserv_start_date;
	}

	public void setRoom_reserv_start_date(Timestamp room_reserv_start_date) {
		this.room_reserv_start_date = room_reserv_start_date;
	}

	public Timestamp getRoom_reserv_end_date() {
		return room_reserv_end_date;
	}

	public void setRoom_reserv_end_date(Timestamp room_reserv_end_date) {
		this.room_reserv_end_date = room_reserv_end_date;
	}

	public String getReserv_state() {
		return reserv_state;
	}

	public void setReserv_state(String reserv_state) {
		this.reserv_state = reserv_state;
	}

	@Override
	public String toString() {
		return "TestDto [room_num=" + room_num + ", check_in=" + check_in + ", check_out=" + check_out
				+ ", room_reserv_start_date=" + room_reserv_start_date + ", room_reserv_end_date="
				+ room_reserv_end_date + ", room_price=" + room_price + ", room_people=" + room_people + ", room_title="
				+ room_title + ", user_email=" + user_email + ", room_location=" + room_location + ", v=" + v
				+ ", room_price_v=" + room_price_v + ", reserv_state=" + reserv_state + "]";
	}

}
