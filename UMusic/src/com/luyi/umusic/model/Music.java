package com.luyi.umusic.model;

/**
 * Music entity. @author MyEclipse Persistence Tools
 */

public class Music implements java.io.Serializable {

	// Fields

	private Integer id;
	private String musicTitle;
	private String musicType;
	private String musicDcpt;
	private String singer;
	private String musicPath;
	private Integer userId;
	private Integer musicState;
	private Integer feedbackSetting;
	private Integer readedCount;
	private Integer feedbackCount;
	private String pubTime;
	// Constructors

	/** default constructor */
	public Music() {
	}

	/** minimal constructor */
	public Music(Integer id, String musicTitle, String musicPath) {
		this.musicTitle = musicTitle;
		this.musicPath = musicPath;
	}

	/** full constructor */
	public Music(Integer id, String musicTitle, String musicType, String musicDcpt,
			String singer, String musicPath, Integer userId,
			Integer musicState, Integer feedbackSetting, Integer readedCount,
			Integer feedbackCount) {
		this.id = id;
		this.musicTitle = musicTitle;
		this.musicType = musicType;
		this.musicDcpt = musicDcpt;
		this.singer = singer;
		this.musicPath = musicPath;
		this.userId = userId;
		this.musicState = musicState;
		this.feedbackSetting = feedbackSetting;
		this.readedCount = readedCount;
		this.feedbackCount = feedbackCount;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMusicTitle() {
		return this.musicTitle;
	}

	public void setMusicTitle(String musicTitle) {
		this.musicTitle = musicTitle;
	}

	public String getMusicType() {
		return this.musicType;
	}

	public void setMusicType(String musicType) {
		this.musicType = musicType;
	}

	public String getSinger() {
		return this.singer;
	}
	
	public void setMusicDcpt(String musicDcpt) {
		this.musicDcpt = musicDcpt;
	}

	public String getMusicDcpt() {
		return this.musicDcpt;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getMusicPath() {
		return this.musicPath;
	}

	public void setMusicPath(String musicPath) {
		this.musicPath = musicPath;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getMusicState() {
		return this.musicState;
	}

	public void setMusicState(Integer musicState) {
		this.musicState = musicState;
	}

	public Integer getFeedbackSetting() {
		return this.feedbackSetting;
	}

	public void setFeedbackSetting(Integer feedbackSetting) {
		this.feedbackSetting = feedbackSetting;
	}

	public Integer getReadedCount() {
		return this.readedCount;
	}

	public void setReadedCount(Integer readedCount) {
		this.readedCount = readedCount;
	}

	public Integer getFeedbackCount() {
		return this.feedbackCount;
	}

	public void setFeedbackCount(Integer feedbackCount) {
		this.feedbackCount = feedbackCount;
	}

	public String getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}
}