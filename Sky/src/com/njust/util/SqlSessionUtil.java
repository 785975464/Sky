package com.njust.util;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.njust.service.PermissionService;

public class SqlSessionUtil {
	private static HibernateTemplate hibernateTemplate;

	public static HibernateTemplate getSqlFactory() {
		if (hibernateTemplate == null) {
			//System.out.println("jinlai?");
			//ApplicationContext ctx = new ClassPathXmlApplicationContext("/WebRoot/WEB-INF/applicationContext.xml");
			ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");			
			//System.out.println("jinlai2?");
			hibernateTemplate = (HibernateTemplate) ctx.getBean("hibernateTemplate");
			//System.out.println("jinlai3?");
			//hibernateTemplate.getSessionFactory();
			//permissionService= (HibernateTemplate) ctx.getBean("hibernateTemplate");
		}
		return hibernateTemplate;
	}


}
