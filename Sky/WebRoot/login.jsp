<%@ page contentType="text/html;charset=utf-8"%>
<html>
	<head>
		<title>Login</title>
	</head>
	<body>
		
		<form action="j_spring_security_check" method="POST">
			<label for="j_username">
				用户名
			</label>
			<input class="input" type="text" name="j_username" />
			<br />
			<label for="j_password">
				密码
			</label>
			<input class="input" type="password" name="j_password" />
			<br />  
			<input type="submit" class="Button" value="登录" />
			
 		
		<!-- 
		<s:form action="login" method="POST">
			<s:textfield name="username" label="用户名" id="j_username" />
			<s:password name="password" label="密码" id="j_password" />
			 -->

			<%
				String error = request.getParameter("error");
					if (error != null) {
			%>
			<span class="errorMessage"> 
			<%
			 	out.println(session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION"));
			 %> </span>
			<%
				}
			%>
			
			</form>
			<!-- 
			<s:submit />
			 -->
		<!--</s:form>-->
	</body>
</html>