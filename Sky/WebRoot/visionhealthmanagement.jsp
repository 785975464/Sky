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
div.p1 {
	width: 100%;
	height: 116px;
	background: url("images/20150331p1.png") no-repeat;
	background-size: contain;
	background-color: #7BC830;
}

div.p2 {
	float: left;
	width: 335px;
	height: 30px;
	background-color: #7BC830;
	margin-top: 1px;
	width: 335px;
}

div.p3 {
	float: left;
	width: 669px;
	height: 30px;
	background-color: #7BC830;
	margin-top: 1px;
	border-left: 1px solid #fff;
}

div.p2 span,div.p3 span {
	font-family: Microsoft Yahei, arial, serif;
	font-size: 14px;
	line-height: 30px;
	display: block;
	text-indent: 15px;
}

div.p4 {
	float: left;
	width: 335px;
	height: 300px;
	background: url("images/20150331p3.png") no-repeat;
	background-size: contain;
}

div.p5 {
	float: left;
	width: 660px;
	height: 300px;
	border-left: 1px solid #e9e9e9;
}

.p6 {
	width: 300px;
	height: 100px;
	background: #F7F4E0;
	margin: 40px auto;
	padding: 10px;
}

.p6 ul {
	list-style: none;
	width: 400px;
}

.p6 ul li {
	padding: 5px;
}

.p6 ul li span {
	font-family: Microsoft Yahei, arial, serif;
	font-size: 14px; width : 60px;
	display: inline-block;
	float: left;
	width: 60px;
}

.p6 ul li input[type=text],.p6 ul li input[type=password] {
	width: 200px;
	height: 18px;
	border: 1px solid #AAAAAA;
	padding: 3px 8px;
	background: url("red_asterisk.png") no-repeat 98% #fff;
	transition: padding .25s;
	-o-transition: padding .25s;
	-moz-transition: padding .25s;
	-webkit-transition: padding .25s;
}

.p6 ul li input:FOCUS {
	border-color: #7BC830;
}

.p6 ul li input[type=submit] {
	background-image: url('images/p6.png');
	background-repeat: no-repeat;
	border: 0;
	width: 70px;
	height: 20px;
	float: right;
	position: relative;
	right: 112px;
	
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
							<li><a href="#">我的视觉</a>
							</li>
							<li><a href="partner.jsp">专业合作</a>
							</li>
							<li><a href="findMoreNews?page=1">新闻中心</a>
							</li>
							<li><a href="public.jsp">公益行动</a>
							</li>
							<li><a href="findMoreSheets?page=1">问卷调查</a>
							</li>
							<li style="background:none;padding-right:0px;"><a
								href="contact.jsp">联系我们</a>
							</li>
						</ul>
					</div>
					<div class="banner">
						<div style="width: 100%;height: 470px;background-color: #FEFBE9;">
							<div class="p1"></div>
							<div class="p2">
								<span>经验分享</span>
							</div>
							<div class="p3">
								<span>我的视觉健康档案</span>
							</div>
							<div class="p4"></div>
							<div class="p5">
								<div class="p6">
									<form action="login" method="post">
										<ul>
											<li><span>用户名</span><input type="text" name="username"
												required="required" />
											</li>
											<li><span>密　码</span><input type="password" name="password"
												required="required" />
											</li>
											<li><input type="submit" value="" />
											</li>
										</ul>
									</form>
								</div>
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