package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class RoomReviewVo {
	
	private int room_review_num;
	private String user_email;
	private String user_pic;
	private int room_num;
	private int review_score_location;
	private int review_score_cleanliness;
	private int review_score_checkin;
	private int review_score_communication;
	private int total_score;
	private Timestamp room_review_write_date;
	private String room_review_text;
	
	public RoomReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoomReviewVo(int room_review_num, String user_email, String user_pic, int room_num,
			int review_score_location, int review_score_cleanliness, int review_score_checkin,
			int review_score_communication, int total_score, Timestamp room_review_write_date,
			String room_review_text) {
		super();
		this.room_review_num = room_review_num;
		this.user_email = user_email;
		this.user_pic = user_pic;
		this.room_num = room_num;
		this.review_score_location = review_score_location;
		this.review_score_cleanliness = review_score_cleanliness;
		this.review_score_checkin = review_score_checkin;
		this.review_score_communication = review_score_communication;
		this.total_score = total_score;
		this.room_review_write_date = room_review_write_date;
		this.room_review_text = room_review_text;
	}

	public int getRoom_review_num() {
		return room_review_num;
	}

	public void setRoom_review_num(int room_review_num) {
		this.room_review_num = room_review_num;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pic() {
		return user_pic;
	}

	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getReview_score_location() {
		return review_score_location;
	}

	public void setReview_score_location(int review_score_location) {
		this.review_score_location = review_score_location;
	}

	public int getReview_score_cleanliness() {
		return review_score_cleanliness;
	}

	public void setReview_score_cleanliness(int review_score_cleanliness) {
		this.review_score_cleanliness = review_score_cleanliness;
	}

	public int getReview_score_checkin() {
		return review_score_checkin;
	}

	public void setReview_score_checkin(int review_score_checkin) {
		this.review_score_checkin = review_score_checkin;
	}

	public int getReview_score_communication() {
		return review_score_communication;
	}

	public void setReview_score_communication(int review_score_communication) {
		this.review_score_communication = review_score_communication;
	}

	public int getTotal_score() {
		return total_score;
	}

	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}

	public Timestamp getRoom_review_write_date() {
		return room_review_write_date;
	}

	public void setRoom_review_write_date(Timestamp room_review_write_date) {
		this.room_review_write_date = room_review_write_date;
	}

	public String getRoom_review_text() {
		return room_review_text;
	}

	public void setRoom_review_text(String room_review_text) {
		this.room_review_text = room_review_text;
	}

	@Override
	public String toString() {
		return "RoomReviewVo [room_review_num=" + room_review_num + ", user_email=" + user_email + ", user_pic="
				+ user_pic + ", room_num=" + room_num + ", review_score_location=" + review_score_location
				+ ", review_score_cleanliness=" + review_score_cleanliness + ", review_score_checkin="
				+ review_score_checkin + ", review_score_communication=" + review_score_communication + ", total_score="
				+ total_score + ", room_review_write_date=" + room_review_write_date + ", room_review_text="
				+ room_review_text + "]";
	}
	
	
}
