package com.kh.dailyhouse.domain;

public class RoomTypeVo {
	private String room_type_num;
	private String room_type_explain;
	
	public String getRoom_type_num() {
		return room_type_num;
	}
	public void setRoom_type_num(String room_type_num) {
		this.room_type_num = room_type_num;
	}
	public String getRoom_type_explain() {
		return room_type_explain;
	}
	public void setRoom_type_explain(String room_type_explain) {
		this.room_type_explain = room_type_explain;
	}
	
	@Override
	public String toString() {
		return "RoomTypeVo [room_type_num=" + room_type_num + ", room_type_explain=" + room_type_explain + "]";
	}
}

