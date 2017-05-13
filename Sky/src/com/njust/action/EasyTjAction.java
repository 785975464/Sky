package com.njust.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.Rows;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.njust.domain.TjKey;
import com.njust.domain.TjSheet;
import com.njust.domain.TjValue;
import com.njust.service.TjKeyService;
import com.njust.service.TjSheetService;
import com.njust.service.TjValueService;
import com.njust.tag.JsonUtil;
import com.njust.tag.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EasyTjAction extends ActionSupport{	
	private TjSheetService tjSheetService;
	private TjKeyService tjKeyService;
	private TjValueService tjValueService;
	
	private String sheetid;     //createtime+creator  的ASCII生成
	private String sheetname;    //表名
	private Timestamp creatime;
	private String creator;   
	
	private Integer kid;     //自增
//	private String sheetid;
	private String sheetkey;    //属性名字
	private Integer keytype;    //属性类型
	private String choicevalue;   //选择题时候的  选项
	private String keysequence;    //顺序
	
	
	private Integer vid;    //自增
//	private String sheetjid;     
	private String sheetvalue;   //对应属性的值
	private String sequence;
	private String username;
	
	
	private List list;
	private PageBean pageBean;
	private int page; // 第几页
	private String stuResult; // 反馈给ajax的json对象---用于list
	
	
	
	
	public void setTjSheetService(TjSheetService tjSheetService) {
		this.tjSheetService = tjSheetService;
	}
	public void setTjKeyService(TjKeyService tjKeyService) {
		this.tjKeyService = tjKeyService;
	}
	public void setTjValueService(TjValueService tjValueService) {
		this.tjValueService = tjValueService;
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
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSheetid() {
		return sheetid;
	}
	public void setSheetid(String sheetid) {
		this.sheetid = sheetid;
	}
	@JSON(name = "STURESULT")
	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}
	public String getSheetname() {
		return sheetname;
	}
	public void setSheetname(String sheetname) {
		this.sheetname = sheetname;
	}
	public Timestamp getCreatime() {
		return creatime;
	}
	public void setCreatime(Timestamp creatime) {
		this.creatime = creatime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Integer getKid() {
		return kid;
	}
	public void setKid(Integer kid) {
		this.kid = kid;
	}
	public String getSheetkey() {
		return sheetkey;
	}
	public void setSheetkey(String sheetkey) {
		this.sheetkey = sheetkey;
	}
	public Integer getKeytype() {
		return keytype;
	}
	public void setKeytype(Integer keytype) {
		this.keytype = keytype;
	}
	public String getChoicevalue() {
		return choicevalue;
	}
	public void setChoicevalue(String choicevalue) {
		this.choicevalue = choicevalue;
	}
	public String getKeysequence() {
		return keysequence;
	}
	public void setKeysequence(String keysequence) {
		this.keysequence = keysequence;
	}
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getSheetvalue() {
		return sheetvalue;
	}
	public void setSheetvalue(String sheetvalue) {
		this.sheetvalue = sheetvalue;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public TjSheetService getTjSheetService() {
		return tjSheetService;
	}
	public TjKeyService getTjKeyService() {
		return tjKeyService;
	}
	public TjValueService getTjValueService() {
		return tjValueService;
	}
	///列表  所有的调查表格
	public String gettjlist(){
		String hql="from TjSheet t order by t.creatime desc";
		
		this.pageBean = tjSheetService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = tjSheetService.querySearchForPage(10, 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}	
		
		///////////request
		
		
		return SUCCESS;
	}
	
	////展示一张调查表格
	public String startTj () {
		String hql="from TjKey t where t.sheetid=? order by t.keysequence";
		String[] values = new String[1];
		values[0] = sheetid;
		list = tjKeyService.findInfo(hql, values);
		return SUCCESS;
	}
	
	public String findMoreSheets(){
		String hql="from TjSheet t order by t.creatime desc";
		
		this.pageBean = tjSheetService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = tjSheetService.querySearchForPage(10, 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}	
		return SUCCESS;
	}
	public String userSheets(){											//新增问卷，2015-12-16
		System.out.println("This is userSheets() of EasyTjAction!");
		String hql="from TjSheet t order by t.creatime desc";
		
		this.pageBean = tjSheetService.querySearchForPage(10, page, hql);
		list = pageBean.getList();
		if (list.size() <= 0) {
			this.pageBean = tjSheetService.querySearchForPage(10, 1, hql);
			list = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}	
		return SUCCESS;
	}
	public String findSheetsByID () {
		String hql="from TjKey t where t.sheetid=? order by t.keysequence";
		String[] values = new String[1];
		values[0] = sheetid;
		list = tjKeyService.findInfo(hql, values);
		
		String h="from TjSheet t where t.sheetid=?";
		List l=tjSheetService.findInfo(h, values);
		TjSheet tj=(TjSheet)l.get(0);
		ActionContext ac = ActionContext.getContext();
		ac.put("sheet",tj);
		return SUCCESS;
	}

	public String userSheetsByID () {			//用户问卷
		System.out.println("This is userSheetsByID() of EasyTjAction!");
		String hql="from TjKey t where t.sheetid=? order by t.keysequence";
		String[] values = new String[1];
		values[0] = sheetid;
		list = tjKeyService.findInfo(hql, values);
		
		String h="from TjSheet t where t.sheetid=?";
		List l=tjSheetService.findInfo(h, values);
		TjSheet tj=(TjSheet)l.get(0);
		ActionContext ac = ActionContext.getContext();
		ac.put("sheet",tj);
		return SUCCESS;
	}

	public String deleteTjByID () {
		String hql="from TjSheet t where t.sheetid=?";
		String[] values = new String[1];
		values[0] = sheetid;
		TjSheet tjSheet =new TjSheet();
		List list=tjSheetService.findInfo(hql, values);
		tjSheet=(TjSheet) list.get(0);
		tjSheetService.delete(tjSheet);
		
		String h1="from TjKey t where t.sheetid=?";
		List li=tjKeyService.findInfo(h1, values);
		if (li!=null) {
			for (int i = 0; i < li.size(); i++) {
				TjKey tjKey=new TjKey();
				tjKey=(TjKey) li.get(i);
				tjKeyService.delete(tjKey);
			}
		}
		
		String h2="from TjValue t where t.sheetid=?";
		List lio=tjValueService.findInfo(h2, values);
		if (lio!=null) {
			for (int i = 0; i < lio.size(); i++) {
				TjValue tjValue=new TjValue();
				tjValue=(TjValue) lio.get(i);
				tjValueService.delete(tjValue);
			}
		}
		
		String hqlr="from TjSheet t order by t.creatime ";
		
		this.pageBean = tjSheetService.querySearchForPage(10, page, hqlr);
		List listy = pageBean.getList();
		if (listy.size() <= 0) {
			this.pageBean = tjSheetService.querySearchForPage(10, 1, hqlr);
			listy = pageBean.getList();
			this.pageBean.setTotalPage(1);
			this.pageBean.setCurrentPage(1);
		}	
		stuResult = JsonUtil.listToJson(listy);
		
		
		return SUCCESS;
	}
	
	
	
	
	
	
	public String exportDcDataToFile(){
		//在服务器新建一个excel文件，写入数据，下载文件，再删除服务器的文件
		String[] values = new String[1];
		values[0] = sheetid;
		HttpServletRequest request = ServletActionContext.getRequest();
		String basepath=request.getSession().getServletContext().getRealPath("/");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String tempfilename=sheetid+df.format(new Date());
		String filePath=basepath+"/upload/"+tempfilename+".xls";

		Workbook wb = new HSSFWorkbook();  
        DataFormat format = wb.createDataFormat();  
        CellStyle style;  
        String[] attribute ;
        //创建一个SHEET  
        String h="from TjSheet t where t.sheetid=?";        
		List l=tjSheetService.findInfo(h, values);        
        TjSheet tSheet=new TjSheet();
        tSheet=(TjSheet) l.get(0);
        TjKey tjKey=new TjKey();
        String hql="from TjKey t where t.sheetid=? order by t.keysequence";
		list = tjKeyService.findInfo(hql, values);   //属性栏
		attribute=new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			TjKey tkey=new TjKey();
			tkey=(TjKey)list.get(i);
			attribute[i]=tkey.getSheetkey();
		}
		
		Sheet sheet1 = wb.createSheet(tSheet.getSheetname());
		Row row=sheet1.createRow(0);
		for (int i = 0; i < attribute.length; i++) {    //填充标题  
			Cell cell=row.createCell(i+1);
			cell.setCellValue(attribute[i]);
		}
		
		////具体数据
		String hq="from TjValue tv where tv.sheetid=?";
		List valuelist = tjKeyService.findInfo(hq, values); 
		int all_rows=valuelist.size()/attribute.length;  //总行数
		for (int k = 0; k < valuelist.size(); ) {
			for (int i = 0; i < all_rows; i++) {
				Row row1=sheet1.createRow(i+1);
				row1.createCell(0).setCellValue(i);
				for (int j = 0; j < attribute.length; j++) {
					TjValue tvValue=new TjValue();
					tvValue=(TjValue) valuelist.get(k);
					String vString=tvValue.getSheetvalue();
					row1.createCell(j+1).setCellValue(vString);
					k++;
				}
			}
		}
		
		FileOutputStream fileOut;
		try {
			fileOut = new FileOutputStream(filePath);
			wb.write(fileOut);  
		    fileOut.close(); 
//		    System.out.println("333333333333");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		ActionContext ac = ActionContext.getContext();
		String fp=tempfilename+".xls";
		ac.put("dcwjfilePatht",fp);
		return SUCCESS;
	}
	
	
	
	
	public String sunmitsuccess(){
		return "success";
	}
	public String usersubmitsuccess(){		//判断用户是否登录 2015-12-17
		return "success";
	}
	
	
}
