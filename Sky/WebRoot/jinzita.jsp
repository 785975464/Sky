<%@taglib prefix="s" uri="/struts-tags" %><!-- pageEncoding="GB2312" -->
<%@ page pageEncoding="utf-8"%>

<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML>
<html>
<head>
<title>视康云</title>
<meta charset="GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="jquery/jquery.min.js"></script>
<!-- 
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="bootstrap/js/bootstrap.min.js"></script>
 -->
<link rel="stylesheet" href="jquery/jquery-ui.min.css">


<script src="jquery/jquery-ui.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">

<style type="text/css">
	body {background-image:none!important;}
	input{width:100px;}
	.container{margin:20px;}
</style>
</head>

<body>
<div class="container" >
	<p>
	  <label for="amount1">视力检测（次/年）：</label>
	  <input type="text" id="amount1" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max1"></div>
	
	<p>
	  <label for="amount2">做亮睛操（次/天）：</label>
	  <input type="text" id="amount2" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max2"></div>
	
	<p>
	  <label for="amount3">视力训练（次/周）：</label>
	  <input type="text" id="amount3" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max3"></div>
	
	<p>
	  <label for="amount4">户外活动（次/天）：</label>
	  <input type="text" id="amount4" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max4"></div>
	
	<p>
	  <label for="amount5">户外活动时长（小时/天）：</label>
	  <input type="text" id="amount5" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max5"></div>
	
	<p>
	  <label for="amount6">近距工作时间间隔（*10分钟）：</label>
	  <input type="text" id="amount6" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max6"></div>
	
	<p>
	  <label for="amount7">电子设备使用间隔（*10分钟）：</label>
	  <input type="text" id="amount7" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max7"></div>
	
	<p>
	  <label for="amount8">睡眠时长（小时/天）：</label>
	  <input type="text" id="amount8" style="border:0; color:#f6931f; font-weight:bold;">
	</p>
	<div id="slider-range-max8"></div>
	<!--  -->
	
	<input type="button" class="btn" style="width:100%;height:30px;margin-top:20px" onclick="getnum();" value="点击我">
</div>

	<script type="text/javascript">
		//创建XMLHttpRequest对象
		/*
		var xmlHttpReq;
		var actionname = "";
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttpReq = new ActiveXObject("MSXML2.XMLHTTP.3.0");
			} else {
				xmlHttpReq = new XMLHttpRequest();
			}
		}
		*/
		function getnum(){
			var num = document.getElementById("amount1").value;
			alert(num);
		}
		$(function() {
		    $( "#slider-range-max1" ).slider({
		      range: "max",
		      min: 0,
		      max: 18,
		      value: 0,
		      slide: function( event, ui ) {
		        $( "#amount1" ).val( ui.value );
		      }
		    });
		    $( "#amount1" ).val( $( "#slider-range-max1" ).slider( "value" ) );
		    
		    $( "#slider-range-max2" ).slider({
		      range: "max",
		      min: 0,
		      max: 10,
		      value: 0,
		      slide: function( event, ui ) {
		        $( "#amount2" ).val( ui.value );
		      }
		    });
		    $( "#amount2" ).val( $( "#slider-range-max2" ).slider( "value" ) );
		    
		    $( "#slider-range-max3" ).slider({
		      range: "max",
		      min: 0,
		      max: 8,
		      value: 0,
		      slide: function( event, ui ) {
		        $( "#amount3" ).val( ui.value );
		      }
		    });
		    $( "#amount3" ).val( $( "#slider-range-max3" ).slider( "value" ) );
		    
		    $( "#slider-range-max4" ).slider({
		      range: "max",
		      min: 0,
		      max: 10,
		      value: 0,
		      slide: function( event, ui ) {
		        $( "#amount4" ).val( ui.value );
		      }
		    });
		    $( "#amount4" ).val( $( "#slider-range-max4" ).slider( "value" ) );
		    
		    $( "#slider-range-max5" ).slider({
		      range: "max",
		      min: 0,
		      max: 8,
		      value: 0,
		      slide: function( event, ui ) {
		        $( "#amount5" ).val( ui.value );
		      }
		    });
		    $( "#amount5" ).val( $( "#slider-range-max5" ).slider( "value" ) );
		    
		    $( "#slider-range-max6" ).slider({
		      range: "max",
		      min: 0,
		      max: 9.5,
		      value: 0,
		      step: 0.5,
		      slide: function( event, ui ) {
		        $( "#amount6" ).val( ui.value );
		      }
		    });
		    $( "#amount6" ).val( $( "#slider-range-max6" ).slider( "value" ) );
		    
		    $( "#slider-range-max7" ).slider({
		      range: "max",
		      min: 0,
		      max: 8.5,
		      value: 0,
		      step: 0.5,
		      slide: function( event, ui ) {
		        $( "#amount7" ).val( ui.value );
		      }
		    });
		    $( "#amount7" ).val( $( "#slider-range-max7" ).slider( "value" ) );
		    
		    $( "#slider-range-max8" ).slider({
		      range: "max",
		      min: 0,
		      max: 18,
		      value: 0,
		      slide: function( event, ui ) {
		        $( "#amount8" ).val( ui.value );
		      }
		    });
		    $( "#amount8" ).val( $( "#slider-range-max8" ).slider( "value" ) );
		});
	</script>
</body>
</html>
