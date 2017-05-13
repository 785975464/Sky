<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<title>登录页面</title>
	</head>
	
	<body>
		<form action="login.action" method="post">
			<table cellpadding="0" cellspacing="0" norder="0" align="center">
				<caption>用户登录</caption>
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;码:</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="登录"></td>	
				</tr>
			</table>
		</form>
	</body>
</html>
