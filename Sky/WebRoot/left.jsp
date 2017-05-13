<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>left.html</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery.min.js"></script>
<link href="css/main.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body style="background-color: #EEEEEE">
	<div class="content main-content menu-left-page" id="left-container">
		<s:if test="#session.loginuser.level=='社工'">
			<!-- <div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='communityInfo.action';">视觉健康档案管理</div> -->
			<div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='socialcommunityInfo.jsp';">社区档案管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='communityVision.jsp';">视觉分级管理</div>
			<!-- 
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allAddressInfo.action';">地址管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allSchoolInfo.action';">学校管理</div>
			 -->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='publishCommunitymessage.jsp';">发布站内信</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listMessage.action';">历史站内信</div>
			<!--
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='setCommunityEyesight.jsp';">本社区视力统计图</div>
			  -->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='userSheets.action';">问卷调查</div>
			<!-- <div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='communityVisionInfo.action?visionlevel=-1';">视觉质量分级管理</div> -->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='visionAlertInfo.action';">预警人员信息查询</div>
			
			<!-- 
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='test.jsp';">测试-社工</div>
			 -->
			
		</s:if>

		<s:elseif test="#session.loginuser.level=='校医'">
			<div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allStuInfo.action';">学生管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='publishCommunitymessage.jsp';">发布站内信</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listMessage.action';">历史站内信</div>
			<!-- 
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='set.jsp';">本校学生视力统计图</div>
			 -->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuVisionLevel.action?visionlevel=-1';">学生视觉档案</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='userSheets.action';">问卷调查</div>
		</s:elseif>
		<s:elseif test="#session.loginuser.level=='家长'">
			<div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='parentStuInfo.action?username=${session.loginuser.username}';">学生信息</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='parent_personal_info.jsp';">个人信息</div>
			<!-- 监护人信息管理 2016.4.18 -->
			<!-- 
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='myParentsInfo.action';">监护人信息</div>
			 -->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuPersonalVisionInfoNewest.action';">最新档案</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuPersonalVisionInfo.action';">历史档案</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='myvisualchart.jsp';">视力状态图</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuAuthorizedSpecialist.action';">授权专家</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listStudentsMessage.action';">学生站内信</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listParentsMessage.action';">家长站内信</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='userSheets.action';">问卷调查</div>
		</s:elseif>
		<s:elseif test="#session.loginuser.level=='专家'">
			<div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='expertDiagnose.action';">患者信息</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='noAuthorizedInfo.action';">授权请求</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listMessage.action';">历史站内信</div>
		</s:elseif>
		<s:elseif test="#session.loginuser.level=='学生'">
			<div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuPersonalVisionInfoNewest.action';">最新档案</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuPersonalVisionInfo.action';">历史档案</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='myvisualchart.jsp';">视力状态图</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuAuthorizedSpecialist.action';">授权专家</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuPersInfo.action';">个人信息</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allParent.action';">监护人管理</div>
			<!-- 
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listMessage.action';">未读站内信</div>
			-->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='listCommunityMessage.action';">站内信</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='userSheets.action';">问卷调查</div>
		</s:elseif>
		<s:elseif test="#session.loginuser.level=='管理员'">
			<!-- 
			<div class="item selected" onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allInfo.action';">用户信息</div>
			 -->
			<div class="item selected"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='stuInfo.action';">学生管理</div>		<!-- 添加学生、社工、校医管理等功能 2015-12-14 -->
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='socialWorkerInfo.action';">社工管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='schoolDocInfo.action?page=1';">校医管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allAddressInfo.action';">社区管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='allSchoolInfo.action';">学校管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='admin_create_info.jsp';">添加用户</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='findNews.action';">新闻管理</div>	
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='adminInfo.action';">管理员信息</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='gettjlist.action';">问卷管理</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='publishmessage.jsp';">发布站内信</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='piechart.jsp';">统计图</div>
			<div class="item"
				onclick="changeItem(this);parent.document.getElementById('mainIframe').src='downloadStuInfo.action';">数据下载</div>		<!-- download_students_info.jsp 数据下载功能 2016-07-23 -->
		</s:elseif>
	</div>
	<script type="text/javascript">
		var height = document.getElementById("left-container").scrollHeight;
		parent.AdjustLeftIframeHeight(height);
		$(window).resize(function() {
			var height = document.getElementById("left-container").scrollHeight;
			parent.AdjustLeftIframeHeight(height);
		});
		function changeItem(obj) {
			$(".menu-left-page .item").removeClass("selected");
			$(obj).addClass("selected");
		};
		function fun(){
			var visionalert = document.getElementById("visionalert");
			if(visionalert.style.display=="none"){
				visionalert.style.display="block";
			}
			else if(visionalert.style.display=="block"){
				visionalert.style.display="none";
			}
			//document.getElementById("test2").style.display="block";
			//document.getElementById("test").style.visibility="visible";
		}
	</script>
</body>
</html>
