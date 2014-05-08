package com.luyi.umusic.dao;

import java.util.List;
import com.luyi.umusic.model.Guestbook;

public interface GuestbookDAO {

	public void save(Guestbook transientInstance);
	public void delete(Guestbook persistentInstance);
	public Guestbook findById(java.lang.Integer id);
	public List findByExample(Guestbook instance);
	public List findByProperty(String propertyName, Object value);
	public List findAll();
	public Guestbook merge(Guestbook detachedInstance);
	
}
