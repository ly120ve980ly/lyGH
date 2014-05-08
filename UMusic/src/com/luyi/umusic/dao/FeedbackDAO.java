package com.luyi.umusic.dao;

import java.util.List;
import com.luyi.umusic.model.Feedback;

public interface FeedbackDAO {
	
	public void save(Feedback transientInstance);
	public void delete(Feedback persistentInstance);
	public Feedback findById(java.lang.Integer id);
	public List findByExample(Feedback instance);
	public List findByProperty(String propertyName, Object value);
	public List findAll();
	public Feedback merge(Feedback detachedInstance);
	
}
