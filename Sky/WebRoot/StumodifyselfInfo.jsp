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
<script src="js/tab.js"></script>

</head>

<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">
					修改信息
					<button type="button" class="btn btn-info btn-sm"
						style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"
						onClick="history.back(-1)">返回</button>
				</div>
				<div class="tabbable" id="tabs-534095">
				<ul class="nav nav-tabs" role="tablist" id="docs-tab">
					<li role="presentation" class="active">
						<a href="#detail" role="tab" data-toggle="tab">修改个人信息</a>
					</li>
					<li role="presentation">
						<a href="#shili"role="tab" data-toggle="tab">修改密码</a>
					</li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" role="tabpanel" id="detail">
						
						<div class="context" style="padding-left: 10px !important;">
					<form name="updateform" id="updateform" class="form-horizontal"
						action="updateStuselfInfo" method="post">
						<fieldset>
							<div class="f1">
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">注册用户名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="username"
											name="username" value='${userinfo.username}'
											readonly="readonly" required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">学校</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="school"
											name="school" placeholder="学校"
											value='${userinfo.school}' 
											readonly="readonly" required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">姓名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="realname"
											name="realname" placeholder="姓名"
											value='${userinfo.realname}' required="required">
									</div>
								</div>
								
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">联系电话</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="phone"
											name="phone" placeholder="联系电话"
											value='${userinfo.phone}'>
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">E-mail</label>
									<div class="col-sm-6">
										<input type="email" class="form-control col-sm-6" id="email"
											name="email" placeholder="E-mail"
											value='${userinfo.email}'>
									</div>
								</div>
							</div>

						</fieldset>
						<div class="modal-footer" style="padding-right: 22%;">
							
							<button type="submit" class="btn btn-primary" id="submit">确定</button>
						</div>
					</form>
				</div>
						
					</div>
					
					<div class="tab-pane" role="tabpanel" id="shili">
						
						<div class="context" style="padding-left: 10px !important;">
					<form name="updateform" id="updateform" class="form-horizontal"
						action="updateStuKey" method="post">
						<fieldset>
							<div class="f1">
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">用户名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control col-sm-6" id="username"
											name="username" value='${userinfo.username}'
											readonly="readonly" required="required">
									</div>
								</div>
								
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">新密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control col-sm-6" id="password"
											name="password" 
											 required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="IDCard" class="col-sm-3 control-label">再次确认密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control col-sm-6" id="password_new"
											name="password_new"  required="required" onblur="checkpassword()">
									</div>
								</div>
								<div class="form-group" id="hint">
									<label for="IDCard" class="col-sm-3 control-label"  style="color:red"></label>
								</div>
								
							</div>

						</fieldset>
						<div class="modal-footer" style="padding-right: 22%;" id="submit_pas">
							<button type="submit" class="btn btn-primary" >提交</button>
						</div>
					</form>
				</div>
						
					</div>
					
					
					
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
		$(function() {
			$("#docs-tab a").click(function(e) {
				$(this).tab('show');
				var height = document.getElementById("page-container").scrollHeight;
				parent.AdjustIframeHeight(height);
			});
		});
	</script>
	
		<script type="text/javascript">
		var xmlHttpReq;
		function createXMLHttpRequest() {
			if (window.XMLHttpRequest) {
				xmlHttpReq = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				try {
					xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
				} catch (e) {
					xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				}
			}
		}

		function checkpassword() {
			var password_new = document.getElementById("password_new").value;
			var password = document.getElementById("password").value;
			
			if(password==password_new){
					var nstr="";
					var nstr1="";
					nstr1+="<button type='submit' class='btn btn-primary'>提交</button>";
					nstr+="<label for='IDCard' class='col-sm-3 control-label' style='color:red'></label>";
					document.getElementById("hint").innerHTML = nstr;
					document.getElementById("submit_pas").innerHTML = nstr1;
			}else{
				var nstr="";
				var nstr2="";
				nstr+="<label for='IDCard' class='col-sm-3 control-label' style='color:red'>前后密码不一致！</label>";
				document.getElementById("hint").innerHTML = nstr;
				
				document.getElementById("submit_pas").innerHTML = nstr2;
			}
			

		}
		
	</script>
	
</body>
</html>