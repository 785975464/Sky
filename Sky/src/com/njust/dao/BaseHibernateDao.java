package com.njust.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.njust.tag.PageBean;

public class BaseHibernateDao<T extends Serializable> extends HibernateDaoSupport implements BaseDao<T> {

	public void delete(T entity) {
		// TODO Auto-generated method stub

		Session session = this.getSessionFactory().openSession();
		session.beginTransaction();
		session.delete(entity);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(String hql) {
		return this.getHibernateTemplate().find(hql);

	}

	@SuppressWarnings("unchecked")
	public List<T> findInfo(String hql, Object[] values) {
		//System.out.println("This is findInfo() of BaseHibernateDao!");
		return this.getHibernateTemplate().find(hql, values);

	}

	public void save(T entity) {
		// TODO Auto-generated method stub
		// this.getHibernateTemplate().save(entity);
		try {
			Session session = this.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(entity);
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(T entity) {
		this.getHibernateTemplate().update(entity);

	}

	public int update(String hql) {
		Session session = this.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		Query queryupdate = session.createQuery(hql);
		int ret = queryupdate.executeUpdate();
		trans.commit();
		return ret;
	}

	/*
	 * public List<T> queryForPage(String hql, int offset, int length) { // TODO
	 * Auto-generated method stub return null; }
	 */
	public List<T> queryOnePage(final String hql, final int offset, final int length) {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setFirstResult(offset);
				query.setMaxResults(length);
				List<T> list = query.list();
				return list;

			}
		});

		return list;
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql) {
		// TODO Auto-generated method stub
		int allRow = this.getAllRowCount(hql); // �ܼ�¼��
		int totalPage = PageBean.countTotalPage(pageSize, allRow); // ��ҳ��
		final int offset = PageBean.countOffset(pageSize, page); // ��ǰҳ��ʼ��¼
		final int length = pageSize; // ÿҳ��¼��
		final int currentPage = PageBean.countCurrentPage(page);
		List<T> list = this.queryOnePage(hql, offset, length); // "һҳ"�ļ�¼

		// �ѷ�ҳ��Ϣ���浽Bean��
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}

	/*
	 * public List<T> querySearchForPage(String hql, Object[] values,int offset,
	 * int length) { // TODO Auto-generated method stub return null; }
	 */
	@SuppressWarnings( { "unchecked", "rawtypes" })
	public List<T> queryOnePage(final String hql, final Object[] values, final int offset, final int length) {
		List list = this.getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session) throws HibernateException, SQLException {

				Query query = session.createQuery(hql);
				for (int i = 0; i < values.length; i++) {
					query.setParameter(i, values[i]);
				}
				query.setFirstResult(offset);
				query.setMaxResults(length);
				List<T> list = query.list();
				return list;

			}
		});

		return list;
	}

	public int getAllRowCount(String hql) {
		return this.getHibernateTemplate().find(hql).size();
	}

	public int getSearchRowCount(String hql, Object[] values) {
		return this.getHibernateTemplate().find(hql, values).size();
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql, Object[] values) {
		// TODO Auto-generated method stub

		int allRow = this.getSearchRowCount(hql, values); // �ܼ�¼��
		int totalPage = PageBean.countTotalPage(pageSize, allRow); // ��ҳ��
		final int offset = PageBean.countOffset(pageSize, page); // ��ǰҳ��ʼ��¼
		final int length = pageSize; // ÿҳ��¼��
		final int currentPage = PageBean.countCurrentPage(page);
		List<T> list = this.queryOnePage(hql, values, offset, length); // "һҳ"�ļ�¼

		// �ѷ�ҳ��Ϣ���浽Bean��
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}

}
