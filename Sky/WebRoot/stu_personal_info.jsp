<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
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
<body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				<div class="title">
					个人信息<a href="modifyStuselfInfo.action"
						style="position:absolute;right:10px;top:2px;background-color: #3CBE86;color: #fff;"
						class="btn btn-sm">编辑</a>
				</div>
				
				<div class="context" style="padding-left: 10px !important;">
                    <div class="my-info"> 
                        <div class="f2" style="padding-left: 2%;">
                        	<div class="info-item">学号：<span>${session.loginuser.username}</span></div>
                            <div class="info-item">性别：<span>${session.loginuser.gender}</span></div>
                            <div class="info-item">身高：<span>${session.loginuser.height}</span></div>
                            <div class="info-item">社区：<span>${session.loginuser.address}</span></div>
                            <div class="info-item">年级：<span>${session.loginuser.grade}</span></div>
                            <div class="info-item">身份证号：<span>${session.loginuser.idNumber}</span></div>
                            <div class="info-item">民族：<span>${session.loginuser.nation}</span></div>
                            <div class="info-item">监护人：<span>${session.loginuser.guardianName}</span></div>
                        </div>
                        <div class="f2">
                        	<div class="info-item">姓名：<span>${session.loginuser.realname}</span></div>
                            <div class="info-item">年龄：<span>${session.loginuser.age}</span></div>
                            <div class="info-item">体重：<span>${session.loginuser.weight}</span></div>
                            <div class="info-item">学校：<span>${session.loginuser.school}</span></div>
                            <div class="info-item">班级：<span>${session.loginuser.stuClass}</span></div>
                            <div class="info-item">联系电话：<span>${session.loginuser.phone}</span></div>
                            <div class="info-item">邮箱：<span>${session.loginuser.email}</span></div>
                        </div>
                    </div>
            	</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
            var height = document.getElementById("page-container").scrollHeight;
            parent.AdjustIframeHeight(height);
            $(window).resize(function() {
            	var height = document.getElementById("page-container").scrollHeight;
            	parent.AdjustIframeHeight(height);
            });
    </script>
</body>
</html>