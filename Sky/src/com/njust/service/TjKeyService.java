package com.njust.service;

import java.util.List;

import com.njust.dao.TjKeyDao;
import com.njust.domain.TjKey;
import com.njust.tag.PageBean;

public class TjKeyService implements BaseService<TjKey>{

	private TjKeyDao tjKeyDao;
	
	
	public void setTjKeyDao(TjKeyDao tjKeyDao) {
		this.tjKeyDao = tjKeyDao;
	}

	public void save(TjKey entity) {
		// TODO Auto-generated method stub
		tjKeyDao.save(entity);
	}

	public void delete(TjKey entity) {
		// TODO Auto-generated method stub
		tjKeyDao.delete(entity);
	}

	public void update(TjKey entity) {
		// TODO Auto-generated method stub
		
	}

	public List<TjKey> findAll(String hql) {
		// TODO Auto-generated method stub
		return tjKeyDao.findAll(hql);
	}

	public List<TjKey> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return tjKeyDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return null;
	}

}
