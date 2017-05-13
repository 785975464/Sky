<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<form role="form"  class="form-horizontal" action="publishMessage" method="post">
			<div  style="line-height:30px;">
				<label>${session.loginuser.level }发布信息：</label> 
				
			</div>
			<!-- 
			<div>
				<select type="select" id="grade" name="grade" class="form-control" style="position:absolute;width:150px;left:120px;top:0px;color: #000;">
         			<option value=''  selected="selected">请选择接收对象</option>
     				<option value='一年级'>一年级</option>
       				<option value='二年级'>二年级</option>
       				<option value='三年级'>三年级</option>
       				<option value='四年级'>四年级</option>
				</select>
			</div>
			 -->
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
</script>


</html>