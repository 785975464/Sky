package com.njust.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Addressinfo;
import com.njust.domain.Schoolinfo;
import com.njust.domain.Userinfo;
import com.njust.service.AddressinfoService;
import com.njust.service.SchoolinfoService;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("rawtypes")
public class SchoolAction extends ActionSupport{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private SchoolinfoService schoolinfoService;
	private AddressinfoService addressinfoService;
	private HttpServletRequest req;
	
	private Integer schoolid;
	private String schoolname;
	private Integer addressid;
	
	
	private List list,addresslist,list2;		//list2用于存放学校列表
	private PageBean pageBean;
	private int page; // 第几页
	private String msg;
	private String schResult; // 反馈给ajax的json对象---用于list
	private String delResult;	//用于测试删除结果
	private String tempSchResult;
	private String tempAddResult;
	
	
	public void setSchoolinfoService(SchoolinfoService schoolinfoService) {
		this.schoolinfoService = schoolinfoService;
	}
	public void setAddressinfoService(AddressinfoService addressinfoService) {
		this.addressinfoService = addressinfoService;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public List getAddresslist() {
		return addresslist;
	}
	public void setAddresslist(List addresslist) {
		this.addresslist = addresslist;
	}
	/****/
	public List getList2() {
		return list2;
	}
	public void setList2(List list2) {
		this.list2 = list2;
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

	public Integer getSchoolid() {
		return schoolid;
	}
	public void setSchoolid(Integer schoolid) {
		this.schoolid = schoolid;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public Integer getAddressid() {
		return this.addressid;
	}
	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
	@JSON(name = "SCHRESULT")
	public String getSchResult() {
		return schResult;
	}
	
	public void setSchResult(String schResult) {
		this.schResult = schResult;
	}
	
	@JSON(name = "MSG")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@JSON(name = "DELRESULT")
	public String getDelResult() {
		return delResult;
	}

	public void setDelResult(String delResult) {
		this.delResult = delResult;
	}
	
	@JSON(name = "TEMPSCHRESULT")
	public String getTempSchResult() {
		return tempSchResult;
	}

	public void setTempSchResult(String tempSchResult) {
		this.tempSchResult = tempSchResult;
	}
	
	@JSON(name = "TEMPADDRESULT")
	public String getTempAddResult() {
		return tempAddResult;
	}

	public void setTempAddResult(String tempAddResult) {
		this.tempAddResult = tempAddResult;
	}
	
	
	///列表  所有表格
	public String allSchoolInfo(){
		System.out.println("This is allSchoolInfo() of SchoolAction!");
		//String hql="from Schoolinfo";
		String hql="select s.schoolid,s.schoolname,a.district,a.community,a.street " +
				" from Schoolinfo s,Addressinfo a where s.addressid=a.addressid";
		//list2 = schoolinfoService.findAll(hql);
		//System.out.println("list2的size为："+list2.size());
		
		this.pageBean = schoolinfoService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = schoolinfoService.querySearchForPage(10, 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		
//		System.out.println("所有学校列表为："+JsonUtil.listToJson(list));
		//String hql2="from Schoolinfo s,Addressinfo a where s.addressid=a.addressid";
		String hql2="from Addressinfo";
		addresslist = addressinfoService.findAll(hql2);
		
		return SUCCESS;
	}
	
	public String createSchoolInfo(){
		System.out.println("This is createSchoolInfo() of SchoolAction!");
		//String hql="select s.schoolid,s.schoolname,a.district,a.community,a.street from Schoolinfo s,Addressinfo a where s.addressid=a.addressid";

		String hql2="from Addressinfo a where a.addressid>0 ";
		list2 = addressinfoService.findAll(hql2);
		return SUCCESS;
	}
	
	public String checkSchInfo() {
		System.out.println("This is checkSchInfo() of SchoolAction!");
		try {
			//req.setCharacterEncoding("UTF-8");
			schoolname = java.net.URLDecoder.decode(schoolname,"UTF-8");
			System.out.println("传过来的参数为："+schoolid+schoolname);
			
			String hql = "from Schoolinfo s where s.schoolname=?";
			String[] values = new String[1];
			values[0] = schoolname;
			//Integer[] values = new Integer[1];
			//values[0] = schoolid;

			list = schoolinfoService.findInfo(hql, values);
			System.out.println("list.size()为："+list.size());
			
			if (list.size() > 0) {
				msg = "该学校名称已存在";
			} else {
				msg = "";
			}
			System.out.println("msg为："+msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String addSchoolInfo() {
		try {
			Schoolinfo schoolinfo = new Schoolinfo();
			schoolinfo.setSchoolname(schoolname);
			schoolinfo.setAddressid(addressid);
			//userinfo.setPassword(username);
			schoolinfoService.save(schoolinfo);
			//ActionContext ac = ActionContext.getContext();
			//ac.getSession().put("new_schoolname", schoolname);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("null")
	public String delSchInfo() {
		System.out.println("This is delSchInfo() of SchoolAction!");
		System.out.println("要删除的是schoolid为"+schoolid);

		String hql = "from Schoolinfo s where s.schoolid=?";
		Integer[] val = new Integer[]{ schoolid };
		
		try{
			list = schoolinfoService.findInfo(hql, val);
			if(list.size()>0){
				Schoolinfo temp = (Schoolinfo) list.get(0);
				schoolinfoService.delete(temp);
//				System.out.println("删除成功！");
			}
			else{
				System.out.println("删除失败！");
				delResult = "删除失败，请重试！";
				return null;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			delResult = "删除失败，请重试！";
			System.out.println("删除失败！");
			return null;
		}
		delResult = "删除学校成功！";
		System.out.println("删除学校成功！");
//		hql = "from Schoolinfo"; // 查询语句
		hql="select s.schoolid,s.schoolname,a.district,a.community,a.street,a.addressid " +
				" from Schoolinfo s,Addressinfo a where s.addressid=a.addressid";
		this.pageBean = schoolinfoService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = schoolinfoService.querySearchForPage(10, 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		System.out.println("list.size()为："+list.size());
		List<Schoolinfo> tempSchList = new ArrayList<Schoolinfo>();
		List<Addressinfo> tempAddList = new ArrayList<Addressinfo>();
		
		try{
			for(int i=0;i<list.size();i++){
//				System.out.println("the "+i+"th loop!");
				Object[] obj = (Object[]) list.get(i);
				
				Schoolinfo schoolinfo = new Schoolinfo();
//				System.out.println((Integer) obj[0]);
//				System.out.println((String) obj[1]);
//				System.out.println((String) obj[2]);
//				System.out.println((String) obj[3]);
//				System.out.println((String) obj[4]);
//				System.out.println((Integer) obj[5]);
				
				schoolinfo.setSchoolid((Integer) obj[0]);
				schoolinfo.setSchoolname((String) obj[1]);
				schoolinfo.setAddressid((Integer) obj[5]);
				
				Addressinfo addressinfo = new Addressinfo();
				addressinfo.setAddressid((Integer) obj[5]);
				addressinfo.setDistrict((String) obj[2]);
				addressinfo.setCommunity((String) obj[3]);
				addressinfo.setStreet((String) obj[4]);
				
				tempSchList.add(schoolinfo);
				tempAddList.add(addressinfo);
				
//				System.out.println(schoolinfo.getSchoolname());
//				System.out.println(addressinfo.getCommunity());
			}
			tempSchResult = JsonUtil.listToJson(tempSchList);			//将多表查询的结果分成多个list返回，2016-8-2
			tempAddResult = JsonUtil.listToJson(tempAddList);
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("error！");
			return null;
		}
		//return schResult;
		return SUCCESS;
	}
	
	public String modifySchoolInfo() {
		System.out.println("This is modifySchoolInfo() of SchoolAction!");
		String hql = "from Schoolinfo s where s.schoolid=?";
		Integer[] values = new Integer[] { schoolid };
		list = schoolinfoService.findInfo(hql, values);
		Schoolinfo schoolinfo = (Schoolinfo) list.get(0);
		System.out.println("要修改的Schoolname为："+schoolinfo.getSchoolname());

		String hql2 = "from Addressinfo a where a.addressid=? ";
		Integer[] values2 = new Integer[] { schoolinfo.getAddressid() };
		List tempList = addressinfoService.findInfo(hql2, values2);
		Addressinfo addressinfo = (Addressinfo) tempList.get(0);
		
		String hql3="from Addressinfo";
		list2 = addressinfoService.findAll(hql3);	//list2用于存放学校列表 2016-1-10
		
		
		ActionContext ac = ActionContext.getContext();
		ac.put("schoolinfo", schoolinfo);
		ac.put("addressinfo", addressinfo);
		return "success";
	}
	
	public String searchSchoolInfo() {
		/****/
		try {
			schoolname = java.net.URLDecoder.decode(schoolname,"UTF-8");
			System.out.println("This is searchSchoolInfo() of SchoolAction!schoolname为："+schoolname);
			
			//String hql="from Schoolinfo";
			String hql="select s.schoolid,s.schoolname,a.district,a.community,a.street " +
					" from Schoolinfo s,Addressinfo a where s.addressid=a.addressid ";
			
			String[] values = new String[1];
			

			if(schoolname!=null && !schoolname.equals("")){
				//hql+=" s where s.schoolname like ?";
				hql+=" and s.schoolname like ?";
				values[0] = "%"+schoolname+"%";
				System.out.println("数组中有School！值为："+schoolname);
				//this.pageBean = schoolinfoService.querySearchForPage(pageBean.getAllRow() , page, hql, values);
				this.pageBean = schoolinfoService.querySearchForPage(10 , page, hql, values);
				list = pageBean.getList();
				System.out.println("list.size()为："+list.size());
				if (list.size() <= 0) {
					this.pageBean = schoolinfoService.querySearchForPage(pageBean.getAllRow(), 1, hql, values);
					list = pageBean.getList();
					this.pageBean.setTotalPage(1);
					this.pageBean.setCurrentPage(1);
				}
			}
			else{
				this.pageBean = schoolinfoService.querySearchForPage(pageBean.getAllRow() , page, hql);
				list = pageBean.getList();
				if (list.size() <= 0) {
					this.pageBean = schoolinfoService.querySearchForPage(pageBean.getAllRow(), 1, hql);
					list = pageBean.getList();
					this.pageBean.setTotalPage(1);
					this.pageBean.setCurrentPage(1);
				}
			}
			//schResult = JsonUtil.listToJson(list);
			// System.out.println(stuResult);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public String updateSchoolInfo() {
		System.out.println("This is updateSchoolInfo() of SchoolAction!");
		String hql = "from Schoolinfo s where s.schoolid=?";
		Integer[] values = new Integer[] { schoolid };
		list = schoolinfoService.findInfo(hql, values);
		Schoolinfo schoolinfo = (Schoolinfo) list.get(0);
		
		schoolinfo.setSchoolname(schoolname);
		schoolinfo.setAddressid(addressid);
		//req = ServletActionContext.getRequest();
		//req.getSession().getAttribute("loginuser");
		
		schoolinfoService.update(schoolinfo);
		return "success";
	}
	
	
	public String downloadSchoolStuInfo(){
		System.out.println("This is downloadSchoolStuInfo() of SchoolAction!");
		String hql="from Schoolinfo ";//s where s.addressid>0 ";
		
		list = schoolinfoService.findAll(hql);
		//System.out.println("list2的size为："+list2.size());
		
//		this.pageBean = addressinfoService.querySearchForPage(10, page, hql);
//		list = pageBean.getList();
//		if (list.size() <= 0) {
//			this.pageBean = addressinfoService.querySearchForPage(10, 1, hql);
//			list = pageBean.getList();
//			this.pageBean.setTotalPage(1);
//			this.pageBean.setCurrentPage(1);
//		}	
		return SUCCESS;
	}
	
	public int peopleSchoolComputing(String schoolname){
//		System.out.println("This is peopleSchoolComputing() of AddressAction!");
		String hql = "from Userinfo u where u.level=? and u.school=?";
		String[] values = new String[]{"学生",schoolname};
		list = addressinfoService.findInfo(hql, values);
		return list.size();
	}
	
	//2017.4.25重构
	public void getAllSchools(){
//		System.out.println("in getAllSchools!");
		String hql = "from Schoolinfo s";
//		String[] values = new String[]{district,street};
		list = addressinfoService.findAll(hql);
//			province, city,town,street
		String listjson = JsonUtil.listToJson(list);
		//System.out.println("list:"+list);
		try {
			ServletActionContext.getResponse().getWriter().write(listjson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
