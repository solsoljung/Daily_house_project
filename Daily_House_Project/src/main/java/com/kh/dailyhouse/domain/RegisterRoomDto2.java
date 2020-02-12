package com.kh.dailyhouse.domain;

import java.util.Arrays;

public class RegisterRoomDto2 {

	private String[] room_options;

	public String[] getRoom_options() {
		return room_options;
	}
	public void setRoom_options(String[] room_options) {
		this.room_options = room_options;
	}
	
	@Override
	public String toString() {
		return "RegisterRoomDto2 [room_options=" + Arrays.toString(room_options) + "]";
	}
}
