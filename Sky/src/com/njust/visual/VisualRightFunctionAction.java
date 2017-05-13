package com.njust.visual;

import java.awt.Color;
import java.awt.RenderingHints;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.jfree.chart.ChartColor;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.Plot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.time.Day;
import org.jfree.data.time.Hour;
import org.jfree.data.time.Minute;
import org.jfree.data.time.Month;
import org.jfree.data.time.RegularTimePeriod;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

import com.njust.domain.Userinfo;
import com.njust.domain.Visioncheck;
import com.njust.service.VisioncheckService;


public class VisualRightFunctionAction {

    /**  
     * 定义JFreeChart对象 注意在这里JFreeChart对象名只能为chart     
     *   
     */  
    private JFreeChart chart;   
	private VisioncheckService visioncheckService;
	private HttpServletRequest req;
  
    public VisioncheckService getVisioncheckService() {
		return visioncheckService;
	}

	public void setVisioncheckService(VisioncheckService visioncheckService) {
		this.visioncheckService = visioncheckService;
	}

	public JFreeChart getChart() {   
        return chart;   
    }   
  
    public void setChart(JFreeChart chart) {   
        this.chart = chart;   
    }
	
    //---------------------------------------------
    private XYDataset createDataset(ArrayList<Double> leftVisual, ArrayList<String> checkTimeList,int age) {
    	TimeSeriesCollection dataset = new TimeSeriesCollection();
    
    	//TimeSeries timeSeries1 = new TimeSeries("左眼视力图",Month.class);
    	//TimeSeries timeSeries2 = new TimeSeries("视力标准",Month.class);
    	TimeSeries timeSeries1 = new TimeSeries("右眼视力图",Day.class);
    	TimeSeries timeSeries2 = new TimeSeries("视力标准",Day.class);
    	//TimeSeries timeSeries3 = new TimeSeries("12");
    	//timeSeries3.add(1);
    	double standardline;		//设置视力达标线
    	if(age>=0 && age<5){
    		standardline=0.5;
    	}
    	else if(age>=5 && age<8){
    		standardline=0.8;
    	}
    	else if(age>=8 && age<12){
    		standardline=0.8;
    	}
    	else if(age>=12 && age<150){
    		standardline=0.5;
    	}
    	else{
    		standardline=0;
    	}
    	/****/
    try{
    	for(int i=0;i<leftVisual.size();i++){
    		//timeSeries1.add(new Day(21, 9, 2008), (Double) leftVisual.toArray()[i]);
    		//System.out.println("第"+i+"次循环");
    		String[] value=((String) checkTimeList.toArray()[i]).split("-");

    		//System.out.println((Double)leftVisual.toArray()[i]);
    		if(value.length==3){
    			//年月日展示 2016-1-26
    			timeSeries1.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , (Double)leftVisual.toArray()[i]);
    			timeSeries2.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , standardline);
    		}
    		
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    	dataset.addSeries(timeSeries1);
    	dataset.addSeries(timeSeries2);
    	//timeSeries1.setMaximumItemAge(1000);	//设置元素过期周期
    	return dataset;
    }
    

