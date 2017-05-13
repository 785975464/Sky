package com.njust.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.njust.domain.Userinfo;
import com.njust.domain.Visioncheck;
import com.njust.service.UserinfoService;
import com.njust.tag.JsonUtil;
import com.opensymphony.xwork2.ActionSupport;

public class PersonInfoAction extends ActionSupport{
	private HttpServletRequest req;
	
	private String username;
	private List list;
	private UserinfoService userinfoService;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}  
	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public void setUserinfoService(UserinfoService userinfoService) {
		this.userinfoService = userinfoService;
	}
	
	public void delPersonInfo() {
		System.out.println("This is delPersonInfo() of PersonInfoAction!");
		System.out.println("Ҫɾ������usernameΪ"+username);
		String message=null;
		try {
			req = ServletActionContext.getRequest();
			if(username==null || req==null || req.getSession()==null){
				System.out.println("usernameΪ�գ���reqΪ�գ���req.getSession()Ϊ�գ�");
				message="usernameΪ�գ���reqΪ�գ���req.getSession()Ϊ�գ�";
				return;
			}
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			if(u==null || u.getUsername()==null){
				System.out.println("loginuserΪ�գ�");
				message="loginuserΪ�գ�";
				return;
			}
			System.out.println("u.getUsername()Ϊ��"+u.getUsername());
			if( u.getUsername().equals(username)){
				System.out.println("���û�����ɾ����");
				message="���û�����ɾ����";
				return;
			}
			
			String queryhql = "from Userinfo u where u.username=?";
			String[] val = new String[] { username };
			try{
				list = userinfoService.findInfo(queryhql, val);
				if(list.size()!=1){							//�ҵ�Ҫɾ�����û�
					message="��ɾ���û��쳣��";
					return;
				}
				String queryhqlstatus = "from Userinfo u where u.username=? and u.isDeleted=0";
				list = userinfoService.findInfo(queryhqlstatus, val);
				if(list.size()!=1){							//�ҵ�Ҫɾ�����û�
					message="�����ظ�ɾ����";
					return;
				}
				System.out.println("�ҵ����û���");
				Userinfo temp = (Userinfo) list.get(0);
				temp.setIsDeleted(1);						//���ɾ��
				userinfoService.update(temp);
				System.out.println("�ѽ����û����Ϊ��ɾ����");
				message="�ѽ����û����Ϊ��ɾ����";
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("ɾ���쳣��");
				message="ɾ���쳣��";
				return;
			}
			System.out.println("ɾ���ɹ���");
			message="ɾ���ɹ���";
		}finally{
			try {
				ServletActionContext.getResponse().getWriter().write(JsonUtil.msgToJson(message));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("�������쳣��");
				message="�������쳣��";
			}
		}
//		return SUCCESS;
	}
	
	public void downloadPersonInfo(){
		System.out.println("This is downloadPersonInfo() in PersonInfoAction!");
		req = ServletActionContext.getRequest();
		String[] downloadbox = req.getParameterValues("downloadbox");
		String hql = "from Userinfo u where u.username=?";
		String[] values =null;
		List<Userinfo> templist=null;
		
		for(int i=0;i<downloadbox.length;i++){
			System.out.println(downloadbox[i]);
			try {
				values = new String[] { downloadbox[i]};
				if(templist==null || templist.isEmpty()){
					templist=userinfoService.findInfo(hql, values);
				}
				else{
					templist.addAll( userinfoService.findInfo(hql, values) );
				}
				//makeDownList(templist);
				//list.addAll( (Collection)templist );
				//System.out.println("��������"+list.size()+"�����ݣ�");
				
			} catch (Exception e) {
				e.printStackTrace();
				//return null;
			}
		}
		System.out.println("��������"+templist.size()+"�����ݣ�"+templist);
	}
	
	
}
