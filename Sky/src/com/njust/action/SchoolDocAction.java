package com.njust.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import check.judgeNumber;

import com.njust.domain.Addressinfo;
import com.njust.domain.Schoolinfo;
import com.njust.domain.Userinfo;
import com.njust.domain.Userrole;
import com.njust.domain.Visioncheck;
import com.njust.downloadExcel.ExportExcel;
import com.njust.downloadExcel.LoadUserInfo;
import com.njust.service.AddressinfoService;
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
public class SchoolDocAction extends ActionSupport {
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
	private int community;
	private String grade;
	private String stuClass;
	private String idNumber;
	private String nation;
	private String height;
	private String weight;

	private String stuResult; // ������ajax��json����---����list
	private String delResult;	//���ڲ���ɾ�����
	private List list;//,loadlist;		//loadlist���ڴ��ѧ����ѯ�����б�2016-05-17
	private PageBean pageBean;
	private UserinfoService userinfoService;
	private UserroleService userroleService;
	private SchoolinfoService schoolinfoService;
	private AddressinfoService addressinfoService;
	private VisioncheckService visioncheckService;
	private int page; // �ڼ�ҳ
	private String msg;

	private String specialistName;

	private String loadsql,loadvalues;	//���������ļ���2016-05-17
	private int outflag;	//�����жϵǳ�ʱ�Ŀͻ���״̬��2016-8-25
	
	public int getSchool() {
		return school;
	}

	public void setSchool(int school) {
		this.school = school;
	}

	public int getCommunity() {
		return community;
	}

