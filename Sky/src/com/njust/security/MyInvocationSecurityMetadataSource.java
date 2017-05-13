package com.njust.security;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.AntUrlPathMatcher;
import org.springframework.security.web.util.UrlMatcher;

import com.njust.domain.Permission;
import com.njust.domain.Role;
import com.njust.domain.Rolepermission;
import com.njust.service.PermissionService;
import com.njust.service.RoleRightManagementService;
import com.njust.service.RolepermissionService;
import com.njust.service.UserinfoService;
import com.njust.util.SqlSessionUtil;
/**
 * 
 * 此类在初始化时，应该取到所有资源及其对应角色的定义
 * 
 */
public class MyInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	private static UrlMatcher urlMatcher = new AntUrlPathMatcher();
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	public MyInvocationSecurityMetadataSource() {
		loadResourceDefine();
	}

	/**
	 * 在此处载入资源与角色的对应关系
	 */
	public static void loadResourceDefine() {
		System.out.println("begin load resource");
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		// SqlSessionTemplate session = SqlSessionUtil.getSqlSession();
		List<String> resources = new ArrayList<String>();	
		// load all resources		
		// 获得所有资源
		//yc-12-30
		SessionFactory sessionFactory=SqlSessionUtil.getSqlFactory().getSessionFactory();
		Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            List<Permission> li = (List<Permission>) session.createQuery("from Permission").list();
            List<String> list = new ArrayList<String>() ;
    		for(int c=0;c<li.size();c++){
    			Permission tempP=(Permission) li.get(c);
    			list.add(tempP.getResource());
    		}
    		resources=list;//resources存有所有资源
            session.getTransaction().commit();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        //-end-yc
		for (String resource : resources) {
			Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
			System.out.println(resource + " can be accessed by roles:");
			String hql="from Rolepermission r,Permission p where r.permissionId=p.id and p.resource="+"'"+resource+"'";
			List li=session.createQuery(hql).list();
			ArrayList sList = (ArrayList) li;
			Iterator iterator1 = sList.iterator();
			List l2=new ArrayList<Role>();
			while (iterator1.hasNext()) {
				Object[] o = (Object[]) iterator1.next();
				Rolepermission v = (Rolepermission) o[0];
				l2.add(v);
			//	Authorizerelation a = (Authorizerelation) o[1];
			} 
			List<Integer> list2 = new ArrayList<Integer>();
			for(int c=0;c<l2.size();c++){
				Rolepermission temp=(Rolepermission) l2.get(c);
				list2.add(temp.getRoleId());
			}
			
			List<Integer> roleids = list2;
			
			for (int id : roleids) {
				System.out.println(id);
				String rhql="from Role r where r.id="+id;
				List<Role> rli=session.createQuery(rhql).list();
				Role role = rli.get(0);	 
				//Role role =(Role) session.createQuery(rhql);
				System.out.println("\t" + role.getRolename());
				atts.add(new SecurityConfig(role.getRolename()));
				//rli=null;
			}
			System.out.println("yeah!!!");
			resourceMap.put(resource, atts);
			System.out.println("yeah2222!!!");
		}
		System.out.println("---end---");
	}

	/**
	 * 根据访问的url，取得能访问这个资源的角色列表
	 */
	public Collection<ConfigAttribute> getAttributes(Object   object) throws IllegalArgumentException {
		System.out.println("yeah2222---------------!!!");
		String url = ((FilterInvocation) object).getRequestUrl();
		Iterator<String> it = resourceMap.keySet().iterator();
		System.out.println("Try to access " + url);
		while (it.hasNext()) {
			String resURL = it.next();
			boolean isMached = urlMatcher.pathMatchesUrl(resURL, url);
			if (isMached) {
				System.out.println(url + " is protected , the roles that can access this url are:");
				// the resURL is protected,return the list of roles that can
				// access the url
				for (ConfigAttribute ca : resourceMap.get(resURL)) {
					System.out.println("\t" + ca.getAttribute());
				}
				return resourceMap.get(resURL);
			}
		}
		System.out.println(url + " is unprotected");
		// not protected
		return null;
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

}

