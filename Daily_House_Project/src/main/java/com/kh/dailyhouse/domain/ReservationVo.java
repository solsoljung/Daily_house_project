package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class ReservationVo {
	private int reserv_num;
	private int room_num;
	private String user_email;
	private Timestamp room_reserv_start_date;
	private Timestamp room_reserv_end_date;
	private int room_score;
	
	
	public int getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
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
	public int getRoom_score() {
		return room_score;
	}
	public void setRoom_score(int room_score) {
		this.room_score = room_score;
	}
	@Override
	public String toString() {
		return "ReservationVo [reserv_num=" + reserv_num + ", room_num=" + room_num + ", user_email=" + user_email
				+ ", room_reserv_start_date=" + room_reserv_start_date + ", room_reserv_end_date="
				+ room_reserv_end_date + ", room_score=" + room_score + "]";
	}
	
	
}
