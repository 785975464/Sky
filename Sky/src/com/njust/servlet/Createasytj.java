package com.njust.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.njust.domain.TjKey;
import com.njust.domain.TjSheet;
import com.njust.domain.Userinfo;
import com.njust.service.TjKeyService;
import com.njust.service.TjSheetService;
import com.njust.service.TjValueService;
//import com.sun.org.apache.bcel.internal.generic.NEW;


public class Createasytj extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpServletRequest req;
		HttpSession session = request.getSession();
		StringToAscii stoaAscii =new StringToAscii();
		
		//tjname
		String tjname = request.getParameter("tjname");	
		req = ServletActionContext.getRequest();
		Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
		TjSheetService tjSheetService=(TjSheetService) SpringContextUtil.getBean("tjSheetService");
		TjKeyService tjKeyService=(TjKeyService) SpringContextUtil.getBean("tjKeyService");
		TjValueService tjValueService= (TjValueService) SpringContextUtil.getBean("tjValueService");
		
		TjSheet tjsheet =new TjSheet();
		TjKey tjKey= new TjKey();
		
		tjsheet.setCreator(u.getUsername());
		tjsheet.setSheetname(tjname);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		tjsheet.setCreatime(df.format(new Date()));
		
		
		String sheetid=df.format(new Date())+stoaAscii.parseAscii(u.getUsername());  //string  to  ascii
		tjsheet.setSheetid(sheetid);  
		tjSheetService.save(tjsheet);
		
		
		//Subject
		//XSubject
		//choices
		
		int i= 1;
		String keyname = "Subject"+i;
		String key=request.getParameter(keyname);
		for (int j = 0 ; key!=null; keyname = "Subject"+i) {
			key=null;
			key=request.getParameter(keyname);	   //
			if (key!=null) {
				tjKey.setSheetid(sheetid);
				tjKey.setSheetkey(key);
				String kn="SType"+i;
				String kt=request.getParameter(kn);  //
				tjKey.setKeytype(Integer.valueOf(kt));
				
				if (Integer.valueOf(kt)!=3) {
					String kvnString="choices"+i;
					String kv=request.getParameter(kvnString);
					tjKey.setChoicevalue(kv);
				}
				tjKey.setKeysequence(i);
				tjKeyService.save(tjKey);
				i++;
			}	
		}
	
		response.sendRedirect("gettjlist.action");
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}






