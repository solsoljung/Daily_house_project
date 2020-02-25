package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class PointVo {
	private int point_num;
	private String user_email;
	private Timestamp point_date;
	private String point_code;
	private int point_score;
	private int room_num;
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public String getPoint_code() {
		return point_code;
	}
	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}
	public int getPoint_score() {
		return point_score;
	}
	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	
	@Override
	public String toString() {
		return "PointVo [point_num=" + point_num + ", user_email=" + user_email + ", point_date=" + point_date
				+ ", point_code=" + point_code + ", point_score=" + point_score + ", room_num=" + room_num + "]";
	}
	
}