	public void setCommunity(int community) {
		this.community = community;
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
	/**
	public List getLoadlist() {
		return loadlist;
	}
	public void setLoadlist(List loadlist) {
		this.loadlist = loadlist;
	}
	**/
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

	public void setSchoolinfoService(SchoolinfoService schoolinfoService) {
		this.schoolinfoService = schoolinfoService;
	}
	
	public void setAddressinfoService(AddressinfoService addressinfoService) {
		this.addressinfoService = addressinfoService;
	}
	
	public void setVisioncheckService(VisioncheckService visioncheckService) {
		this.visioncheckService = visioncheckService;
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
	
	public int getOutflag() {
		return outflag;
	}

	public void setOutflag(int outflag) {
		this.outflag = outflag;
	}
	
	
	public String allStuInfo() {
		try {
			System.out.println("This is allStuInfo() of SchoolDocAction!and the username is:"+username);
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			String hql = "from Userinfo u where u.level=? and u.school=?"; // ��ѯ���
			Object[] values = new Object[] { "ѧ��" , u.getSchool() };
			this.pageBean = userinfoService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				this.pageBean = userinfoService.querySearchForPage(10, page - 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}
			
			loadsql=hql;
			loadvalues="";
			for(int i=0;i<values.length;i++){
				loadvalues+=values[i]+"|";
			}
			
			//String hql2="from Schoolinfo";
			//list2 = schoolinfoService.findAll(hql2);	//list2���ڴ��ѧУ�б� 2016-1-10
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
			//userinfo.setPassword(username);
			String pw = getMD5.makeMD5("000000");
			userinfo.setPassword(pw);
			userinfo.setLevel("ѧ��");
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
	
	
	public String addParentInfo(){
		System.out.println("This is addParentInfo() of SchoolDocAction!");
		System.out.println("Ҫ��ӵ�usernameΪ"+username);
		try {
			Userinfo userinfo = new Userinfo();
			userinfo.setUsername(username);
			//userinfo.setPassword(username);
			String pw = getMD5.makeMD5("000000");
			userinfo.setPassword(pw);
			userinfo.setLevel("�ҳ�");
			userinfo.setEnabled(true);
			userinfo.setAccountNonExpired(true);
			userinfo.setCredentialsNonExpired(true);
			userinfo.setAccountNonLocked(true);
			userinfo.setRealname(realname);
			userinfo.setGender(gender);
			userinfo.setAge(age);
			
			userinfo.setPhone(phone);
			userinfo.setEmail(email);
			

			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");

			userinfo.setGuardianName(u.getUsername());
			userinfo.setAddress(u.getAddress());
//			userinfo.setSchool(u.getSchool());
//			userinfo.setGrade(grade);
//			userinfo.setStuClass(stuClass);
//			userinfo.setIdNumber(idNumber);
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

			
//			ActionContext ac = ActionContext.getContext();
//			ac.getSession().put("new_username", username);

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
				msg = "��ID�Ѵ���";
			} else {
				msg = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String searchStuInfo() {
		try {
			System.out.println("This is searchStuInfo() of SchoolDocAction!");
			
			String hql="from Userinfo u where u.level =?  and u.school=? ";
			//String[] values;// = new String[];
			ArrayList<Object> namelist =new ArrayList<Object>();
			
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			namelist.add("ѧ��");
			//namelist.add("Уҽ");
			namelist.add(u.getSchool());
			//System.out.println("This is searchStuInfo()!and u.username is:"+u.getUsername());
			
			//��Ҫת��
			grade = java.net.URLDecoder.decode(grade,"UTF-8");
			stuClass = java.net.URLDecoder.decode(stuClass,"UTF-8");
			realname = java.net.URLDecoder.decode(realname,"UTF-8");
			
			if(grade!=null && !grade.equals("")){
				hql+=" and u.grade=? ";
				namelist.add(grade);
				System.out.println("��������Grade��ֵΪ��"+grade);
			}
			if(stuClass!=null && !stuClass.equals("")){
				hql+=" and u.stuClass=? ";	//and
				namelist.add(stuClass);
				System.out.println("��������StuClass��ֵΪ��"+stuClass);
				
			}
			if(realname!=null && !realname.equals("")){
				hql+=" and u.realname like ? ";
				namelist.add("%"+realname+"%");
				System.out.println("��������Realname��ֵΪ��"+realname);
				
			}
			if(username!=null && !username.equals("") ){
				hql+=" and u.username=? ";
				namelist.add(username);
				System.out.println("��������username��ֵΪ��"+username);
				
			}
			
			String[] values = new String[namelist.size()];
			System.out.println("namelist size Ϊ��"+namelist.size());
			for(int i=0;i<namelist.size();i++){
				System.out.println("ִ�е�"+i+"��ѭ����");
				values[i]=(String) namelist.get(i);
				System.out.println(values[i]);
			}
			

			//String hql = "from Userinfo u where u.stuClass like '#?#' and u.level=? and u.school=?";	// and u.level=? and u.school=?
			//String hql = "from Userinfo u where u.stuClass=? and u.level=? and u.school=?";
			//String hql = "from Userinfo u where u.username=? and u.level=? and u.school=?";
			//String[] values = new String[] {u.getStuClass(),"ѧ��", u.getSchool() };
			//System.out.println("u.getStuClass:"+u.getStuClass());		//null
			System.out.println("Grade:"+grade);
			System.out.println("StuClass:"+stuClass);
			System.out.println("Realname:"+realname);
			System.out.println("Username:"+username);
			
			this.pageBean = userinfoService.querySearchForPage(10 , page, hql, values);
			//this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow() , page, hql, values);
			list = pageBean.getList();
			if (list.size() <= 0) {
				//this.pageBean = userinfoService.querySearchForPage(pageBean.getAllRow(), 1, hql, values);
				this.pageBean = userinfoService.querySearchForPage(10, 1, hql, values);
				list = pageBean.getList();
				this.pageBean.setTotalPage(1);
				this.pageBean.setCurrentPage(1);
			}

//			stuResult = JsonUtil.listToJson(list);
			// System.out.println(stuResult);
			
			loadsql=hql;
			System.out.println("searchStuInfo��loadsqlΪ��"+loadsql);
			loadvalues="";
			for(int i=0;i<values.length;i++){
				System.out.println("searchStuInfo��valuesΪ��"+values[i].replace("%", "%25"));
				loadvalues+=values[i].replace("%", "%25")+"|";		//���⡰%�������ڴ�������б�ת��
			}
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String delStuInfo() {
		System.out.println("This is delStuInfo() of SchoolDocAction!");
		System.out.println("Ҫɾ������usernameΪ"+username);
		//Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		//System.out.println("u.getUsername()Ϊ��"+u.getUsername()+"Ҫɾ������usernameΪ"+username);
		/**
		if( u.getUsername().equals(username)){
			System.out.println("���û�����ɾ����");
			//this.addActionMessage("ɾ��ʧ�ܣ�");
			return null;
		}
		**/
		String hql = "from Userinfo u where u.username=?";
		String[] val = new String[] { username };
//		list = userinfoService.findInfo(hql, val);
//		Userinfo temp = (Userinfo) list.get(0);
//		userinfoService.delete(temp);
		try{
			list = userinfoService.findInfo(hql, val);
			Userinfo temp = (Userinfo) list.get(0);
			userinfoService.delete(temp);
		}
		catch (Exception e) {
			e.printStackTrace();
			delResult = "ɾ��ʧ�ܣ������ԣ�";
			return null;
		}
		delResult = "ɾ���ɹ���";
		//System.out.println("ɾ���ɹ���");

		//ɾ�����û��������Ӿ�����
		String hql2 = "from Visioncheck v where v.username=?";
		String[] val2 = new String[] { username };
		try{
			List templist = visioncheckService.findInfo(hql2, val2);
			for(int i=0;i<templist.size();i++){
				Visioncheck tempv = (Visioncheck) templist.get(i);
				visioncheckService.delete(tempv);
			}
			//delResult += "ɾ������Ҳ�ɹ���";
		}
		catch (Exception e) {
			System.out.println("ɾ���û�"+username+"�Ӿ�����ʱ����");
			e.printStackTrace();
		}
		
		
		hql = "from Userinfo u where u.level=? and u.school=?"; // ��ѯ���
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		Object[] values = new Object[] { "ѧ��", u.getSchool() };

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

	public String modifyStuInfo() {
		System.out.println("This is modifyStuInfo() of SchoolDocAction!");
		String hql = "from Userinfo u where u.username=?";
		String[] values = new String[] { username };
		list = userinfoService.findInfo(hql, values);
		Userinfo userinfo = (Userinfo) list.get(0);

		ActionContext ac = ActionContext.getContext();
		ac.put("userinfo", userinfo);
		return "success";
	}

	public String updateStuInfo() {
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
		userinfo.setSchool(u.getSchool());
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

	
	public String downloadFile() {
		System.out.println("This is downloadFile() of SchoolDocAction!");
		
		try {	//����
			loadsql = java.net.URLDecoder.decode(loadsql,"UTF-8");
			System.out.println("���յ��Ĳ���loadsqlΪ��"+loadsql);
			System.out.println("loadvaluesΪ��"+loadvalues);
//			loadvalues = java.net.URLDecoder.decode(loadvalues,"GBK");
//			System.out.println("loadvaluesΪ��"+loadvalues);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	    System.out.println("���յ��Ĳ���loadsqlΪ��"+loadsql);
	    System.out.println("loadvaluesΪ��"+loadvalues);
	    try {
			String[] values = loadvalues.substring(0, loadvalues.length()-1).split("\\|");	//�á�|�����Ž��зָ�
			for(int i=0;i<values.length;i++){
				System.out.println(values[i]);
			}
			List loadlist = userinfoService.findInfo(loadsql, values);
			makeDownList(loadlist);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
			return SUCCESS;
	}
	
	public void makeDownList(List loadlist){
			// TODO Auto-generated method stub
			// ����ѧ��  
//			ExportExcel<String> ex = new ExportExcel<String>(); 
//			ExportExcel<Userinfo> ex = new ExportExcel<Userinfo>();
			ExportExcel<LoadUserInfo> ex = new ExportExcel<LoadUserInfo>();
			
			
	        String[] headers =  
	        { "����", "�Ա�", "����", "��ַ", "�໤��", "ѧУ", "�꼶", "�༶", "����", "���", "����" };  
	        
//	        Collection<Userinfo> dataset = loadlist;
	        
//	        List<Student> dataset = new ArrayList<Student>();
//	        List<Userinfo> dataset = new ArrayList<Userinfo>();
			List<LoadUserInfo> dataset = new ArrayList<LoadUserInfo>();
	        
	        
//	        Date temp = new Date();
//	        for(int i=0;i<templist.length;i++){
//	        	dataset.add(templist[i].split("|")[0],templist[i].split("|")[1],templist[i].split("|")[2]);
//	        }
	        System.out.println("loadlist.size()Ϊ��"+loadlist.size());
	        for(int i=0;i<loadlist.size();i++){
	        	dataset.add(new LoadUserInfo(
	        			((Userinfo)loadlist.get(i)).getRealname(),
						((Userinfo)loadlist.get(i)).getGender(),
						((Userinfo)loadlist.get(i)).getAge(),
						((Userinfo)loadlist.get(i)).getAddress(),
						((Userinfo)loadlist.get(i)).getSchool(),
						((Userinfo)loadlist.get(i)).getGrade(),
						((Userinfo)loadlist.get(i)).getStuClass(),
						((Userinfo)loadlist.get(i)).getNation(),
						((Userinfo)loadlist.get(i)).getHeight(),
						((Userinfo)loadlist.get(i)).getWeight(),
						((Userinfo)loadlist.get(i)).getGuardianName()));
//	        			((Userinfo)loadlist.get(i)).getAddress(), 
//	        			((Userinfo)loadlist.get(i)).getLevel()));
	        }
//	        dataset.add(new Student(10000001, "����", 20, true, temp));  
//	        dataset.add(new Student(20000002, "����", 24, false, temp));  
//	        dataset.add(new Student(30000003, "����", 22, true, temp));  
	        try  
	        {  
//	        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
//	        	String tempvalue = sdf.format(temp); 
//	            OutputStream out = new FileOutputStream("E://"+tempvalue+".xls");
	        	OutputStream out = new FileOutputStream("C://sky_tempdata//download.xls"); 
	            
	            ex.exportExcel(headers, dataset, out);  
	            out.close();  
//	            JOptionPane.showMessageDialog(null, "�����ɹ�!");  
	            System.out.println("excel�����ɹ���");
	            clientDownload("C://sky_tempdata//download.xls");  //"D://a.xls"�������������ļ������ͻ�������
	        } catch (FileNotFoundException e) {
//	        	System.out.println("����1��");
	            e.printStackTrace();  
	        } catch (IOException e) { 
//	        	System.out.println("����2��");
	            e.printStackTrace();  
	        }  
		}
	
	private void clientDownload(String path) {  //�����ļ��ͻ������� 2016-05-18
        try {  
            // path��ָ�����ص��ļ���·����  
            File file = new File(path);  
            // ȡ���ļ�����  
            String filename = file.getName();  
            // ��������ʽ�����ļ���  
            InputStream fis = new BufferedInputStream(new FileInputStream(path));  
            byte[] buffer = new byte[fis.available()];  
            fis.read(buffer);  
            fis.close();  
            // ���response  
//            response.reset();  
            // ����response��Header  
            HttpServletResponse response = ServletActionContext.getResponse();
            response.addHeader("Content-Disposition", "attachment;filename="  
                    + new String(filename.getBytes()));  
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream( response.getOutputStream());  
            response.setContentType("application/vnd.ms-excel;charset=gb2312");
            toClient.write(buffer);
            toClient.flush();  
            toClient.close();
            
        } catch (IOException ex) { 
//        	System.out.println("����3��");
            ex.printStackTrace();  
        }  
    }
	
	
	public String downloadSingleCommunityInfo(){
		System.out.println("This is downloadSingleCommunityInfo() in SchoolDocAction!");
		req = ServletActionContext.getRequest();
		String addressid = req.getParameter("addressid");
		System.out.println(addressid);
		try {
			String hql = "from Addressinfo a where a.addressid=?";
			Object[] values = new Object[] { Integer.parseInt(addressid) };
			list = addressinfoService.findInfo(hql, values);
			System.out.println(list.size());
			if(list.size()>0){
				Addressinfo a = (Addressinfo)list.get(0);
				String add = a.getDistrict()+","+a.getStreet()+","+a.getCommunity();
				String addhql = "from Userinfo u where u.address=? and u.level in (?,?)";
				String[] addvalues = new String[] { add,"ѧ��","�ҳ�" };
				list = userinfoService.findInfo(addhql, addvalues);
				//System.out.println(a.getDistrict()+","+a.getStreet()+","+a.getCommunity());
				if(list.size()>0){
					makeDownList(list);
				}
				else{
					System.out.println("δ�ҵ����ݣ�");
					return "error";
				}
			}
			else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public String downloadCommunityInfo(){
		System.out.println("This is downloadCommunityInfo() in SchoolDocAction!");
		req = ServletActionContext.getRequest();
		String[] downloadbox = req.getParameterValues("downloadbox");
		String hql = "from Userinfo u where u.address=? and u.level in (?,?)";
		String[] values =null;
		//list=null;
		List<Userinfo> templist=null;
		for(int i=0;i<downloadbox.length;i++){
			System.out.println(downloadbox[i]);
			try {
				values = new String[] { downloadbox[i].replace(" ", ""),"ѧ��","�ҳ�" };
				if(templist==null || templist.isEmpty()){
					templist=userinfoService.findInfo(hql, values);
				}
				else{
					templist.addAll( userinfoService.findInfo(hql, values) );
				}
				System.out.println("��������"+templist.size()+"�����ݣ�");
				//makeDownList(templist);
				//list.addAll( (Collection)templist );
				//System.out.println("��������"+list.size()+"�����ݣ�");
				
			} catch (Exception e) {
				e.printStackTrace();
				//return null;
			}
		}
		if(templist.size()>0){		//	��ѯָ����������Ա��Ϣ
			makeDownList(templist);
		}
		else{
			System.out.println("δ�ҵ����ݣ�");
			return "error";
		}
		return null;
	}
	
	//ѧУ�������� 2016-07-27
	public String downloadSingleSchoolInfo(){
		System.out.println("This is downloadSingleSchoolInfo() in SchoolDocAction!");
		req = ServletActionContext.getRequest();
		String schoolid = req.getParameter("schoolid");
		System.out.println(schoolid);
		try {
			String hql = "from Schoolinfo s where s.schoolid=?";
			Integer[] values = new Integer[] { Integer.parseInt(schoolid) };
			list = schoolinfoService.findInfo(hql, values);
			System.out.println(list.size());
			if(list.size()>0){
				Schoolinfo s = (Schoolinfo)list.get(0);
				String schoolname = s.getSchoolname();
				String schoolhql = "from Userinfo u where u.school=? and u.level in (?,?)";
				String[] addvalues = new String[] { schoolname,"ѧ��","�ҳ�" };
				list = userinfoService.findInfo(schoolhql, addvalues);
				//System.out.println(a.getDistrict()+","+a.getStreet()+","+a.getCommunity());
				if(list.size()>0){
					makeDownList(list);
				}
				else{
					System.out.println("δ�ҵ����ݣ�");
					return "error";
				}
			}
			else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public String downloadSchoolInfo(){
		System.out.println("This is downloadSchoolInfo() in SchoolDocAction!");
		req = ServletActionContext.getRequest();
		String[] downloadbox = req.getParameterValues("downloadbox");
		String hql = "from Userinfo u where u.school=? and u.level in (?,?)";
		String[] values =null;
		//list=null;
		List<Userinfo> templist=null;
		for(int i=0;i<downloadbox.length;i++){
			System.out.println(downloadbox[i]); 
			try {
				values = new String[] { downloadbox[i].replace(" ", ""),"ѧ��","�ҳ�" };
				if(templist==null || templist.isEmpty()){
					templist=userinfoService.findInfo(hql, values);
				}
				else{
					templist.addAll( userinfoService.findInfo(hql, values) );
				}
				System.out.println("��ѧУ��"+templist.size()+"�����ݣ�");
				//makeDownList(templist);
				//list.addAll( (Collection)templist );
				//System.out.println("��������"+list.size()+"�����ݣ�");
				
			} catch (Exception e) {
				e.printStackTrace();
				//return null;
			}
		}
		if(templist.size()>0){		//	��ѯָ��ѧУ����Ա��Ϣ
			makeDownList(templist);
		}
		else{
			System.out.println("δ�ҵ����ݣ�");
			return "error";
		}
		return null;
	}
	
	public String login() {
//		Authentication au = SecurityContextHolder.getContext().getAuthentication();
//		String username = au.getName();
//		username=(String) req.getAttribute("username");
//		password=(String) req.getAttribute("password");
		System.out.println("This is login() of SchoolDocAction!");
		
		if(username == null || password == null){
			return "error";
		}
		//���ĵ�¼��ʽ 2016-05-19
		String hql = "from Userinfo u where u.password=? ";
		if(judgeNumber.isMobileLegal(username)){
			System.out.println("�û�"+username+"���ֻ��ŵ�¼��");
			hql += " and u.phone=?";
		}
		else if(judgeNumber.isEmailLegal(username)){
			System.out.println("�û�"+username+"�������¼��");
			hql += " and u.email=?";
		}
		else{
			System.out.println("�û�"+username+"����ͨ��ݵ�¼��");
			hql += " and u.username=?";
		}
		
//		String hql = "from Userinfo u where u.username=? and password=?";
//		String pw = getMD5.makeMD5(password);
		String pw = getMD5_2.toMD5(password);
		String[] values = new String[] { pw,username };
		list = userinfoService.findInfo(hql, values);
		System.out.println("This is login() of SchoolDocAction!and the username="+username+"\t"+password+"\t"+pw);
		System.out.println("list.size()Ϊ:"+list.size());
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

	public String loginOut() {
		System.out.println("This is loginOut() of SchoolDocAction!");
		
//		req.getSession().removeAttribute("username");
//		req.getSession().removeAttribute("password");
		
		
		req = ServletActionContext.getRequest();
		System.out.println("Ҫ�ǳ����û�Ϊ��"+req.getAttribute("username"));
		System.out.println("outflagΪ��"+outflag);
//		req.getSession().invalidate();
		
		ActionContext ac = ActionContext.getContext(); 
		ac.getSession().remove("loginuser");  
		
		username=null;
		password=null;
		
		if(outflag==1){
			return "phoneout";
		}
		return SUCCESS;
	}

	
}
