package com.njust.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Messagetext;
import com.njust.domain.News;
import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.domain.Visioncheck;
import com.njust.service.MessageService;
import com.njust.service.MessagetextService;
import com.njust.service.NewsService;
import com.njust.service.UserinfoService;
import com.njust.service.UserroleService;
import com.njust.servlet.getMD5;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport {
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
	private int page;
	private String msg;

	private String stuResult; // 反馈给ajax的json对象---用于list
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
	private String visionlevel;
	private String isrecheck;
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
	}

	public void setUserroleService(UserroleService userroleService) {
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
		public String getVisionlevel() {
			return visionlevel;
		}

		public void setVisionlevel(String visionlevel) {
			this.visionlevel = visionlevel;
		}

		public String getIsrecheck() {
			return isrecheck;
		}

		public void setIsrecheck(String isrecheck) {
			this.isrecheck = isrecheck;
		}
	
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public void setMessagetextService(MessagetextService messagetextService) {
		this.messagetextService = messagetextService;
	}


	public String publishCommunityMessage(){  //群发信息
		System.out.println("This is publishCommunityMessage() of MessageAction!");
		try {
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
			if(u.getLevel().equals("社工")){
				messagetext.setReceiver(u.getAddress());
			}
			else if(u.getLevel().equals("校医")){
				messagetext.setReceiver(String.valueOf(u.getSchool()));
			}
			messagetext.setReceiverlevel(receiverlevel);
			messagetext.setVisionlevel("-1");
			messagetext.setIsrecheck("-1");
			//messagetext.setReceiverlevel("学生");
			messagetextService.save(messagetext);

			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public String publishCommunityAdvancedMessage(){  //群发信息，学生高级信息 2016.5.2
		System.out.println("This is publishCommunityAdvancedMessage() of MessageAction!");
		System.out.println("参数visionlevel为"+visionlevel);
		try {
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
			if(u.getLevel().equals("社工")){
				messagetext.setReceiver(u.getAddress());
			}
			else if(u.getLevel().equals("校医")){
				messagetext.setReceiver(String.valueOf(u.getSchool()));
			}
			messagetext.setReceiverlevel(receiverlevel);
			if(visionlevel==null){
				messagetext.setVisionlevel("-1");
			}
			else{
				messagetext.setVisionlevel(visionlevel);
			}
			if(isrecheck==null){
				messagetext.setIsrecheck("-1");
			}
			else{
				messagetext.setIsrecheck(isrecheck);
			}
			messagetextService.save(messagetext);

			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
//	public String publishCommunityParentsMessage(){  //群发信息，家长高级信息 2016.5.4
//		System.out.println("This is publishCommunityParentsMessage() of MessageAction!");
//		System.out.println("参数visionlevel为"+visionlevel);
//		try {
//			req = ServletActionContext.getRequest();
//			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			//System.out.println("u.getUsername()为"+u.getUsername()+"\t\tu.getLevel()为："+u.getLevel());	//获取登录信息
//			System.out.println("receiverlevel为："+ receiverlevel);
//
//			Messagetext messagetext=new Messagetext();
//			messagetext.setText(text);
//			Calendar now = Calendar.getInstance();
//			String date = now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 1) + "-" + now.get(Calendar.DATE);
//			messagetext.setPdate(date);
//			messagetext.setSender(u.getUsername());
//			messagetext.setSenderlevel(u.getLevel());
//			if(u.getLevel().equals("社工")){
//				messagetext.setReceiver(u.getAddress());
//			}
//			else if(u.getLevel().equals("校医")){
//				messagetext.setReceiver(u.getSchool());
//			}
//			messagetext.setReceiverlevel(receiverlevel);
//			messagetext.setVisionlevel(visionlevel);
//			messagetext.setIsrecheck(isrecheck);
//			//messagetext.setReceiverlevel("学生");
//			messagetextService.save(messagetext);
//
//			return "success";
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	public String listCommunityMessage(){  //展示学生的站内信
		System.out.println("This is listCommunityMessage() of MessageAction!");
		try {
//			String hql="from Messagetext m where m.receiver in('all',?,?) and" +
//					" m.receiverlevel in('all',?) and m.visionlevel in('-1',?)";
			//String hql="from Messagetext m where m.senderlevel=? and m.receiverlevel is null)";
//			String hql0 = 	"select v.visionlevel,v.checkTime,v.tableId" +
//					" from Visioncheck v " +
//					" where v.username=? "+
//					" and v.tableId in " +
//						"( " +
//						" select MAX(v.tableId) from Visioncheck v " +
//						" where v.username=? " +	
//						")";
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String[] values0 = {u.getUsername(),u.getUsername()};
			
			//查询当前用户的最新视觉档案信息 2016-5-2
//			List list0 = messagetextService.findInfo(hql0, values0);
//			String[] values = {u.getAddress(),u.getSchool(),u.getLevel(),null};
//			if(list0.size()>0){
//				System.out.println("查询的结果为："+list0.get(0));
////				String[] values = {u.getAddress(),u.getSchool(),u.getLevel(),(String) list0.get(0)};
////				values[3]=(String) list0.get(0);
//			}
//			Visioncheck visioncheck = (Visioncheck)list0.get(0);	//无法转换
//			System.out.println("转换的结果为："+visioncheck.getVisionlevel());
			
			//查找最新的档案信息
			String hql_tableid = " select MAX(v.tableId) from Visioncheck v where v.username=? ";
			String[] values_tableid  = {u.getUsername()};
			List list_tableid = messagetextService.findInfo(hql_tableid, values_tableid);
			String hql="from Messagetext m where m.receiver in('all',?,?) and" +
					" m.receiverlevel in('all',?)";
			ArrayList<Object> valueslist =new ArrayList<Object>();	//用来存放values
			valueslist.add(u.getAddress());
			valueslist.add(u.getSchool());
			valueslist.add(u.getLevel());
			
			if(list_tableid.size()>0){	//学生若有档案信息，则查询是否复查超期
				//查找视觉等级
				String hql_level = " select v.visionlevel from Visioncheck v where v.tableId=? ";
				Integer[] values_level  = {(Integer) list_tableid.get(0)};
				List list_level = messagetextService.findInfo(hql_level, values_level);
				
				//查找检查时间
				String hql_checktime = " select v.checkTime from Visioncheck v where v.tableId=? ";
				Integer[] values_checktime  = {(Integer) list_tableid.get(0)};
				List list_checktime = messagetextService.findInfo(hql_checktime, values_checktime);
				
				String check_flag="0";
				if(timeComputing(list_checktime.get(0).toString(), list_level.get(0).toString()) < 0){	//小于0，则超期，置标志位为“1”
					check_flag="1";
				}
				
				
				hql +=" and m.visionlevel in('-1',?) and m.isrecheck in('-1',?)";
				valueslist.add((String) list_level.get(0));
				valueslist.add(check_flag);
//				String[] values = {u.getAddress(),u.getSchool(),u.getLevel(),(String) list_level.get(0),check_flag};
			}
			
			hql+=" order by messageID desc";
			String[] values = new String[valueslist.size()];
			for(int i=0;i<valueslist.size();i++){
				values[i]=(String) valueslist.get(i);
				System.out.println("values["+i+"]为："+values[i]);
			}
			
//			String[] valuestemp = {"江苏省,南京市,玄武区,孝陵卫街道,社区1","龙华二小","学生","异常","yes"};
//			list = messagetextService.findInfo(hql, valuestemp);
			
			this.pageBean = messagetextService.querySearchForPage(10, page, hql,values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = messagetextService.querySearchForPage(10, page, hql,values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			/**原代码
			String hql="from Message";
			 
			list = messageService.findAll(hql);
			if (list.size()<=0) {
				hql="from Messagetext";
				list = messagetextService.findAll(hql);
				this.pageBean=null;
				return "success";
			}
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String[] values = new String[1];
			values[0] = u.getUsername();
			
			String h="from Messagetext m,Message n where m.messageId!=n.messageId and n.recId=?";
			this.pageBean = messagetextService.querySearchForPage(10, page, h,values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = messagetextService.querySearchForPage(10, page, h,values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			////Messagetext 的 messageId 为该用户未读的
			ArrayList sList = (ArrayList) list;
			Iterator iterator1 = sList.iterator();
			List l2 = new ArrayList<Userinfo>();
			while (iterator1.hasNext()) {
				Object[] o = (Object[]) iterator1.next();
				Messagetext v = (Messagetext) o[0];
				l2.add(v);
			}
			list = l2;
			**/
			return "success";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); 
			return null;
		}
	}
	
	public String listStudentsMessage(){  //展示家长的站内信，用于接收孩子的信息
		System.out.println("This is listStudentsMessage() of MessageAction!");
		try {
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			//查找孩子的信息
			String hql_childs = "select u.username from Userinfo u where u.guardianName =? ";
			String[] values_childs  = {u.getUsername()};
			List list_childs = messagetextService.findInfo(hql_childs, values_childs);
			
			String hql=null;
			ArrayList<String> valueslist =new ArrayList<String>();	//用来存放values
			if(list_childs.size()>0){	//对每个孩子查找他的信息
				
				System.out.println(u.getUsername()+" have "+list_childs.size()+" child(s)! called: "+list_childs.get(0).toString());
				String childname = list_childs.get(0).toString();
				
				//查找孩子的地址信息
				String hql_childs_address = "select u.address from Userinfo u where u.username =? ";
				String[] values_childs_address  = {childname};
				List list_childs_address = messagetextService.findInfo(hql_childs_address, values_childs_address);
				String childaddress = list_childs_address.get(0).toString();
				
				//查找孩子的学校信息
				String hql_childs_school = "select u.school from Userinfo u where u.username =? ";
				String[] values_childs_school  = {childname};
				List list_childs_school = messagetextService.findInfo(hql_childs_school, values_childs_school);
				String childschool = list_childs_school.get(0).toString();
				
				//查找孩子的最新档案信息
				String hql_tableid = " select MAX(v.tableId) from Visioncheck v where v.username=? ";
				String[] values_tableid  = {childname};
				List list_tableid = messagetextService.findInfo(hql_tableid, values_tableid);
				hql="from Messagetext m where m.receiver in('all',?,?) and" +
						" m.receiverlevel in('all',?)";
				
//				valueslist.add(u.getAddress());
//				valueslist.add(u.getSchool());
//				valueslist.add(u.getLevel());
				
				valueslist.add(childaddress);
				valueslist.add(childschool);
				valueslist.add("学生");
				
				if(list_tableid.size()>0){	//学生若有档案信息，则查询是否复查超期
					//查找视觉等级
					String hql_level = " select v.visionlevel from Visioncheck v where v.tableId=? ";
					Integer[] values_level  = {(Integer) list_tableid.get(0)};
					List list_level = messagetextService.findInfo(hql_level, values_level);
					
					//查找检查时间
					String hql_checktime = " select v.checkTime from Visioncheck v where v.tableId=? ";
					Integer[] values_checktime  = {(Integer) list_tableid.get(0)};
					List list_checktime = messagetextService.findInfo(hql_checktime, values_checktime);
					
					String check_flag="0";
					if(timeComputing(list_checktime.get(0).toString(), list_level.get(0).toString()) < 0){	//小于0，则超期，置标志位为“1”
						check_flag="1";
					}
					
					
					hql +=" and m.visionlevel in('-1',?) and m.isrecheck in('-1',?)";
					valueslist.add((String) list_level.get(0));
					valueslist.add(check_flag);
				}
			
			}
			
			
			String[] values = new String[valueslist.size()];
			for(int i=0;i<valueslist.size();i++){
				values[i]=valueslist.get(i);
				System.out.println("values["+i+"]为："+values[i]);
			}
			
			
			this.pageBean = messagetextService.querySearchForPage(10, page, hql,values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = messagetextService.querySearchForPage(10, page, hql,values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			return "success";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); 
			return null;
		}
			
	}
	
	
	public String listParentsMessage(){  //展示家长的站内信，用于接收家长的信息
			System.out.println("This is listParentsMessage() of MessageAction!");
			try {
				
				req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				
				
				String hql="from Messagetext m where m.receiver in('all',?,?) and" +
						" m.receiverlevel in('all',?)";
//				ArrayList<String> valueslist =new ArrayList<String>();	//用来存放values
//				valueslist.add(u.getAddress());
//				valueslist.add(u.getSchool());
//				valueslist.add(u.getLevel());
				Object[] values = {u.getAddress(),u.getSchool(),"家长"};
				
				this.pageBean = messagetextService.querySearchForPage(10, page, hql,values);
				list = pageBean.getList();
				if (list.size() <= 0) {
					this.pageBean = messagetextService.querySearchForPage(10, page, hql,values);
					list = pageBean.getList();
					this.pageBean.setTotalPage(1);
					this.pageBean.setCurrentPage(1);
				}
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
	
	//调用timeComputing方法，计算经过的天数2016-5-4
	public long timeComputing(String date,String level) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dt;
			long day = 0;
			try {
				dt = df.parse(date);
			
				Date now = new Date();
				day = (now.getTime()-dt.getTime())/(24*3600*1000);

				//System.out.println("This is timeComputing()! and the day is:"+day);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				//System.out.println("日期出错！");
				return 0;
			}
			if(level.equals("预警")){
				return 60-day;
			}
			else if(level.equals("正常") || level.equals("异常")){
				return 90-day;
			}
			else{
				return 0;
			}
	}

}
