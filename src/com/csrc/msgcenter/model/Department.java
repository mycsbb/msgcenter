package com.csrc.msgcenter.model;

public class Department {
	private Integer id;
	private Integer pid;
	private String name;
	
	public Department() {
		super();
	}
	/**
	 * @param id
	 * @param pid
	 * @param name
	 */
	public Department(Integer id, Integer pid, String name) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
	}
	/**
	 * @param pid
	 * @param name
	 */
	public Department(Integer pid, String name) {
		super();
		this.pid = pid;
		this.name = name;
	}
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the pid
	 */
	public Integer getPid() {
		return pid;
	}
	/**
	 * @param pid the pid to set
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	} 
	
}
