package com.njust.action;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Addressinfo;
import com.njust.domain.Messagetext;
import com.njust.domain.News;
import com.njust.domain.Schoolinfo;
import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.service.AddressinfoService;
import com.njust.service.MessageService;
import com.njust.service.MessagetextService;
import com.njust.service.NewsService;
import com.njust.service.SchoolinfoService;
import com.njust.service.UserinfoService;
import com.njust.service.UserroleService;
import com.njust.servlet.getMD5;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdministratorAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String level;
	private String realname;
	private String gender;
	private String age;
	private int school;
	private String address;
	private String phone;
	private String email;
	private String guardianName;
	private String manager;

	private List list;
	private PageBean pageBean;
	private UserinfoService userinfoService;
	private UserroleService userroleService;
	private AddressinfoService addressinfoService;
	private SchoolinfoService schoolinfoService;
	private int page;
	private String msg;

	private String stuResult; // 反馈给ajax的json对象---用于list
	private NewsService newsService;
	private String title;
	private String content;
	private Integer newsid;
	
	private HttpServletRequest req;
	
	private Integer mid;
	private String sendId;
	private String recId;
	private Integer messageId;
	private Integer statue;
	private MessageService messageService;
	

	private String text;
	private String pdate;
	private String sender;
	private String receiver;
	private String senderlevel;
	private String receiverlevel;
	//private String grade;
	private MessagetextService messagetextService;

	
	/*
	private String result;
	@JSON(name = "RESULT")
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	*/
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	@JSON(name = "STURESULT")
	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}
	public Integer getNewsid() {
		return newsid;
	}

	public void setNewsid(Integer newsid) {
		this.newsid = newsid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
//		this.password = getMD5.makeMD5(password);
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
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

	public int getSchool() {
		return school;
	}

	public void setSchool(int school) {
		this.school = school;
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

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
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

	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}

	public void setUserroleService(UserroleService userroleService) {
		this.userroleService = userroleService;
	}

	public void setAddressinfoService(AddressinfoService addressinfoService) {
		this.addressinfoService = addressinfoService;
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

	@JSON(name = "MSG")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getRecId() {
		return recId;
	}

	public void setRecId(String recId) {
		this.recId = recId;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getStatue() {
		return statue;
	}

	public void setStatue(Integer statue) {
		this.statue = statue;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	//新增字段，发送者。接收者 2016-1-4
	
		public String getSender() {
			return this.sender;
		}
		public void setSender(String sender) {
			this.sender = sender;
		}
		public String getReceiver() {
			return this.receiver;
		}
		public void setReceiver(String receiver) {
			this.receiver = receiver;
		}
		
		public String getSenderlevel() {
			return this.senderlevel;
		}
		public void setSenderlevel(String senderlevel) {
			this.senderlevel = senderlevel;
		}
		
		public String getReceiverlevel() {
			return this.receiverlevel;
		}
		public void setReceiverlevel(String receiverlevel) {
			this.receiverlevel = receiverlevel;
		}
		/**
		public String getGrade() {
			return this.grade;
		}
		public void setGrade(String grade) {
			this.grade = grade;
		}
		**/
	
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public void setMessagetextService(MessagetextService messagetextService) {
		this.messagetextService = messagetextService;
	}

	public String allInfo() {
		try {
			String hql = "from Userinfo";
			this.pageBean = userinfoService.querySearchForPage(10, page, hql);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql);
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

	public String checkUser() {
		try {
			String hql = "from Userinfo u where u.username=?";
			String[] values = new String[] { username };
			list = userinfoService.findInfo(hql, values);

			if (list.size() > 0) {
				msg = "该用户已存在";
			} else {
				msg = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addUser() {
		System.out.println("This is addUser() of AdministratorAction!");
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			Userinfo userinfo = new Userinfo();
			userinfo.setUsername(username);
			String pw = getMD5.makeMD5(username);
			userinfo.setPassword(pw);
//			userinfo.setPassword(username);
			userinfo.setLevel(level);
			if(level.equals("社工")){
				System.out.println(username+"的身份为"+level);
				
				String hql = "from Addressinfo a where a.district=? and a.street=? and a.community=?";
				String[] values = new String[] { req.getParameter("province")+","+req.getParameter("city")+","+req.getParameter("town"),req.getParameter("street"),req.getParameter("community") };
				List templist=addressinfoService.findInfo(hql, values);
				if(templist.size()==0){
					Addressinfo addressinfo = new Addressinfo();
					addressinfo.setCommunity(req.getParameter("community"));
					addressinfo.setDistrict(req.getParameter("province")+","+req.getParameter("city")+","+req.getParameter("town"));
					addressinfo.setStreet(req.getParameter("street"));
					addressinfoService.save(addressinfo);
				}
				else{
					System.out.println("已存在该社区！");
				}
			}
			else if(level.equals("校医")){
				System.out.println(username+"的身份为"+level);
				
				String hql = "from Schoolinfo s where s.schoolname=?";
				String[] values = new String[] { req.getParameter("school") };
				List templist=schoolinfoService.findInfo(hql, values);
				if(templist.size()==0){
					Schoolinfo schoolinfo = new Schoolinfo();
					schoolinfo.setSchoolname(req.getParameter("school"));
					schoolinfo.setAddressid(0);
					schoolinfoService.save(schoolinfo);
				}
				else{
					System.out.println("已存在该学校！");
				}
			}
			userinfo.setEnabled(true);
			userinfo.setAccountNonExpired(true);
			userinfo.setCredentialsNonExpired(true);
			userinfo.setAccountNonLocked(true);
			userinfo.setRealname(realname);
			userinfo.setGender(gender);
			userinfo.setAge(age);
			userinfo.setSchool(school);
			userinfo.setAddress(address);
			userinfo.setPhone(phone);
			userinfo.setEmail(email);
			userinfo.setCreater(u.getUsername());
			userinfo.setManager(u.getUsername());
			userinfoService.save(userinfo);

			Userrole userrole = new Userrole();
			userrole.setUsername(username);
			userrole.setRoleId(1);
			userroleService.save(userrole);

			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String stuInfo() {
		try {
			System.out.println("This is stuInfo() of AdministratorAction!and the username is:"+username);
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
	
	//////新闻
	public String findNews(){
		try {
			
//			String h = "from Userinfo";
//			this.pageBean = userinfoService.querySearchForPage(10, page, h);
			String hql = "from News";
			
			this.pageBean = newsService.querySearchForPage(10, page, hql);

			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = newsService.querySearchForPage(10, page - 1, hql);
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
	
	public void findIndexNews(){
		try {
			String hql = "from News order by newsid desc";
//			list = newsService.queryOnePage(hql, 0, 5);
			list = newsService.findAll(hql);
			String listjson = JsonUtil.listToJson(list);
//			System.out.println(listjson);
			
//			listjson =URLDecoder.decode(listjson,"UTF-8");
			ServletActionContext.getResponse().getWriter().write(listjson);  //以这种方式传值json，处理乱码
//			 return listjson;
/*			
 			result = JsonUtil.listToJson(list);	
			System.out.println(result);
			result=result.replaceAll("\r\n", "</p><p>");
			System.out.println(result);
*/
//			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return;
//			return "success";
		}

	}
	
	
	public String findMoreNews(){
		try {
			String hql = "from News order by newsid desc";
			
			this.pageBean = newsService.querySearchForPage(10, page, hql);

			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = newsService.querySearchForPage(10, page - 1, hql);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			
//			result = JsonUtil.listToJson(list);
//			result=result.replaceAll("\r\n", "</p><p>");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public String findNewsByID(){  //查看单条新闻
		try {
			String hql = "from News n where n.newsid=?";
			Integer[] values = new Integer[] { newsid };			
			list = newsService.findInfo(hql, values);
			News news =(News)list.get(0);
			news.setContent(news.getContent().replaceAll("\r\n", "</p><p>")) ;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public String addNews(){
		try {
			News news=new News();
			news.setTitle(title);
			news.setContent(content);
			newsService.save(news);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String delNews(){
		try {
			
			News news=new News();
			news.setNewsid(newsid);
			newsService.delete(news);
			
			
			String hql = "from News "; // 查询语句
			
			this.pageBean = newsService.querySearchForPage(10, page, hql);
			
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = newsService.querySearchForPage(10, page - 1, hql);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			stuResult = JsonUtil.listToJson(list);
//			System.out.println(stuResult);
			return SUCCESS;
	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	public String adminInfo() {
		try {
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String[] values = new String[1];
			values[0] = u.getUsername();
			
			String hql = "from Userinfo u where u.level='管理员' and u.username!=?";		// and u.username!=? 
			this.pageBean = userinfoService.querySearchForPage(10, page, hql,values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page, hql,values);
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

	public String delAdminInfo() {
		String hql = "from Userinfo u where u.username=?";
		String[] val = new String[] { username };
		list = userinfoService.findInfo(hql, val);
		Userinfo temp = (Userinfo) list.get(0);
		userinfoService.delete(temp);

		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		String[] values = new String[1];
		values[0] = u.getUsername();
		
		String h = "from Userinfo u where u.level='管理员' and u.username!=? ";
		this.pageBean = userinfoService.querySearchForPage(10, page, h,values);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = userinfoService.querySearchForPage(10, page, h,values);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		stuResult = JsonUtil.listToJson(list);
		return SUCCESS;
	}

	public String register() {
		try {
			
			Userinfo userinfo = new Userinfo();
			
			userinfo.setUsername(username);
			String pw = getMD5.makeMD5(password);
			userinfo.setPassword(pw);
			userinfo.setLevel("家长");
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
			userinfo.setCreater(username);
			userinfo.setManager(username);
			userinfoService.save(userinfo);

			Userrole userrole = new Userrole();
			userrole.setUsername(username);
			userrole.setRoleId(1);
			userroleService.save(userrole);

			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String modifyManager() {
		try {
			String hql = "from Userinfo u where u.level=?";
			String[] val = new String[] { "校医" };
			list = userinfoService.findInfo(hql, val);
			
			ActionContext ac = ActionContext.getContext();
			ac.getSession().put("uname", username);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String updateManager() {
		try {
			String hql = "from Userinfo u where u.username=?";
			String[] values = new String[] { username };
			list = userinfoService.findInfo(hql, values);
			Userinfo userinfo = (Userinfo) list.get(0);
			userinfo.setManager(manager);
			userinfoService.update(userinfo);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public String publishMessage(){  //群发信息
		try {
			System.out.println("This is publishMessage() of AdministratorAction!");
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			//System.out.println("u.getUsername()为"+u.getUsername()+"\t\tu.getLevel()为："+u.getLevel());	//获取登录信息
			System.out.println("receiverlevel为："+ receiverlevel);

			Messagetext messagetext=new Messagetext();
			messagetext.setText(text);
			Calendar now = Calendar.getInstance();
			String date = now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
			messagetext.setPdate(date);
			messagetext.setSender(u.getUsername());
			messagetext.setSenderlevel(u.getLevel());
			//messagetext.setReceiver("all");
			messagetext.setReceiverlevel(receiverlevel);
			//messagetext.setReceiverlevel("学生");
			messagetextService.save(messagetext);

			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	
	public String listMessage(){  //展示未读的站内信
		System.out.println("This is listMessage() of AdministratorAction!");
		try {
			String hql="from Messagetext order by messageID desc";
			list = messageService.findAll(hql);
			
			
//			String hql="from Message";
//			 
//			list = messageService.findAll(hql);
//			if (list.size()<=0) {
//				hql="from Messagetext";
//				list = messagetextService.findAll(hql);
//				this.pageBean=null;
//				return "success";
//			}
//			
//			req = ServletActionContext.getRequest();
//			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String[] values = new String[1];
//			values[0] = u.getUsername();
//			
//			String h="from Messagetext m,Message n where m.messageId!=n.messageId and n.recId=? order by messageID desc ";
//			this.pageBean = messagetextService.querySearchForPage(10, page, h,values);
//			list = pageBean.getList();
//			if (list.size() <= 0) {
//				this.pageBean = messagetextService.querySearchForPage(10, page, h,values);
//				list = pageBean.getList();
//				this.pageBean.setTotalPage(1);
//				this.pageBean.setCurrentPage(1);
//			}
//			////Messagetext 的 messageId 为该用户未读的
//			ArrayList sList = (ArrayList) list;
//			Iterator iterator1 = sList.iterator();
//			List l2 = new ArrayList<Userinfo>();
//			while (iterator1.hasNext()) {
//				Object[] o = (Object[]) iterator1.next();
//				Messagetext v = (Messagetext) o[0];
//				l2.add(v);
//			}
//			list = l2;
			return "success";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); 
			return null;
		}
	}
	
	public String clickmessage(){  //根据messageId 点击单个未读消息
		try {
			Integer[] values = new Integer[1];
			values[0] =messageId;
			String hql="from Messagetext m where m.messageId=?";
			this.pageBean = messagetextService.querySearchForPage(1, page, hql, values);
			list = pageBean.getList();
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

}