	   ///////////////*********************NEW*************************************************
//	   private JFreeChart getChartByType(ArrayList<Double> leftVisual,  ArrayList<String> checkTimeList, int size,String typeString) {
//			DefaultCategoryDataset dataSet = new DefaultCategoryDataset(); 
//			for (int i = 0; i <size; i++) {
//				int j=i+1;
//				dataSet.addValue(leftVisual.get(i), typeString, checkTimeList.get(i)+"("+j+")");
//			}
//			chart=ChartFactory.createLineChart(typeString, "检测时间", "数值", dataSet, 
//					 PlotOrientation.VERTICAL, // 绘制方向  
//					 true, // 绘制方向
//					 true,// 显示图例
//					 false// 是否生成超链接  
//					 );
//			CategoryPlot cp = chart.getCategoryPlot();  
//	        cp.setBackgroundPaint(ChartColor.WHITE); // 背景色设置  
//	        cp.setRangeGridlinePaint(ChartColor.GRAY); // 网格线色设置  
//	        cp.setNoDataMessage("数据缺失。。。。。。");
//			return chart;
//		}
//	   
//	   public String leftVisualFuntion() {   
//		   System.out.println("This is leftVisualFuntion() of VisualJChartAction!");
//		   try {
//	    		req = ServletActionContext.getRequest();
//				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//				String hql = "from Visioncheck v where v.username=? order by v.tableId"; 				
//				String[] values = new String[] { u.getUsername() };
//				Calendar now = Calendar.getInstance();
//				int age = now.get(Calendar.YEAR) - Integer.parseInt(u.getAge().substring(0, 4));
//				//System.out.println("该用户的年龄为："+u.getAge()+"age为："+age);
//				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
//				ArrayList <Double> leftVisual = new ArrayList<Double>();	
//				ArrayList <String> checkTimeList = new ArrayList<String>();
//				//System.out.println("list.size()为"+list.size());
//				for (int i = 0; i < list.size(); i++) {
//
//					leftVisual.add(Double.valueOf(list.get(i).getLeftEyeLittleValue()));					
//					checkTimeList.add(list.get(i).getCheckTime());	
//				}				
//				//改为时序图显示多条折线 2016-1-19
//				this.chart = ChartFactory.createTimeSeriesChart("左眼视力","检测时间", "数值", createDataset(leftVisual,checkTimeList,age), true,true, false);
//				XYPlot xyplot = (XYPlot) chart.getPlot(); // 获得 plot
//				DateAxis dateaxis = (DateAxis) xyplot.getDomainAxis(); // 对domain
//				  // 轴上日期显示格式定义
//				dateaxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd"));
//				//XYDataset dataset = createXYDataset();
//				//chart = createChart(dataset);
//				//this.chart = getChartByType(leftVisual,checkTimeList,list.size(),"左眼视力");
//	            return "success";
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//				return null;
//			}	        
//	    }
	   
