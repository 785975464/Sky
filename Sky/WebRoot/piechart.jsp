<%@ page contentType="text/html;charset=UTF-8"%>   
  
<%@ page import="org.jfree.chart.*,org.jfree.chart.plot.PiePlot,org.jfree.chart.title.TextTitle,org.jfree.chart.labels.*,   
org.jfree.data.general.DefaultPieDataset,org.jfree.chart.servlet.ServletUtilities,java.awt.*,java.text.NumberFormat"%>   
<%@ page import="check.*"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>视觉质量四级饼图</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		body, div, td, input {font-size:18px; margin:0px; text-align:center}
		.line {margin:2px; }
	</style>
  </head>
  
  <body>
     <br>
    
     <%   
     	eyesight est=new eyesight();
		est.Connection();
		//Chart ct=new Chart();
		int value1=est.getcon_Nor();
		int value2=est.getcon_Warn();
		int value3=est.getSubhealthy();
		int value4=est.getcon_Abnor();
		int value5=est.getWrong_rs();
		int value6=est.getUnexpected();
		//int sum=v1+v2+v3;
		//ct.getChart(v1, v2, v3);

		DefaultPieDataset dataset = new DefaultPieDataset();
		//dataset.setValue("视觉质量未知", value5);
		//dataset.setValue("视觉质量错误", value4);
		dataset.setValue("视觉质量异常", value4); 
		dataset.setValue("视觉质量亚健康", value3);
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
		//pieplot.setSectionPaint("视觉质量未知", Color.GRAY);			//设置颜色
		//pieplot.setSectionPaint("视觉质量错误", Color.BLUE);
		pieplot.setSectionPaint("视觉质量异常", Color.RED);
		pieplot.setSectionPaint("视觉质量亚健康", Color.GRAY);
		pieplot.setSectionPaint("视觉质量预警", Color.ORANGE);
		pieplot.setSectionPaint("视觉质量正常", Color.GREEN);   
		pieplot.setLabelGap(0.02D);   
		  
		//String filename = ServletUtilities.saveChartAsPNG(chart, 1000, 600, null, session);
		String filename = JfreeChartUtilities.saveChartAsPNG(chart, 1000, 600, request);
		//System.out.println("filename:"+filename);
		//String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;   
		String graphURL = request.getContextPath() + "/images/" + filename;   
		//System.out.println("graphURL:"+graphURL);
		
		%>

	
    <img src="<%= graphURL %>" alt="picture" width=800 height=480 border=0 >
    
    
  </body>
</html>
