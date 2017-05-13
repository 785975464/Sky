package com.njust.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.njust.dao.RoleRightManagementDao;
import com.njust.domain.Role;
import com.njust.domain.Userinfo;
import com.njust.tag.PageBean;

public class RoleRightManagementService implements BaseService<Role>{

	RoleRightManagementDao roleRightManagementDao;
	public void setRoleRightManagementDao(
			RoleRightManagementDao roleRightManagementDao) {
		this.roleRightManagementDao = roleRightManagementDao;
	}

	public void save(Role entity) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Role entity) {
		// TODO Auto-generated method stub
		
	}

	public void update(Role entity) {
		// TODO Auto-generated method stub
		
	}

	public List<Role> findAll(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Role> findInfo(String hql, Object[] values) {
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
	
	public List<String>  getRoleName(String username) {
		String hql="from Role r,Userrole u where u.roleId=r.id and u.username="+username;
		List li=roleRightManagementDao.findAll(hql);
		ArrayList sList = (ArrayList) li;
		Iterator iterator1 = sList.iterator();
		List l2=new ArrayList<Role>();
		while (iterator1.hasNext()) {
			Object[] o = (Object[]) iterator1.next();
			Role v = (Role) o[0];
			l2.add(v);
		//	Authorizerelation a = (Authorizerelation) o[1];
		} 
		List<String> list = null;
		for(int c=0;c<l2.size();c++){
			Role tempR=(Role) l2.get(c);
			list.add(tempR.getRolename());
		}
		return list;
	} 
	
	
	public Role selectOneRole(int roleid) {
		String hql="from Role r where r.id="+roleid;
		List<Role> li=roleRightManagementDao.findAll(hql);
		Role temp=li.get(0);
		return temp;
	}
	

}
