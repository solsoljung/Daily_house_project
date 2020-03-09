package com.kh.dailyhouse.domain;

public class AdminReservResultDto {
	private int reserv_num;
	private int reserv_price;
	private int reserv_mile;
	private String user_email;
	private int room_num;
	
	public AdminReservResultDto() {
		super();
		
	}
	
	public AdminReservResultDto(int reserv_num, int reserv_price, int reserv_mile, String user_email, int room_num) {
		super();
		this.reserv_num = reserv_num;
		this.reserv_price = reserv_price;
		this.reserv_mile = reserv_mile;
		this.user_email = user_email;
		this.room_num = room_num;
	}
	
	public int getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}
	public int getReserv_price() {
		return reserv_price;
	}
	public void setReserv_price(int reserv_price) {
		this.reserv_price = reserv_price;
	}
	public int getReserv_mile() {
		return reserv_mile;
	}
	public void setReserv_mile(int reserv_mile) {
		this.reserv_mile = reserv_mile;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	
	@Override
	public String toString() {
		return "AdminReservResultDto [reserv_num=" + reserv_num + ", reserv_price=" + reserv_price + ", reserv_mile="
				+ reserv_mile + ", user_email=" + user_email + ", room_num=" + room_num + "]";
	}
	
	
}
