package com.njust.service;

import java.util.List;

import com.njust.dao.UserinfoDao;
import com.njust.domain.Userinfo;
import com.njust.tag.PageBean;

public class UserinfoService implements BaseService<Userinfo> {

	private UserinfoDao userinfoDao;

	public void setUserinfoDao(UserinfoDao userinfoDao) {
		this.userinfoDao = userinfoDao;
	}

	public UserinfoService() {

	}

	public void delete(Userinfo entity) {
		userinfoDao.delete(entity);
	}

	public void save(Userinfo entity) {
		userinfoDao.save(entity);
	}

	public void update(Userinfo entity) {
		userinfoDao.update(entity);

	}

	public List<Userinfo> findAll(String hql) {
		return userinfoDao.findAll(hql);
	}

	public List<Userinfo> findInfo(String hql, Object[] values) {
		return userinfoDao.findInfo(hql, values);
	}
	public PageBean querySearchForPage(int pageSize, int page,String hql) {
		return userinfoDao.querySearchForPage(pageSize, page, hql);
	
	}
	public PageBean querySearchForPage(int pageSize, int page,String hql,Object[] values){
		return userinfoDao.querySearchForPage(pageSize, page, hql, values);
	}
	public Userinfo getOneUser(String username) {
		String hql="from Userinfo u where u.username="+username;
		List<Userinfo> li=userinfoDao.findAll(hql);
		Userinfo temp=li.get(0);
		return temp;
		} 

/*
	public PageBean queryForPage(int pageSize, int page,String hql) {
		// TODO Auto-generated method stub
		int allRow = userinfoDao.getAllRowCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow); // 总页数
		final int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Userinfo> list = userinfoDao.queryForPage(hql, offset, length); // "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
	*/


	
	
/*	
	public PageBean querySearchForPage(int pageSize, int page,String hql,Object[] values) {
		// TODO Auto-generated method stub
		int allRow = userinfoDao.getSearchRowCount(hql, values); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow); // 总页数
		final int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Userinfo> list = userinfoDao.querySearchForPage(hql,values, offset, length); // "一页"的记录

		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
*/
}
