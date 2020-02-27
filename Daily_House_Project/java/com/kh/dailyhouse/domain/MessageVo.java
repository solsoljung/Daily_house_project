package com.kh.dailyhouse.domain;

import java.sql.Timestamp;

public class MessageVo {

	private int message_num;
	private String receiver;
	private String sender;
	private String message_text;
	private Timestamp open_date;
	private Timestamp send_date;
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage_text() {
		return message_text;
	}
	public void setMessage_text(String message_text) {
		this.message_text = message_text;
	}
	public Timestamp getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Timestamp open_date) {
		this.open_date = open_date;
	}
	public Timestamp getSend_date() {
		return send_date;
	}
	public void setSend_date(Timestamp send_date) {
		this.send_date = send_date;
	}
	@Override
	public String toString() {
		return "MessageVo [message_num=" + message_num + ", receiver=" + receiver + ", sender=" + sender
				+ ", message_text=" + message_text + ", open_date=" + open_date + ", send_date=" + send_date + "]";
	}
	
}
