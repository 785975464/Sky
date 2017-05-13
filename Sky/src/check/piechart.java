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
//		dataset.setValue("�Ӿ�����δ֪", value5);
//		dataset.setValue("�Ӿ���������", value4);
		dataset.setValue("�Ӿ������쳣", value4);
		dataset.setValue("�Ӿ������ǽ���", value3);		//�����Ӿ��ȼ��ǽ���3��2016-07-13
		dataset.setValue("�Ӿ�����Ԥ��", value2);
		dataset.setValue("�Ӿ���������", value1);   
		//�Ӿ������쳣����ɫ��Ԥ������ɫ����������ɫ
  
		//ͨ������������JFreeChart����   
		JFreeChart chart = ChartFactory.createPieChart("�Ӿ������ļ���ͼ", dataset, true, true, false);   
		//��Ӹ�����   
		//chart.addSubtitle(new TextTitle("2010���"));   
		PiePlot pieplot = (PiePlot) chart.getPlot();   
		pieplot.setLabelFont(new Font("����", 0, 21));   
		//���������С
		//���ñ�ͼ��Բ�ģ�true����������Բ�ģ�false����Ĭ��Ϊtrue   
		pieplot.setCircular(true);   
		StandardPieSectionLabelGenerator standarPieIG = new StandardPieSectionLabelGenerator("{0} {2}", NumberFormat.getNumberInstance(), NumberFormat.getPercentInstance());   
		pieplot.setLabelGenerator(standarPieIG);   
  
		//û�����ݵ�ʱ����ʾ������   
		pieplot.setNoDataMessage("������������ʾ��");
//		pieplot.setSectionPaint("�Ӿ�����δ֪", Color.GRAY);			//������ɫ
//		pieplot.setSectionPaint("�Ӿ���������", Color.BLUE);
		pieplot.setSectionPaint("�Ӿ������쳣", Color.RED);
		pieplot.setSectionPaint("�Ӿ������ǽ���", Color.GRAY);
		pieplot.setSectionPaint("�Ӿ�����Ԥ��", Color.ORANGE);
		pieplot.setSectionPaint("�Ӿ���������", Color.GREEN);
		pieplot.setLabelGap(0.02D);   
  
		//String filename = ServletUtilities.saveChartAsPNG(chart, 1000, 600, null, session);
		String filename = JfreeChartUtilities.saveChartAsPNG(chart, 800, 480, request);
		System.out.println("filename:"+filename);
		//String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;   
		graphURL = request.getContextPath() + "/images/" + filename;   
		System.out.println("graphURL:"+graphURL);
		//System.out.println("getURL����:"+getURL());

		
		
	}
	public String getURL(){
		System.out.println("piechart��graphURLΪ"+graphURL);
		return graphURL;
		
	}

}
