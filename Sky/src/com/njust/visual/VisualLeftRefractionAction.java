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


public class VisualLeftRefractionAction {

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
    private XYDataset createDataset(ArrayList<Double> leftRefraction, ArrayList<String> checkTimeList) {	//,int age
    	TimeSeriesCollection dataset = new TimeSeriesCollection();
    
    	//TimeSeries timeSeries1 = new TimeSeries("左眼视力图",Month.class);
    	//TimeSeries timeSeries2 = new TimeSeries("视力标准",Month.class);
    	TimeSeries timeSeries1 = new TimeSeries("左眼屈光度图",Day.class);
//    	TimeSeries timeSeries2 = new TimeSeries("视力标准",Day.class);
    	//TimeSeries timeSeries3 = new TimeSeries("12");
    	//timeSeries3.add(1);
//    	double standardline;		//设置视力达标线
//    	if(age>=0 && age<5){
//    		standardline=0.5;
//    	}
//    	else if(age>=5 && age<8){
//    		standardline=0.8;
//    	}
//    	else if(age>=8 && age<12){
//    		standardline=0.8;
//    	}
//    	else if(age>=12 && age<150){
//    		standardline=0.5;
//    	}
//    	else{
//    		standardline=0;
//    	}
    	/****/
	    try{
	    	for(int i=0;i<leftRefraction.size();i++){
	    		//timeSeries1.add(new Day(21, 9, 2008), (Double) leftVisual.toArray()[i]);
	    		//System.out.println("第"+i+"次循环");
	    		String[] value=((String) checkTimeList.toArray()[i]).split("-");
	
	    		//System.out.println((Double)leftVisual.toArray()[i]);
	    		if(value.length==3){
	    			//年月日展示 2016-1-26
	    			timeSeries1.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , (Double)leftRefraction.toArray()[i]);
	//    			timeSeries2.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , standardline);
	    		}
	    		
	    	}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
    	dataset.addSeries(timeSeries1);
//    	dataset.addSeries(timeSeries2);
    	//timeSeries1.setMaximumItemAge(1000);	//设置元素过期周期
    	return dataset;
    }
	   
    //测试左右眼分别生成折线图 2016。5.10
    //屈光度
   public String leftRefraction() {
	   System.out.println("This is leftRefraction() of VisualLeftRefractionAction!");
    	try {
    		req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String hql = "from Visioncheck v where v.username=? order by v.tableId"; //再限制10个				
			String[] values = new String[] { u.getUsername() };
//				Calendar now = Calendar.getInstance();
//				int age = now.get(Calendar.YEAR) - Integer.parseInt(u.getAge().substring(0, 4));
			List<Visioncheck> list = visioncheckService.findInfo(hql, values);
			
			System.out.println("用户"+u.getUsername()+"视觉档案的数量为："+list.size());
			
			ArrayList <Double> leftRefraction = new ArrayList<Double>();
			ArrayList <String> checkTimeList = new ArrayList<String>();	
			double temp_value;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dt;
			for (int i = 0; i < list.size(); i++) {
//					System.out.println("list.get(i).getRefractionLeftEyeAverages()为："+list.get(i).getRefractionLeftEyeAverages());
//					if(list.get(i).getRefractionLeftEyeAverages().equals("")){
//						System.out.println("第"+i+"个为空值");
//					}
				if(list.get(i).getRefractionLeftEyeAverages()!=null && !list.get(i).getRefractionLeftEyeAverages().equals("")){
					try{
						temp_value=Double.valueOf(list.get(i).getRefractionLeftEyeAverages());
						dt = df.parse(list.get(i).getCheckTime());
					}catch(Exception e){
						System.out.println("第"+i+"次循环，leftRefraction视力中有错误数据！");
						continue;
					}
					leftRefraction.add(temp_value);
					checkTimeList.add(df.format(dt));
				}
			}
			//改为时序图显示多条折线 2016-1-19
			this.chart = ChartFactory.createTimeSeriesChart("左眼屈光度","检测时间", "数值", createDataset(leftRefraction,checkTimeList), true,true, false);
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
	   
	   
}
