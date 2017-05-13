package com.njust.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T extends Serializable> {
	public void save(T entity);

	public void delete(T entity);

	public void update(T entity);

	public int update(String hql);
	public List<T> queryOnePage(final String hql, final int offset,
			final int length);

	// 得到记录总数
	int getAllRowCount(String hql);
}
