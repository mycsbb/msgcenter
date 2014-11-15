package com.csrc.msgcenter.model;

public class Contact {
	private Integer id;
	private String phone;
	private String zhname;
	
	public Contact() {
		super();
	}
	
	public Contact(Integer id, String phone, String zhname) {
		super();
		this.id = id;
		this.phone = phone;
		this.zhname = zhname;
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
		return "Contact [id=" + id + ", phone=" + phone + ", zhname=" + zhname
				+ "]";
	}
}
