package com.luyi.umusic.dao.hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.luyi.umusic.model.Guestbook;
import com.luyi.umusic.dao.GuestbookDAO;
/**
 * A data access object (DAO) providing persistence and search support for
 * Guestbook entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.luyi.umusic.model.Guestbook
 * @author MyEclipse Persistence Tools
 */

public class GuestbookDAOHibernate extends HibernateDaoSupport
	implements GuestbookDAO {
	private static final Log log = LogFactory.getLog(GuestbookDAOHibernate.class);
	// property constants
	public static final String NAME = "name";
	public static final String EMAIL = "email";
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String PUB_DATE = "pubDate";

	protected void initDao() {
		// do nothing
	}

	public void save(Guestbook transientInstance) {
		log.debug("saving Guestbook instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Guestbook persistentInstance) {
		log.debug("deleting Guestbook instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Guestbook findById(java.lang.Integer id) {
		log.debug("getting Guestbook instance with id: " + id);
		try {
			Guestbook instance = (Guestbook) getHibernateTemplate().get(
					"com.luyi.umusic.model.Guestbook", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Guestbook instance) {
		log.debug("finding Guestbook instance by example");
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
		log.debug("finding Guestbook instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Guestbook as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByPubDate(Object pubDate) {
		return findByProperty(PUB_DATE, pubDate);
	}

	public List findAll() {
		log.debug("finding all Guestbook instances");
		try {
			String queryString = "from Guestbook";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Guestbook merge(Guestbook detachedInstance) {
		log.debug("merging Guestbook instance");
		try {
			Guestbook result = (Guestbook) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Guestbook instance) {
		log.debug("attaching dirty Guestbook instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Guestbook instance) {
		log.debug("attaching clean Guestbook instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GuestbookDAOHibernate getFromApplicationContext(ApplicationContext ctx) {
		return (GuestbookDAOHibernate) ctx.getBean("GuestbookDAOHibernate");
	}
}