<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- Title and Meta Tags -->
<title>视康云</title>
<meta charset="utf-8">
	<meta content="" name="Description" />
	<meta content="" name="Keywords" />

	<!-- Css -->
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/slider.css" rel="stylesheet" type="text/css" />

<!-- Java Script -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/slides.min.jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<style type="text/css">
#newscenterdiv a {
	color: #47474C;
	font-size: 14px;
	text-decoration: none;
}

#newscenterdiv a:hover {
	color: #1E7DEE;
}

#newscenterdiv table td{
	background: url("images/news.png") no-repeat;
	padding: 4px 0px 4px 30px;
}
</style>
</head>
<body>

	<!--Site start-->
	<div id="wrapper">


		<!--Header start-->
		<div id="header">
			<div class="header">

				<!--Logo Part start-->
				<div class="logo-part">

					<div class="logo">
						<a href="index.jsp"><img src="images/sky.png"/> </a>
					</div>

				</div>
				<!--Logo Part End-->

				<!--Menu and Banner Part start-->
				<div class="menu-and-banner">

					<!--Menu Part start-->
					<div class="menu-part">

						<ul>
							<li><a href="#">首页</a>
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
							<li style="background:none;padding-right:0px;"><a href="contact.jsp">联系我们</a>
							</li>
						</ul>

					</div>
					<!--Menu Part End-->

					<!--Banner Part start-->
					<div class="banner">

						<div id="example">

							<div id="slides">
								<div class="slides_container">
									<div class="slide">
										<a target="_blank" href="http://www.cooc.org.cn/"><img src="images/slide-2.png" width="1005"
											height="453" alt="Slide 1" /> </a>
										<div class="caption">
											<p>热点新闻</p>
										</div>
									</div>
									<div class="slide">
										<a href="public.jsp"><img src="images/slide-3.png" width="1005"
											height="453" alt="Slide 1" /> </a>
										<div class="caption">
											<p>公益行动</p>
										</div>
									</div>
									<div class="slide">
										<a href="#"><img src="images/slide-4.png" width="1005"
											height="453" alt="Slide 1" /> </a>
										<div class="caption">
											<p>普及教育</p>
										</div>
									</div>



								</div>
								<a href="#" class="prev"><img src="images/arrow-prev.png"
									width="39" height="54" alt="Arrow Prev" /> </a> <a href="#"
									class="next"><img src="images/arrow-next.png" width="39"
									height="54" alt="Arrow Next" /> </a>
							</div>

						</div>

					</div>
					<!--Banner Part End-->

				</div>
				<!--Menu and Banner Part End-->

			</div>
		</div>
		<!--Header End-->

		<!--Content start-->
		<div id="content">
			<div class="content">

				<div class="left-bg"></div>
				<div class="content-center">


					<div class="welcome-part">

						<!--Health News start-->
						<div class="news">
							<h1>
								<span>用户登录</span>
							</h1>
							<form action="login" method="post">
								<div class="log-in">
									<div class="input">
										<span style="font-family:Microsoft Yahei; position: relative;top: 5px;">用户名</span><input
											name="username" type="text" class="log-in-input-bg"
											value="" />
									</div>
									<div class="input">
										<span style="font-family:Microsoft Yahei;position: relative;top: 5px;">密　码</span><input
											name="password" type="password" class="log-in-input-bg"
											value="" />
									</div>
									<div></div>
									<div>
										<a href="register.jsp" style="font:14px Microsoft Yahei;color: #1E7DEE;">新用户注册</a>
										<input
											style="background-image:url('images/inp_1.png');border:0; width: 92px;height: 30px;float: right;position: relative;right: 10px;background-repeat: no-repeat;"
											name="login" type="submit" value="" />
									</div>
								</div>
							</form>
						</div>
						<!--Health News End-->

						<!--Health care start-->
						<div class="health-care">
							<h1>
								<span>视康云平台</span>
							</h1>
							<h2>
								<img src="images/health-image.png" width="270" height="103"
									alt="" />
							</h2>
							<h3>视康云平台旨在集结视觉健康产业中保健及诊疗资源，建立集视觉健康评估、保健咨询、治疗方案、科研、学术交流及社会学统计为一体的视觉健康云数据公共服务平台</h3>
							<h4>
								<a href="#"><img src="images/read-more.png" width="103"
									height="29" alt="" /> </a>
							</h4>
						</div>
						<!--Health care End-->

						<!--Featured Tools start-->
						<div class="tools">
							<h1>
								<span>视觉健康服务</span>
							</h1>
							<h2>为大众提供视觉健康全生命周期的服务，利用视觉健康新技术实现科学指导的、及时有效的个性化视觉健康的保健与专家远程诊断服务，特别是建立和推广青少年视觉健康保健体系。缓解看病难、医疗资源分布不均的难题，提升国民视觉健康整体素质。</h2>
							<h4>
								<a href="#"><img src="images/read-more.png" width="103"
									height="29" alt="" /> </a>
							</h4>
						</div>
						<!--Featured Tools End-->

						<div class="divater">
							<img src="images/divate-co.png" width="933" height="2" alt="" />
						</div>
					</div>

					<div><h1 style="font:Normal 26px Arial, Helvetica, sans-serif, normal;">新闻中心</h1>
					</div>
					<!--Testimonial Part start-->
					<div class="testimonial-part">

					<div style="width:33.3%;float:left;">
					<img src="images/news_center.png" width="270" height="122" alt="" />
					<h3 style="font-size:13px;font-weight: normal; ">“视觉健康关爱服务站”儿童手绘呵护眼睛图案</h3>
					</div>
					<div id="newscenterdiv" style="width:33.3%;float:left;">
						<span style="display:block;margin-bottom:5px;position: relative;left: 240px;"><a style="font-size:12px;color:#1E7DEE;" href="findMoreNews?page=1">更多新闻>></a></span>
						<table>
							<%-- <s:iterator value="list">
								<tr>
									<td>
										<a href="findNewsByID?newsid=<s:property value='newsid'/>"><s:property value="title"/></a>
									</td>
								</tr>
							</s:iterator> --%>
						</table>
					</div>
					<div style="width:33.3%;float:left;">
					<img src="images/weixinlogo.png" width="50%"  alt="" />
					<h3 style="font-size:13px;font-weight: normal; ">关注“视康云”微信公众平台</h3>
					
					</div>

					</div>
					<!--Testimonial Part End-->


				</div>
				<div class="right-bg"></div>


			</div>
		</div>
		<!--Content End-->

		<!--Footer start-->
		<div id="footer">

			<!--Footer Top start-->
			<div class="footer-top">


				<!--Footer Menu start-->
				<div class="footer-menu">

					<!--Service start-->
					<div class="service">
						<h1>专业机构及合作伙伴</h1>
						<div class="service-list">
							<ul>
								<li><a href="#">Bariatric</a>
								</li>
								<li><a href="#">Behavioral Health</a>
								</li>
								<li><a href="#">Cancer</a>
								</li>
								<li><a href="#">Heart </a>
								</li>
								<li><a href="#">Kidney</a>
								</li>
								<li><a href="#">Nasal &amp; Sinus</a>
								</li>
							</ul>
						</div>
					</div>
					<!--Service End-->


					<!--Patients start-->
					<div class="patients">
						<h1>For Patients</h1>
						<div class="service-list">
							<ul>
								<li><a href="#">Admission</a>
								</li>
								<li><a href="#">About Your Stay</a>
								</li>
								<li><a href="#">Admission Process</a>
								</li>
								<li><a href="#">Health Plans</a>
								</li>
								<li><a href="#">Medical Records</a>
								</li>
								<li><a href="#">Patient and Family </a>
								</li>
							</ul>
						</div>
					</div>
					<!--Patients start-->

					<!--Visitors start-->
					<div class="visitors">
						<h1>For Visitors</h1>
						<div class="service-list">
							<ul>
								<li><a href="#">Locations</a>
								</li>
								<li><a href="#">Patient Guide</a>
								</li>
								<li><a href="#">Find a Doctor</a>
								</li>
								<li><a href="#">Visiting </a>
								</li>
								<li><a href="#">Contact </a>
								</li>
								<li><a href="#">Education &amp; Events </a>
								</li>
							</ul>
						</div>
					</div>
					<!--Visitors End-->

					<!--Contact start-->
					<div class="contact">
						<h1>联系我们</h1>
						<p>
							南京市建邺区嘉陵江东街18号4栋411室 <br />Call : 86-25-84343889 <br /> Mail :
							tracy@vh-cloud.net
						</p>
						<h2>
							<a href="#"><img src="images/make-cal.png" width="190"
								height="39" alt="" /> </a>
						</h2>
						<h2>
							<a href="request-appointment.html"><img
								src="images/appointment.png" width="190" height="39" alt="" />
							</a>
						</h2>
					</div>
					<!--Contact End-->

				</div>
				<!--Footer Menu End-->

			</div>
			<!--Footer Top End-->

			<!--Footer Bottom start-->
			<div class="footer-bottom">

				<div class="copy-right-part">
					<div class="copy-right-text" >
						<a href="http://www.miitbeian.gov.cn/"> 苏ICP备14000201号-1 <br />
					</div>
					<div class="copy-right-text">
						Copyright© 2012- 2013 Nanjing Vision Health Cloud Information
						Technology Co.,Ltd. <br />
					</div>
					<div class="social-media">
						<ul>
							<li><a href="#"><img src="images/facebook.png"
									width="36" height="33" alt="" /> </a>
							</li>
							<li><a href="#"><img src="images/twitter.png" width="36"
									height="33" alt="" /> </a>
							</li>
							<li><a href="#"><img src="images/google+.png" width="36"
									height="33" alt="" /> </a>
							</li>
							<li><a href="#"><img src="images/rss.png" width="36"
									height="33" alt="" /> </a>
							</li>
						</ul>
					</div>
				</div>

			</div>
			<!--Footer Bottom End-->

		</div>
		<!--Footer End-->


	</div>
	<!--Site End-->
	<script type="text/javascript">
		$(function () {
			$.ajax({
				// 获得新闻列表
				url: "findIndexNews.action",
			    // data: {"id": 0},
			    // type: "post",
			    type: "get",
			    success: function (newsinfo) {
			    	
	
			    	var obj = eval('(' + newsinfo + ')');
					console.log(obj);
	
			  		if(obj.length<=0){
			    		document.querySelector("table").innerHTML += 
				            "<div>"+
				                //"<div class='weui-cell__bd'>"+
				                    "<p>暂无新闻</p>"+
				                //"</div>"+
					        "</div>";
			    	}
					for (var i = 0; i < obj.length ; i++ ) {
						document.querySelector("table").innerHTML += 
							"<tr>"+
								"<td>"+
									"<a href='findNewsByID?newsid="+obj[i].newsid+"' >"+obj[i].title+"</a>"+
								"</td>"+
							"</tr>";
					}
	
			    },
			    error: function (error) {
			    	// Materialize.toast("网络异常，请稍后再试！", 2000);
			        console.log(error);
			    }
			});
		});
		
        function browserRedirect() {
        	//alert("browserRedirect");
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
            //document.writeln("您的浏览设备为：");
            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                //document.writeln("phone");
                //document.location.href = "success.jsp";
                document.location.href = "phonelogin.jsp";
            }// else {
                //document.writeln("pc");
                //document.location.href = "phonelogin.jsp";
            //}
        }

        browserRedirect();
    </script>
	
</body>
</html>
