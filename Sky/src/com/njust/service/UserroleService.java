package com.njust.service;

import java.util.List;

import com.njust.dao.UserroleDao;
import com.njust.domain.Userrole;
import com.njust.tag.PageBean;

public class UserroleService implements BaseService<Userrole> {

	private UserroleDao userroleDao;

	public void setUserroleDao(UserroleDao userroleDao) {
		this.userroleDao = userroleDao;
	}

	public void delete(Userrole entity) {
		// TODO Auto-generated method stub

	}

	public List<Userrole> findAll(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Userrole> findInfo(String hql, Object[] values) {
		return userroleDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql, Object[] values) {
		// TODO Auto-generated method stub
		return null;
	}

	public void save(Userrole entity) {
		userroleDao.save(entity);

	}

	public void update(Userrole entity) {
		// TODO Auto-generated method stub

	}

}
