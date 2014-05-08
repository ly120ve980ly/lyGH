package com.luyi.umusic.dao;

import java.util.List;
import com.luyi.umusic.model.PhotoSet;

public interface PhotoSetDAO {

	public void save(PhotoSet transientInstance);
	public void delete(PhotoSet persistentInstance);
	public PhotoSet findById(java.lang.Integer id);
	public List findByExample(PhotoSet instance);
	public List findByProperty(String propertyName, Object value);
	public List findAll();
	public PhotoSet merge(PhotoSet detachedInstance);
	
}
