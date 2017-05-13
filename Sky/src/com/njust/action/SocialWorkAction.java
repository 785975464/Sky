package com.njust.action;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import check.judgeNumber;

import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.domain.Visioncheck;
import com.njust.service.SchoolinfoService;
import com.njust.service.UserinfoService;
import com.njust.service.UserroleService;
import com.njust.service.VisioncheckService;
import com.njust.servlet.getMD5;
import com.njust.servlet.getMD5_2;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("rawtypes")
public class SocialWorkAction extends ActionSupport {
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
	private int manageCommunity;
	private String grade;
	private String stuClass;
	private String idNumber;
	private String nation;
	private String height;
	private String weight;

	private String stuResult; // 反馈给ajax的json对象---用于list
	private String delResult;	//用于测试删除结果
	private List list,list2,loadlist;		//list2用于存放学校列表
	private PageBean pageBean;
	private UserinfoService userinfoService;
	private UserroleService userroleService;
	private VisioncheckService visioncheckService;
	private SchoolinfoService schoolinfoService;
	private int page; // 第几页
	private String msg;
	private String specialistName;
	private String loadsql,loadvalues;	//用于下载文件，2016-05-17
	
	private File uploadfile;// 上传的文件
	public File getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	public int getSchool() {
		return school;
	}

	public void setSchool(int school) {
		this.school = school;
	}
	
	public int getManageCommunity() {
		return manageCommunity;
	}

