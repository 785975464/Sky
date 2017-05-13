<%@ page contentType="text/html;charset=UTF-8"%>   
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type"content="text/html;charset=UTF-8"/>
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

  <body style="background-color:lightblue">  
		<%  
        	System.out.println("setback页面！");
        %>
		<img alt="" src="<%=request.getAttribute("name")%>">
		<div style="font-size:10px;">
		已有视觉档案的人数为<%=request.getAttribute("total_number") %>人，
		其中视觉信息错误或未知的有<%=request.getAttribute("error_number") %>人。
		</div>
		<div>
			<input type="button" name="btn" id="btn" value="返回" style="text-align: center;position:absolutely;margin-top:20px;" onClick="history.back(-1)"/>
		</div>
		
  </body>
</html>
