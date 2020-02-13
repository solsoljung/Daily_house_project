package com.kh.dailyhouse.domain;

public class RoomOptionVo {
	private int room_num;
	private String option_aircon;
	private String option_wifi;
	private String option_tv;
	private String option_breakfast;
	private String option_parking;
	private String option_smoking;
	private String option_pet;
	private String option_closet;
	private String option_hair_dry;
	
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getOption_aircon() {
		return option_aircon;
	}
	public void setOption_aircon(String option_aircon) {
		this.option_aircon = option_aircon;
	}
	public String getOption_wifi() {
		return option_wifi;
	}
	public void setOption_wifi(String option_wifi) {
		this.option_wifi = option_wifi;
	}
	public String getOption_tv() {
		return option_tv;
	}
	public void setOption_tv(String option_tv) {
		this.option_tv = option_tv;
	}
	public String getOption_breakfast() {
		return option_breakfast;
	}
	public void setOption_breakfast(String option_breakfast) {
		this.option_breakfast = option_breakfast;
	}
	public String getOption_parking() {
		return option_parking;
	}
	public void setOption_parking(String option_parking) {
		this.option_parking = option_parking;
	}
	public String getOption_smoking() {
		return option_smoking;
	}
	public void setOption_smoking(String option_smoking) {
		this.option_smoking = option_smoking;
	}
	public String getOption_pet() {
		return option_pet;
	}
	public void setOption_pet(String option_pet) {
		this.option_pet = option_pet;
	}
	public String getOption_closet() {
		return option_closet;
	}
	public void setOption_closet(String option_closet) {
		this.option_closet = option_closet;
	}
	public String getOption_hair_dry() {
		return option_hair_dry;
	}
	public void setOption_hair_dry(String option_hair_dry) {
		this.option_hair_dry = option_hair_dry;
	}
	
	@Override
	public String toString() {
		return "RoomOptionVo [room_num=" + room_num + ", option_aircon=" + option_aircon + ", option_wifi="
				+ option_wifi + ", option_tv=" + option_tv + ", option_breakfast=" + option_breakfast
				+ ", option_parking=" + option_parking + ", option_smoking=" + option_smoking + ", option_pet="
				+ option_pet + ", option_closet=" + option_closet + ", option_hair_dry=" + option_hair_dry + "]";
	}
}
