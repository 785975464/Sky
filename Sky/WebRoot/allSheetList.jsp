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

.newscenterdiv a {
	color: #47474C;
	font-size: 14px;
	text-decoration: none;
}

.newscenterdiv a:hover {
	color: #1E7DEE;
}

.newscenterdiv table {
	width: 100%;
}

.newstbodydiv {
	position: relative;
	left: 25%;
	top: 10%;
	width: 50%;
	height: 70%;
}

.newscenterdiv table td {
	background: url("images/news.png") no-repeat;
	padding: 4px 0px 4px 30px;
	border-bottom: 1px solid #e8e8e8;
}

div#pageTable {
	position: relative;
	left: 28%;
	top: 5%;
	color: #47474C;
	font-size: 14px;
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
							<li><a href="#">问卷调查</a></li>
							<li style="background:none;padding-right:0px;"><a href="contact.jsp">联系我们</a>
							</li>
						</ul>
					</div>
					<div class="banner">
						<div class="newscenterdiv">
							<div class="newstbodydiv">
								<table>
									<s:iterator value="list">
										<tr>
											<td>
												<a href="findSheetsByID?sheetid=<s:property value='sheetid'/>"><s:property value="sheetname"/></a>
											</td>
										</tr>
									</s:iterator>
								</table>
							</div>
							<div id="pageTable">
								<s:if test="%{pageBean.currentPage == 1}">首页 上一页 </s:if>
								<s:else>
									<a href="findMoreSheets!findMoreSheets?page=1">首页 </a>
									<a href="findMoreSheets!findMoreSheets?page=<s:property value="%{pageBean.currentPage-1}"/>" />上一页 </a>
								</s:else>
								<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
									<a href="findMoreSheets!findMoreSheets?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页 </a>
									<a href="findMoreSheets!findMoreSheets?page=<s:property value="pageBean.totalPage"/>">尾页 </a>
								</s:if>
								<s:else>下一页 尾页 </s:else>
								第<s:property value="pageBean.currentPage" />/<s:property value="pageBean.totalPage" />页 
								共<s:property value="pageBean.allRow" />条记录
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
