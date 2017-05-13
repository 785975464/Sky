package com.njust.service;

import java.util.List;

import com.njust.dao.TjSheetDao;
import com.njust.domain.TjSheet;
import com.njust.tag.PageBean;

public class TjSheetService implements BaseService<TjSheet>{

	private TjSheetDao tjSheetDao;
	
	
	
	public void setTjSheetDao(TjSheetDao tjSheetDao) {
		this.tjSheetDao = tjSheetDao;
	}

	public void save(TjSheet entity) {
		// TODO Auto-generated method stub
			tjSheetDao.save(entity);
	}

	public void delete(TjSheet entity) {
		// TODO Auto-generated method stub
		tjSheetDao.delete(entity);
	}

	public void update(TjSheet entity) {
		// TODO Auto-generated method stub
		
	}

	public List<TjSheet> findAll(String hql) {
		// TODO Auto-generated method stub
		return tjSheetDao.findAll(hql);
	}

	public List<TjSheet> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return tjSheetDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return tjSheetDao.querySearchForPage(pageSize, currentPage, hql);
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return null;
	}

}
