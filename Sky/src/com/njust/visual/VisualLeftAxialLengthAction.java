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


public class VisualLeftAxialLengthAction {

    /**  
     * ����JFreeChart���� ע��������JFreeChart������ֻ��Ϊchart     
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
    private XYDataset createDataset(ArrayList<Double> leftAxialLength, ArrayList<String> checkTimeList) {	//,int age
    	TimeSeriesCollection dataset = new TimeSeriesCollection();
    
    	TimeSeries timeSeries1 = new TimeSeries("����ͫ�׳���",Day.class);
	    try{
	    	for(int i=0;i<leftAxialLength.size();i++){
	    		String[] value=((String) checkTimeList.toArray()[i]).split("-");
	    		if(value.length==3){
	    			//������չʾ 2016-1-26
	    			timeSeries1.addOrUpdate(new Day(Integer.parseInt(value[2]),Integer.parseInt(value[1]), Integer.parseInt(value[0])) , (Double)leftAxialLength.toArray()[i]);
	    		}
	    		
	    	}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
    	dataset.addSeries(timeSeries1);
    	//timeSeries1.setMaximumItemAge(1000);	//����Ԫ�ع�������
    	return dataset;
    }
	   
    //���������۷ֱ���������ͼ 2016��5.10
    //ͫ��
   public String leftAxialLength() {
	   System.out.println("This is leftAxialLength() of VisualLeftAxialLengthAction!");
    	try {
    		req = ServletActionContext.getRequest();
			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
			String hql = "from Visioncheck v where v.username=? order by v.tableId"; //������10��				
			String[] values = new String[] { u.getUsername() };
			List<Visioncheck> list = visioncheckService.findInfo(hql, values);
			
//			System.out.println("�û�"+u.getUsername()+"�Ӿ�����������Ϊ��"+list.size());
			
			ArrayList <Double> leftAxialLength = new ArrayList<Double>();
			ArrayList <String> checkTimeList = new ArrayList<String>();	
			double temp_value;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dt;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getLeftAnteriorAxialLength()!=null && !list.get(i).getLeftAnteriorAxialLength().equals("")){
					try{
						temp_value=Double.valueOf(list.get(i).getLeftAnteriorAxialLength());
						dt = df.parse(list.get(i).getCheckTime());
					}catch(Exception e){
						System.out.println("��"+i+"��ѭ����leftAxialLength�������д������ݣ�");
						continue;
					}
					leftAxialLength.add(temp_value);
					checkTimeList.add(df.format(dt));
				}
			}
			//��Ϊʱ��ͼ��ʾ�������� 2016-1-19
			this.chart = ChartFactory.createTimeSeriesChart("����ͫ�׳���","���ʱ��", "��ֵ", createDataset(leftAxialLength,checkTimeList), true,true, false);
			XYPlot xyplot = (XYPlot) chart.getPlot(); // ��� plot
			DateAxis dateaxis = (DateAxis) xyplot.getDomainAxis(); // ��domain
			  // ����������ʾ��ʽ����
			dateaxis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd"));
            return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
        
    }
   
   
 //ͫ��
//   public String leftAxialLength() {
//	   System.out.println("This is leftAxialLength() of VisualJChartAction!");
//    	try {
//    		
//    		req = ServletActionContext.getRequest();
//			Userinfo u = (Userinfo) req.getSession().getAttribute("loginuser");
//			String hql = "from Visioncheck v where v.username=? order by v.tableId"; //������10��			
//			String[] values = new String[] { u.getUsername() };
//			List<Visioncheck> list = visioncheckService.findInfo(hql, values);
//			
//			ArrayList <Double> leftAxialLength = new ArrayList<Double>();				
//			ArrayList <String> checkTimeList = new ArrayList<String>();				
//			for (int i = 0; i < list.size(); i++) {
//				leftAxialLength.add(Double.valueOf(list.get(i).getLeftAnteriorAxialLength()));					
//				checkTimeList.add(list.get(i).getCheckTime());	
//			}		
//			this.chart = getChartByType(leftAxialLength,checkTimeList,list.size(),"����ͫ�׳���");
//            return "success";
//		} catch (Exception e) {
//			// TODO: handle exception
//			//e.printStackTrace();
//			return null;
//		}
//        
//    }
	   
	   
}
