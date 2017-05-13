package com.njust.security;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.FilterInvocation;

public class MyAccessDecisionManager implements AccessDecisionManager {

	/**
	 * 决定登录的用户是否有权限访问url
	 * 
	 * @param authentication
	 *            登录用户信息
	 * @param object
	 *            用户要访问的url
	 * @param configAttributes
	 *            访问该url所需要的权限集合
	 * @throws AccessDeniedException
	 *             拒绝访问，页面将跳转到403页面
	 * @return 该url有权限访问
	 */
	public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		if (configAttributes == null) {
			return;
		}
		String url = ((FilterInvocation) object).getRequestUrl();
		System.out.println("begin decide " + url);
		System.out.println("\tget user:" + authentication.getName());
		Iterator<ConfigAttribute> ite = configAttributes.iterator();
		// you can change access strategy here
		while (ite.hasNext()) {
			ConfigAttribute ca = ite.next();
			String needRole = ((SecurityConfig) ca).getAttribute();
			for (GrantedAuthority ga : authentication.getAuthorities()) {
				if (needRole.equals(ga.getAuthority())) {
					return;
				}
			}
		}
		// have no authories to access the page , will navigate to
		// access-denied-page
		throw new AccessDeniedException("no right");
	}

	public boolean supports(ConfigAttribute attribute) {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

}

