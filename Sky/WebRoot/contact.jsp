<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视康云</title>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/slides.min.jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.contactus{
	width:300px;
	height:130px;
	padding:30px 20px 0;
	float: left;
}

h2 {
	font-family: arial, Microsoft YaHei, serif;
	font-size: 16px;
	color: #474747;
	padding: 0 0 5px 25px;
	background: url("images/star.png") no-repeat;
	border-bottom: 2px solid #1E7DEE;
}

h3 {
	font: Normal 14px Arial, Helvetica, sans-serif;
	color: #474747;
	line-height: 20px;
	padding-top: 10px;
	text-indent: 28px;
}
h4 {
	font: Normal 14px Arial, Helvetica, sans-serif;
	color: #474747;
	line-height: 20px;
	text-indent: 28px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div class="header">
				<div class="logo-part">
					<div class="logo">
						<a href="index.jsp"><img src="images/sky.png" /> </a>
					</div>
				</div>
				<div class="menu-and-banner">
					<div class="menu-part">
						<ul>
							<li><a href="findIndexNews">首页</a>
							</li>
							<li><a href="about.jsp">关于我们</a>
							</li>
							<li><a href="visionhealthmanagement.jsp">我的视觉</a>
							</li>
							<li><a href="partner.jsp">专业合作</a>
							</li>
							<li><a href="findMoreNews?page=1">新闻中心</a>
							</li>
							<li><a href="public.jsp">公益行动</a>
							</li>
							<li><a href="findMoreSheets?page=1">问卷调查</a>
							</li>
							<li style="background:none;padding-right:0px;"><a href="#">联系我们</a>
							</li>
						</ul>
					</div>
					<div class="banner">
						<div style="width: 100%;height: 470px;background-color: #fff;">
							<div class="contactus">
								<h2>联系我们</h2>
								<h3>南京市建邺区嘉陵江东街18号4栋411室</h3>
								<h4>Call : 86-25-84343889</h4>
								<h4>Mail : tracy@vh-cloud.net</h4>
								<!-- <input type="button" name="name" value="获得统计表" onclick="window.open('piechart.jsp')"></input> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom"></div>
	</div>
</body>
</html>