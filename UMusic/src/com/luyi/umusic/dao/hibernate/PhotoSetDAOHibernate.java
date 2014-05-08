package com.luyi.umusic.dao.hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.luyi.umusic.model.PhotoSet;
import com.luyi.umusic.dao.PhotoSetDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * PhotoSet entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.luyi.umusic.model.PhotoSet
 * @author MyEclipse Persistence Tools
 */

public class PhotoSetDAOHibernate extends HibernateDaoSupport 
	implements PhotoSetDAO {
	private static final Log log = LogFactory.getLog(PhotoSetDAOHibernate.class);
	// property constants
	public static final String PHOTO_NAME = "photoName";
	public static final String PHOTO_INFO = "photoInfo";
	public static final String PHOTO_PATH = "photoPath";
	public static final String USER_ID = "userId";

	protected void initDao() {
		// do nothing
	}

	public void save(PhotoSet transientInstance) {
		log.debug("saving PhotoSet instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(PhotoSet persistentInstance) {
		log.debug("deleting PhotoSet instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public PhotoSet findById(java.lang.Integer id) {
		log.debug("getting PhotoSet instance with id: " + id);
		try {
			PhotoSet instance = (PhotoSet) getHibernateTemplate().get(
					"com.luyi.umusic.model.PhotoSet", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(PhotoSet instance) {
		log.debug("finding PhotoSet instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding PhotoSet instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from PhotoSet as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPhotoName(Object photoName) {
		return findByProperty(PHOTO_NAME, photoName);
	}

	public List findByPhotoInfo(Object photoInfo) {
		return findByProperty(PHOTO_INFO, photoInfo);
	}

	public List findByPhotoPath(Object photoPath) {
		return findByProperty(PHOTO_PATH, photoPath);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findAll() {
		log.debug("finding all PhotoSet instances");
		try {
			String queryString = "from PhotoSet";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public PhotoSet merge(PhotoSet detachedInstance) {
		log.debug("merging PhotoSet instance");
		try {
			PhotoSet result = (PhotoSet) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(PhotoSet instance) {
		log.debug("attaching dirty PhotoSet instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(PhotoSet instance) {
		log.debug("attaching clean PhotoSet instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PhotoSetDAOHibernate getFromApplicationContext(ApplicationContext ctx) {
		return (PhotoSetDAOHibernate) ctx.getBean("PhotoSetDAOHibernate");
	}
}