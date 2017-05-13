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
<link href="css/slider.css" rel="stylesheet" type="text/css" />>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/slides.min.jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<!-- 
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">
-->
<link rel="stylesheet"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="bootstrap/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
<style type="text/css">
.newscenterdiv {
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
.bs-docs-home {
	background-color: #dfdfdf;
	background-image: url(http://www.easytj.com/img/bg_noise.jpg);
}

.input-group {
	margin-top: 3px;
	margin-bottom: 3px;
}

.tans-bg {
	background-color: rgba(255, 255, 255, 0.9);
}

.custinput {
	display: inline-block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	float: left;
}

.custa {
	display: inline-block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	background-image: none;
	border-radius: 4px;
}

.ptitle {
	height: 35px;
	line-height: 35px;
	background-color: #60BBFF;
	font-size: 16px;
	font-family: Microsoft Yahei;
	color: #fff;
	padding-left: 15px;
	position: relative;
}
.sheetname{
	width: 100%;
	text-align: center;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  	font-size: 20px;
  	font-weight: bold;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div class="header">
				<div class="menu-and-banner">
					<div class="banner newscenterdiv">
						<form action="AddRecord" method="post">
							<div class="panel-body">
								<div style="display: none;"><input type="text" name="sheetid" value="${sheet.sheetid}"></div>
								<!-- 
								<div style="display: none;"><input type="text" name="username" value="${session.loginuser.username}"></div>
								 -->
								<div>
									<input type="text" class="form-control" style="width:200px;"
											name="username" value="" placeholder="请输入受访者姓名！"/>
								</div>
								<div class="sheetname">${sheet.sheetname}</div>
								<s:iterator value="list">
									<div class="form-group col-sm-8 col-sm-offset-2 question">
										<label><s:property value="keysequence" />. <s:property
												value="sheetkey" />
										</label>
										<div class="hidden"></div>
										<s:if test="%{keytype == 1}">
											<%
												String choicevalue = (String) request
																.getAttribute("choicevalue");
														choicevalue = choicevalue.replaceAll(",", "，");
														String[] strings = choicevalue.split("，");
														for (int i = 0; i < strings.length; i++) {
															out.println("<div class='radio'>");
															out.println("<label><input type='radio' name='que"
																	+ request.getAttribute("keysequence")
																	+ "' value='" + strings[i] + "'>" + strings[i]
																	+ "</label>");
															out.println("</div>");
														}
											%>

										</s:if>
										<s:elseif test="%{keytype == 2}">
											<%
												String choicevalue = (String) request
																.getAttribute("choicevalue");
														choicevalue = choicevalue.replaceAll(",", "，");
														String[] strings = choicevalue.split("，");
														for (int i = 0; i < strings.length; i++) {
															out.println("<div class='checkbox'>");
															out.println("<label><input type='checkbox' name='que"
																	+ request.getAttribute("keysequence")
																	+ "' value='" + strings[i] + "'>" + strings[i]
																	+ "</label>");
															out.println("</div>");
														}
											%>
										</s:elseif>
										<s:elseif test="%{keytype == 3}">
											<div class="form-group">
												<input type="text" class="form-control"
													name="que<s:property value="keysequence"/>" value="" />
											</div>
										</s:elseif>
									</div>
								</s:iterator>
							</div>

							<div class="panel-footer">
								<input class="btn btn-primary col-md-offset-5" type="submit" value="提交"/>
								<input class="btn btn-default " type="reset"  value="清空"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom"></div>
	</div>
</body>
</html>
