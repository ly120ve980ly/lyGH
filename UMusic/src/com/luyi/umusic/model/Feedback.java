package com.luyi.umusic.model;

/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */

public class Feedback implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String content;
	private String pubTime;
	private Integer musicId;

	// Constructors

	/** default constructor */
	public Feedback() {
	}

	/** minimal constructor */
	public Feedback(Integer id, String content) {
		this.id = id;
		this.content = content;
	}

	/** full constructor */
	public Feedback(Integer id, String userName, String content,
			String pubTime, Integer musicId) {
		this.id = id;
		this.userName = userName;
		this.content = content;
		this.pubTime = pubTime;
		this.musicId = musicId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}

	public Integer getMusicId() {
		return this.musicId;
	}

	public void setMusicId(Integer musicId) {
		this.musicId = musicId;
	}

}