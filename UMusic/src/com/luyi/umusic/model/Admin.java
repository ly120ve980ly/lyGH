package com.luyi.umusic.model;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private Integer id;
	private String adminName;
	private String adminPwd;
	private String lastDate;
	private String lastIp;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String adminName, String adminPwd) {
		this.adminName = adminName;
		this.adminPwd = adminPwd;
	}

	/** full constructor */
	public Admin(Integer id, String adminName, String adminPwd,
			String lastDate, String lastIp) {
		this.id = id;
		this.adminName = adminName;
		this.adminPwd = adminPwd;
		this.lastDate = lastDate;
		this.lastIp = lastIp;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPwd() {
		return this.adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getLastDate() {
		return this.lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getLastIp() {
		return this.lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

}