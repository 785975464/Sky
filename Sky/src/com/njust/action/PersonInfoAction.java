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
		System.out.println("要删除的是username为"+username);
		String message=null;
		try {
			req = ServletActionContext.getRequest();
			if(username==null || req==null || req.getSession()==null){
				System.out.println("username为空，或req为空，或req.getSession()为空！");
				message="username为空，或req为空，或req.getSession()为空！";
				return;
			}
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			if(u==null || u.getUsername()==null){
				System.out.println("loginuser为空！");
				message="loginuser为空！";
				return;
			}
			System.out.println("u.getUsername()为："+u.getUsername());
			if( u.getUsername().equals(username)){
				System.out.println("该用户不得删除！");
				message="该用户不得删除！";
				return;
			}
			
			String queryhql = "from Userinfo u where u.username=?";
			String[] val = new String[] { username };
			try{
				list = userinfoService.findInfo(queryhql, val);
				if(list.size()!=1){							//找到要删除的用户
					message="被删除用户异常！";
					return;
				}
				String queryhqlstatus = "from Userinfo u where u.username=? and u.isDeleted=0";
				list = userinfoService.findInfo(queryhqlstatus, val);
				if(list.size()!=1){							//找到要删除的用户
					message="不得重复删除！";
					return;
				}
				System.out.println("找到该用户！");
				Userinfo temp = (Userinfo) list.get(0);
				temp.setIsDeleted(1);						//标记删除
				userinfoService.update(temp);
				System.out.println("已将该用户标记为已删除！");
				message="已将该用户标记为已删除！";
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("删除异常！");
				message="删除异常！";
				return;
			}
			System.out.println("删除成功！");
			message="删除成功！";
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
				//System.out.println("该社区有"+list.size()+"条数据！");
				
			} catch (Exception e) {
				e.printStackTrace();
				//return null;
			}
		}
		System.out.println("该社区有"+templist.size()+"条数据！"+templist);
	}
	
	
}
