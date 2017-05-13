package com.njust.action;


import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.InputStream;  
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
  
import org.apache.struts2.ServletActionContext; 

import com.opensymphony.xwork2.ActionSupport;

public class FileAction extends ActionSupport{
	/**
	 * �����ļ����ص�Action�� 
	 */
	private static final long serialVersionUID = 1L;
    private String fileName;  
      

    @Override
    public String execute() throws Exception {
       return SUCCESS;
    }
    /** �ļ��� ת������ ��ֹ��������*/
    public String getDownloadFileName() {
    	   String fileName=ServletActionContext.getRequest().getParameter("fileName");
    	   String downFileName = fileName;
    	   try {
    	    downFileName = new String(downFileName.getBytes(), "ISO8859-1");
    	   } catch (Exception e) {
    	    e.printStackTrace();
    	   }
    	   return downFileName;
    }
    
    public InputStream getInputStream() {
    	   String name=this.getDownloadFileName();
    	//  String realPath=ServletActionContext.getServletContext().getRealPath("/uploadImages")+ "/"+name; ·������
    	   String realPath="/upload/"+name;
    	   InputStream in=ServletActionContext.getServletContext().getResourceAsStream(realPath);
    	   if(null==in){
    	    System.out.println("Can not find a java.io.InputStream with the name [inputStream] in the invocation stack. Check the <param name=\"inputName\"> tag specified for this action.���action���ļ�����·���Ƿ���ȷ.");   
    	   }
    	   System.out.println("This is FileAction!");
    	   return ServletActionContext.getServletContext().getResourceAsStream(realPath);
    }

	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


}
