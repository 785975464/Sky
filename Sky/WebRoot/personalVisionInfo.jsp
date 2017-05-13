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
	top: 50%;

	margin-top: -200px;
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
.login-title h4 {
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
.table-striped>tbody>tr:nth-child(even) {
    background-color: #f9f9f9;
}
/*
.fixed {  
    position: fixed; 
    top: 0px; 
  } 
.sticky {  
    width: 100%;  
    text-transform: uppercase;
  } */
 .affix {
 	position:fixed;
 	top: 0px;
 	left:0px;
   /*width: 500px;*/
   width: 100%;
   text-transform: uppercase;
 }
</style>
<script type="text/javascript">

	function test(){
		//alert("test!");
		//alert(document.getElementById("lefteye").rowSpan);
		document.getElementById("lefteye").rowSpan+=1;
		document.getElementById("righteye").rowSpan+=1;
	};
</script>
<body>
	<div class="box">
		<div class="login-box">
				<div class="login-title text-center" >	<!-- data-spy="affix" data-offset-top="0"  -->	<!-- sticky， data-spy属性用于悬浮固定 -->
					<h1><small>${session.loginuser.realname}，${session.loginuser.gender}，${age}岁</small></h1>
					<!--  -->
					<h4><small>检查日期：${visioncheck.checkTime} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								视觉状况：${visioncheck.visionlevel}</small></h4>
				</div>
			<div class="tab-content" id="content">
					<div class="context">
						<div class="table-responsive">
							<table class="table table-bordered big-data table-striped" style="text-align:center;" id="table">
								<!-- 
								<colgroup>
									<col style="width:200px;">
									<col style="">
									<col style="width:200px;">
									<col style="">
								</colgroup>
								 -->
								<tbody id="tbody">
									<tr>
										<td colspan="2">项目</td>
										<td>检查值</td>
										<td>参考值</td>
										<td colspan="2">项目</td>
										<td>检查值</td>
										<td>参考值</td>
									</tr>
									<tr>
										<td rowspan="4" id="lefteye">左眼</td>
										<td>视力</td>
										<td>${visioncheck.leftEyeLittleValue}</td>
										<td>${StandEyeValue }</td>
										<td rowspan="4" id="righteye">右眼</td>
										<td>视力</td>
										<td>${visioncheck.rightEyeLittleValue}</td>
										<td>${StandEyeValue }</td>
									</tr>
									<tr>
										<td>视功能</td>
										<td>${visioncheck.leftEyeVisualFunction}</td>
										<td>0.35</td>
										<td>视功能</td>
										<td>${visioncheck.rightEyeVisualFunction}</td>
										<td>0.35</td>
									</tr>
									<!--  -->
									<tr>
										<td>屈光</td>
										<td>${visioncheck.refractionLeftEyeAverages}</td>
										<td>${StandRefractionEyeAverages}</td>
										<td>屈光</td>
										<td>${visioncheck.refractionRightEyeAverages}</td>
										<td>${StandRefractionEyeAverages}</td>
									</tr>
									
									<!-- 球镜S/DS1 -->
									<s:if test='(#visioncheck.leftEyeSphericalLens != null && #visioncheck.leftEyeSphericalLens != "" && #visioncheck.leftEyeSphericalLens != "/") ||
												(#visioncheck.rightEyeSphericalLens != null && #visioncheck.rightEyeSphericalLens != "" && #visioncheck.rightEyeSphericalLens != "/")'>
										
										<script language="javascript">
											$(function(){
												test();	//jquery写法
												//alert("1");
												//alert("here!"+document.getElementById("lefteye").rowSpan);
												//document.getElementById("lefteye").rowSpan+=1;
												//document.getElementById("righteye").rowSpan+=1;
											});
										</script>
										<tr>
											<td>球镜S/DS1</td>
											<td colspan="2">${visioncheck.leftEyeSphericalLens}</td>
											<td>球镜S/DS1</td>
											<td colspan="2">${visioncheck.rightEyeSphericalLens}</td>
										</tr>
									</s:if>
									
									<!-- 柱镜C/DC1 -->
									<s:if test='(#visioncheck.leftCylinder != null && #visioncheck.leftCylinder != "" && #visioncheck.leftCylinder != "/") ||
												(#visioncheck.rightCylinder != null && #visioncheck.rightCylinder != "" && #visioncheck.rightCylinder != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>柱镜C/DC1</td>
											<td colspan="2">${visioncheck.leftCylinder}</td>
											<td>柱镜C/DC1</td>
											<td colspan="2">${visioncheck.rightCylinder}</td>
										</tr>
									</s:if>
									
									<!-- 柱镜轴位A1 -->
									<s:if test='(#visioncheck.leftCylinderAxial != null && #visioncheck.leftCylinderAxial != "" && #visioncheck.leftCylinderAxial != "/") ||
												(#visioncheck.rightCylinderAxial != null && #visioncheck.rightCylinderAxial != "" && #visioncheck.rightCylinderAxial != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>柱镜轴位A1</td>
											<td colspan="2">${visioncheck.leftCylinderAxial}</td>
											<td>柱镜轴位A1</td>
											<td colspan="2">${visioncheck.rightCylinderAxial}</td>
										</tr>
									</s:if>
									
									<!-- 球镜S/DS2 -->
									<s:if test='(#visioncheck.leftEyeSphericalLensSecond != null && #visioncheck.leftEyeSphericalLensSecond != "" && #visioncheck.leftEyeSphericalLensSecond != "/") ||
												(#visioncheck.rightEyeSphericalLensSecond != null && #visioncheck.rightEyeSphericalLensSecond != "" && #visioncheck.rightEyeSphericalLensSecond != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>球镜S/DS2</td>
											<td colspan="2">${visioncheck.leftEyeSphericalLensSecond}</td>
											<td>球镜S/DS2</td>
											<td colspan="2">${visioncheck.rightEyeSphericalLensSecond}</td>
										</tr>
									</s:if>
									
									<!-- 柱镜C/DC2 -->
									<s:if test='(#visioncheck.leftCylinderSecond != null && #visioncheck.leftCylinderSecond != "" && #visioncheck.leftCylinderSecond != "/") ||
												(#visioncheck.rightCylinderSecond != null && #visioncheck.rightCylinderSecond != "" && #visioncheck.rightCylinderSecond != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>柱镜C/DC2</td>
											<td colspan="2">${visioncheck.leftCylinderSecond}</td>
											<td>柱镜C/DC2</td>
											<td colspan="2">${visioncheck.rightCylinderSecond}</td>
										</tr>
									</s:if>
									
									<!-- 柱镜轴位A2 -->
									<s:if test='(#visioncheck.leftCylinderAxialSecond != null && #visioncheck.leftCylinderAxialSecond != "" && #visioncheck.leftCylinderAxialSecond != "/") ||
												(#visioncheck.rightCylinderAxialSecond != null && #visioncheck.rightCylinderAxialSecond != "" && #visioncheck.rightCylinderAxialSecond != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>柱镜轴位A2</td>
											<td colspan="2">${visioncheck.leftCylinderAxialSecond}</td>
											<td>柱镜轴位A2</td>
											<td colspan="2">${visioncheck.rightCylinderAxialSecond}</td>
										</tr>
									</s:if>
									
									<!-- 球镜S/DS3 -->
									<s:if test='(#visioncheck.leftEyeSphericalLensThird != null && #visioncheck.leftEyeSphericalLensThird != "" && #visioncheck.leftEyeSphericalLensThird != "/") ||
												(#visioncheck.rightEyeSphericalLensThird != null && #visioncheck.rightEyeSphericalLensThird != "" && #visioncheck.rightEyeSphericalLensThird != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>球镜S/DS3</td>
											<td colspan="2">${visioncheck.leftEyeSphericalLensThird}</td>
											<td>球镜S/DS3</td>
											<td colspan="2">${visioncheck.rightEyeSphericalLensThird}</td>
										</tr>
									</s:if>
									
									<!-- 柱镜C/DC3 -->
									<s:if test='(#visioncheck.leftCylinderThird != null && #visioncheck.leftCylinderThird != "" && #visioncheck.leftCylinderThird != "/") ||
												(#visioncheck.rightCylinderThird != null && #visioncheck.rightCylinderThird != "" && #visioncheck.rightCylinderThird != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>柱镜C/DC3</td>
											<td colspan="2">${visioncheck.leftCylinderThird}</td>
											<td>柱镜C/DC3</td>
											<td colspan="2">${visioncheck.rightCylinderThird}</td>
										</tr>
									</s:if>
									
									<!-- 柱镜轴位A3 -->
									<s:if test='(#visioncheck.leftCylinderAxialThird != null && #visioncheck.leftCylinderAxialThird != "" && #visioncheck.leftCylinderAxialThird != "/") ||
												(#visioncheck.rightCylinderAxialThird != null && #visioncheck.rightCylinderAxialThird != "" && #visioncheck.rightCylinderAxialThird != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>柱镜轴位A3</td>
											<td colspan="2">${visioncheck.leftCylinderAxialThird}</td>
											<td>柱镜轴位A3</td>
											<td colspan="2">${visioncheck.rightCylinderAxialThird}</td>
										</tr>
									</s:if>
									
									<!-- 平均值 -->
									<!-- 
									<s:if test='(#visioncheck.refractionLeftEyeAverages != null && #visioncheck.refractionLeftEyeAverages != "" && #visioncheck.refractionLeftEyeAverages != "/") ||
												(#visioncheck.refractionRightEyeAverages != null && #visioncheck.refractionRightEyeAverages != "" && #visioncheck.refractionRightEyeAverages != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>平均值</td>
											<td>${visioncheck.refractionLeftEyeAverages}</td>
											<td>0</td>
											<td>平均值</td>
											<td>${visioncheck.refractionRightEyeAverages}</td>
											<td>0</td>
										</tr>
									</s:if>
									 -->
									 
									<!-- 检影验光 -->
									<s:if test='(#visioncheck.leftEyeRetinoscopy != null && #visioncheck.leftEyeRetinoscopy != "" && #visioncheck.leftEyeRetinoscopy != "/") ||
												(#visioncheck.rightEyeRetinoscopy != null && #visioncheck.rightEyeRetinoscopy != "" && #visioncheck.rightEyeRetinoscopy != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>检影验光</td>
											<td colspan="2">${visioncheck.leftEyeRetinoscopy}</td>
											<td>检影验光</td>
											<td colspan="2">${visioncheck.rightEyeRetinoscopy}</td>
										</tr>
									</s:if>
									
									<!-- 近视力 -->
									<s:if test='(#visioncheck.leftEyeNearVision != null && #visioncheck.leftEyeNearVision != "" && #visioncheck.leftEyeNearVision != "/") ||
												(#visioncheck.rightEyeNearVision != null && #visioncheck.rightEyeNearVision != "" && #visioncheck.rightEyeNearVision != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>近视力</td>
											<td colspan="2">${visioncheck.leftEyeNearVision}</td>
											<td>近视力</td>
											<td colspan="2">${visioncheck.rightEyeNearVision}</td>
										</tr>
									</s:if>
									
									<!-- 戴镜度数  -->
									<s:if test='(#visioncheck.leftEyeSpectaclesDegrees != null && #visioncheck.leftEyeSpectaclesDegrees != "" && #visioncheck.leftEyeSpectaclesDegrees != "/") ||
												(#visioncheck.rightEyeSpectaclesDegrees != null && #visioncheck.rightEyeSpectaclesDegrees != "" && #visioncheck.rightEyeSpectaclesDegrees != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>戴镜度数 </td>
											<td colspan="2">${visioncheck.leftEyeSpectaclesDegrees}</td>
											<td>戴镜度数 </td>
											<td colspan="2">${visioncheck.rightEyeSpectaclesDegrees}</td>
										</tr>
									</s:if>
									
									<!-- 矫正视力  -->
									<s:if test='(#visioncheck.leftEyeVisionCorrection != null && #visioncheck.leftEyeVisionCorrection != "" && #visioncheck.leftEyeVisionCorrection != "/") ||
												(#visioncheck.rightEyeVisionCorrection != null && #visioncheck.rightEyeVisionCorrection != "" && #visioncheck.rightEyeVisionCorrection != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>矫正视力 </td>
											<td colspan="2">${visioncheck.leftEyeVisionCorrection}</td>
											<td>矫正视力</td>
											<td colspan="2">${visioncheck.rightEyeVisionCorrection}</td>
										</tr>
									</s:if>
									
									
									<!-- 眼轴/前房长度 -->
									<s:if test='(#visioncheck.leftAnteriorAxialLength != null && #visioncheck.leftAnteriorAxialLength != "" && #visioncheck.leftAnteriorAxialLength != "/") ||
												(#visioncheck.rightAnteriorAxialLength != null && #visioncheck.rightAnteriorAxialLength != "" && #visioncheck.rightAnteriorAxialLength != "/")'>
										<script language="javascript">test()</script>
										<tr>
											<td>眼轴/前房长度</td>
											<td>${visioncheck.leftAnteriorAxialLength}</td>
											<td>${StandAnteriorAxialLength }</td>
											<td>眼轴/前房长度</td>
											<td>${visioncheck.rightAnteriorAxialLength}</td>
											<td>${StandAnteriorAxialLength }</td>
										</tr>
									</s:if>
									
									<tr>
										<td>视觉状况</td>
										<td colspan="2">${state_Left}</td>
										<td>视觉状况</td>
										<td colspan="2">${state_Right}</td>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
			</div>
			
			<div style="margin:20px;">
				<h4>
				说明：
				</h4>
				<h5>
				${advice}
				</h5>
			</div>
			
			<div class="input-group">
				<span class="input-group-addon"><a onClick="history.back(-1)">返回</a><span class="glyphicon glyphicon-arrow-left"></span></span>
				<span class="input-group-addon"><a href="loginOut?outflag=1">退出</a><span class="glyphicon glyphicon-log-out"></span></span>
			</div>
		</div>
	</div>
<script type="text/javascript">
	//var sticky = document.querySelector('.sticky');  
	//var origOffsetY = document.querySelector('.login-box').offsetTop; 
	//function onScroll(e) {  
		//alert("here!"+document.querySelector('.tab-content').offsetTop);
		//window.scrollY >= origOffsetY ? sticky.classList.add('fixed') : sticky.classList.remove('fixed');
		//document.getElementById("lefteye").innerHTML=window.scrollY;//document.getElementById("detail").offsetTop;
		//document.getElementById("detail").style.top="100px";
		//if(window.scrollY>58){
			//document.getElementById("detail").offsetTop+=86;
			//document.getElementById("lefteye").innerHTML=
			//document.getElementById("tbody").style="position:absolute;top:58px;";
			//document.getElementById("lefteye").innerHTML=document.getElementById("tbody").style.top;
			//document.querySelector('.login-box').style.top="58px"; 
		//}
	//}  
	//document.addEventListener('scroll', onScroll); 
</script>
</body>
</html>
