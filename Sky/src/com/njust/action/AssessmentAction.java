package com.njust.action;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Assessments;
import com.njust.domain.Userinfo;
import com.njust.service.AssessmentsService;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AssessmentAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private HttpServletRequest req;
	
	private Integer tableId;
	private String specialistName;
	private String assessment;
	private AssessmentsService assessmentsService;

	private PageBean pageBean;
	private int page; // µÚ¼¸Ò³
	private List list;

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

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

	private String msg;

	@JSON(name = "MSG")
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getTableId() {
		return tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public void setAssessmentsService(AssessmentsService assessmentsService) {
		this.assessmentsService = assessmentsService;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	public String getAssessment() {
		return assessment;
	}

	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}

	public String expertInsertAssessment() {
		try {
//			System.out.println("tableid:"+tableId+"  assessment:"+assessment);
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			String assm=URLDecoder.decode(assessment,"utf-8");

			Assessments a = new Assessments();
			a.setTableId(tableId);
			a.setSpecialistName(u.getUsername());
			a.setAssessment(assm);
			assessmentsService.save(a);
			msg = assm;
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String expertUpdateAssessment() {
		try {
//			System.out.println("tableid:"+tableId+"  assessment:"+assessment);
			req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			
			String assm=URLDecoder.decode(assessment,"utf-8");
			
			String hql="from Assessments a where tableId=? and specialistName=?";
			Object[] values = new Object[]{tableId,u.getUsername()};
			list=assessmentsService.findInfo(hql, values);
			
			Assessments ass=(Assessments)list.get(0);
			ass.setAssessment(assm);
			assessmentsService.update(ass);

			msg = assm;
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String stuCheckAssessmentFromId() {
		try {
			String hql = "from Assessments a where a.tableId=?";
			Integer[] values = new Integer[] { tableId };
			
			ActionContext ac = ActionContext.getContext();
			ac.put("tableId", tableId);
			
			this.pageBean = assessmentsService.querySearchForPage(10, page, hql, values);
			list = pageBean.getList();

			if (list.size() <= 0) {
				this.pageBean = assessmentsService.querySearchForPage(10, 1, hql, values);
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

}
