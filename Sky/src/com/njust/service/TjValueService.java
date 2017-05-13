package com.njust.service;

import java.util.List;

import com.njust.dao.TjValueDao;
import com.njust.domain.TjValue;
import com.njust.tag.PageBean;

public class TjValueService implements BaseService<TjValue>{

	private TjValueDao tjValueDao;
	
	
	
	public void setTjValueDao(TjValueDao tjValueDao) {
		this.tjValueDao = tjValueDao;
	}

	public void save(TjValue entity) {
		// TODO Auto-generated method stub
		tjValueDao.save(entity);
	}

	public void delete(TjValue entity) {
		// TODO Auto-generated method stub
		tjValueDao.delete(entity);
		
	}

	public void update(TjValue entity) {
		// TODO Auto-generated method stub
		
	}

	public List<TjValue> findAll(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<TjValue> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return null;
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
