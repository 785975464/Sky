<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>防近运动金字塔</title><!-- submitPhoneTjSuccess.jsp -->
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<meta http-equiv="refresh" content="3;url=phonelogin.jsp" />
	  -->
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<script src="jquery/jquery.min.js"></script>
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
		type="text/css">
	<script src="bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">

	.container{
		
		
		height:41px;
      
    }
    h3{
    	margin-bottom:100px;
    	/*
    	margin-bottom:100px;
    	*/
    }
    canvas{
    	width:300px;
		height: 59px;
    	/*
		定义宽度为270px，18个单位，15px/单位
		
    	*/
    	/*
    	height: 100%;
    	
    	width: 100%;
    	*/
    	margin: 0 auto;
    	padding: 0;
    	border:1;
    	display: block;
    }
    #footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 60px;/*脚部的高度*/
		background: #6cf;
		clear:both;
	}
</style>

  </head>

  <body onload="loadimg()">
<div class="container">	<!-- container -->
	<h3 class="text-center">
	        数据提交成功，正在刷新，请稍后...
	</h3>

	<div class="container">
		<canvas id="mycanvas1" ></canvas>
	</div>
	<div class="container">
		<canvas id="mycanvas2" ></canvas>
	</div>
	<div class="container">
		<canvas id="mycanvas3" ></canvas>
	</div>
	<div class="container">
		<canvas id="mycanvas4" ></canvas>
	</div>
	<div class="container">
		<canvas id="mycanvas5" ></canvas>
	</div>
	<div style="margin:40px 0px;">
		
	</div>
</div>
<div id="footer" class="text-center">
	<span class="glyphicon glyphicon-arrow-left" style="padding:20px;"><a href="phonelogin.jsp" >返回</a></span>	<!-- history.back(-1) -->
