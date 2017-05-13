package com.njust.action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Authorizerelation;
import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.domain.Visioncheck;
import com.njust.service.AuthorizerelationService;
import com.njust.service.UserinfoService;
import com.njust.service.VisioncheckService;
import com.njust.servlet.getMD5;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport {
	private HttpServletRequest req;

	private Userinfo userinfo;
	private String username;
	private List list, list1;
	private UserinfoService userinfoService;
	private PageBean pageBean;
	private int page;
	private String specialname;
	private AuthorizerelationService authorizerelationService;
	private Integer id;
	private VisioncheckService visioncheckService;
	private String stuResult;
	
	private String realname;
	private String phone;
	private String email;
	private String password;
	private String guardianName;
	
	public String getGuardianName() {
		return guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
//		this.password = getMD5.makeMD5(password);
	}

	public void setVisioncheckService(VisioncheckService visioncheckService) {
		this.visioncheckService = visioncheckService;
	}

	@JSON(name = "STURESULT")
	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}

	public void setAuthorizerelationService(AuthorizerelationService authorizerelationService) {
		this.authorizerelationService = authorizerelationService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List getList1() {
		return list1;
	}

	public void setList1(List list1) {
		this.list1 = list1;
	}

	public String getSpecialname() {
		return specialname;
	}

	public void setSpecialname(String specialname) {
		this.specialname = specialname;
	}

	private static final long serialVersionUID = 1L;

	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
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

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}

	//学生修改自己个人信息--查找
	public String modifyStuselfInfo() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String hql = "from Userinfo u where u.username=?";
