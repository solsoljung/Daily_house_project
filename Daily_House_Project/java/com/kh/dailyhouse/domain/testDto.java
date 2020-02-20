package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class testDto {
	private int room_num;
	private String check_in;
	private String check_out;
	public testDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public testDto(int room_num, String check_in, String check_out) {
		super();
		this.room_num = room_num;
		this.check_in = check_in;
		this.check_out = check_out;
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
	@Override
	public String toString() {
		return "testDto [room_num=" + room_num + ", check_in=" + check_in + ", check_out=" + check_out + "]";
	}
	
	
}
