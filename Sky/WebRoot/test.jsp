<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>测试页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<hr>
	<h1>上传进度：</h1>
	<hr>
	<div class="progress progress-striped active" style="width: 60%;">	<!-- margin-left:20%; -->
	   <div class="progress-bar progress-bar-info" role="progressbar" id="myProBar"
	      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
	      style="width: 0%;">
	      <span class="sr-only">30% 完成（信息）</span>
	   </div>
	</div>
	<button type="button" class="btn btn-info" onclick="setPro();">信息按钮</button>
	<span style="color:#f00;position: absolute;" id="check"></span>
</body>
</html>

<script type="text/javascript">
	var xmlHttpReq;
	function createXMLHttpRequest() {
		if (window.XMLHttpRequest) {
			xmlHttpReq = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
			} catch (e) {
				xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
	}
	
	function checkprocess() {
		var username = document.getElementById("username").value;
		var url = "checkProcess.action";
		createXMLHttpRequest();
		xmlHttpReq.open("POST", url, true);
		xmlHttpReq.onreadystatechange = getResult;
		xmlHttpReq.send(null);

	}
	function getResult() {
		if (xmlHttpReq.readyState == 4) {
			var res = eval('(' + xmlHttpReq.responseText + ')');
			var msg = res.MSG;
			var checkusernameinfo = document.getElementById("checkusernameinfo");
			if (msg) {
				checkusernameinfo.innerText = msg;
				document.getElementById("submit").disabled = true;
			} else {
				checkusernameinfo.innerText = msg;
				document.getElementById("submit").disabled = false;
			}
		}
	}
		
		
	var timerId;
	var index=0;
	$(function(){
		//每隔0.5秒自动调用方法，实现进度条的实时更新
		timerId=window.setInterval(getForm,500);
	});
	
	function getForm(){
		//alert(timerId);
		index+=1;
		document.getElementById("check").innerText = "当前进度："+ index+"%";
		document.getElementById("myProBar").style.width=index+"%";
		
		if(index>=100){
			window.clearInterval(timerId);
			document.getElementById("check").innerText = "已完成！";
		}
		
	}

	
	function setPro(){
		index+=10;
		//var width = document.getElementById("myProBar").style.width;
		document.getElementById("myProBar").style.width=index+"%";
		//alert(width);
		//document.getElementById("myProBar").style.width+="20%";
		//alert(document.getElementById("myProBar").style.width);
	}
	
	
	
</script>