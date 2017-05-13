package com.njust.service;

import java.util.List;

import com.njust.dao.PermissionDao;
import com.njust.domain.Permission;
import com.njust.domain.Role;
import com.njust.tag.PageBean;

public class PermissionService implements BaseService<Permission>{
	PermissionDao permissionDao;
	
	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	public void save(Permission entity) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Permission entity) {
		// TODO Auto-generated method stub
		
	}

	public void update(Permission entity) {
		// TODO Auto-generated method stub
		
	}

	public List<Permission> findAll(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Permission> findInfo(String hql, Object[] values) {
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
	
	
	public List<String> getSource() {
		String hql="from Permission";
		List<Permission> li=permissionDao.findAll(hql);
		
		List<String> list = null;
		for(int c=0;c<li.size();c++){
			Permission tempP=(Permission) li.get(c);
			list.add(tempP.getResource());
		}
		return list;

	}

}
