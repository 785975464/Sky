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

	<div class="banner">
		<div class="newscenterdiv">

			<s:iterator value="list">
				<div class="发布时间">
					<h3>
						<s:property value="pdate" />
					</h3>
				</div>
				<div class="信息">
					<p>
						<s:property value="text" escape="false" />
					</p>
				</div>
			</s:iterator>

		</div>
	</div>


</body>
</html>