	   //测试左右眼分别生成折线图 2016。5.10
	   public String rightVisualFunction() {
		   System.out.println("This is rightVisualFunction() of VisualRightFunctionAction!");
	    	try {
	    		req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个				
				String[] values = new String[] { u.getUsername() };
				Calendar now = Calendar.getInstance();
				int age = now.get(Calendar.YEAR) - Integer.parseInt(u.getAge().substring(0, 4));
				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
				ArrayList <Double> rightVisual = new ArrayList<Double>();
				ArrayList <String> checkTimeList = new ArrayList<String>();
				double temp_value;
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date dt;
				for (int i = 0; i < list.size(); i++) {	
					try{
						temp_value=Double.valueOf(list.get(i).getRightEyeLittleValue());
						dt = df.parse(list.get(i).getCheckTime());
					}catch(Exception e){
						System.out.println("第"+i+"次循环，rightVisualFunction视力中有错误数据！");
						continue;
					}
//					System.out.println(temp_value+"\t"+df.format(dt));
					rightVisual.add(temp_value);
					checkTimeList.add(df.format(dt));
				}
				//改为时序图显示多条折线 2016-1-19
				this.chart = ChartFactory.createTimeSeriesChart("右眼视力","检测时间", "数值", createDataset(rightVisual,checkTimeList,age), true,true, false);
				XYPlot xyplot = (XYPlot) chart.getPlot(); // 获得 plot
				DateAxis dateaxis = (DateAxis) xyplot.getDomainAxis(); // 对domain
				  // 轴上日期显示格式定义
				dateaxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd"));
				//this.chart = getChartByType(rightVisual,checkTimeList,list.size(),"右眼视力");
	            return "success";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	        
	    }
	   
	   //屈光度
//	   public String leftRefraction() {
//		   System.out.println("This is leftRefraction() of VisualJChartAction!");
//	    	try {	
//	    		req = ServletActionContext.getRequest();
//				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个			
//				String[] values = new String[] { u.getUsername() };
//				List<Visioncheck> list = visioncheckService.findInfo(hql, values);		
//				ArrayList <Double> leftRefraction = new ArrayList<Double>();
//				ArrayList <String> checkTimeList = new ArrayList<String>();
//				for (int i = 0; i < list.size(); i++) {
//					leftRefraction.add(Double.valueOf(list.get(i).getRefractionLeftEyeAverages()));					
//					checkTimeList.add(list.get(i).getCheckTime());	
//				}				
//				this.chart = getChartByType(leftRefraction,checkTimeList,list.size(),"左眼屈光度");
//	            return "success";
//			} catch (Exception e) {
//				// TODO: handle exception
//				//e.printStackTrace();
//				return null;
//			}	        
//	    }
//	   
//	   public String rightRefraction() {
//		   System.out.println("This is rightRefraction() of VisualJChartAction!");
//	    	try {	
//	    		req = ServletActionContext.getRequest();
//				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//				String hql = "from Visioncheck v where v.username=? order by v.tableId"; 
//				String[] values = new String[] { u.getUsername() };
//				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
//				ArrayList <Double> rightRefraction = new ArrayList<Double>();	
//				ArrayList <String> checkTimeList = new ArrayList<String>();
//				for (int i = 0; i < list.size(); i++) {	
//					rightRefraction.add(Double.valueOf(list.get(i).getRefractionRightEyeAverages()));
//					checkTimeList.add(list.get(i).getCheckTime());
//				}
//				this.chart = getChartByType(rightRefraction,checkTimeList,list.size(),"右眼屈光度");
//	            return "success";
//			} catch (Exception e) {
//				// TODO: handle exception
//				//e.printStackTrace();
//				return null;
//			}
//	    }
//	   
//	   //瞳孔
//	   public String leftAxialLength() {
//		   System.out.println("This is leftAxialLength() of VisualJChartAction!");
//	    	try {
//	    		
//	    		req = ServletActionContext.getRequest();
//				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个			
//				String[] values = new String[] { u.getUsername() };
//				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
//				ArrayList <Double> leftAxialLength = new ArrayList<Double>();				
//				ArrayList <String> checkTimeList = new ArrayList<String>();				
//				for (int i = 0; i < list.size(); i++) {
//					leftAxialLength.add(Double.valueOf(list.get(i).getLeftAnteriorAxialLength()));					
//					checkTimeList.add(list.get(i).getCheckTime());	
//				}		
//				this.chart = getChartByType(leftAxialLength,checkTimeList,list.size(),"左眼瞳孔长度");
//	            return "success";
//			} catch (Exception e) {
//				// TODO: handle exception
//				//e.printStackTrace();
//				return null;
//			}
//	        
//	    }
//
//		   public String rightAxialLength() { 
//			   System.out.println("This is rightAxialLength() of VisualJChartAction!");
//		    	try {		    	
//		    		req = ServletActionContext.getRequest();
//					Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//					String hql = "from Visioncheck v where v.username=? order by v.tableId"; 
//					String[] values = new String[] { u.getUsername() };
//					List<Visioncheck> list = visioncheckService.findInfo(hql, values);			
//					ArrayList <Double> rightAxialLength = new ArrayList<Double>();
//					ArrayList <String> checkTimeList = new ArrayList<String>();
//					for (int i = 0; i < list.size(); i++) {	
//						rightAxialLength.add(Double.valueOf(list.get(i).getRightAnteriorAxialLength()));
//						checkTimeList.add(list.get(i).getCheckTime());
//					}					
//					this.chart = getChartByType(rightAxialLength,checkTimeList,list.size(),"右眼瞳孔长度");
//		            return "success";
//				} catch (Exception e) {
//					// TODO: handle exception
//					//e.printStackTrace();
//					return null;
//				}
//		        
//		    }
	   
}
