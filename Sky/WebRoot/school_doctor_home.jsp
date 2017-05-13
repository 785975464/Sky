<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
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
	<div class="header sky-title shadow">
		<div class="header-item split-left"><a style="text-decoration: none;color: #F9F7F7" href="loginOut?outflag=0">退出</a></div>
		<!-- <div class="header-item split-left">我的消息</div> -->
		<div class="header-item" style="width:50%;text-align:right;padding-right: 5px;">
			<span style="color:#FCCA08;">${session.loginuser.realname}</span> ，欢迎您！
		</div>
	</div>
	<div class="main-top header-fix split-bottom" style="background-color: #0072C6;">
	<img src="images/sky.png" style="position: absolute;top: 12%;left: 1%;">
	</div>
	<div class="content main-content" id="content">
		<div class="menu-left"  style="background-color: #EEEEEE">
			<iframe id="leftIframe" name="leftIframe" src="left.jsp"
					frameborder="0" scrolling="no" style="width:100%;height:100%;"> </iframe>
		</div>
		<div class="context">
			<s:if test="#session.loginuser.level=='社工'">
				<!-- <iframe id="mainIframe" name="mainIframe" src="communityInfo.action"
					frameborder="0" scrolling="no"  onload="AdjustIframeHeightOnLoad()"> </iframe> -->
				<iframe id="mainIframe" name="mainIframe" src="socialcommunityInfo.jsp"
					frameborder="0" scrolling="no"  onload="AdjustIframeHeightOnLoad()"> </iframe>
			</s:if>
			<s:elseif test="#session.loginuser.level=='校医'">
				<iframe id="mainIframe" name="mainIframe" src="allStuInfo.action"
					frameborder="0" scrolling="no"  onload="AdjustIframeHeightOnLoad()"> </iframe>
			</s:elseif>
			<s:elseif test="#session.loginuser.level=='家长'">
			<iframe id="mainIframe" name="mainIframe" src="parentStuInfo.action?username=${session.loginuser.username}"
					frameborder="0" scrolling="no"  onload="AdjustIframeHeightOnLoad()"> </iframe>
			</s:elseif>
			<s:elseif test="#session.loginuser.level=='专家'">
			<iframe id="mainIframe" name="mainIframe" src="expertDiagnose.action"
					frameborder="0" scrolling="no" onload="AdjustIframeHeightOnLoad()"> </iframe>
			</s:elseif>
			<s:elseif test="#session.loginuser.level=='学生'">
			<iframe id="mainIframe" name="mainIframe" src="stuPersonalVisionInfoNewest.action"
					frameborder="0" scrolling="no" onload="AdjustIframeHeightOnLoad()"> </iframe>
			</s:elseif>
			<s:elseif test="#session.loginuser.level=='管理员'">
				<iframe id="mainIframe" name="mainIframe" src="stuInfo.action"
					frameborder="0" scrolling="no" onload="AdjustIframeHeightOnLoad()"> </iframe>
				<!-- 
				<iframe id="mainIframe" name="mainIframe" src="allInfo.action"
					frameborder="0" scrolling="no" onload="AdjustIframeHeightOnLoad()"> </iframe>
				 -->
			</s:elseif>
			<script type="text/javascript">
                    function AdjustIframeHeightOnLoad() { 
                    	var heightVal = Math.max(document.getElementById("mainIframe").contentWindow.document.body.scrollHeight,
                    					document.getElementById("leftIframe").contentWindow.document.body.scrollHeight);
                        var height = heightVal + "px";
//                         console.log("height:"+height);
                        document.getElementById("mainIframe").style.height = height;
                        document.getElementById("content").style.height = height;
                        if (heightVal < document.body.scrollHeight-132)
                        	document.getElementById("content").style.height = (document.body.scrollHeight-132)+"px";
//                         document.getElementById("mainIframe").style.height = "100%";
//                         document.getElementById("content").style.height = "500px";
                    }
                    function AdjustIframeHeight(i) { 
                        document.getElementById("mainIframe").style.height = parseInt(i) + "px";
                        //if (i > document.getElementById("content").style.height)
                        var heightVal = Math.max(i,
                    					document.getElementById("leftIframe").contentWindow.document.body.scrollHeight);
                        document.getElementById("content").style.height = parseInt(heightVal) + "px";
                        if (heightVal < document.body.scrollHeight-132)
                        	document.getElementById("content").style.height = (document.body.scrollHeight-132)+"px";
                    }
                    function AdjustLeftIframeHeight(i) { 
//                     	var leftiframe = document.getElementById("leftIframe");
//                     	console.log("leftiframe height:"+leftiframe.style.height);
                        document.getElementById("leftIframe").style.height = parseInt(i) + "px";
//                         var mainIframe = document.getElementById("mainIframe");
//                         console.log("i is:"+i);
//                         console.log("document.body.scrollHeight is:"+document.body.scrollHeight);
//                     	console.log("mainIframe scrollHeight:"+mainIframe.contentWindow.document.body.scrollHeight);
                  		var heightVal = Math.max(i,
                    					document.getElementById("mainIframe").contentWindow.document.body.scrollHeight);
// 						var heightVal = Math.max(i,document.body.scrollHeight);
                    	document.getElementById("content").style.height = parseInt(heightVal) + "px";
                    	if (heightVal < document.body.scrollHeight-132)
                        	document.getElementById("content").style.height = (document.body.scrollHeight-132)+"px";
                    }
            </script>
		</div>
	</div>
<script>
	$(".context").resize(function() {
	});
	var resizeFrame = function() {
		var totalWidth = $(".content").width();
		var menuLeftWidth = $(".menu-left").width();
		$(".context").css("width", totalWidth - menuLeftWidth);

		var iframe = document.getElementById("mainIframe");//$("#mainIframe")[0];
		var bHeight = iframe.contentWindow.document.body.scrollHeight;
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
		var height = Math.max(bHeight, dHeight);
		$("#mainIframe").css("width", "100%");
		$("#mainIframe").css("height", "100%");
		AdjustIframeHeightOnLoad();
	};
	$(window).resize(function() {
		resizeFrame();
	});
	resizeFrame();
	
</script>
</html>
