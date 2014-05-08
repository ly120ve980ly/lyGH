package com.luyi.umusic.model;

/**
 * PhotoSet entity. @author MyEclipse Persistence Tools
 */

public class PhotoSet implements java.io.Serializable {

	// Fields

	private Integer id;
	private String photoName;
	private String photoInfo;
	private String photoPath;
	private Integer userId;

	// Constructors

	/** default constructor */
	public PhotoSet() {
	}

	/** minimal constructor */
	public PhotoSet(Integer id, String photoName, String photoPath,
			Integer userId) {
		this.id = id;
		this.photoName = photoName;
		this.photoPath = photoPath;
		this.userId = userId;
	}

	/** full constructor */
	public PhotoSet(Integer id, String photoName, String photoInfo,
			String photoPath, Integer userId) {
		this.id = id;
		this.photoName = photoName;
		this.photoInfo = photoInfo;
		this.photoPath = photoPath;
		this.userId = userId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhotoName() {
		return this.photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getPhotoInfo() {
		return this.photoInfo;
	}

	public void setPhotoInfo(String photoInfo) {
		this.photoInfo = photoInfo;
	}

	public String getPhotoPath() {
		return this.photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}