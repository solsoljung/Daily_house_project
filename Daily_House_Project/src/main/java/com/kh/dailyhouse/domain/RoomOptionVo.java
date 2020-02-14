package com.kh.dailyhouse.domain;

public class RoomOptionVo {
	
	private String room_option_code;
	private String room_option_explain;
	
	public String getRoom_option_code() {
		return room_option_code;
	}
	public void setRoom_option_code(String room_option_code) {
		this.room_option_code = room_option_code;
	}
	public String getRoom_option_explain() {
		return room_option_explain;
	}
	public void setRoom_option_explain(String room_option_explain) {
		this.room_option_explain = room_option_explain;
	}
	
	@Override
	public String toString() {
		return "RoomOptionVo [room_option_code=" + room_option_code + ", room_option_explain=" + room_option_explain
				+ "]";
	}
	
}
