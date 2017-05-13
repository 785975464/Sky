package com.njust.service;

import java.util.List;

import com.njust.dao.MessagetextDao;
import com.njust.domain.Messagetext;
import com.njust.tag.PageBean;

public class MessagetextService implements BaseService<Messagetext>{

	private MessagetextDao messagetextDao;

	public void setMessagetextDao(MessagetextDao messagetextDao) {
		this.messagetextDao = messagetextDao;
	}

	public void save(Messagetext entity) {
		// TODO Auto-generated method stub
		messagetextDao.save(entity);
	}

	public void delete(Messagetext entity) {
		// TODO Auto-generated method stub
		
	}

	public void update(Messagetext entity) {
		// TODO Auto-generated method stub
		
	}

	public List<Messagetext> findAll(String hql) {
		// TODO Auto-generated method stub
		return messagetextDao.findAll(hql);
	}

	public List<Messagetext> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return messagetextDao.findInfo(hql, values);
//		return null;
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return messagetextDao.querySearchForPage(pageSize, currentPage, hql);
//		return null;
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return messagetextDao.querySearchForPage(pageSize, page, hql, values);
	}

}
