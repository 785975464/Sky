package com.njust.service;

import java.util.List;

import com.njust.dao.AddressinfoDao;
import com.njust.domain.Addressinfo;
import com.njust.tag.PageBean;

public class AddressinfoService implements BaseService<Addressinfo>{

	private AddressinfoDao addressinfoDao;

	
	public void setAddressinfoDao(AddressinfoDao addressinfoDao) {
		this.addressinfoDao = addressinfoDao;
	}

	public void save(Addressinfo entity) {
		// TODO Auto-generated method stub
		addressinfoDao.save(entity);
	}

	public void delete(Addressinfo entity) {
		// TODO Auto-generated method stub
		addressinfoDao.delete(entity);
	}

	public void update(Addressinfo entity) {
		// TODO Auto-generated method stub
		addressinfoDao.update(entity);
	}

	public List<Addressinfo> findAll(String hql) {
		// TODO Auto-generated method stub
		return addressinfoDao.findAll(hql);
	}

	public List<Addressinfo> findInfo(String hql, Object[] values) {
		//System.out.println("This is findInfo() of SchoolinfoService!");
		// TODO Auto-generated method stub
		return addressinfoDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return addressinfoDao.querySearchForPage(pageSize, currentPage, hql);
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return addressinfoDao.querySearchForPage(pageSize, page, hql, values);
	}

}
