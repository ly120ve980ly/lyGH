/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.luyi.umusic.web;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 12-06-2013
 * 
 * XDoclet definition:
 * @struts.form name="regForm"
 */
public class UserForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** sex property */
	private String sex;

	/** username property */
	private String username;

	/** address property */
	private String address;

	/** email property */
	private String email;

	/** province property */
	private String province;

	/** photo property */
	private String photo;

	/** password property */
	private String password;

	/** qq property */
	private String qq;

	/** city property */
	private String city;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the sex.
	 * @return String
	 */
	public String getSex() {
		return sex;
	}

	/** 
	 * Set the sex.
	 * @param sex The sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/** 
	 * Returns the username.
	 * @return String
	 */
	public String getUsername() {
		return username;
	}

	/** 
	 * Set the username.
	 * @param username The username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/** 
	 * Returns the address.
	 * @return String
	 */
	public String getAddress() {
		return address;
	}

	/** 
	 * Set the address.
	 * @param address The address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/** 
	 * Returns the email.
	 * @return String
	 */
	public String getEmail() {
		return email;
	}

	/** 
	 * Set the email.
	 * @param email The email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/** 
	 * Returns the province.
	 * @return String
	 */
	public String getProvince() {
		return province;
	}

	/** 
	 * Set the province.
	 * @param province The province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/** 
	 * Returns the photo.
	 * @return String
	 */
	public String getPhoto() {
		return photo;
	}

	/** 
	 * Set the photo.
	 * @param photo The photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	/** 
	 * Returns the password.
	 * @return String
	 */
	public String getPassword() {
		return password;
	}

	/** 
	 * Set the password.
	 * @param password The password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/** 
	 * Returns the qq.
	 * @return String
	 */
	public String getQq() {
		return qq;
	}

	/** 
	 * Set the qq.
	 * @param qq The qq to set
	 */
	public void setQq(String qq) {
		this.qq = qq;
	}

	/** 
	 * Returns the city.
	 * @return String
	 */
	public String getCity() {
		return city;
	}

	/** 
	 * Set the city.
	 * @param city The city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
}