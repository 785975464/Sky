<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>视康云</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery.min.js"></script>
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">个人信息</div>

				<div class="context">
					<div class="table-responsive">
						<table class="table table-hover table-bordered">
							<s:iterator value="list">
								<tr>
									<td><label>用户名：</label> <s:property value="username" /></td>
									<td></td>
								</tr>
								<tr>
									<td><label>姓名：</label>
									<s:property value="realname" />
									</td>
									<td><label>性别：</label>
									<s:property value="gender" />
									</td>
								</tr>
								<tr>
									<td><label>年龄：</label>
									<s:property value="age" />
									</td>
									<td><label>通信地址：</label>
									<s:property value="address" />
									</td>
								</tr>
								<tr>
									<td><label>联系方式：</label>
									<s:property value="phone" />
									</td>
									<td><label>邮箱：</label>
									<s:property value="email" />
									</td>
								</tr>
							</s:iterator>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
            var height = document.getElementById("page-container").scrollHeight;
            parent.AdjustIframeHeight(height);
            $(window).resize(function() {
            	var height = document.getElementById("page-container").scrollHeight;
            	parent.AdjustIframeHeight(height);
            });
    </script>
</body>
</html>