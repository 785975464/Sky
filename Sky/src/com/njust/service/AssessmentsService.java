package com.njust.service;

import java.util.List;

import com.njust.dao.AssessmentsDao;
import com.njust.domain.Assessments;
import com.njust.tag.PageBean;

public class AssessmentsService implements BaseService<Assessments>{

	private AssessmentsDao assessmentsDao;
	public void setAssessmentsDao(AssessmentsDao assessmentsDao) {
		this.assessmentsDao = assessmentsDao;
	}

	public void save(Assessments entity) {
		// TODO Auto-generated method stub
		assessmentsDao.save(entity);
	}

	public void delete(Assessments entity) {
		// TODO Auto-generated method stub
		
	}

	public void update(Assessments entity) {
		assessmentsDao.update(entity);
	}
	public int update(String  hql) {
		return assessmentsDao.update(hql);
	}

	public List<Assessments> findAll(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Assessments> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return assessmentsDao.findInfo(hql, values);
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return assessmentsDao.querySearchForPage(pageSize, page, hql, values);
	}

}
