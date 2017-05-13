<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>视康云</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1.0">	<!-- bootstrap响应式 -->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="jquery/jquery.min.js"></script>
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
	
	html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 400px;
	position: absolute;
	top: 50%;

	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 350px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>

<body>
	<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>修改登录密码</small></h1>
			</div>
			
			<div class="login-content ">
				<p class="text-warning" style="margin:20px;" >密码应为6~20位字符长度，为了您的数据安全，密码建议为字母、数字、_、.、$、%、@、#等字符的组合。</p> 
				<div class="form">
				<form action="updatePhoneLoginInfo" method="post" onsubmit="return check()">	<!-- 手机客户端登录 -->
					<div class="form-group">
						<div class="col-xs-12  ">
							<div class="input-group">
								<span class="input-group-addon">新设密码 </span>
								<input type="password" id="password" name="password" class="form-control" placeholder="新设密码" required>
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12  ">
							<div class="input-group">
								<span class="input-group-addon">确认密码 </span>
								<input type="password" id="checkpassword" name="checkpassword" class="form-control" placeholder="确认密码" required>
								<span class="input-group-addon"><span class="glyphicon glyphicon-check"></span></span>
							</div>
						</div>
					</div>
					<div class="form-group form-actions">
						<div class="" style="text-align:center;">	<!-- col-xs-4 col-xs-offset-4 -->
							<button type="submit" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-ok"></span> 提交</button>
						</div>
					</div>
					<!-- 
					<div class="form-group">
						<div class="col-xs-6 link">
							<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a>
							</p>
						</div>
						<div class="col-xs-6 link">
							<p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" ><small>注册</small></a>
							</p>
						</div>
					</div>
					 -->
				</form>
				</div>
			</div>
			<div class="input-group">
				<span class="input-group-addon"><a onClick="history.back(-1)">返回</a><span class="glyphicon glyphicon-arrow-left"></span></span>
				<span class="input-group-addon"><a href="loginOut?outflag=1">退出</a><span class="glyphicon glyphicon-log-out"></span></span>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function check(){
		
		var password=document.getElementById("password").value;
		var checkpassword=document.getElementById("checkpassword").value;
		//alert(password);
		if(password.length<6 || password.length>20){
			alert("密码应为6~20位字符长度！");	//wrong length!
			return false;
		}
		else if(password.indexOf("\\")!=-1 || password.indexOf("/")!=-1 || password.indexOf(":")!=-1 || 
				password.indexOf("*")!=-1 || password.indexOf("?")!=-1 || password.indexOf("\"")!=-1 ||
				password.indexOf("<")!=-1 || password.indexOf(">")!=-1 || password.indexOf("|")!=-1 || password.indexOf("=")!=-1){
				alert("密码请勿出现以下字符 ' \\ / : * ? \" < > | = ' !!");		//wrong password! DON'T input
			return false;
		}
		else if(password != checkpassword){
			alert("两次密码输入不一致，请重新输入！");		//wrong password! please check!
			return false;
		}
		else{
			return true;
		}
	}
</script>
	
</body>
</html>
