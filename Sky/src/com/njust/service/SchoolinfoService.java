package com.njust.service;

import java.util.List;

import com.njust.dao.SchoolinfoDao;
//import com.njust.dao.TjSheetDao;
import com.njust.domain.Schoolinfo;
//import com.njust.domain.TjSheet;
import com.njust.tag.PageBean;

public class SchoolinfoService implements BaseService<Schoolinfo>{

	private SchoolinfoDao schoolinfoDao;

	
	public void setSchoolinfoDao(SchoolinfoDao schoolinfoDao) {
		this.schoolinfoDao = schoolinfoDao;
	}

	public void save(Schoolinfo entity) {
		// TODO Auto-generated method stub
		schoolinfoDao.save(entity);
	}

	public void delete(Schoolinfo entity) {
		// TODO Auto-generated method stub
		schoolinfoDao.delete(entity);
	}

	public void update(Schoolinfo entity) {
		// TODO Auto-generated method stub
		schoolinfoDao.update(entity);
	}

	public List<Schoolinfo> findAll(String hql) {
		// TODO Auto-generated method stub
		return schoolinfoDao.findAll(hql);
	}

	public List<Schoolinfo> findInfo(String hql, Object[] values) {
		//System.out.println("This is findInfo() of SchoolinfoService!");
		// TODO Auto-generated method stub
		return schoolinfoDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return schoolinfoDao.querySearchForPage(pageSize, currentPage, hql);
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return schoolinfoDao.querySearchForPage(pageSize, page, hql, values);
	}

}
