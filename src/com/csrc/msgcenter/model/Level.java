package com.csrc.msgcenter.model;

public class Level {
	private Integer id;
	private String position;
	
	public Level() {
		super();
	}
	
	/**
	 * @param id
	 * @param position
	 */
	public Level(Integer id, String position) {
		super();
		this.id = id;
		this.position = position;
	}
	/**
	 * @param position
	 */
	public Level(String position) {
		super();
		this.position = position;
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
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}
	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
		this.position = position;
	}
	
}
