<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>

<head>
<title>视康云</title>
<meta charset="UTF-8">
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

		<form role="form"  class="form-horizontal" action="publishCommunityAdvancedMessage" method="post">
			<div  style="line-height:30px;">
				<label>信息发布：</label> 
				
			</div>
			<div>
				<select type="select" id="receiverlevel" name="receiverlevel" class="form-control" style="position:absolute;width:150px;left:100px;top:0px;color: #000;">
         			<option value='all'  selected="selected">请选择接收对象</option>
     				<option value='学生'>学生</option>
       				<option value='家长'>家长</option>
       				<!-- <option value='all'>所有人</option> -->
				</select>
				<a class="btn-sm" id="advancedsettings" onclick="return fun()">高级设置</a>
				<!-- <input class="form-control" type="hidden" id="receiver" name="receiver" value='${session.loginuser.address }'/> -->
			</div>
			<div>
				<input class="form-control" type="text" id="text" name="text"
					required="required" /> 
				<button type="submit" class="btn btn-primary" id="submit">发布</button>
			</div>

		</form>
	</div>

</body>
<script type="text/javascript">
	var height = document.getElementById("page-container").scrollHeight;
	parent.AdjustIframeHeight(height);
	$(window).resize(function() {
		var height = document.getElementById("page-container").scrollHeight;
		parent.AdjustIframeHeight(height);
	});
	$(function() {
		$("#docs-tab a")
				.click(
						function(e) {
							$(this).tab('show');
							var height = document
									.getElementById("page-container").scrollHeight;
							parent.AdjustIframeHeight(height);
						});
	});
	
	function fun(){
		var receiverlevel = document.getElementById("receiverlevel").value;
		if(receiverlevel=="all"){
			//alert(receiverlevel);
			alert("请选择接收对象！");
			return false;
		}
		else if(receiverlevel=="学生"){
			//alert(receiverlevel);
			document.getElementById("advancedsettings").href="publishCommunityAdvancedMessage.jsp?a=0";
			return true;
		}
		else{
			//alert(receiverlevel);
			document.getElementById("advancedsettings").href="publishCommunityAdvancedMessage.jsp?a=1";
			return true;
		}
	}
</script>


</html>