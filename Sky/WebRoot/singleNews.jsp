<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视康云</title>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />


<!-- Java Script -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/slides.min.jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<style type="text/css">
.newscenterdiv {
	height: 470px;
	background-color: #fff;
}

.newstitle {
	width: 80%;
	position: relative;
	left: 10%;
	top: 30px;
	border-bottom: 1px solid #1E7DEE;
	padding-bottom: 10px;
}

.newscontent {
	width: 76%;
	position: relative;
	left: 12%;
	top: 30px;
	padding-top: 25px;
}

.newstitle h3 {
	text-align: center;
	color: #7E7E7E;
}

.newscontent p {
	text-indent: 32px;
	font: 14px/22px SimSun;
	color: #7E7E7E;
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
							<li><a href="findIndexNews">首页</a></li>
							<li><a href="about.jsp">关于我们</a></li>
							<li><a href="visionhealthmanagement.jsp">我的视觉</a></li>
							<li><a href="partner.jsp">专业合作</a></li>
							<li><a href="findMoreNews?page=1">新闻中心</a></li>
							<li><a href="public.jsp">公益行动</a></li>
							<li style="background:none;padding-right:0px;"><a
								href="contact.jsp">联系我们</a>
							</li>
						</ul>
					</div>
					<div class="banner">
						<div class="newscenterdiv">

							<s:iterator value="list">
								<div class="newstitle">
									<h3>
										<s:property value="title" />
									</h3>
								</div>
								<div class="newscontent">
									<p>
										<s:property value="content" escape="false" />
									</p>
								</div>
							</s:iterator>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom"></div>
	</div>
</body>
</html>
