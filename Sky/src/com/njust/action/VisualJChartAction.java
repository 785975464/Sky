package com.njust.action;

import java.awt.Color;
import java.awt.RenderingHints;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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


public class VisualJChartAction {

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
	

  /*  
    private JFreeChart getPieChart(ArrayList<Double> leftVisual, ArrayList<Double> leftRefraction, ArrayList<Double> leftAxialLength, ArrayList<String> checkTimeList, int size) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset(); 
		for (int i = 0; i <size; i++) {
			dataSet.addValue(leftVisual.get(i), "视力", checkTimeList.get(i));
			dataSet.addValue(leftRefraction.get(i), "屈光度", checkTimeList.get(i));
			dataSet.addValue(leftAxialLength.get(i), "眼轴长度", checkTimeList.get(i));
		}

		chart=ChartFactory.createLineChart3D("我的视觉", "检测时间", "数值", dataSet, 
				 PlotOrientation.VERTICAL, // 绘制方向  
				 true, // 绘制方向
				 true,// 显示图例
				 false// 是否生成超链接  
				 );
		CategoryPlot cp = chart.getCategoryPlot();  
        cp.setBackgroundPaint(ChartColor.WHITE); // 背景色设置  
        cp.setRangeGridlinePaint(ChartColor.GRAY); // 网格线色设置  
        cp.setNoDataMessage("数据缺失。。。。。。");
		return chart;
	}
    

    public String leftVisualChart() {   
         //实例化chart
    	try {
    		
    		req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个
			
			String[] values = new String[] { u.getUsername() };
			List<Visioncheck> list = visioncheckService.findInfo(hql, values);
			
			ArrayList <Double> leftVisual = new ArrayList<Double>();
			
			ArrayList <Double> leftRefraction = new ArrayList<Double>();
			
			ArrayList <Double> leftAxialLength = new ArrayList<Double>();
			
			ArrayList <String> checkTimeList = new ArrayList<String>();
			
			for (int i = 0; i < list.size(); i++) {

				leftVisual.add(Double.valueOf(list.get(i).getLeftEyeLittleValue()));
				leftRefraction.add(Double.valueOf(list.get(i).getRefractionLeftEyeAverages()));
				leftAxialLength.add(Double.valueOf(list.get(i).getLeftAnteriorAxialLength()));
				
				checkTimeList.add(list.get(i).getCheckTime());	
			}
			
			this.chart = getPieChart(leftVisual,leftRefraction,leftAxialLength,checkTimeList,list.size());
            return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
        
    }

	   public String rightVisualChart() {   
	         //实例化chart
	    	try {
	    		
	    		req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个
				
				String[] values = new String[] { u.getUsername() };
				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
				
				
				ArrayList <Double> rightVisual = new ArrayList<Double>();
				ArrayList <Double> rightRefraction = new ArrayList<Double>();				
				ArrayList <Double> rightAxialLength = new ArrayList<Double>();
				ArrayList <String> checkTimeList = new ArrayList<String>();
				
				for (int i = 0; i < list.size(); i++) {	
					rightRefraction.add(Double.valueOf(list.get(i).getRefractionRightEyeAverages()));
					rightVisual.add(Double.valueOf(list.get(i).getRightEyeLittleValue()));
					rightAxialLength.add(Double.valueOf(list.get(i).getRightAnteriorAxialLength()));
					checkTimeList.add(list.get(i).getCheckTime());
				}
				
				this.chart = getPieChart(rightVisual,rightRefraction,rightAxialLength,checkTimeList,list.size());
	            return "success";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	        
	    }
	
	   
*/
    /**设置多条折线图
    private static XYDataset createXYDataset() {
        XYSeries xyseries1 = new XYSeries("One");
        xyseries1.add(1D, 50);
        xyseries1.add(2D, 20);
        xyseries1.add(3D, 30);
        xyseries1.add(5D, 40);
 
        XYSeries xyseries2 = new XYSeries("Two");
        xyseries2.add(1D, 20);
        xyseries2.add(2D, 10);
        xyseries2.add(3D, 40);
        XYSeriesCollection xySeriesCollection = new XYSeriesCollection();
        xySeriesCollection.addSeries(xyseries1); 
        xySeriesCollection.addSeries(xyseries2);
        return xySeriesCollection;
    }
    public static JFreeChart createChart(XYDataset dataset) {      
        // 创建JFreeChart对象：ChartFactory.createXYLineChart      
        JFreeChart jfreechart = ChartFactory.createXYLineChart("XYLine Chart Demo", // 标题      
                "年分", // categoryAxisLabel （category轴，横轴，X轴标签）      
                "数量", // valueAxisLabel（value轴，纵轴，Y轴的标签）      
                dataset, // dataset      
                PlotOrientation.VERTICAL,   
                true, // legend      
                false, // tooltips      
                false); // URLs      
 
        // 使用CategoryPlot设置各种参数。以下设置可以省略。      
        XYPlot plot = (XYPlot) jfreechart.getPlot();      
        // 背景色 透明度      
        plot.setBackgroundAlpha(0.5f);      
        // 前景色 透明度      
        plot.setForegroundAlpha(0.5f);      
        // 其它设置可以参考XYPlot类      
 
        return jfreechart;      
    }
    **/
    //---------------------------------------------
    private XYDataset createDataset(ArrayList<Double> leftVisual, ArrayList<String> checkTimeList,int age) {
    	TimeSeriesCollection dataset = new TimeSeriesCollection();
    
    	//TimeSeries timeSeries1 = new TimeSeries("左眼视力图",Month.class);
    	//TimeSeries timeSeries2 = new TimeSeries("视力标准",Month.class);
    	TimeSeries timeSeries1 = new TimeSeries("左眼视力图",Day.class);
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
    			//timeSeries1.addOrUpdate(new Month(i+1,2016) , (Double)leftVisual.toArray()[i]);
    			//timeSeries2.addOrUpdate(new Month(i+1,2016) , 0.8);
    			//System.out.println("value[0])为"+value[0]+"\tvalue[1])为"+value[1]);
    			//timeSeries1.addOrUpdate(new Month(Integer.parseInt(value[1]),2015) , 0.7);
    			
    			//timeSeries1.add(new Month(Integer.parseInt(value[1]), Integer.parseInt(value[0])) , (Double)leftVisual.toArray()[i]);
    			//timeSeries2.add(new Month(Integer.parseInt(value[1]), Integer.parseInt(value[0])) , standardline);
    			
    			//年月日展示 2016-1-26
    			timeSeries1.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , (Double)leftVisual.toArray()[i]);
    			timeSeries2.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , standardline);
    			//timeSeries1.addOrUpdate(new Month(Integer.parseInt(value[1]), Integer.parseInt(value[0])) , (Double)leftVisual.toArray()[i]);
    			//timeSeries2.addOrUpdate(new Month(Integer.parseInt(value[1]), Integer.parseInt(value[0])) , standardline);
    			//timeSeries2.addOrUpdate(new Month(1+i, Integer.parseInt(value[0])) , 0.8);
    		}
    		
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    	/**
    	timeSeries1.addOrUpdate(new Month(1,2015) , 0.8);
    	timeSeries1.addOrUpdate(new Month(2,2015) , 0.7);
    	timeSeries1.addOrUpdate(new Month(3,2015) , 0.8);
    	timeSeries2.addOrUpdate(new Month(2,2015) , 0.8);
    	timeSeries2.addOrUpdate(new Month(3,2015) , 0.7);
    	timeSeries2.addOrUpdate(new Month(4,2015) , 0.8);
    	**/
    	dataset.addSeries(timeSeries1);
    	dataset.addSeries(timeSeries2);
    	//timeSeries1.setMaximumItemAge(1000);	//设置元素过期周期
    	//timeSeries2.setMaximumItemAge(1000);
    	//dataset.addSeries(timeSeries3);
    	return dataset;
    }
    

	   ///////////////*********************NEW*************************************************
	   private JFreeChart getChartByType(ArrayList<Double> leftVisual,  ArrayList<String> checkTimeList, int size,String typeString) {
			DefaultCategoryDataset dataSet = new DefaultCategoryDataset(); 
			for (int i = 0; i <size; i++) {
				int j=i+1;
				dataSet.addValue(leftVisual.get(i), typeString, checkTimeList.get(i)+"("+j+")");
			}
			chart=ChartFactory.createLineChart(typeString, "检测时间", "数值", dataSet, 
					 PlotOrientation.VERTICAL, // 绘制方向  
					 true, // 绘制方向
					 true,// 显示图例
					 false// 是否生成超链接  
					 );
			CategoryPlot cp = chart.getCategoryPlot();  
	        cp.setBackgroundPaint(ChartColor.WHITE); // 背景色设置  
	        cp.setRangeGridlinePaint(ChartColor.GRAY); // 网格线色设置  
	        cp.setNoDataMessage("数据缺失。。。。。。");
			return chart;
		}
	   
	   public String leftVisualFuntion() {   
		   System.out.println("This is leftVisualFuntion() of VisualJChartAction!");
		   try {
	    		req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				String hql = "from Visioncheck v where v.username=? order by v.tableId"; 				
				String[] values = new String[] { u.getUsername() };
				Calendar now = Calendar.getInstance();
				int age = now.get(Calendar.YEAR) - Integer.parseInt(u.getAge().substring(0, 4));
				//System.out.println("该用户的年龄为："+u.getAge()+"age为："+age);
				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
				ArrayList <Double> leftVisual = new ArrayList<Double>();	
				ArrayList <String> checkTimeList = new ArrayList<String>();
				//System.out.println("list.size()为"+list.size());
				for (int i = 0; i < list.size(); i++) {

					leftVisual.add(Double.valueOf(list.get(i).getLeftEyeLittleValue()));					
					checkTimeList.add(list.get(i).getCheckTime());	
				}				
				//改为时序图显示多条折线 2016-1-19
				this.chart = ChartFactory.createTimeSeriesChart("左眼视力","检测时间", "数值", createDataset(leftVisual,checkTimeList,age), true,true, false);
				XYPlot xyplot = (XYPlot) chart.getPlot(); // 获得 plot
				DateAxis dateaxis = (DateAxis) xyplot.getDomainAxis(); // 对domain
				  // 轴上日期显示格式定义
				dateaxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd"));
				//XYDataset dataset = createXYDataset();
				//chart = createChart(dataset);
				//this.chart = getChartByType(leftVisual,checkTimeList,list.size(),"左眼视力");
	            return "success";
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}	        
	    }
