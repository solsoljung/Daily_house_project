package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class RoomPictureVo {
	private String pic_uri;
	private int room_num;
	private Timestamp pic_reg_date;
	public RoomPictureVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomPictureVo(String pic_uri, int room_num, Timestamp pic_reg_date) {
		super();
		this.pic_uri = pic_uri;
		this.room_num = room_num;
		this.pic_reg_date = pic_reg_date;
	}
	public String getPic_uri() {
		return pic_uri;
	}
	public void setPic_uri(String pic_uri) {
		this.pic_uri = pic_uri;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public Timestamp getPic_reg_date() {
		return pic_reg_date;
	}
	public void setPic_reg_date(Timestamp pic_reg_date) {
		this.pic_reg_date = pic_reg_date;
	}
	@Override
	public String toString() {
		return "RoomPicture [pic_uri=" + pic_uri + ", room_num=" + room_num + ", pic_reg_date=" + pic_reg_date + "]";
	}
	
	
}
