package com.kh.dailyhouse.domain;

public class RoomLowHighPriceDto {
	
	private int max_high_price;
	private int min_low_price;
	public int getMax_high_price() {
		return max_high_price;
	}
	public void setMax_high_price(int max_high_price) {
		this.max_high_price = max_high_price;
	}
	public int getMin_low_price() {
		return min_low_price;
	}
	public void setMin_low_price(int min_low_price) {
		this.min_low_price = min_low_price;
	}
	@Override
	public String toString() {
		return "RoomLowHighPriceDto [max_high_price=" + max_high_price + ", min_low_price=" + min_low_price + "]";
	}

}