//			String[] values = new String[] { u.getUsername() };			
//			list = userinfoService.findInfo(hql, values);
//			Userinfo userinfo = (Userinfo) list.get(0);
			ActionContext ac = ActionContext.getContext();
			ac.put("userinfo", u);		
			return "success";			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	//学生修改自己个人信息--修改基本信息
	public String updateStuselfInfo() {
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		Userinfo userinfo = (Userinfo) list.get(0);
		userinfo.setRealname(realname);
		userinfo.setPhone(phone);
		userinfo.setEmail(email);

		userinfoService.update(userinfo);
		
		ActionContext ac = ActionContext.getContext();
		ac.getSession().put("loginuser", userinfo);
		
		return "success";
	}
	
	//学生修改自己个人信息--修改基本密码
	public String updateStuKey() {
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		Userinfo userinfo = (Userinfo) list.get(0);
		userinfo.setRealname(password);
		userinfoService.update(userinfo);
		
		ActionContext ac = ActionContext.getContext();
		ac.getSession().put("loginuser", userinfo);
		
		return "success";
	}
	
	
	
	// 视觉档案
	public String stuPersonalVisionInfo() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Visioncheck v where v.username=?";
			String[] values = new String[] { u.getUsername() };
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();

			if (list.size() <= 0) {
				this.pageBean = visioncheckService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	// 授权专家
	public String stuAuthorizedSpecialist() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Authorizerelation a,Userinfo u where a.username=? and a.specialistName=u.username";
			// String hql = "from Authorizerelation a where a.username=?";
			String[] values = new String[] { u.getUsername() };
			list = authorizerelationService.findInfo(hql, values);

			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	// 删除授权关系
	public String delAuthorizerelation() {
		Authorizerelation authorizerelation = new Authorizerelation();
		authorizerelation.setId(id);
		authorizerelationService.delete(authorizerelation);

		String hql = "from Authorizerelation a,Userinfo u where a.username=? and a.specialistName=u.username";
		// String hql = "from Authorizerelation a where a.username=?";

		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		String[] values = new String[] { u.getUsername() };

		list = authorizerelationService.findInfo(hql, values);
		StringBuilder json = new StringBuilder();
		json.append("[");
		if (list != null && list.size() > 0) {
			Iterator it = list.iterator();
			while (it.hasNext()) {
				Object[] obj = (Object[]) it.next();
				Authorizerelation au = (Authorizerelation) obj[0];
				Userinfo userinfo = (Userinfo) obj[1];
				json.append("{\"id\":\"");
				json.append(au.getId().toString());
				json.append("\",");
				json.append("\"specialistName\":\"");
				json.append(au.getSpecialistName().toString());
				json.append("\",");
				json.append("\"realname\":\"");
				json.append(userinfo.getRealname().toString());
				json.append("\",");
				json.append("\"gender\":\"");
				json.append(userinfo.getGender().toString());
				json.append("\",");
				json.append("\"age\":\"");
				json.append(userinfo.getAge().toString());
				json.append("\"},");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		stuResult = json.toString();
		// stuResult = JsonUtil.listToJson(list);
		System.out.println(stuResult);
		return SUCCESS;
	}

	// 学生申请专家同意
	public String studentApplyExpert() {

		try {
			String h = "from Authorizerelation";
			list = authorizerelationService.findAll(h);
			if (list.size() <= 0) {
				h = "from Userinfo u where u.level=?";
				String[] value = new String[] { "专家" };
				this.pageBean = userinfoService.querySearchForPage(10, 1, h, value);
				list = this.pageBean.getList();
				stuResult = JsonUtil.listToJson(list);
				return "success";
			}
			String hql = "select distinct u from Userinfo u,Authorizerelation a where u.level=? and u.username NOT IN(SELECT a.specialistName FROM a WHERE a.username=? )"; // 查询语句
			String[] values = new String[2];
			values[0] = "专家";

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			values[1] = u.getUsername();
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			List li = pageBean.getList();
			if (li.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, 1, hql, values);
				li = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}

			list = li;
			stuResult = JsonUtil.listToJson(list);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String studentInsertAuthorizerelation() {
		try {
			Authorizerelation authorizerelation = new Authorizerelation();
			authorizerelation.setIsAgreed("否");
			authorizerelation.setSpecialistName(specialname);
			// /获取session的参数

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			authorizerelation.setUsername(u.getUsername());
			authorizerelationService.save(authorizerelation);

			String hql = "select distinct u from Userinfo u,Authorizerelation a where u.level=? and u.username NOT IN(SELECT a.specialistName FROM a WHERE a.username=? )"; // 查询语句
			String[] values = new String[2];
			values[0] = "专家";
			values[1] = u.getUsername(); // 取得当前登录名
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			List l = pageBean.getList();
			if (l.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
				l = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			list = l;
			stuResult = JsonUtil.listToJson(list);
			System.out.println(stuResult);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	public String stuPersonalVisionInfoNewest() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Visioncheck v where v.username=? order by CheckTime desc";
			String[] values = new String[] { u.getUsername() };
			list = visioncheckService.queryOnePage(hql, values, 0, 1);
			Visioncheck visioncheck = null;
			if(list.size()>0){
				visioncheck=(Visioncheck)list.get(0);
//				return "success";
			}
//			else{
//				return null;
//			}
			ActionContext ac = ActionContext.getContext();
			ac.put("visioncheck", visioncheck);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String allParent() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			String hql = "from Userinfo u where u.level=? and u.guardianName=?";
			String[] values = new String[] { "家长",u.getUsername() };
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	//修改、删除监护人信息 2016.5.12
//	public String modifyParentInfo() {
//		System.out.println("This is modifyParentInfo() of StudentAction!");
//		System.out.println("参数username为"+username);
//		try {
//			req = ServletActionContext.getRequest();
//			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			
//			String hql = "from Userinfo u where u.level=? and u.guardianName=?";
//			String[] values = new String[] { "家长",u.getUsername() };
//			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
//			list = pageBean.getList();
//			if (list.size() <= 0) {
//				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
//				list = pageBean.getList();
//				this.pageBean.setTotalPage(1);
//				this.pageBean.setCurrentPage(1);
//			}
//			return SUCCESS;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	public String delParentInfo() {
		System.out.println("This is delParentInfo() of StudentAction!");
		System.out.println("要删除的是username为"+username);

		
		//用于处理“删除”监护人操作，实际上是修改要“删除”的用户的监护人信息为空
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		
		List templist = userinfoService.findInfo(hql, values);
		if(templist.size()>0){
			Userinfo userinfo = (Userinfo) templist.get(0);
			userinfo.setGuardianName("");
			userinfoService.update(userinfo);
		}
		System.out.println("成功删除保存监护人信息！");
		
		
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		
		String hql2 = "from Userinfo u where u.level=? and u.guardianName=?";
		String[] values2 = new String[] { "家长",u.getUsername() };
		this.pageBean = userinfoService.querySearchForPage(10, page, hql2, values2);
		list = pageBean.getList();
		
		if (list.size() <= 0) {
			this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql2, values2);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		stuResult = JsonUtil.listToJson(list);
		return SUCCESS;
	}
	
	
	
	public String updateParent() {
		System.out.println("This is updateParent() of StudentAction!guardianName为: "+guardianName);
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			String hql = "from Userinfo u where u.username=?";
			String[] values = new String[] { u.getUsername() };
			
			list = userinfoService.findInfo(hql, values);
			Userinfo userinfo = (Userinfo) list.get(0);
			userinfo.setGuardianName(guardianName);
			userinfoService.update(userinfo);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String stuPersInfo() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			String hql = "from Userinfo u where u.username=?";
			String[] values = new String[] { u.getUsername() };
			
			list = userinfoService.findInfo(hql, values);
			Userinfo userinfo = (Userinfo) list.get(0);
			
			ActionContext ac = ActionContext.getContext();
			ac.getSession().put("loginuser", userinfo);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String searchParentInfo() {
		try {
			String hql = "from Userinfo u where u.level=? and username=?";
			String[] values = new String[] { "家长",username};
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			stuResult = JsonUtil.listToJson(list);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String myParentsInfo() {
		System.out.println("This is myParentsInfo() of StudentAction!");
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		
		try {
			String hql = "from Userinfo u where u.guardianName=?";
			String[] values = new String[] { u.getUsername()};
			
			List templist = userinfoService.findInfo(hql, values);
			
			
			if(templist.size()>0){
				String hql2 = "from Userinfo u where u.username=?";
				Userinfo userinfo = (Userinfo) list.get(0);
				String[] values2 = new String[] { userinfo.getGuardianName()};
				this.pageBean = userinfoService.querySearchForPage(10, page, hql2, values2);
				list = pageBean.getList();
			}
//			if (list.size() <= 0) {
//				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
//				list = pageBean.getList();
//				this.pageBean.setTotalPage(1);
//				this.pageBean.setCurrentPage(1);
//			}
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

}
