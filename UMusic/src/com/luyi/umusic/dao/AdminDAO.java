package com.luyi.umusic.dao;

import java.util.List;
import com.luyi.umusic.model.Admin;

public interface AdminDAO {

	public void save(Admin transientInstance);
	public void delete(Admin persistentInstance);
	public Admin findById(java.lang.Integer id);
	public List findByExample(Admin instance);
	public List findByProperty(String propertyName, Object value);
	public List findAll();
	public Admin merge(Admin detachedInstance);
	
}
