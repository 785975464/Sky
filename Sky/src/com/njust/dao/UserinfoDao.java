package com.njust.dao;

import com.njust.domain.Userinfo;

public class UserinfoDao extends BaseHibernateDao<Userinfo> {
/*
	public List<Userinfo> queryForPage(final String hql, final int offset,
			final int length) {
		List list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<Userinfo> list = query.list();
						return list;

					}
				});

		return list;
	}*/
/*
	public List<Userinfo> querySearchForPage(final String hql, final Object[] values, final int offset,
			final int length) {
		List list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						for (int i = 0; i < values.length; i++) {
							query.setParameter(i, values[i]);
						}
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<Userinfo> list = query.list();
						return list;

					}
				});

		return list;
	}
*/
}
