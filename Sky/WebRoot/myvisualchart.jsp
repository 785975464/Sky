<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<script src="js/tab.js"></script>

</head>
  
  
  
  <body>
	<div class="content sky-content" id="page-container">
		<div class="frame-records">
			<div class="records-new part4">
				
				<div class="tabbable" id="tabs-534095">
				<ul class="nav nav-tabs" role="tablist" id="docs-tab">
					<li role="presentation" class="active">
						<a href="#line" role="tab" data-toggle="tab">正常视力</a>
					</li>
					
					<li role="presentation" >
						<a href="#detail" role="tab" data-toggle="tab">左眼视力</a>
					</li>
					<li role="presentation">
						<a href="#shili"role="tab" data-toggle="tab">右眼视力</a>
					</li>
					
					<li role="presentation" >
						<a href="#leftRefraction" role="tab" data-toggle="tab">左眼屈光度</a>
					</li>
					<li role="presentation">
						<a href="#rightRefraction" role="tab" data-toggle="tab">右眼屈光度</a>
					</li>
					
					<li role="presentation" >
						<a href="#leftAxialLength" role="tab" data-toggle="tab">左眼瞳孔</a>
					</li>
					<li role="presentation">
						<a href="#rightAxialLength" role="tab" data-toggle="tab">右眼瞳孔</a>
					</li>
					
				</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane active" role="tabpanel" id="line">
						<img src="images/standardline.png"/>  
					</div>
					<div class="tab-pane" role="tabpanel" id="detail">
						<img alt="jfreechart" src="leftVisualFunction"/>  
					</div>
					<div class="tab-pane" role="tabpanel" id="shili">
						<img alt="jfreechart" src="rightVisualFunction"/> 
					</div>
					
					<div class="tab-pane" role="tabpanel" id="leftRefraction">
						<img alt="jfreechart" src="leftRefraction"/>  
					</div>
					<div class="tab-pane" role="tabpanel" id="rightRefraction">
						<img alt="jfreechart" src="rightRefraction"/> 
					</div>
					
					<div class="tab-pane" role="tabpanel" id="leftAxialLength">
						<img alt="jfreechart" src="leftAxialLength"/>  
					</div>
					<div class="tab-pane" role="tabpanel" id="rightAxialLength">
						<img alt="jfreechart" src="rightAxialLength"/> 
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
		$(function() {
			$("#docs-tab a").click(function(e) {
				$(this).tab('show');
				var height = document.getElementById("page-container").scrollHeight;
				parent.AdjustIframeHeight(height);
			});
		});
	</script>
	
</body>
  
</html>
