package com.kh.dailyhouse.domain;

public class CertificationDto {
	private String user_input;
	private String dice;
	
	public String getUser_input() {
		return user_input;
	}
	public void setUser_input(String user_input) {
		this.user_input = user_input;
	}
	public String getDice() {
		return dice;
	}
	public void setDice(String dice) {
		this.dice = dice;
	}
	
	@Override
	public String toString() {
		return "Certification [user_input=" + user_input + ", dice=" + dice + "]";
	}
}
