<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视康云</title>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
.left {
	width: 15%;
	height: 470px;
	float: left;
	background-color: #EEEEEE;
}

.right {
	width: 85%;
	height: 470px;
	float: left;
}

.itemdiv {
	font-family: arial, Microsoft YaHei, serif;
	font-size : 14px;
	color: #333;
	text-decoration: none;
	display: block;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-bottom: 1px solid #D6D6D6;
	font-size: 14px;
}

.selected {
	background-color: #60BBFF;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
}

.right iframe {
	width: 100%;
	height: 470px;
}
</style>

<!-- Java Script -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/slides.min.jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
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
							<li><a href="#">公益行动</a>
							</li>
							<li><a href="findMoreSheets?page=1">问卷调查</a>
							</li>
							<li style="background:none;padding-right:0px;"><a href="contact.jsp">联系我们</a>
							</li>
						</ul>
					</div>
					<div class="banner">
						<div style="width: 100%;height: 470px;background-color: #fff;">
							<div class="left">
								<div class="itemdiv selected"
									onclick="$('#show')[0].src='liangjing.jsp';">亮睛行动</div>
								<div class="itemdiv" onclick="$('#show')[0].src='yigong.jsp';">义工团队</div>
								<div class="itemdiv" onclick="$('#show')[0].src='fengcai.jsp';">活动风采</div>
							</div>
							<div class="right">
								<iframe id="show" name="iframe" src="liangjing.jsp"
									frameborder="0" scrolling="no"> </iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom"></div>
	</div>
	<script type="text/javascript">
		$(".itemdiv").click(function() {
			$(".itemdiv").removeClass("selected");
			$(this).addClass("selected");
		});
	</script>
</body>
</html>