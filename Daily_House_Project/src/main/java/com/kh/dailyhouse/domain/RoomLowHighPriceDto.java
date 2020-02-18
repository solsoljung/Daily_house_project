package com.kh.dailyhouse.domain;

public class RoomLowHighPriceDto {
	
	private static int high_price;
	private int low_price;
	public int getHigh_price() {
		return high_price;
	}
	public void setHigh_price(int high_price) {
		this.high_price = high_price;
	}
	public int getLow_price() {
		return low_price;
	}
	public void setLow_price(int low_price) {
		this.low_price = low_price;
	}
	@Override
	public String toString() {
		return "RoomLowHighPriceDto [high_price=" + high_price + ", low_price=" + low_price + "]";
	}
	

}
