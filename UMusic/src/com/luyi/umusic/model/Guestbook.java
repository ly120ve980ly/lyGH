package com.luyi.umusic.model;

/**
 * Guestbook entity. @author MyEclipse Persistence Tools
 */

public class Guestbook implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String email;
	private String title;
	private String content;
	private String pubDate;

	// Constructors

	/** default constructor */
	public Guestbook() {
	}

	/** minimal constructor */
	public Guestbook(Integer id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
	}

	/** full constructor */
	public Guestbook(Integer id, String name, String email, String title,
			String content, String pubDate) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.title = title;
		this.content = content;
		this.pubDate = pubDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPubDate() {
		return this.pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

}