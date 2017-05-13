package com.njust.service;

import java.util.List;

import com.njust.dao.AuthorizerelationDao;
import com.njust.domain.Authorizerelation;
import com.njust.tag.PageBean;



public class AuthorizerelationService implements BaseService<Authorizerelation>{

	private AuthorizerelationDao authorizerelationDao;
	public void setAuthorizerelationDao(AuthorizerelationDao authorizerelationDao) {
		this.authorizerelationDao = authorizerelationDao;
	}

	public void save(Authorizerelation entity) {
		// TODO Auto-generated method stub
		authorizerelationDao.save(entity);
	}

	public void delete(Authorizerelation entity) {
		// TODO Auto-generated method stub
		authorizerelationDao.delete(entity);
	}

	

	public void update(Authorizerelation entity) {
		// TODO Auto-generated method stub
		authorizerelationDao.update(entity);
	}

	public List<Authorizerelation> findAll(String hql) {
		// TODO Auto-generated method stub
		return authorizerelationDao.findAll(hql);
	}
	public List<Authorizerelation> findInfo(String hql, Object[] values) {
		return authorizerelationDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return authorizerelationDao.querySearchForPage(pageSize, page, hql, values);
	}

}
