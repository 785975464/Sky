package com.njust.service;

import java.util.List;

import com.njust.dao.MessageDao;
import com.njust.domain.Message;
import com.njust.tag.PageBean;

public class MessageService implements BaseService<Message>{

	private MessageDao messageDao;
	
	
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	public void save(Message entity) {
		// TODO Auto-generated method stub
		
	}

	public void delete(Message entity) {
		// TODO Auto-generated method stub
		
	}

	public void update(Message entity) {
		// TODO Auto-generated method stub
		
	}

	public List<Message> findAll(String hql) {
		// TODO Auto-generated method stub
		return messageDao.findAll(hql);
	}

	public List<Message> findInfo(String hql, Object[] values) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean querySearchForPage(int pageSize, int currentPage, String hql) {
		// TODO Auto-generated method stub
		return messageDao.querySearchForPage(pageSize, currentPage, hql);
	}

	public PageBean querySearchForPage(int pageSize, int page, String hql,
			Object[] values) {
		// TODO Auto-generated method stub
		return null;
	}

}
