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
  <form action="CommunityEyesightServlet.servlet" method="POST" >
  		<div>
  			<input type="hidden" value="${session.loginuser.getAddress()}" name="address" id="address"/>
  		</div>
        <%  
        	System.out.println("setCommunityEyesight页面！");
        %>  
        <input type="submit" name="btn" id="btn" value="刷新" />
  </form>
		
  </body>
</html>