//	   public String rightVisualFunction() {
//		   System.out.println("This is rightVisualFunction() of VisualJChartAction!");
//	    	try {	    		
//	    		req = ServletActionContext.getRequest();
//				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个				
//				String[] values = new String[] { u.getUsername() };
//				Calendar now = Calendar.getInstance();
//				int age = now.get(Calendar.YEAR) - Integer.parseInt(u.getAge().substring(0, 4));
//				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
//				ArrayList <Double> rightVisual = new ArrayList<Double>();
//				ArrayList <String> checkTimeList = new ArrayList<String>();				
//				for (int i = 0; i < list.size(); i++) {	
//					rightVisual.add(Double.valueOf(list.get(i).getRightEyeLittleValue()));
//					checkTimeList.add(list.get(i).getCheckTime());
//				}
//				//改为时序图显示多条折线 2016-1-19
//				this.chart = ChartFactory.createTimeSeriesChart("右眼视力","检测时间", "数值", createDataset(rightVisual,checkTimeList,age), true,true, false);
//				XYPlot xyplot = (XYPlot) chart.getPlot(); // 获得 plot
//				DateAxis dateaxis = (DateAxis) xyplot.getDomainAxis(); // 对domain
//				  // 轴上日期显示格式定义
//				dateaxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd"));
//				//this.chart = getChartByType(rightVisual,checkTimeList,list.size(),"右眼视力");
//	            return "success";
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//				return null;
//			}
//	        
//	    }
	   
	   //屈光度
	   public String leftRefraction() {
		   System.out.println("This is leftRefraction() of VisualJChartAction!");
	    	try {	
	    		req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个			
				String[] values = new String[] { u.getUsername() };
				List<Visioncheck> list = visioncheckService.findInfo(hql, values);		
				ArrayList <Double> leftRefraction = new ArrayList<Double>();
				ArrayList <String> checkTimeList = new ArrayList<String>();
				for (int i = 0; i < list.size(); i++) {
					leftRefraction.add(Double.valueOf(list.get(i).getRefractionLeftEyeAverages()));					
					checkTimeList.add(list.get(i).getCheckTime());	
				}				
				this.chart = getChartByType(leftRefraction,checkTimeList,list.size(),"左眼屈光度");
	            return "success";
			} catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				return null;
			}	        
	    }
	   
	   public String rightRefraction() {
		   System.out.println("This is rightRefraction() of VisualJChartAction!");
	    	try {	
	    		req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				String hql = "from Visioncheck v where v.username=? order by v.tableId"; 
				String[] values = new String[] { u.getUsername() };
				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
				ArrayList <Double> rightRefraction = new ArrayList<Double>();	
				ArrayList <String> checkTimeList = new ArrayList<String>();
				for (int i = 0; i < list.size(); i++) {	
					rightRefraction.add(Double.valueOf(list.get(i).getRefractionRightEyeAverages()));
					checkTimeList.add(list.get(i).getCheckTime());
				}
				this.chart = getChartByType(rightRefraction,checkTimeList,list.size(),"右眼屈光度");
	            return "success";
			} catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				return null;
			}
	    }
	   
	   //瞳孔
	   public String leftAxialLength() {
		   System.out.println("This is leftAxialLength() of VisualJChartAction!");
	    	try {
	    		
	    		req = ServletActionContext.getRequest();
				Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
				String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个			
				String[] values = new String[] { u.getUsername() };
				List<Visioncheck> list = visioncheckService.findInfo(hql, values);
				ArrayList <Double> leftAxialLength = new ArrayList<Double>();				
				ArrayList <String> checkTimeList = new ArrayList<String>();				
				for (int i = 0; i < list.size(); i++) {
					leftAxialLength.add(Double.valueOf(list.get(i).getLeftAnteriorAxialLength()));					
					checkTimeList.add(list.get(i).getCheckTime());	
				}		
				this.chart = getChartByType(leftAxialLength,checkTimeList,list.size(),"左眼瞳孔长度");
	            return "success";
			} catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				return null;
			}
	        
	    }

		   public String rightAxialLength() { 
			   System.out.println("This is rightAxialLength() of VisualJChartAction!");
		    	try {		    	
		    		req = ServletActionContext.getRequest();
					Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
					String hql = "from Visioncheck v where v.username=? order by v.tableId"; 
					String[] values = new String[] { u.getUsername() };
					List<Visioncheck> list = visioncheckService.findInfo(hql, values);			
					ArrayList <Double> rightAxialLength = new ArrayList<Double>();
					ArrayList <String> checkTimeList = new ArrayList<String>();
					for (int i = 0; i < list.size(); i++) {	
						rightAxialLength.add(Double.valueOf(list.get(i).getRightAnteriorAxialLength()));
						checkTimeList.add(list.get(i).getCheckTime());
					}					
					this.chart = getChartByType(rightAxialLength,checkTimeList,list.size(),"右眼瞳孔长度");
		            return "success";
				} catch (Exception e) {
					// TODO: handle exception
					//e.printStackTrace();
					return null;
				}
		        
		    }
	   
	   
	   
	
	
	
}
