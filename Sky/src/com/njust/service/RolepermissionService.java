package com.njust.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.njust.dao.RolepermissionDao;
import com.njust.domain.Role;
import com.njust.domain.Rolepermission;
import com.njust.tag.PageBean;

public class RolepermissionService implements BaseService<Rolepermission>{

	RolepermissionDao rolepermissionDao;
	public void setRolepermissionDao(RolepermissionDao rolepermissionDao) {
		this.rolepermissionDao = rolepermissionDao;
	}

	public void save(Rolepermission entity) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Rolepermission entity) {
		// TODO Auto-generated method stub
		
	}

	public void update(Rolepermission entity) {
		// TODO Auto-generated method stub
		
	}

	public List<Rolepermission> findAll(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Rolepermission> findInfo(String hql, Object[] values) {
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
	
	public List<Integer> getRoleIdByResource(String resource) {
		String hql="from Rolepermission r,Permission p where r.roleId=p.id and p.resource="+resource;
		
		List li=rolepermissionDao.findAll(hql);
		
		
		
		ArrayList sList = (ArrayList) li;
		Iterator iterator1 = sList.iterator();
		List l2=new ArrayList<Role>();
		while (iterator1.hasNext()) {
			Object[] o = (Object[]) iterator1.next();
			Rolepermission v = (Rolepermission) o[0];
			l2.add(v);
		//	Authorizerelation a = (Authorizerelation) o[1];
		} 
		List<Integer> list = null;
		for(int c=0;c<l2.size();c++){
			Rolepermission temp=(Rolepermission) l2.get(c);
			list.add(temp.getRoleId());
		}
		return list;
		
	}

}
