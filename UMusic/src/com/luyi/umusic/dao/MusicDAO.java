package com.luyi.umusic.dao;

import java.util.List;
import com.luyi.umusic.model.Music;

public interface MusicDAO {

	public void save(Music transientInstance);
	public void delete(Music persistentInstance);
	public Music findById(java.lang.Integer id);
	public List findByExample(Music instance);
	public List findByProperty(String propertyName, Object value);
	public List findAll();
	public Music merge(Music detachedInstance);
	
}
