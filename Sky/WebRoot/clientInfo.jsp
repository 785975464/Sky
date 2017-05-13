<%@taglib prefix="s" uri="/struts-tags" %>
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
/* 	top: 50%; */

/* 	margin-top: -200px; */
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
	height: 410px;
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
	margin-top: 0px !important;
}
.login-title small {
	color: #fff;
}
.login-title h6 {
	margin: 0px !important;
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
				<h1><small>${session.loginuser.realname}，欢迎回来！</small></h1>
				<h6><small>以下是您的历次视力检查数据，点击可查看详情。</small></h6>
			</div>
			<div>
				${prompt}
			</div>
			<div class="login-content ">
			
				<div class="table-responsive" style="width:90%;margin:20px 20px;overflow-y: auto;">		<!-- style="height: 500px;overflow-y: auto;" -->
					<table class="table table-hover table-bordered big-data table-striped" >
						<colgroup>
							<col style="">
							<col style="">
						</colgroup>
						<thead style="background-color:#EEEEEE;">
							<tr>
								<th style="display:none">tableId</th>
								<th style="text-align:center;">序号</th>
								<th style="text-align:center;">检查日期</th>
								<th style="text-align:center;">视觉状况</th>
							</tr>
						</thead>
						<tbody id="userinfoTbody">
							<s:iterator value="list" id="list" status="st">
								<tr class="gradec">
									<!-- 
									<td style="display:none"><s:property value="#l[0]" />
									</td>
									<td><s:property value="#l[1]" />
									</td>
									<td><s:property value="#l[2]" />
									</td>
									 --> 
									<td style="display:none"><s:property value="tableId" />
									</td>
									<td style="text-align:center;"><s:property value="#st.count"/>
									</td>
									<td style="text-align:center;"><s:property value="checkTime" />
									</td>
									<td style="text-align:center;"><s:property value="visionlevel" />
									</td>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			
				<div>
					<table id="pageTable" style="margin:auto;text-align:center;">
						<tr>
							<td><s:if test="%{pageBean.currentPage == 1}">首页      上一页</s:if>
								<s:else>
									<a href="phonelogin!phonelogin?page=1">首页</a>
									<a
										href="phonelogin!phonelogin?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页</a>
								</s:else></td>
							<td><s:if
									test="%{pageBean.currentPage != pageBean.totalPage}">
									<a
										href="phonelogin!phonelogin?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
									<a
										href="phonelogin!phonelogin?page=<s:property value="pageBean.totalPage"/>">尾页</a>
								</s:if> <s:else>下一页  尾页</s:else>
							</td>
							<td>页次 <s:property value="pageBean.currentPage" /> / <s:property
									value="pageBean.totalPage" /> 共 <s:property
									value="pageBean.allRow" /> 记录</td>
						</tr>
					</table>
				</div>
			
			
				<!-- 手机客户端登录 -->
				<!-- 
				<div class="form">
				<form action="phonelogin" method="post">
					<div class="form-group">
						<div class="col-xs-6 link">
							<p class="remove-margin" style="right:0;"><small>首次登录？</small> <a href="phonefirstlogin.jsp" ><small>点这里</small></a>
							</p>
						</div>
					</div>
				</form>
				</div>
				 -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("tr:gt(0)").click(function(){
		  	var tableId = $(this).children("td:first").text();
			//alert(tableId);
		 	window.location.href="personalVisionInfo.action?tableId=" + tableId;
		});
	</script>
</body>
</html>
