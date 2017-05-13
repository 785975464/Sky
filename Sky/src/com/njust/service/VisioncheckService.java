package com.njust.service;

import java.util.List;

import com.njust.dao.VisioncheckDao;
import com.njust.domain.Visioncheck;
import com.njust.tag.PageBean;

public class VisioncheckService implements BaseService<Visioncheck> {

	private VisioncheckDao visioncheckDao;

	public VisioncheckService() {
		
	}

	public VisioncheckDao getVisioncheckDao() {
		return visioncheckDao;
	}

	public void setVisioncheckDao(VisioncheckDao visioncheckDao) {
		this.visioncheckDao = visioncheckDao;
	}

	public void save(Visioncheck entity) {
		// TODO Auto-generated method stub
		visioncheckDao.save(entity);
	}

	public void delete(Visioncheck entity) {
		// TODO Auto-generated method stub
		visioncheckDao.delete(entity);
	}

	public void update(Visioncheck entity) {
		// TODO Auto-generated method stub
		visioncheckDao.update(entity);

	}

	public List<Visioncheck> findAll(String hql) {
		// TODO Auto-generated method stub
		return visioncheckDao.findAll(hql);
	}
	public List<Visioncheck> findInfo(String hql, Object[] values) {
		return visioncheckDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,Object[] values) {
		return visioncheckDao.querySearchForPage(pageSize, page, hql, values);
	}
	
	public List<Visioncheck> queryOnePage(final String hql, final Object[] values, final int offset, final int length) {
		return visioncheckDao.queryOnePage(hql, values, offset, length);
	}

}
