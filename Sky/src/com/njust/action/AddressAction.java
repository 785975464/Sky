package com.njust.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.Addressinfo;
import com.njust.service.AddressinfoService;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("rawtypes")
public class AddressAction extends ActionSupport{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private AddressinfoService addressinfoService;
	private HttpServletRequest req;
	
	private Integer addressid;
	private String district;
	private String street;
	private String community;
	
	private List list;//,list2;		//list2���ڴ��ѧУ�б�
	private PageBean pageBean;
	private int page; // �ڼ�ҳ
	private String msg;
	private String addResult; // ������ajax��json����---����list
	private String delResult;	//���ڲ���ɾ�����
	
	private String province;
	private String city;
	private String town;
	private String checkResult;	//���ڲ��Լ����
	
	
	public void setAddressinfoService(AddressinfoService addressinfoService) {
		this.addressinfoService = addressinfoService;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	/**
	public List getList2() {
		return list2;
	}
	public void setList2(List list2) {
		this.list2 = list2;
	}
	**/
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
	public Integer getAddressid() {
		return this.addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
	public String getCommunity() {
		return this.community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}

	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}
	
	public String getDistrict() {
		return this.district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
	
	public String getProvince() {
		return this.province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getCity() {
		return this.city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getTown() {
		return this.town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	
	@JSON(name = "ADDRESULT")
	public String getAddResult() {
		return addResult;
	}
	
	public void setAddResult(String addResult) {
		this.addResult = addResult;
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
	
	@JSON(name = "CHECKRESULT")
	public String getCheckResult() {
		return checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}
	
	
	///�б�  ���б��
	public String allAddressInfo(){
		System.out.println("This is allAddressInfo() of AddressAction!");
		String hql="from Addressinfo a where a.addressid>0 ";
		
		//list2 = schoolinfoService.findAll(hql);
		//System.out.println("list2��sizeΪ��"+list2.size());
		
		this.pageBean = addressinfoService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = addressinfoService.querySearchForPage(10, 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}	
		return SUCCESS;
	}
	public String createAddressInfo(){
		return "success";
	}
	public String addAddressInfo() {
		try {
			Addressinfo addressinfo = new Addressinfo();
			System.out.println("���յ��Ĳ���Ϊ��������"+district+"\t�ֵ�Ϊ��"+street+"\t����Ϊ��"+community);
			addressinfo.setDistrict(district);
			addressinfo.setStreet(street);
			addressinfo.setCommunity(community);
			//userinfo.setPassword(username);
			addressinfoService.save(addressinfo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String modifyAddressInfo() {
		System.out.println("This is modifyAddressInfo() of AddressAction!");
		String hql = "from Addressinfo a where a.addressid=? ";
		Integer[] values = new Integer[] { addressid };
		list = addressinfoService.findInfo(hql, values);
		Addressinfo addressinfo = (Addressinfo) list.get(0);
		
		//String hql2 = "from Schoolinfo s where s.addressid=? ";
		//Integer[] values2 = new Integer[] { addressinfo.getAddressid() };
		//list2 = schoolinfoService.findInfo(hql, values);
		//Addressinfo addressinfo = (Addressinfo) list.get(0);
		
		System.out.println("Ҫ�޸ĵ��������ֵ�Ϊ��"+addressinfo.getCommunity()+addressinfo.getStreet());

		ActionContext ac = ActionContext.getContext();
		ac.put("addressinfo", addressinfo);
		return "success";
	}
	public String updateAddressInfo() {
		System.out.println("This is updateAddressInfo() of AddressAction!");
		String hql = "from Addressinfo a where a.addressid=?";
		Integer[] values = new Integer[] { addressid };
		list = addressinfoService.findInfo(hql, values);
		Addressinfo addressinfo = (Addressinfo) list.get(0);
		
		//addressinfo.setDistrict(district);
		addressinfo.setStreet(street);
		addressinfo.setCommunity(community);
		//req = ServletActionContext.getRequest();
		//req.getSession().getAttribute("loginuser");
		
		addressinfoService.update(addressinfo);
		return "success";
	}
	public String delAddressInfo() {
		System.out.println("This is delAddressInfo() of AddressAction!");
		System.out.println("Ҫɾ������schoolidΪ"+addressid);

		String hql = "from Addressinfo a where a.addressid=?";
		Integer[] val = new Integer[]{ addressid };

		try{
			list = addressinfoService.findInfo(hql, val);
			if(list.size()>0){
				Addressinfo temp = (Addressinfo) list.get(0);
				addressinfoService.delete(temp);
			}
			else{
				System.out.println("ɾ��ʧ�ܣ�");
				delResult = "ɾ��ʧ�ܣ������ԣ�";
				return null;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			delResult = "ɾ��ʧ�ܣ������ԣ�";
			System.out.println("ɾ��ʧ�ܣ�");
			return null;
		}
		delResult = "ɾ����ַ�ɹ���";
		System.out.println("ɾ����ַ�ɹ���");
		
		hql = "from Addressinfo a where a.addressid>0 "; // ��ѯ���
		//req = ServletActionContext.getRequest();
		
		this.pageBean = addressinfoService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		//System.out.println("list.size()Ϊ��"+list.size());
		if (list.size() <= 0) {
			this.pageBean = addressinfoService.querySearchForPage(10, page - 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}
		addResult = JsonUtil.listToJson(list);
		
		return SUCCESS;
	}
	
	public String getCommNum(){
		System.out.println("This is getCommNum() of AddressAction!");
		try {
			province = java.net.URLDecoder.decode(province,"UTF-8");
			city = java.net.URLDecoder.decode(city,"UTF-8");
			town = java.net.URLDecoder.decode(town,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("�������Ĳ���provinceΪ��"+province+city+town);
//		try {
//			
			String hql = "from Addressinfo a where a.district=? group by a.street";
			String[] values = new String[]{province+","+city+","+town};
			//Integer[] values = new Integer[1];
			//values[0] = schoolid;

			list = addressinfoService.findInfo(hql, values);
			System.out.println("�ҵ��õ�ַ�²��ظ�street��list.size()Ϊ��"+list.size());
			checkResult = JsonUtil.listToJson(list);
//			
//			if (list.size() > 0) {
//				msg = "��ѧУ�����Ѵ���";
//			} else {
//				msg = "";
//			}
//			System.out.println("msgΪ��"+msg);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return SUCCESS;
	}
	
	public String checkCommInfo(){
		System.out.println("This is checkCommInfo() of AddressAction!");
		try {
			province = java.net.URLDecoder.decode(province,"UTF-8");
			city = java.net.URLDecoder.decode(city,"UTF-8");
			town = java.net.URLDecoder.decode(town,"UTF-8");
			street = java.net.URLDecoder.decode(street,"UTF-8");
			community = java.net.URLDecoder.decode(community,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String hql = "from Addressinfo a where a.district=? and a.street=? and a.community=?";
		String[] values = new String[]{ province+","+city+","+town, street, community };
		list = addressinfoService.findInfo(hql, values);
		
		
		if (list.size() > 0) {
			msg = "�����������Ѵ���";
		} else {
			msg = "��д��ȷ��";
		}
		System.out.println("msgΪ��"+msg);
		return "success";
	}
	/**

	public String searchSchoolInfo() {
		try {
			System.out.println("This is searchSchoolInfo() of SchoolAction!");
			
			String hql="from Schoolinfo";
			String[] values = new String[1];
			

			if(schoolname!=null && !schoolname.equals("")){
				hql+=" s where s.schoolname like ?";
				values[0] = "%"+schoolname+"%";
				System.out.println("��������School��ֵΪ��"+schoolname);
				this.pageBean = schoolinfoService.querySearchForPage(pageBean.getAllRow() , page, hql, values);
				list = pageBean.getList();
				System.out.println("list.size()Ϊ��"+list.size());
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
			schResult = JsonUtil.listToJson(list);
			// System.out.println(stuResult);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	**/
	
	///�б�  ���б��
	public String downloadStuInfo(){
		System.out.println("This is downloadStuInfo() of AddressAction!");
		String hql="from Addressinfo a where a.addressid>0 ";
		
		list = addressinfoService.findAll(hql);
		
		//System.out.println("list2��sizeΪ��"+list2.size());
		
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
	
	//���ڼ���������ѧУ��������������ǰ̨��ʾ��2016-8-2
	public int peopleCommunityComputing(String district,String street,String community){
		//System.out.println("This is peopleComputing() of AddressAction!");
		String tempAddress = district+","+street+","+community;
		//System.out.println(tempAddress);
		
		String hql = "from Userinfo u where u.level in (?,?) and u.address=?";
		String[] values = new String[]{"ѧ��","�ҳ�",tempAddress};
		list = addressinfoService.findInfo(hql, values);
		return list.size();
	}
	
	//2017.4.24�ع�
	public void getTheCommunity(){
		district =province+","+ city+","+town;
//		System.out.println("in getTheCommunity district is:"+district+" & street is:"+street);
		String hql = "from Addressinfo a where a.district=? and a.street=?";
		String[] values = new String[]{district,street};
		list = addressinfoService.findInfo(hql, values);
		String listjson = JsonUtil.listToJson(list);
		try {
			ServletActionContext.getResponse().getWriter().write(listjson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getTheStreet(){
		district =province+","+ city+","+town;
//		System.out.println("in getTheStreet district is:"+district);
		String hql = "from Addressinfo a where a.district=?";
		String[] values = new String[]{district};
		list = addressinfoService.findInfo(hql, values);
		String listjson = JsonUtil.listToJson(list);
		//System.out.println("list:"+list);
		try {
			ServletActionContext.getResponse().getWriter().write(listjson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getTheDistrict(){
//		System.out.println("in getTheDistrict addressid is:"+addressid);
		String hql = "from Addressinfo a where a.addressid=?";
		Object[] values = new Object[]{addressid};
		list = addressinfoService.findInfo(hql, values);
//		province, city,town,street
		String listjson = JsonUtil.listToJson(list);
		//System.out.println("list:"+list);
		try {
			ServletActionContext.getResponse().getWriter().write(listjson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getTheAddressId(){
//		System.out.println("in getTheDistrict addressid is:"+addressid);
		String hql = "from Addressinfo a where a.district=? and a.street=? and a.community=?";
		String[] values = new String[]{district,street,community};
		list = addressinfoService.findInfo(hql, values);
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
