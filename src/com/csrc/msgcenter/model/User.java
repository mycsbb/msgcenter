package com.csrc.msgcenter.model;

public class User {
	private Integer id;
	private String username;
	private String password;
	private Integer departId;
	private Integer levelId;
	private String zhname;
	private String phone;
	
	public User() {
		super();
	}

	/**
	 * @param id
	 * @param username
	 * @param password
	 * @param departId
	 * @param levelId
	 * @param zhname
	 * @param phone
	 */
	public User(Integer id, String username, String password, Integer departId,
			Integer levelId, String zhname, String phone) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.departId = departId;
		this.levelId = levelId;
		this.zhname = zhname;
		this.phone = phone;
	}
	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @return the departId
	 */
	public Integer getDepartId() {
		return departId;
	}
	/**
	 * @param departId the departId to set
	 */
	public void setDepartId(Integer departId) {
		this.departId = departId;
	}
	/**
	 * @return the levelId
	 */
	public Integer getLevelId() {
		return levelId;
	}
	/**
	 * @param levelId the levelId to set
	 */
	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}
	/**
	 * @return the zhname
	 */
	public String getZhname() {
		return zhname;
	}
	/**
	 * @param zhname the zhname to set
	 */
	public void setZhname(String zhname) {
		this.zhname = zhname;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [id=" + id + ", departId=" + departId + ", levelId=" + levelId +
				", username=" + username + ", password=" + password + ", zhname=" 
				+ zhname + ", phone=" + phone + "]";
	}
}
