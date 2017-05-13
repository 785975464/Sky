package com.njust.service;

import java.io.Serializable;
import java.util.List;

import com.njust.tag.PageBean;

public interface BaseService <T extends Serializable>{
	public void save(T entity);
	public void delete(T entity);
	public void update(T entity);
	public List<T> findAll(String hql); 
	public List<T> findInfo(String hql, Object[] values);
	public PageBean querySearchForPage(int pageSize,int currentPage,String hql);
	public PageBean querySearchForPage(int pageSize, int page,String hql,Object[] values);
}
