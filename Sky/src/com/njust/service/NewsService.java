package com.njust.service;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.njust.dao.NewsDao;
import com.njust.domain.News;
import com.njust.tag.PageBean;

public class NewsService implements BaseService<News>{

	
	private NewsDao newsDao;
	
	public NewsService(){
		
	}
	
	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	public void save(News entity) {
		// TODO Auto-generated method stub
		newsDao.save(entity);
	}

	public void delete(News entity) {
		// TODO Auto-generated method stub
		newsDao.delete(entity);
	}

	public void update(News entity) {
		// TODO Auto-generated method stub
		
	}

	public List<News> findAll(String hql) {
		// TODO Auto-generated method stub
		return newsDao.findAll(hql);
	}

	public List<News> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return newsDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int page,String hql) {
		// TODO Auto-generated method stub
		return newsDao.querySearchForPage(pageSize, page, hql);
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		return newsDao.querySearchForPage(pageSize, page, hql, values);
	}
	
	public List<News> queryOnePage(final String hql, final int offset, final int length) {
		return newsDao.queryOnePage(hql, offset, length);
	}

}
