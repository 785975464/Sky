package com.njust.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Authorizerelation;
import com.njust.domain.Userinfo;
import com.njust.service.AuthorizerelationService;
import com.njust.service.UserinfoService;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionSupport;

public class AuthorizerelationAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest req;

	private String id;
	private String username;
	private String specialistName;
	private String isAgreed;

	private String stuResult;
	private List list;
	private PageBean pageBean;
	private int page;

	private String realname;
	private String gender;
	private String age;
	private String address;
	private String school;
	private String grade;
	private String stuClass;
	private String nation;
	private Double height;
	private Double weight;

	private UserinfoService userinfoService;

	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}

	private AuthorizerelationService authorizerelationService;

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStuClass() {
		return stuClass;
	}

	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	public String getIsAgreed() {
		return isAgreed;
	}

	public void setIsAgreed(String isAgreed) {
		this.isAgreed = isAgreed;
	}

	@JSON(name = "STURESULT")
	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	@JSON(name = "PAGEBEAN")
	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public AuthorizerelationService getAuthorizerelationService() {
		return authorizerelationService;
	}

	public void setAuthorizerelationService(AuthorizerelationService authorizerelationService) {
		this.authorizerelationService = authorizerelationService;
	}

	public String noAuthorizedInfo() {
		String hql = "select distinct u from Authorizerelation au,Userinfo u where au.specialistName=? and au.isAgreed=? and au.username=u.username";
		

		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		String[] values = new String[]{u.getUsername(),"·ñ"};
		this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
		list = pageBean.getList();

		if (list.size() <= 0) {
			this.pageBean = userinfoService.querySearchForPage(10, 1, hql, values);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}

		return SUCCESS;
	}

	public String updateAuthorizedInfo() {
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		
		String tempHql = "from Authorizerelation au where au.username=? and au.specialistName=?";
		String[] tempValues = new String[] { username, u.getUsername() };
		List tempList = authorizerelationService.findInfo(tempHql, tempValues);

		Authorizerelation au = new Authorizerelation();
		au = (Authorizerelation) tempList.get(0);
		au.setIsAgreed("ÊÇ");
		authorizerelationService.update(au);

		// String hql = "from Authorizerelation au where au.specialistName=? and au.isAgreed=?";
		String hql = "select distinct u from Authorizerelation au,Userinfo u where au.specialistName=? and au.isAgreed=? and au.username=u.username";		
		String[] values = new String[]{u.getUsername(),"·ñ"};
		this.pageBean = authorizerelationService.querySearchForPage(10, page, hql, values);
		list = pageBean.getList();

		if (list.size() <= 0) {
			this.pageBean = authorizerelationService.querySearchForPage(10, 1, hql, values);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		stuResult = JsonUtil.listToJson(list);
		return SUCCESS;

	}

	public String delAuthorizedInfo() {
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		
		String tempHql = "from Authorizerelation au where au.username=? and au.specialistName=?";
		String[] tempValues = new String[] { username, u.getUsername() };
		List tempList = authorizerelationService.findInfo(tempHql, tempValues);

		Authorizerelation au = new Authorizerelation();
		au = (Authorizerelation) tempList.get(0);
		authorizerelationService.delete(au);

		// String hql = "from Authorizerelation au where au.specialistName=? and au.isAgreed=?";
		String hql = "select distinct u from Authorizerelation au,Userinfo u where au.specialistName=? and au.isAgreed=? and au.username=u.username";
		String[] values = new String[]{u.getUsername(),"·ñ"};
		this.pageBean = authorizerelationService.querySearchForPage(10, page, hql, values);
		list = pageBean.getList();

		if (list.size() <= 0) {
			this.pageBean = authorizerelationService.querySearchForPage(10, 1, hql, values);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		stuResult = JsonUtil.listToJson(list);
		return SUCCESS;

	}
}