</div>

    <script type="text/javascript">
    var que1 = '<%=request.getParameter("que1")%>' ;
    var que2 = '<%=request.getParameter("que2")%>' ;
    var que3 = '<%=request.getParameter("que3")%>' ;
    var que4 = '<%=request.getParameter("que4")%>' ;
    var que5 = '<%=request.getParameter("que5")%>' ;
    var que6 = '<%=request.getParameter("que6")%>' ;
    var que7 = '<%=request.getParameter("que7")%>' ;
    var que8 = '<%=request.getParameter("que8")%>' ;
    var que9 = '<%=request.getParameter("que9")%>' ;
    
    //alert(que1);
    var unit=15;	//定义单位长度为10px，手机尺寸为360px，canvas为180px
    rectcontainer_width=300;
    color="rgba(204,204,204,0.3)"; //定义颜色，支持透明
    //alert(document.body.clientWidth);
    //alert(document.getElementById("mycanvas1").width);
    //----------------------------------------------canvas1
    var c=document.getElementById("mycanvas1");
    var p100=c.getContext("2d");
    var num1;
    if(que1==null || que1=='不近视'){
    	num1=2;		//定义标准宽度
    }
    else{
    	num1=4;		//定义标准宽度
    }
    var standline1=num1*unit;
    
    if(que2>18){
    	que2=18;
    }
    if(que2>0){
	    p100.fillStyle="rgb(208,248,52)"; //定义矩形颜色
	    //p100.fillStyle="red";
    }
    p100.fillRect((rectcontainer_width-que2*unit)/2,0,que2*unit,100); //定义矩形的大小
    //p100.fillStyle="rgba(0,0,255,0.5)"; //定义颜色，支持透明
    //p100.fillRect(200,200,500,500); //定义矩形大小
  
    //========线======
    p100.moveTo((rectcontainer_width-standline1)/2,50); //起始位置
    p100.lineTo(rectcontainer_width-(rectcontainer_width-standline1)/2,50); //终止位置，标准长度为2或4个单位
    //p100.lineTo(10,50); //如果没有再次设置起始位置将从结束位置开始画
    p100.stroke(); //结束图形
    
    //绘制灰色图块
    if(que2<num1){
    	//p100.fillStyle="grey"; //定义矩形颜色
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect((rectcontainer_width-standline1)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形1的大小
    	p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
    
    //----------------------------------------------canvas2
    var c=document.getElementById("mycanvas2");
    var p100=c.getContext("2d");
    if(que3>10){
    	que3=10;
    }
    if(que3>0){
	    //p100.fillStyle="blue"; //定义颜色
	    p100.fillStyle="rgb(223,254,52)"; //定义矩形颜色
	    p100.fillRect(rectcontainer_width/2+unit-que3*unit,0,que3*unit-1,100); //定义矩形1的大小
  	}
  	if(que4>8){
    	que4=8;
    }
    if(que4>0){
	    //p100.fillStyle="yellow"; //定义颜色
	    p100.fillStyle="rgb(223,255,86)"; //定义矩形颜色
	    p100.fillRect(rectcontainer_width/2+unit+1,0,que4*unit-1,100); //定义矩形2的大小
    }
    
    //========线======
    var standline2=4*unit;		//定义标准线长度
    p100.moveTo((rectcontainer_width-standline2)/2,50); //标准线1，起始位置
    p100.lineTo((rectcontainer_width-standline2)/2+standline2*3/4-1,50);	// 3/4位置
    //p100.stroke();
    
    p100.moveTo((rectcontainer_width-standline2)/2+standline2*3/4+1,50); //标准线2，起始位置
    p100.lineTo(rectcontainer_width-(rectcontainer_width-standline2)/2,50); //终止位置，标准长度为3+1=4个单位
    p100.stroke(); //结束图形
    
    //绘制灰色图块
    if(que3<3){		//que3标准值为3
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect((rectcontainer_width-standline2)/2,0,(3-que3)*unit,100); //定义灰色矩形1的大小
    	//p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
     if(que4<1){		//que4标准值为1
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect(rectcontainer_width/2+unit+1,0,(1-que4)*unit-1,100); //定义灰色矩形2的大小
    	//p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
    
    //----------------------------------------------canvas3
    var c=document.getElementById("mycanvas3");
    var p100=c.getContext("2d");
    if(que5>10){
    	que5=10;
    }
    if(que5>0){
	    //p100.fillStyle="black"; //定义颜色
	    p100.fillStyle="rgb(223,255,126)"; //定义矩形颜色
	    p100.fillRect(rectcontainer_width/2+unit-que5*unit,0,que5*unit-1,100); //定义矩形1的大小
  	}
  	if(que6>8){
    	que6=8;
    }
    if(que6>0){
	    //p100.fillStyle="yellow"; //定义颜色
	    p100.fillStyle="rgb(238,255,126)"; //定义矩形颜色
	    p100.fillRect(rectcontainer_width/2+unit+1,0,que6*unit-1,100); //定义矩形2的大小
    }
    
    //========线======
    var standline3=6*unit;		//定义标准线长度
    p100.moveTo((rectcontainer_width-standline3)/2,50); //标准线1起始位置
    p100.lineTo((rectcontainer_width-standline3)/2+standline3*4/6-1,50);	// 4/6位置
    //p100.stroke();
    
    p100.moveTo((rectcontainer_width-standline3)/2+standline3*4/6+1,50); //标准线2，起始位置
    p100.lineTo(rectcontainer_width-(rectcontainer_width-standline3)/2,50); //终止位置，标准长度为4+2=6个单位
    p100.stroke(); //结束图形
    
    //绘制灰色图块
    if(que5<4){		//que5标准值为4
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect((rectcontainer_width-standline3)/2,0,(4-que5)*unit,100); //定义灰色矩形1的大小
    	//p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
     if(que6<2){		//que6标准值为2
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect(rectcontainer_width/2+que6*unit+unit+1,0,(2-que6)*unit-1,100); //定义灰色矩形2的大小
    	//p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
    //----------------------------------------------canvas4
    var c=document.getElementById("mycanvas4");
    var p100=c.getContext("2d");
    if(que7>9.5){
    	que7=9.5;
    }
    if(que7>0){
	    //p100.fillStyle="yellow"; //定义颜色
	    p100.fillStyle="rgb(254,247,11)"; //定义矩形颜色
	    p100.fillRect(rectcontainer_width/2+unit/2-que7*unit,0,que7*unit-1,100); //定义矩形1的大小
    }
    if(que8>8.5){
	    	que8=8.5;
    }
    if(que8>0){
	    //p100.fillStyle="red"; //定义颜色
	    p100.fillStyle="rgb(254,234,10)"; //定义矩形颜色
	    p100.fillRect(rectcontainer_width/2+unit/2+1,0,que8*unit-1,100); //定义矩形2的大小
	}
	    
    //========线======
    var standline4=7*unit;		//定义标准线长度
    p100.moveTo((rectcontainer_width-standline4)/2,50); //起始位置
    p100.lineTo((rectcontainer_width-standline4)/2+standline4*4/7-1,50);	// 4/7位置
    //p100.stroke();
    
    p100.moveTo((rectcontainer_width-standline4)/2+standline4*4/7+1,50); //标准线2，起始位置
    p100.lineTo(rectcontainer_width-(rectcontainer_width-standline4)/2,50); //终止位置，标准长度为4+3=7个单位
    p100.stroke(); //结束图形
    //绘制灰色图块
    if(que7<4){		//que7标准值为4
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect((rectcontainer_width-standline4)/2,0,(4-que7)*unit,100); //定义灰色矩形1的大小
    	//p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
     if(que8<3){		//que8标准值为3
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect(rectcontainer_width/2+unit/2+que8*unit+1,0,(3-que8)*unit-1,100); //定义灰色矩形2的大小
    	//p100.fillRect((rectcontainer_width-standline1)/2+que2*unit+(standline1-que2*unit)/2,0,(num1-que2)*unit/2,100); //定义灰色矩形2的大小
    }
    //----------------------------------------------canvas5
    var c=document.getElementById("mycanvas5");
    var p100=c.getContext("2d");
    if(que9>18){
    	que9=18;
    }
    var standline5=10*unit;		//定义标准线长度
    //p100.fillStyle="yellow"; //定义颜色
    p100.fillStyle="rgb(254,216,9)"; //定义矩形颜色
    p100.fillRect((rectcontainer_width-que9*unit)/2,0,que9*unit,100); //定义矩形的大小
  
    //========线======
    p100.moveTo((rectcontainer_width-standline5)/2,50); //起始位置
    p100.lineTo(rectcontainer_width-(rectcontainer_width-standline5)/2,50); //终止位置，标准长度为10个单位
    p100.stroke(); //结束图形
    //绘制灰色图块
    if(que9<10){
    	p100.fillStyle=color; //定义颜色，支持透明
    	p100.fillRect((rectcontainer_width-standline5)/2,0,(10-que9)*unit/2,100); //定义灰色矩形1的大小
    	p100.fillRect((rectcontainer_width-standline5)/2+que9*unit+(standline5-que9*unit)/2,0,(10-que9)*unit/2,100); //定义灰色矩形2的大小
    }
    
    function loadimg(){
    	//alert(document.getElementById("htitle").html());
    	var h3= document.getElementsByTagName("h3")[0];
    	h3.innerHTML = "防近运动金字塔";
    	//document.getElementById("htitle").html("加载完毕");
    }
    </script>
  </body>
</html>
