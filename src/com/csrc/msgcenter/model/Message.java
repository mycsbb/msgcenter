package com.csrc.msgcenter.model;

import java.sql.Timestamp;

public class Message {
	private Integer id;
	private String sender;
	private String receiver;
	private String content;
	private Timestamp timestamp;
	
	public Message() {
		super();
	}
	
	public Message(Integer id, String sender, String receiver, String content,
			Timestamp timestamp) {
		super();
		this.id = id;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.timestamp = timestamp;
	}

	public Message(String sender, String receiver, String content,
			Timestamp timestamp) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.timestamp = timestamp;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	
	@Override
	public String toString() {
		return "msg [sender=" + sender + ", receiver=[" + receiver + "], content=[" + content +
				"], timestamp=" + timestamp + "]";
	}
}
