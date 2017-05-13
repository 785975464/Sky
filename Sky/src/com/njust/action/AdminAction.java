package com.njust.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.service.UserinfoService;
import com.njust.service.UserroleService;
import com.njust.servlet.getMD5;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("rawtypes")
public class AdminAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest req;
	
	private String username;
	private String password;
	private String realname;
	private String gender;
	private String age;
	private String address;
	private String phone;
	private String email;
	private String guardianName;
	// /
	private int school;
	private String grade;
	private String stuClass;
	private String idNumber;
	private String nation;
	private String height;
	private String weight;

	private String stuResult; // 反馈给ajax的json对象---用于list
	private String delResult;	//用于测试删除结果
	private List list;
	private PageBean pageBean;
	private UserinfoService userinfoService;
	private UserroleService userroleService;
	private int page; // 第几页
	private String msg;

	private String specialistName;

	public int getSchool() {
		return school;
	}

	public void setSchool(int school) {
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

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
//		String pw = getMD5.makeMD5(password);
//		this.password = getMD5.makeMD5(password);
		this.password = password;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	@JSON(name = "MSG")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

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

	public String getGuardianName() {
		return guardianName;
	}

	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
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

	@JSON(name = "STURESULT")
	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}
	
	@JSON(name = "DELRESULT")
	public String getDelResult() {
		return delResult;
	}

	public void setDelResult(String delResult) {
		this.delResult = delResult;
	}
	
	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}

	public void setUserroleService(UserroleService userroleService) {
		this.userroleService = userroleService;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String stuInfo() {
		try {
			System.out.println("This is stuInfo() of AdminAction!");
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Userinfo u where u.level=?"; // 查询语句
			String[] values = new String[] { "学生" };
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String socialWorkerInfo() {
		try {
			System.out.println("This is socialWorkerInfo() of AdminAction!");
			//req = ServletActionContext.getRequest();
			//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Userinfo u where u.level=?"; // 查询语句
			String[] values = new String[] { "社工" };
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String schoolDocInfo() {
		try {
			System.out.println("This is schoolDocInfo() of AdminAction!");
			//req = ServletActionContext.getRequest();
			//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Userinfo u where u.level=?"; // 查询语句
			String[] values = new String[] { "校医" };
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String addStuInfo() {
		try {
			Userinfo userinfo = new Userinfo();
			userinfo.setUsername(username);
			String pw = getMD5.makeMD5(username);
			userinfo.setPassword(pw);
//			userinfo.setPassword(username);
			userinfo.setLevel("学生");
			userinfo.setEnabled(true);
			userinfo.setAccountNonExpired(true);
			userinfo.setCredentialsNonExpired(true);
			userinfo.setAccountNonLocked(true);
			userinfo.setRealname(realname);
			userinfo.setGender(gender);
			userinfo.setAge(age);
			userinfo.setAddress(address);
			userinfo.setPhone(phone);
			userinfo.setEmail(email);
			userinfo.setGuardianName(guardianName);

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			userinfo.setSchool(u.getSchool());
			userinfo.setGrade(grade);
			userinfo.setStuClass(stuClass);
			userinfo.setIdNumber(idNumber);
			userinfo.setNation(nation);
			userinfo.setHeight(height);
			userinfo.setWeight(weight);
			userinfo.setCreater(u.getUsername());
			userinfo.setManager(u.getUsername());
			userinfoService.save(userinfo);

			Userrole userrole = new Userrole();
			userrole.setUsername(username);
			userrole.setRoleId(1);
			userroleService.save(userrole);

			
			ActionContext ac = ActionContext.getContext();
			ac.getSession().put("new_username", username);

			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String checkStuInfo() {
		try {
			String hql = "from Userinfo u where u.username=?";
			String[] values = new String[1];
			values[0] = username;
			list = userinfoService.findInfo(hql, values);

			if (list.size() > 0) {
				msg = "该学号已存在";
			} else {
				msg = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String searchAllStuInfo() {
		delResult = "";
		try {
			System.out.println("This is searchAllStuInfo() of AdminAction! And the username is:"+username);
			
			//String hql="from Userinfo u where u.level=? and u.school=? ";
			String hql="from Userinfo u where u.level=? ";
			//String[] values;// = new String[];
			ArrayList<String> namelist =new ArrayList<String>();
			
			//req = ServletActionContext.getRequest();
			//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			namelist.add("学生");
			//namelist.add(u.getSchool());
			//System.out.println("This is searchStuInfo()!and u.username is:"+u.getUsername());
			
			if(grade!=null && !grade.equals("")){
				hql+=" and u.grade=? ";
				namelist.add(grade);
				System.out.println("数组中有Grade！值为："+grade);
			}
			if(stuClass!=null && !stuClass.equals("")){
				hql+=" and u.stuClass=? ";	//and
				namelist.add(stuClass);
				System.out.println("数组中有StuClass！值为："+stuClass);
				
			}
			if(realname!=null && !realname.equals("")){
				hql+=" and u.realname like ? ";
				namelist.add("%"+realname+"%");
				System.out.println("数组中有Realname！值为："+realname);
				
			}
			/**
			if(username!=null && !username.equals("") && !username.equals(u.getUsername()) ){
				hql+=" and u.username=? ";
				namelist.add(username);
				System.out.println("数组中有username！值为："+username);
				
			}
			**/
//			if(school!=null && !school.equals("") ){			//查询学校信息 2015-12-14
			if(school!=0){
				hql+=" and u.school like ? ";
				namelist.add("%"+school+"%");
				System.out.println("数组中有school！值为："+school);
				
			}
			
			//values = (String[])namelist.toArray();
			//values = (String[])namelist.toArray(new String[0]);
			
			String[] values = new String[namelist.size()];
			//values = namelist.toArray(values);
			System.out.println("namelist size 为："+namelist.size());
			for(int i=0;i<namelist.size();i++){
				System.out.println("执行第"+i+"次循环！");
				values[i]=namelist.get(i);
				System.out.println(values[i]);
			}
			

			//String hql = "from Userinfo u where u.stuClass like '#?#' and u.level=? and u.school=?";	// and u.level=? and u.school=?
			//String hql = "from Userinfo u where u.stuClass=? and u.level=? and u.school=?";
			//String hql = "from Userinfo u where u.username=? and u.level=? and u.school=?";
			//String[] values = new String[] {u.getStuClass(),"学生", u.getSchool() };
			//System.out.println("u.getStuClass:"+u.getStuClass());		//null
			System.out.println("Grade:"+grade);
			System.out.println("StuClass:"+stuClass);
			System.out.println("Realname:"+realname);
			System.out.println("Username:"+username);
			//System.out.println(u.getUsername());
			//String[] values = new String[] {u.getStuClass(),"学生" };	
			//String[] values = new String[] {stuClass, "学生" , u.getSchool() };
			this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow() , page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow(), 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}

			stuResult = JsonUtil.listToJson(list);
			// System.out.println(stuResult);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String delAdminStuInfo() {
		System.out.println("This is delAdminStuInfo() of AdminAction!");
		
		String hql = "from Userinfo u where u.username=?";
		String[] val = new String[] { username };
		try{
			list = userinfoService.findInfo(hql, val);
			Userinfo temp = (Userinfo) list.get(0);
			userinfoService.delete(temp);
	
		}
		catch (Exception e) {
			e.printStackTrace();
			delResult = "删除失败，请重试！";
			System.out.println("删除失败！");
			return null;
		}
		delResult = "删除成功！";
		System.out.println("删除成功！");
		
		hql = "from Userinfo u where u.level=? ";//and u.school=?"; // 查询语句
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		String[] values = new String[] { "学生" };	//, u.getSchool().toString()

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
	}
	//处理删除社工
	public String delAdminSocialInfo() {
		System.out.println("This is delAdminSocialInfo() of AdminAction!");
		
		String hql = "from Userinfo u where u.username=?";
		String[] val = new String[] { username };
		try{
			list = userinfoService.findInfo(hql, val);
			Userinfo temp = (Userinfo) list.get(0);
			userinfoService.delete(temp);
		}
		catch (Exception e) {
			e.printStackTrace();
			delResult = "删除社工失败，请重试！";
			System.out.println("删除社工失败！");
			return null;
		}
		delResult = "删除社工成功！";
		System.out.println("删除社工成功！");
	
		hql = "from Userinfo u where u.level=? "; // 查询语句
		req = ServletActionContext.getRequest();
		//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		String[] values = new String[] { "社工" };

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
	}
	
	//处理删除校医
		public String delAdminDoctorInfo() {
			System.out.println("This is delAdminDoctorInfo() of AdminAction!");
			
			String hql = "from Userinfo u where u.username=?";
			String[] val = new String[] { username };
			try{
				list = userinfoService.findInfo(hql, val);
				Userinfo temp = (Userinfo) list.get(0);
				userinfoService.delete(temp);
			}
			catch (Exception e) {
				e.printStackTrace();
				delResult = "删除校医失败，请重试！";
				System.out.println("删除校医失败！");
				return null;
			}
			delResult = "删除校医成功！";
			System.out.println("删除校医成功！");
		
			hql = "from Userinfo u where u.level=? "; // 查询语句
			req = ServletActionContext.getRequest();
			//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String[] values = new String[] { "校医" };

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
		}
		
	public String modifyAdminStuInfo() {		//管理员界面，处理学生、社工修改操作
		System.out.println("This is modifyAdminStuInfo() of AdminAction!");
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		Userinfo userinfo = (Userinfo) list.get(0);

		ActionContext ac = ActionContext.getContext();
		ac.put("userinfo", userinfo);
		//System.out.println("userinfo.getLevel()为："+userinfo.getLevel());
		if(userinfo.getLevel().equals("社工")){
			return "community";
		}
		else if(userinfo.getLevel().equals("校医")){
			return "doctor";
		}
		else return "success";
	}
	/**
	public String modifyAdminCommunityInfo() {		//管理员界面，处理社工操作
		System.out.println("This is modifyAdminCommunityInfo() of AdminAction!");
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		Userinfo userinfo = (Userinfo) list.get(0);

		ActionContext ac = ActionContext.getContext();
		ac.put("userinfo", userinfo);
		return "success";
	}
	**/
	public String updateAdminStuInfo() {
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		Userinfo userinfo = (Userinfo) list.get(0);
		userinfo.setRealname(realname);
		userinfo.setGender(gender);
		userinfo.setAge(age);
		userinfo.setAddress(address);
		userinfo.setPhone(phone);
		userinfo.setEmail(email);
		userinfo.setGuardianName(guardianName);

		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		userinfo.setSchool(school);
		userinfo.setGrade(grade);
		userinfo.setStuClass(stuClass);
		userinfo.setIdNumber(idNumber);
		userinfo.setNation(nation);
		userinfo.setHeight(height);
		userinfo.setWeight(weight);

		userinfoService.update(userinfo);
		return "success";
	}

	public String parentStuInfo() {
//		System.out.println("This is parentStuInfo() of AdminAction!and username为："+username);
		try {
			String hql = "from Userinfo u where u.guardianName=?";
			String[] values = new String[] { username };
			list = userinfoService.findInfo(hql, values);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return "success";
	}

	/**
	public String downloadCommunityInfo(){
		System.out.println("This is downloadCommunityInfo() in AdminAction!");
		req = ServletActionContext.getRequest();
		String[] downloadbox = req.getParameterValues("downloadbox");
		for(int i=0;i<downloadbox.length;i++){
			System.out.println(downloadbox[i]);
		}
		try {
			//String hql = "from Addressinfo a";
			//String[] values = new String[] { username };
			
			//list = userinfoService.findInfo(hql, values);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return "success";
	}
	**/
	/**
	public String downloadSingleCommunityInfo(){
		System.out.println("This is downloadSingleCommunityInfo() in AdminAction!");
		req = ServletActionContext.getRequest();
		int addressid = Integer.parseInt(req.getParameter("addressid"));
		System.out.println(addressid);
//		String[] downloadbox = req.getParameterValues("downloadbox");
//		for(int i=0;i<downloadbox.length;i++){
//			System.out.println(downloadbox[i]);
//		}
		try {
			String hql = "from Addressinfo a where a.addressid=?";
			Object[] values = new Object[] { addressid };
			list = userinfoService.findInfo(hql, values);
			if(list.size()>0)
				System.out.println(list.get(0));

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return "success";
	}
**/
}
