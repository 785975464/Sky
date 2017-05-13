package check;
import org.jfree.chart.*;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import java.awt.*;
import java.io.IOException;
import java.text.NumberFormat;

import javax.servlet.http.HttpServletRequest;


public class piechart {
	private static String graphURL;
	public void setPieChart(int value1,int value2,int value3,int value4,int value5,int value6, HttpServletRequest request) throws IOException{

		DefaultPieDataset dataset = new DefaultPieDataset();   
//		dataset.setValue("视觉质量未知", value5);
//		dataset.setValue("视觉质量错误", value4);
		dataset.setValue("视觉质量异常", value4);
		dataset.setValue("视觉质量亚健康", value3);		//新增视觉等级亚健康3，2016-07-13
		dataset.setValue("视觉质量预警", value2);
		dataset.setValue("视觉质量正常", value1);   
		//视觉质量异常，红色；预警，蓝色；正常，绿色
  
		//通过工厂类生成JFreeChart对象   
		JFreeChart chart = ChartFactory.createPieChart("视觉质量四级饼图", dataset, true, true, false);   
		//添加副标题   
		//chart.addSubtitle(new TextTitle("2010年度"));   
		PiePlot pieplot = (PiePlot) chart.getPlot();   
		pieplot.setLabelFont(new Font("宋体", 0, 21));   
		//调整字体大小
		//设置饼图是圆的（true），还是椭圆的（false）；默认为true   
		pieplot.setCircular(true);   
		StandardPieSectionLabelGenerator standarPieIG = new StandardPieSectionLabelGenerator("{0} {2}", NumberFormat.getNumberInstance(), NumberFormat.getPercentInstance());   
		pieplot.setLabelGenerator(standarPieIG);   
  
		//没有数据的时候显示的内容   
		pieplot.setNoDataMessage("暂无无数据显示！");
//		pieplot.setSectionPaint("视觉质量未知", Color.GRAY);			//设置颜色
//		pieplot.setSectionPaint("视觉质量错误", Color.BLUE);
		pieplot.setSectionPaint("视觉质量异常", Color.RED);
		pieplot.setSectionPaint("视觉质量亚健康", Color.GRAY);
		pieplot.setSectionPaint("视觉质量预警", Color.ORANGE);
		pieplot.setSectionPaint("视觉质量正常", Color.GREEN);
		pieplot.setLabelGap(0.02D);   
  
		//String filename = ServletUtilities.saveChartAsPNG(chart, 1000, 600, null, session);
		String filename = JfreeChartUtilities.saveChartAsPNG(chart, 800, 480, request);
		System.out.println("filename:"+filename);
		//String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;   
		graphURL = request.getContextPath() + "/images/" + filename;   
		System.out.println("graphURL:"+graphURL);
		//System.out.println("getURL方法:"+getURL());

		
		
	}
	public String getURL(){
		System.out.println("piechart中graphURL为"+graphURL);
		return graphURL;
		
	}

}
