package com.luyi.umusic.dao;

import java.util.List;
import com.luyi.umusic.model.UserInfo;

public interface UserInfoDAO {

	public void save(UserInfo transientInstance);
	public void delete(UserInfo persistentInstance);
	public UserInfo findById(java.lang.Integer id);
	public List findByExample(UserInfo instance);
	public List findByProperty(String propertyName, Object value);
	public List findAll();
	public UserInfo merge(UserInfo detachedInstance);
	
}
