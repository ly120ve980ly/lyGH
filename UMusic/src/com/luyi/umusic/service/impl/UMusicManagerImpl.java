package com.luyi.umusic.service.impl;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import com.luyi.umusic.service.UMusicManager;
import com.luyi.umusic.dao.hibernate.UserInfoDAOHibernate;
import com.luyi.umusic.dao.hibernate.AdminDAOHibernate;
import com.luyi.umusic.dao.hibernate.FeedbackDAOHibernate;
import com.luyi.umusic.dao.hibernate.GuestbookDAOHibernate;
import com.luyi.umusic.dao.hibernate.MusicDAOHibernate;
import com.luyi.umusic.dao.hibernate.PhotoSetDAOHibernate;

import com.luyi.umusic.model.Music;
import com.luyi.umusic.model.PhotoSet;
import com.luyi.umusic.model.Admin;
import com.luyi.umusic.model.UserInfo;
import com.luyi.umusic.model.Feedback;
import com.luyi.umusic.model.Guestbook;

public class UMusicManagerImpl implements UMusicManager{
	
	private UserInfoDAOHibernate userInfoDAOHibernate;
	private MusicDAOHibernate musicDAOHibernate;
	private PhotoSetDAOHibernate photoSetDAOHibernate;
	private FeedbackDAOHibernate feedbackDAOHibernate;
	private AdminDAOHibernate adminDAOHibernate;
	
	
	public UserInfoDAOHibernate getUserInfoDAOHibernate()
	{
		return userInfoDAOHibernate;
	}
	
	public void setUserInfoDAOHibernate(UserInfoDAOHibernate userInfoDAOHibernate)
	{
		this.userInfoDAOHibernate = userInfoDAOHibernate;
	}
	
	public MusicDAOHibernate getMusicDAOHibernate()
	{
		return musicDAOHibernate;
	}
	
	public void setMusicDAOHibernate(MusicDAOHibernate musicDAOHibernate)
	{
		this.musicDAOHibernate = musicDAOHibernate;
	}
	
	public PhotoSetDAOHibernate getPhotoSetDAOHibernate()
	{
		return photoSetDAOHibernate;
	}
	
	public void setPhotoSetDAOHibernate(PhotoSetDAOHibernate photoSetDAOHibernate)
	{
		this.photoSetDAOHibernate = photoSetDAOHibernate;
	}
	
	public FeedbackDAOHibernate getFeedbackDAOHibernate()
	{
		return feedbackDAOHibernate;
	}
	
	public void setFeedbackDAOHibernate(FeedbackDAOHibernate feedbackDAOHibernate)
	{
		this.feedbackDAOHibernate = feedbackDAOHibernate;
	}
	
	public AdminDAOHibernate getAdminDAOHibernate()
	{
		return adminDAOHibernate;
	}
	
	public void setAdminDAOHibernate(AdminDAOHibernate adminDAOHibernate)
	{
		this.adminDAOHibernate = adminDAOHibernate;
	}
	
	
	
	public boolean login(UserInfo userInfo)
	{
		List list = userInfoDAOHibernate.findByExample(userInfo);
	
		if(list.size() != 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public boolean regist(UserInfo userInfo)
	{
		if(userInfoDAOHibernate.findByUserName(userInfo.getUserName()).size() == 1)
		{
			return false;
		}
		else
		{
			userInfoDAOHibernate.save(userInfo);
			return true;
		}
	}
	
	public List findTheUser(UserInfo userInfo)
	{
		return userInfoDAOHibernate.findByExample(userInfo);
	}
	
	public List findAllUser()
	{
		return userInfoDAOHibernate.findAll();
	}
	
	public void update(UserInfo userInfo)
	{
		userInfoDAOHibernate.update(userInfo);
	}

	public boolean shareM(Music music)
	{
		if(music.getMusicTitle().length() == 0)
		{
			return false;
		}
		else
		{
			musicDAOHibernate.save(music);
			return true;
		}
	}
	
	public void update(Music music)
	{
		musicDAOHibernate.update(music);
	}
	
	public List findAllMusic()
	{
		return musicDAOHibernate.findAll();
	}
	
	public List findUserMusic(int id)
	{
		return musicDAOHibernate.findByUserId(id);
	}
	
	public Music findMusicById(int id)
	{
		return musicDAOHibernate.findById(id);
	}
	
	public void deleteM(int id)
	{
		Music m = musicDAOHibernate.findById(id);
		musicDAOHibernate.delete(m);
	}
	
	public boolean shareP(PhotoSet photo)
	{
		if(photo.getPhotoName().length() == 0)
		{
			return false;
		}
		else
		{
			photoSetDAOHibernate.save(photo);
			return true;
		}
	}
	
	public List findUserPhoto(int id)
	{
		return photoSetDAOHibernate.findByUserId(id);
	}
	
	public void deleteP(int id)
	{
		PhotoSet p = photoSetDAOHibernate.findById(id);
		photoSetDAOHibernate.delete(p);
	}
	
	public boolean saveFeedback(Feedback fb)
	{
		if(fb.getContent()!=null)
		{
			feedbackDAOHibernate.save(fb);
			return true;
		}
		else return false;
	}
	
	public void deleteF(int id)
	{
		Feedback f = feedbackDAOHibernate.findById(id);
		feedbackDAOHibernate.delete(f);
	}
	
	public List findAllFeedback()
	{
		return feedbackDAOHibernate.findAll();
	}
	
	public boolean admin(Admin admin)
	{
		List list = adminDAOHibernate.findByExample(admin);
	
		if(list.size() != 0)
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm:ss");  
			String date = sdf.format(new java.util.Date()); 
			InetAddress inet;
			try {
				inet = InetAddress.getLocalHost();
				admin.setLastIp(inet.getHostAddress());
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  		
			admin.setLastDate(date);
			adminDAOHibernate.save(admin);
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public List findAllAdmin()
	{
		return adminDAOHibernate.findAll();
	}
}
