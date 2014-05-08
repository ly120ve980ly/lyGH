package com.luyi.umusic.dao.hibernate;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.luyi.umusic.model.Music;
import com.luyi.umusic.dao.MusicDAO;

/**
 * A data access object (DAO) providing persistence and search support for Music
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.luyi.umusic.model.Music
 * @author MyEclipse Persistence Tools
 */

public class MusicDAOHibernate extends HibernateDaoSupport
	implements MusicDAO {
	private static final Log log = LogFactory.getLog(MusicDAOHibernate.class);
	// property constants
	public static final String MUSIC_TITLE = "musicTitle";
	public static final String MUSIC_TYPE = "musicType";
	public static final String MUSIC_DCPT = "musicDcpt";
	public static final String SINGER = "singer";
	public static final String MUSIC_PATH = "musicPath";
	public static final String USER_ID = "userId";
	public static final String MUSIC_STATE = "musicState";
	public static final String FEEDBACK_SETTING = "feedbackSetting";
	public static final String READED_COUNT = "readedCount";
	public static final String FEEDBACK_COUNT = "feedbackCount";

	protected void initDao() {
		// do nothing
	}

	public void save(Music transientInstance) {
		log.debug("saving Music instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Music persistentInstance) {
		log.debug("deleting Music instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public void update(Music persistentInstance) {
		log.debug("updating Music instance");
		try {
			getHibernateTemplate().update(persistentInstance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	public Music findById(java.lang.Integer id) {
		log.debug("getting Music instance with id: " + id);
		try {
			Music instance = (Music) getHibernateTemplate().get(
					"com.luyi.umusic.model.Music", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Music instance) {
		log.debug("finding Music instance by example");
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
		log.debug("finding Music instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Music as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMusicTitle(Object musicTitle) {
		return findByProperty(MUSIC_TITLE, musicTitle);
	}

	public List findByMusicType(Object musicType) {
		return findByProperty(MUSIC_TYPE, musicType);
	}
	
	public List findByMusicDcpt(Object musicDcpt) {
		return findByProperty(MUSIC_DCPT, musicDcpt);
	}

	public List findBySinger(Object singer) {
		return findByProperty(SINGER, singer);
	}

	public List findByMusicPath(Object musicPath) {
		return findByProperty(MUSIC_PATH, musicPath);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByMusicState(Object musicState) {
		return findByProperty(MUSIC_STATE, musicState);
	}

	public List findByFeedbackSetting(Object feedbackSetting) {
		return findByProperty(FEEDBACK_SETTING, feedbackSetting);
	}

	public List findByReadedCount(Object readedCount) {
		return findByProperty(READED_COUNT, readedCount);
	}

	public List findByFeedbackCount(Object feedbackCount) {
		return findByProperty(FEEDBACK_COUNT, feedbackCount);
	}

	public List findAll() {
		log.debug("finding all Music instances");
		try {
			String queryString = "from Music";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Music merge(Music detachedInstance) {
		log.debug("merging Music instance");
		try {
			Music result = (Music) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Music instance) {
		log.debug("attaching dirty Music instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Music instance) {
		log.debug("attaching clean Music instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MusicDAOHibernate getFromApplicationContext(ApplicationContext ctx) {
		return (MusicDAOHibernate) ctx.getBean("MusicDAOHibernate");
	}
}