package com.njust.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.njust.domain.TjKey;
import com.njust.domain.TjValue;
import com.njust.service.TjKeyService;
import com.njust.service.TjValueService;



public class AddRecord extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String sheetid=request.getParameter("sheetid");
		String username=request.getParameter("username");
		System.out.println("AddRecord.java中username为："+username);
		
		TjKeyService tjKeyService=(TjKeyService) SpringContextUtil.getBean("tjKeyService");
		TjValueService tjValueService= (TjValueService) SpringContextUtil.getBean("tjValueService");
		String hql="from TjKey t where t.sheetid=? order by t.keysequence";
		String[] values = new String[1];
		values[0] = sheetid;
		List list = tjKeyService.findInfo(hql, values);
		int size=list.size();
		for (int i = 1; i <= size; i++) {
			String qkey="que"+i;
			TjValue tjValue=new TjValue();
			tjValue.setSheetid(sheetid);
			tjValue.setSequence(i);
			//tjValue.setUsername("default");			//添加填写问卷的用户名
			tjValue.setUsername(username);
			if ((request.getParameter(qkey)==null)) {    //////该题的内容
				tjValue.setSheetvalue(null);
//				tjValueService.save(tjValue);
			}else {
				String[] arr=request.getParameterValues(qkey);
				if (arr.length==1) {   //单选、填空
					tjValue.setSheetvalue(arr[0]);
//					tjValueService.save(tjValue);
				}else {//多选  有多个选项的时候
					String tjv="";
					for (int j = 0; j < arr.length-1; j++) {
						tjv+=arr[j]+",";
					}
					tjv+=arr[arr.length-1];
					tjValue.setSheetvalue(tjv);
//					tjValueService.save(tjValue);
				}
			}
			tjValueService.save(tjValue);
		}
		
		
	//	response.sendRedirect("findMoreSheets?page=1");
		if(request.getParameter("submittype")!=null && request.getParameter("submittype").equals("phone")){
			//response.sendRedirect("submitPhoneTjSuccess.jsp");
			RequestDispatcher rd=request.getRequestDispatcher("submitPhoneTjSuccess.jsp");	//submitPhoneTjSuccess,testq
			rd.forward(request,response);
		}
		else if(username==null || username.equals("")){
			response.sendRedirect("sunmitsuccess");
		}
		else{
			response.sendRedirect("usersubmitsuccess");		//判断用户是否登录2015-12-17
		}
	}
	
	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}






