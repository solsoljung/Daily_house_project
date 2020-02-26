package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class BoardVo {
	private int board_num;
	private String user_email;
	private String board_title;
	private String board_content;
	private Timestamp board_reg_date;
	private int board_read_count;
	private int board_ref;
	private int board_re_step;
	private int board_re_level;
	private String board_notice;
	
	private String user_name; // join(tbl_user)

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Timestamp getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(Timestamp board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	public int getBoard_read_count() {
		return board_read_count;
	}

	public void setBoard_read_count(int board_read_count) {
		this.board_read_count = board_read_count;
	}

	public int getBoard_ref() {
		return board_ref;
	}

	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}

	public int getBoard_re_step() {
		return board_re_step;
	}

	public void setBoard_re_step(int board_re_step) {
		this.board_re_step = board_re_step;
	}

	public int getBoard_re_level() {
		return board_re_level;
	}

	public void setBoard_re_level(int board_re_level) {
		this.board_re_level = board_re_level;
	}

	public String getBoard_notice() {
		return board_notice;
	}

	public void setBoard_notice(String board_notice) {
		this.board_notice = board_notice;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "BoardVo [board_num=" + board_num + ", user_email=" + user_email + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_reg_date=" + board_reg_date + ", board_read_count="
				+ board_read_count + ", board_ref=" + board_ref + ", board_re_step=" + board_re_step
				+ ", board_re_level=" + board_re_level + ", board_notice=" + board_notice + ", user_name=" + user_name
				+ "]";
	}
}
