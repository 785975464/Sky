package com.njust.security;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.njust.domain.Role;
import com.njust.domain.Userinfo;
import com.njust.util.SqlSessionUtil;

public class MyUserDetailService implements UserDetailsService {

	/**
	 * ��¼ʱ�����û������ض�Ӧ��UserDetails�������а����˸��û�����Ӧ�Ľ�ɫ
	 * 
	 * @throws UsernameNotFoundException
	 *             �û���������
	 * @throws DataAccessException
	 *             ���ݿ���ʴ���
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		List<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		User userdetail;
		SessionFactory sessionFactory = SqlSessionUtil.getSqlFactory().getSessionFactory();
		Session session = sessionFactory.openSession();
		// Userinfo user = us.getOneUser(username);// �����û�ID
		String hql = "from Userinfo u where u.username='" + username + "'";
		List<Userinfo> li = session.createQuery(hql).list();

		// (com.abc.model.User) session.selectOne("queryUserByName", username);
		if (li.size() != 0) {
			Userinfo user = li.get(0);
			// List<String> roles = s
			// ession.selectList("queryRoleNamesByUserid",
			// user.getId());
			// List<String> roles =r.getRoleName(username);
			String rohql = "from Role r,Userrole u where u.roleId=r.id and u.username='" + username + "'";
			List rli = session.createQuery(rohql).list();
			ArrayList sList = (ArrayList) rli;
			Iterator iterator1 = sList.iterator();
			List l2 = new ArrayList<Role>();
			while (iterator1.hasNext()) {
				Object[] o = (Object[]) iterator1.next();
				Role v = (Role) o[0];
				l2.add(v);
			}
			List<String> list2 = new ArrayList<String>();
			for (int c = 0; c < l2.size(); c++) {
				Role tempR = (Role) l2.get(c);
				list2.add(tempR.getRolename());
			}
			List<String> roles = list2;
			// �����û���ӦȨ��
			System.out.println("load user: " + " username:" + username);
			System.out.println("has authorities:");

			for (String role : roles) {
				System.out.println("\t" + role);
				auths.add(new GrantedAuthorityImpl(role));
			}
			userdetail = new User(user.getUsername(), user.getPassword(), user.getEnabled(), user.getAccountNonExpired(), user
					.getCredentialsNonExpired(), user.getAccountNonLocked(), auths);
			// userdetail = new User(user.getId(),user.getUsername(),
			// user.getPassword(),auths);
		} else {
			throw new UsernameNotFoundException(username + " not exist");
		}
		return userdetail;
	}
}
