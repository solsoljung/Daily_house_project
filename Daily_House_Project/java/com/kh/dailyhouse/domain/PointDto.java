package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class PointDto {
	private int point_num;
	private String user_email;
	private Timestamp point_date;
	private String point_code;
	private int reserv_num;
	private int point_score;
	private String point_code_explain;
	public PointDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PointDto(int point_num, String user_email, Timestamp point_date, String point_code, int reserv_num,
			int point_score, String point_code_explain) {
		super();
		this.point_num = point_num;
		this.user_email = user_email;
		this.point_date = point_date;
		this.point_code = point_code;
		this.reserv_num = reserv_num;
		this.point_score = point_score;
		this.point_code_explain = point_code_explain;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public String getPoint_code() {
		return point_code;
	}
	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}
	public int getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}
	public int getPoint_score() {
		return point_score;
	}
	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}
	public String getPoint_code_explain() {
		return point_code_explain;
	}
	public void setPoint_code_explain(String point_code_explain) {
		this.point_code_explain = point_code_explain;
	}
	@Override
	public String toString() {
		return "PointDto [point_num=" + point_num + ", user_email=" + user_email + ", point_date=" + point_date
				+ ", point_code=" + point_code + ", reserv_num=" + reserv_num + ", point_score=" + point_score
				+ ", point_code_explain=" + point_code_explain + "]";
	}
	
	
}
