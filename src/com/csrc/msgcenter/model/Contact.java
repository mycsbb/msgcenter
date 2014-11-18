package com.csrc.msgcenter.model;

public class Contact {
	private Integer id;
	private Integer userId;
	private String phone;
	private String zhname;
	
	public Contact() {
		super();
	}
	public Contact(Integer userId, String phone, String zhname) {
		super();
		this.userId = userId;
		this.phone = phone;
		this.zhname = zhname;
	}
	public Contact(Integer id, Integer userId, String phone, String zhname) {
		super();
		this.id = id;
		this.userId = userId;
		this.phone = phone;
		this.zhname = zhname;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getZhname() {
		return zhname;
	}

	public void setZhname(String zhname) {
		this.zhname = zhname;
	}

	public Contact(String phone, String zhname) {
		super();
		this.phone = phone;
		this.zhname = zhname;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Override
	public String toString() {
		return "Contact [id=" + id + ", userId=" + userId + ", phone=" + phone
				+ ", zhname=" + zhname + "]";
	}
}