	public void setManageCommunity(int manageCommunity) {
		this.manageCommunity = manageCommunity;
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
		this.password = password;
//		this.password = getMD5.makeMD5(password);
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
	public List getList2() {
		return list2;
	}
	public void setList2(List list2) {
		this.list2 = list2;
	}
	public List getLoadlist() {
		return loadlist;
	}
	public void setLoadlist(List loadlist) {
		this.loadlist = loadlist;
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
	
	public void setVisioncheckService(VisioncheckService visioncheckService) {
		this.visioncheckService = visioncheckService;
	}
	public void setSchoolinfoService(SchoolinfoService schoolinfoService) {
		this.schoolinfoService = schoolinfoService;
	}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getLoadsql() {
		return loadsql;
	}

	public void setLoadsql(String loadsql) {
		this.loadsql = loadsql;
	}

	public String getLoadvalues() {
		return loadvalues;
	}

	public void setLoadvalues(String loadvalues) {
		this.loadvalues = loadvalues;
	}
	
	//2017.4.21重构
	public void communityInfo() {
		try {
			System.out.println("This is SocialWorkAction communityInfo()!");
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String hql0 ="from Userinfo u where u.level in(?,?) and u.address=?";
			
//			String hql = "select u.username,u.realname,u.gender,u.age,u.school,u.community " +
//					" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName " +
//						" from Userinfo u " +
//						" where u.community=?";
			
//			String hql =" from Userinfo u " +
//						" where u.level in(?,?) and u.community=?";
			
			
			String[] userPropvalues={"username","realname","gender","age","school","manageCommunity","grade","stuClass","nation","height","weight","guardianName"};
			String[] visionPropvalues={"visionlevel"};
			String[] schoolPropvalues={"schoolname"};
			
			String hql = "select ";
			if(userPropvalues.length>0){
				hql+="u."+userPropvalues[0];
			}
			int i;
			for(i=1;i<userPropvalues.length;i++){
				hql+=",u."+userPropvalues[i];
			}
			for(i=0;i<visionPropvalues.length;i++){
				hql+=",v."+visionPropvalues[i];
			}
			for(i=0;i<schoolPropvalues.length;i++){
				hql+=",s."+schoolPropvalues[i];
			}
			hql +=" from Userinfo u, Visioncheck v, Schoolinfo s " +
					" where u.level in(?,?) and u.manageCommunity=? and u.isDeleted=0 and u.username = v.username and u.school=s.schoolid and v.tableId in " +
					"( " +
						" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
						" where u.level in(?,?) and u.manageCommunity=? and u.isDeleted=0 and u.username = v.username and u.school=s.schoolid " +
						" group by u.username " +
					")" +
					" group by u.username "; // 查询语句，以地址区分 
			
			
			
			
			
//			System.out.println("当前用户的社区为："+u.getCommunity());
//			Object[] values = new Object[] { "学生" , "家长" , u.getCommunity() };
			Object[] values = new Object[] { "学生" , "家长" , u.getManageCommunity() , "学生" , "家长" , u.getManageCommunity()  };
			list = userinfoService.findInfo(hql,values);
//			String listjson = JsonUtil.listToJson(list);
			//创建自定义对象转json方法
			String listjson = JsonUtil.myListToJson(list,userPropvalues,visionPropvalues,schoolPropvalues);
//			System.out.println(listjson);
			
//			Map datalist =  new HashMap();
//			datalist.put("data", listjson);
//			datalist.put("draw", "");
//			datalist.put("recordsTotal", listjson.length());
//			datalist.put("recordsFiltered", listjson.length());
			
			String jsonstring="{\"data\":"+listjson+",\"draw\":\"1\",\"recordsTotal\":"+list.size()+",\"recordsFiltered\":"+list.size()+"}";
			
			ServletActionContext.getResponse().getWriter().write(jsonstring);  //以这种方式传值json
//			return "success";
		} catch (Exception e) {
			e.printStackTrace();
//			return null;
			return;
		}
	}
	
//	public String communityInfo() {
//		try {
//			System.out.println("This is SocialWorkAction communityInfo()!");
//			req = ServletActionContext.getRequest();
//			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String hql ="from Userinfo u where u.level in(?,?) and u.address=?";
//			//System.out.println("当前用户的地址为："+u.getAddress());
//			/**
//			String hql = "select u.username,u.realname,u.gender,u.age,u.school," +
//					" u.grade,u.stuClass,u.nation,u.height,u.weight,u.guardianName,v.visionlevel " +
//						" from Userinfo u, Visioncheck v " +
//						" where u.level in(?,?) and u.address=? and u.username = v.username and v.tableId in " +
//						"( " +
//							" select MAX(v.tableId) from Userinfo u, Visioncheck v " +
//							" where u.level in(?,?) and u.address=? and u.username = v.username " +
//							" group by u.username " +
//						")" +
//						" group by u.username "; // 查询语句，以地址区分 
//			**/
//			String address = "";
//			String[] ads = u.getAddress().toString().split(",，");
//			for(int i=0;i<ads.length-1;i++){
//				address+=ads[i]+",";
//			}
//			address+=ads[ads.length-1];
//			System.out.println("address为："+address);
//
//			String[] values = new String[] { "学生" , "家长" , address };
//			
//			//ActionContext ac = ActionContext.getContext();		//查找用户的视觉等级
//			//list = visioncheckService.findInfo(hql, values);
//			//Visioncheck visioncheck = (Visioncheck) list.get(0);
//			//ac.put("visioncheck", visioncheck);
//			
//			//保存查询语句
//			loadsql=hql;
//			loadvalues="";
//			for(int i=0;i<values.length;i++){
//				loadvalues+=values[i]+"|";
//			}
//			
//			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
//			list = pageBean.getList();
//			System.out.println("list.size()为"+list.size());
//			for(int i=0;i<list.size();i++){
//				Userinfo userinfo = (Userinfo) list.get(i);
//				//System.out.println("第"+i+"个："+userinfo.getRealname());
//			}
//			if (list.size() <= 0) {
//				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
//				list = pageBean.getList();
//				this.pageBean.setTotalPage(1);
//				this.pageBean.setCurrentPage(1);
//			}
//			
//			
//			String[] tempads = address.split(",");
//			String hql2=" select s.schoolname from Schoolinfo s, Addressinfo a " +
//						" where s.addressid=a.addressid and a.district=? and a.street=? and a.community=?";			// a.district=? and a.street=? and
////			String[] values2 = new String[] { address.split(",")[address.split(",").length-1] };
//			String[] values2 = new String[] { tempads[0]+","+tempads[1]+","+tempads[2] , tempads[3] , tempads[4] };
//			list2 = schoolinfoService.findInfo(hql2,values2);	//list2用于存放学校列表 2016-1-10
//			System.out.println("list2.size()为"+list2.size());
//			return "success";
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
	public String createCommunityInfo(){
		System.out.println("This is createCommunityInfo() of SocialWorkAction!");
		String hql2="from Schoolinfo";
		list2 = schoolinfoService.findAll(hql2);	//list2用于存放学校列表 2016-1-10
		/**
		for(int i=0;i<list2.size();i++){
			System.out.println(list2.get(i));
		}
		**/
		return "success";
	}
	public String addCommunityInfo() {
		try {
			Userinfo userinfo = new Userinfo();
			userinfo.setUsername(username);
			//userinfo.setPassword(username);
			String pw = getMD5.makeMD5("000000");
			userinfo.setPassword(pw);
			userinfo.setLevel("学生");
			userinfo.setEnabled(true);
			userinfo.setAccountNonExpired(true);
			userinfo.setCredentialsNonExpired(true);
			userinfo.setAccountNonLocked(true);
			userinfo.setRealname(realname);
			userinfo.setGender(gender);
			userinfo.setAge(age);
			//userinfo.setAddress(address);
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			userinfo.setAddress(u.getAddress());
			System.out.println("u.getAddress()为："+u.getAddress());
			
			userinfo.setPhone(phone);
			userinfo.setEmail(email);
			userinfo.setGuardianName(guardianName);
			//userinfo.setSchool(u.getSchool());
			userinfo.setSchool(school);
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

	public String checkCommunityInfo() {
		try {
			String hql = "from Userinfo u where u.username=?";
			String[] values = new String[1];
			values[0] = username;
			list = userinfoService.findInfo(hql, values);

			if (list.size() > 0) {
				msg = "该ID已存在";
			} else {
				msg = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String searchCommunityInfo() {
		try {
			System.out.println("This is searchCommunityInfo() of SocialWorkAction!");
			//System.out.println("接收到的参数为：school:"+school+"\trealname:"+realname+"\tphone:"+phone);
			String hql="from Userinfo u where u.level in(?,?) ";//and u.address=? ";
			//String[] values;// = new String[];
			ArrayList<Object> namelist =new ArrayList<Object>();
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			namelist.add("学生");
			namelist.add("家长");
			//System.out.println("u.getAddress()值为："+u.getAddress());
			//namelist.add(u.getAddress());

//			school = java.net.URLDecoder.decode(school,"UTF-8");
			realname = java.net.URLDecoder.decode(realname,"UTF-8");
//			if(school!=null && !school.equals("")){
			if(school!=0){
				hql+=" and u.school = ? ";
				namelist.add(school);
				System.out.println("数组中有School！值为："+school);
			}
			else{
				hql+=" and u.address=? ";
				namelist.add(u.getAddress());
			}
			if(realname!=null && !realname.equals("")){
				hql+=" and u.realname like ? ";
				namelist.add("%"+realname+"%");
				System.out.println("数组中有Realname！值为："+realname);
			}
			if(phone!=null && !phone.equals("") ){		// && !username.equals(u.getUsername())
				hql+=" and u.phone = ? ";
				namelist.add(phone);
				System.out.println("数组中有phone！值为："+phone);
				
			}
			//values = (String[])namelist.toArray();
			//values = (String[])namelist.toArray(new String[0]);
			
			Object[] values = new Object[namelist.size()];
			System.out.println("namelist size 为："+namelist.size());
			for(int i=0;i<namelist.size();i++){
				//System.out.println("执行第"+i+"次循环！");
				values[i]=namelist.get(i);
				//System.out.println("values["+i+"]为："+values[i]);
			}
			
			//System.out.println("Grade:"+grade);
			//System.out.println("StuClass:"+stuClass);
			System.out.println("School:"+school);
			System.out.println("Realname:"+realname);
			System.out.println("Phone:"+phone);
			//System.out.println(u.getUsername());

//			this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow() , page, hql, values);
			this.pageBean = userinfoService.querySearchForPage(10 , page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
//				this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow(), 1, hql, values);
				this.pageBean = userinfoService.querySearchForPage(10, page-1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}

			//stuResult = JsonUtil.listToJson(list);
			// System.out.println(stuResult);
			
			loadsql=hql;
			loadvalues="";
			for(int i=0;i<values.length;i++){
				System.out.println("searchCommunityInfo中values为："+((String) values[i]).replace("%", "%25"));
					loadvalues+=((String) values[i]).replace("%", "%25")+"|";		//避免“%”符号在传输过程中被转义
			}
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String delCommunityInfo() {
		System.out.println("This is delCommunityInfo() of SocialWorkAction!");
		System.out.println("要删除的是username为"+username);
		//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		//System.out.println("u.getUsername()为："+u.getUsername());
		
		//Userinfo user = (Userinfo) req.getSession().getAttribute("loginuser");
		//System.out.println("user.getUsername()为："+user.getUsername()+"要删除的是username为"+username);
		
		
		/**
		
		if( u.getUsername().equals(username)){
			System.out.println("该用户不得删除！");
			//this.addActionMessage("删除失败！");
			return null;
		}
		**/
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
			return null;
		}
		delResult = "删除成功！";
		//System.out.println("删除成功！");
		//delResult = "{\"serverMsg\":\"后台消息：删除成功！\"}";
		
		//删除该用户的所有视觉档案
		String hql2 = "from Visioncheck v where v.username=?";
		String[] val2 = new String[] { username };
		try{
			List templist = visioncheckService.findInfo(hql2, val2);
			for(int i=0;i<templist.size();i++){
				Visioncheck tempv = (Visioncheck) templist.get(i);
				visioncheckService.delete(tempv);
			}
			//delResult += "删除档案也成功！";
		}
		catch (Exception e) {
			System.out.println("删除用户"+username+"视觉档案时错误！");
			e.printStackTrace();
		}
		
		hql = "from Userinfo u where u.level in (?,?) and u.address=?"; // 查询语句
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		//System.out.println("u.getUsername()为："+u.getUsername());

		String[] values = new String[] { "学生", "家长" , u.getAddress().toString() };
		
		this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = userinfoService.querySearchForPage(10, 1, hql, values);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		stuResult = JsonUtil.listToJson(list);
		return SUCCESS;
	}

	public String modifyCommunityInfo() {
//		System.out.println("This is modifyCommunityInfo() of SocialWorkAction!");
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		if(list.size()>0){
			Userinfo userinfo = (Userinfo) list.get(0);

//			String hql2 = "from Addressinfo a where a.addressId=?";
//			Object[] values2 = new Object[] { userinfo.getManagecommunity() };
//			list = userinfoService.findInfo(hql2, values2);
//			Addressinfo addressinfo = (Userinfo) list.get(0);
			
			ActionContext ac = ActionContext.getContext();
			ac.put("userinfo", userinfo);
			return "success";
		}
		return null;
	}

	public void updateCommunityInfo() {
		System.out.println("This is updateCommunityInfo() of SocialWorkAction! username is:"+username+" & manageCommunity is:"+manageCommunity);
		String message=null;
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		try {
			list = userinfoService.findInfo(hql, values);
			if(list.size()==1){
				Userinfo userinfo = (Userinfo) list.get(0);
				userinfo.setRealname(realname);
				userinfo.setGender(gender);
				userinfo.setAge(age);
				userinfo.setAddress(address);
				userinfo.setPhone(phone);
				userinfo.setEmail(email);
				userinfo.setGuardianName(guardianName);
		
				//req = ServletActionContext.getRequest();
				//req.getSession().getAttribute("loginuser");
				//userinfo.setSchool(u.getSchool());
				userinfo.setSchool(school);
				userinfo.setManageCommunity(manageCommunity);
				userinfo.setGrade(grade);
				userinfo.setStuClass(stuClass);
				userinfo.setIdNumber(idNumber);
				userinfo.setNation(nation);
				userinfo.setHeight(height);
				userinfo.setWeight(weight);
		
				userinfoService.update(userinfo);
				message="更新成功！";
			}
		
			
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			message="更新异常！";
		}finally{
			try {
				ServletActionContext.getResponse().getWriter().write(JsonUtil.msgToJson(message));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("输出结果异常！");
				message="输出结果异常！";
			}
		}
//		return "success";
	}

	public String parentCommunityInfo() {
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
	
/****/
	public String phonelogin() {
		if(phone == null || password == null){
			return "error";
		}
		//更改登录方式 2016-05-19
		String hql = "from Userinfo u where u.phone=? and u.password=? ";
		String pw = getMD5_2.toMD5(password);
		String[] values = new String[] { phone,pw };
		List templist = userinfoService.findInfo(hql, values);
		System.out.println("This is phonelogin() of SocialWorkAction!and the phone="+phone+"\t"+password+"\t"+pw);
//		System.out.println("templist.size()为:"+templist.size());
		String prompt;	//提示信息
		if (templist.size() > 0) {
			Userinfo userinfo = new Userinfo();
			userinfo = (Userinfo) templist.get(0);
			
			String hql2 = "from Visioncheck v where v.username=? order by v.checkTime desc";
			String[] values2 = new String[] { userinfo.getUsername() };
//			list = visioncheckService.findInfo(hql2, values2);

			
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql2, values2);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql2, values2);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
				
				prompt="暂无视觉档案！";
			}
			else{
				Visioncheck vc=(Visioncheck)list.get(0);
				System.out.println("最新档案为："+vc.getVisionlevel());
				String recheckresult = getRecheckTime(vc.getCheckTime(),vc.getVisionlevel());
				if(recheckresult.contains("异常")){
					prompt=recheckresult;
				}
				else{
					prompt="您的复查时间为"+recheckresult+"，请您尽快前往就近服务站进行复查！";
				}
			}
			
			
			ActionContext ac = ActionContext.getContext();
			ac.getSession().put("loginuser", userinfo);
			ac.put("prompt", prompt);
			return SUCCESS;
		}
		else{
			return ERROR;
		}
	}

	public String phonefirstlogin() {
//		Authentication au = SecurityContextHolder.getContext().getAuthentication();
//		String username = au.getName();
		if(phone == null || idNumber == null || password == null){
			return "error";
		}
		String hql = "from Userinfo u where u.phone=? and u.idNumber=? and u.password=?";
		String pw = getMD5_2.toMD5(password);
		String[] values = new String[] { phone,idNumber,pw };
		list = userinfoService.findInfo(hql, values);
		System.out.println("This is phonefirstlogin() of SocialWorkAction!and the phone="+phone+"\t"+idNumber+"\t"+pw);
		System.out.println("list.size()为:"+list.size());
		if (list.size() > 0) {
			Userinfo userinfo = new Userinfo();
			userinfo = (Userinfo) list.get(0);

			ActionContext ac = ActionContext.getContext();
			ac.getSession().put("loginuser", userinfo);
			return SUCCESS;
		}
		else{
			return ERROR;
		}
	}
	
	public String updatePhoneLoginInfo() {
		System.out.println("This is updatePhoneLoginInfo() of SocialWorkAction!");
		System.out.println("the phone="+phone+"\t"+"idNumber="+idNumber+"\t"+"password="+password);
		
		String hql = "from Userinfo u where u.phone=? and u.idNumber=?";
		String pw = getMD5_2.toMD5(password);
		String[] values = new String[] { phone,idNumber };
		List templist = userinfoService.findInfo(hql, values);
		if(templist.size()>0){
			Userinfo userinfo = (Userinfo) templist.get(0);
			userinfo.setPassword(pw);
			userinfoService.update(userinfo);
			
			String hql2 = "from Visioncheck v where v.username=? order by v.checkTime desc";
			String[] values2 = new String[] { userinfo.getUsername() };
			
			this.pageBean = visioncheckService.querySearchForPage(10, page, hql2, values2);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql2, values2);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
		}
		else{
			return "error";
		}
	}
	public String getRecheckTime(String date,String level) {
		System.out.println("参数为：" + date+" "+level);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String prompt="您的最新视觉档案异常，请尽快前往就近服务站进行复查！";
		try {
			Date dnow = df.parse(date);
			Calendar calendar = Calendar.getInstance(); //得到日历
			calendar.setTime(dnow);//把当前时间赋给日历
			
			if(level.equals("预警")){
				calendar.add(calendar.MONTH, 2);  //设置为后2月
			}
			else if(level.equals("正常") || level.equals("异常") || level.equals("亚健康")){
				calendar.add(calendar.MONTH, 3);  //设置为后3月
			}
			else{
//				calendar.add(calendar.MONTH, 0);  //设置为后0月
				return prompt;
			}
			
			Date dLater = calendar.getTime();   //得到前3月的时间
			String dlater = df.format(dLater);    //格式化前3月的时间

			System.out.println("复查时间是：" + dlater);
			return dlater;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			//System.out.println("日期出错！");
			return prompt;
		}
		
	}


}
