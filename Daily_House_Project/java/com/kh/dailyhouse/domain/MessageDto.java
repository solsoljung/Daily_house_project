package com.kh.dailyhouse.domain;

public class MessageDto {
	private String receiver;
	private String sender;
	private String message_text;
	
	private int room_num;

	public MessageDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageDto(String receiver, String sender, String message_text, int room_num) {
		super();
		this.receiver = receiver;
		this.sender = sender;
		this.message_text = message_text;
		this.room_num = room_num;
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

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	@Override
	public String toString() {
		return "MessageDto [receiver=" + receiver + ", sender=" + sender + ", message_text=" + message_text
				+ ", room_num=" + room_num + "]";
	}

}
