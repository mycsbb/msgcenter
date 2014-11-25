package com.csrc.msgcenter.model;

import java.sql.Timestamp;

public class Message {
	private Integer id;
	private Integer userId;
	private String receiver;
	private String content;
	private Timestamp timestamp;
	public Message() {
		super();
	}
	public Message(Integer id, Integer userId, String receiver, String content,
			Timestamp timestamp) {
		super();
		this.id = id;
		this.userId = userId;
		this.receiver = receiver;
		this.content = content;
		this.timestamp = timestamp;
	}
	public Message(Integer userId, String receiver, String content,
			Timestamp timestamp) {
		super();
		this.userId = userId;
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
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
		return "Message [id=" + id + ", userId=" + userId + ", receiver="
				+ receiver + ", content=" + content + ", timestamp="
				+ timestamp + "]";
	}
}
